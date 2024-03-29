import numpy as np
import random
from Aligner import *
from HomologousSegmentSet import HomologousSegmentSet
from CrossCorrelation import CrossCorrelation
from config import BLOSUM62, AMINO_ACID_MAPPING, DATA_TYPES
from tool import random_gen_seq

class Homologous(object):
    def __init__(self, ref: np.ndarray, qry: np.ndarray, cross_cor, data_type: str='DNA', threshold=180, n=16, wndw_size=30, l=150, B=32, buffer=4):
        # assert len(ref) == len(qry)
        assert type(ref) == np.ndarray 
        assert type(qry) == np.ndarray
        assert data_type in DATA_TYPES

        self.ref = ref
        self.qry = qry
        self.L = max(len(ref), len(qry))
        self.data_type = data_type
        self.ref_len = ref.shape[0]
        self.qry_len = qry.shape[0]
        self.cross_cor = cross_cor      # c(k)
        self.threshold = threshold      # threshold for homologous segments
        self.n = n                      # check for top n cross-correlation value
        self.wndw_size = wndw_size      # window size for sliding window
        self.maximum_segment_length = l # maximum length for homologous segment)
        self.B = B # num of PE in PE array
        self.buffer = buffer
    
    def _get_score(self, ref: np.ndarray, qry: np.ndarray, mode='DOT', debug=False):
        '''
            use different score system to calculate score between ref & qry
            mode: 
                'SW' for SmithWaterman
                'DOT' for dot product (MAFFT use dot product)
                default 'DOT'
        '''
        assert len(ref) == len(qry)
        if mode == 'SW':
            SW = Aligner(ref, qry, alg='SW')
            return SW.calculate_score()
        elif mode == 'DOT':
            score = 0
            if self.data_type == 'DNA' or self.data_type == 'RNA':
                dot = np.equal(ref, qry)
                # if debug: 
                #     print(f'ref: {ref}')
                #     print(f'qry: {qry}')
                score = np.sum(dot)
            elif self.data_type == 'PROTEIN':
                for i in range(len(ref)):
                    # print(f'pair: <{AMINO_ACID_MAPPING[f"{ref[i]}"]}, {AMINO_ACID_MAPPING[f"{qry[i]}"]}>')
                    s = BLOSUM62[ref[i]][qry[i]]
                    score += s
                    if debug:
                        print(f'pair: <{ref[i]}, {qry[i]}>')
                        print(f'total score: {score}')
            # if debug: print(f'score: {score}')
            return score
        
        return -1

    def _get_segment(self, offset, verbose=False):
        '''
            Return ref's homologous segments with given offset.

            shift ref, qry with given offset
            and return homologous segments for ref & qry

            offset range (-l+1, l-1), 2*l-1 in total
            (offset = ref[0].position - qry[0].position)

            return 2D array, [[start_idx, end_idx], ...]
        '''

        if verbose:
            print(f'offset: {offset}')
        padded_L = None
        ref_pad_len = None
        qry_pad_len = None
        abs_offset = abs(offset)
        if offset < 0: # pad ref left
            L = max(self.ref_len+abs_offset, self.qry_len) # 598+13
            ref_pad_len = max(L-self.ref_len-abs_offset, 0)
            qry_pad_len = max(L-self.qry_len, 0)
        else: # pad qry left
            L = max(self.ref_len, self.qry_len+abs_offset)
            ref_pad_len = max(L-self.ref_len, 0)
            qry_pad_len = max(L-self.qry_len-abs_offset, 0)

        padded_ref = 0
        padded_qry = 0
        if offset < 0: # pad ref left, qry right
            padded_ref = np.pad(self.ref, (abs_offset, ref_pad_len), mode='constant')
            padded_qry = np.pad(self.qry, (0, qry_pad_len), mode='constant')
        else : # pad qry left, ref right
            padded_ref = np.pad(self.ref, (0, ref_pad_len), mode='constant')
            padded_qry = np.pad(self.qry, (abs_offset, qry_pad_len), mode='constant')
        
        ref_segment_list = []
        score_list = []
        

        # sliding window
        # only slide thru overlap region
        sliding_wndw_start_idx = abs_offset
        sliding_wndw_end_idx = None
        if offset < 0: # pad ref left
            sliding_wndw_end_idx = min(self.ref_len+abs_offset, self.qry_len) - self.wndw_size
        else: # pad qry left
            sliding_wndw_end_idx = min(self.ref_len, self.qry_len+abs_offset) - self.wndw_size
        # print(f'start: {sliding_wndw_start_idx}')
        # print(f'end: {sliding_wndw_end_idx}')

        for i in range (sliding_wndw_start_idx, sliding_wndw_end_idx+1):
            # if (i+self.wndw_size-abs_offset) == 17: debug_ = True
            # else: debug_ = False 
            debug_ = False
            # if debug_ and offset == 7 and i == 134: print(f'sliding at {i}')
            # if i == 281 and offset == -241: debug_ = True
            score = self._get_score(padded_ref[i:i+self.wndw_size], padded_qry[i:i+self.wndw_size], debug=debug_)
            # if debug_ and offset == 7 and i == 134:
            #     print(f'pad index: {i}, {i+self.wndw_size}')
            #     print(f'pad ref: {padded_ref[i:i+self.wndw_size]}')
            #     print(f'pad qry: {padded_qry[i:i+self.wndw_size]}')
            #     print(f'no pad: {i-241}, {i+self.wndw_size-241}')
            #     print(f'no pad ref: {self.ref[i-241:i+self.wndw_size-241]}')
            #     print(f'no pad qry: {self.qry[i:i+self.wndw_size]}')
            #     print(f'score: {score}, threshold: {self.threshold}')
            ##### debug
            # print(score)
            #####
            # if offset == -34 and i-abs_offset > 150: print(f'(i, j): ({i+self.wndw_size-1-abs_offset}, {i+self.wndw_size-1-abs_offset-offset}),  coord: {i+self.wndw_size-1-abs_offset-self.wndw_size//2}, score: {score}')
            # if (i+self.wndw_size-abs_offset) == 17: print(padded_ref[i:i+self.wndw_size])
            # if (i+self.wndw_size-abs_offset) == 17: print(padded_qry[i:i+self.wndw_size])
            if score > self.threshold and (i-abs_offset)+(self.wndw_size//2) > self.B//2+self.buffer and i+self.wndw_size//2 > self.B//2+self.buffer:
                score_list.append(score)
                if offset < 0:
                    # print(f'offset: {offset}')
                    # print(f'append {i-offset}')
                    if len(ref_segment_list) == 0:
                        ref_segment_list.append(i-abs_offset)
                    elif (i-abs_offset)-ref_segment_list[-1] > self.buffer:
                        ref_segment_list.append(i-abs_offset)
                else:
                    # print(f'offset: {offset}')
                    # print(f'append {i}')
                    if len(ref_segment_list) == 0:
                        ref_segment_list.append(i)
                    elif i-ref_segment_list[-1] > self.buffer:
                        ref_segment_list.append(i)
            
        ref_segments = [[i, i+self.wndw_size] for i in ref_segment_list]

        ##### debug
        # if offset == 7:
        #     print(f'ref: {ref_segments}')
        #     print(f'offset: {offset}')
        # score_list = np.array(score_list)
        # histogram, _ = np.histogram(score_list, [0, 5, 10, 15, 20, 25, 30, 35])
        # print(histogram)
        #####

        # combine adjacent segments
        i = 0
        # for i in range(len(ref_segments)-1):
        #     j = i+1
        #     while j < len(ref_segments):
        #         # combine
        #         if (ref_segments[i][1] == ref_segments[j][0]) and (ref_segments[i][1] - ref_segments[i][0] != self.maximum_segment_length):
        #             ref_segments[i][1] = ref_segments[j][1]
        #             score_list[i] += score_list[j]
        #             del ref_segments[j]
        #             del score_list[j]
        #         else: j += 1

        ref_segments = np.array(ref_segments)
        score_list = np.array(score_list)

        if verbose:
            print(f'ref segments: {ref_segments}')
        
        return ref_segments, score_list

    def _zigzag(self, arr):
        for i in range(self.L-1):
            value = arr[0]
            arr = np.delete(arr, 0)
            if i == 0:
                arr = np.append(arr, value)
            else:
                arr = np.insert(arr, -i*2, value)
        return arr

    def _get_top_offsets(self):
        # offset = self._zigzag(np.arange(-self.L+1, self.L))
        # xcross = self._zigzag(self.cross_cor)
        # offset = offset[xcross.argsort()[-self.n:]]

        offset = np.arange(-len(self.qry)+1, len(self.ref))
        # print(f'ref len: {len(self.ref)}, qry len: {len(self.qry)}')
        # print(f'offset len: {len(self.cross_cor)}')
        # print(len(self.cross_cor))
        # print(self.cross_cor.argsort()[-self.n:])
        offset = offset[self.cross_cor.argsort()[-self.n:]] # get top n of offset (k)
        offset = np.sort(offset)
        # print(offset)
        return offset
        
    def get_all_homologous_segments(self) -> list:
        '''
            return number of segments found & list of HomologousSegmentSet
        '''
        top_offsets = self._get_top_offsets()
        # print(top_offsets)
        
        all_segment_set = []
        total_segments = 0
        for offset in top_offsets:
            ref_segment_list, score_list = self._get_segment(offset)
            total_segments += ref_segment_list.shape[0]
            # save in np 2D array shape = (n, 2)
            segment_set = HomologousSegmentSet(offset, ref_segment_list, score_list, self.cross_cor[offset+self.qry-1])
            all_segment_set.append(segment_set)
            # segment_set.print_info()
        return total_segments, all_segment_set


def test(data_type='DNA'):
    '''
        data_type = 'DNA' | 'RNA' | 'PROTEIN'
    '''
    ref = random_gen_seq(len=128, data_type=data_type)
    qry = random_gen_seq(len=128, data_type=data_type)
    xcorr = CrossCorrelation(ref, qry)
    c = xcorr.XCorr()

    threshold = 0 if data_type == 'PROTEIN' else 13
    stop = False
    while not stop:
        h = Homologous(ref, qry, c, data_type=data_type, threshold=threshold, wndw_size=30)
        total_segments, homologous_segments_set = h.get_all_homologous_segments()
        if total_segments > 0: stop = True
    print(f'total_segments: {total_segments}')
    index = 0
    while len(homologous_segments_set[index]) <= 0: index += 1
    # print(f'offset: {homologous_segments_set[index].offset}')
    # print(homologous_segments_set[index].ref_segments)
    # print(homologous_segments_set[index].qry_segments)
    ref_seg = homologous_segments_set[index].ref_segments[0]
    qry_seg = homologous_segments_set[index].qry_segments[0]
    print(ref[ref_seg[0]:ref_seg[1]])
    print(qry[qry_seg[0]:qry_seg[1]])


if __name__ == '__main__':
    random.seed(1)
    test('DNA')
    test('PROTEIN')