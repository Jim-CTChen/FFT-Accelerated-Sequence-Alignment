import enum
from cv2 import threshold
import numpy as np
import random
from Aligner import *
from HomologousSegmentSet import HomologousSegmentSet
from CrossCorrelation import CrossCorrelation
from config import BLOSUM62, AMINO_ACID_MAPPING, DATA_TYPES
from tool import random_gen_seq

class Homologous(object):
    def __init__(self, ref: np.ndarray, qry: np.ndarray, cross_cor, data_type: str='DNA', threshold=180, n=16, wndw_size=30, l=150):
        # assert len(ref) == len(qry)
        assert type(ref) == np.ndarray 
        assert type(qry) == np.ndarray
        assert data_type in DATA_TYPES

        self.ref = ref
        self.qry = qry
        self.data_type = data_type
        self.ref_len = ref.shape[0]
        self.qry_len = qry.shape[0]
        self.cross_cor = cross_cor      # c(k)
        self.threshold = threshold      # threshold for homologous segments
        self.n = n                      # check for top n cross-correlation value
        self.wndw_size = wndw_size      # window size for sliding window
        self.maximum_segment_length = l # maximum length for homologous segment)
    
    def _get_score(self, ref: np.ndarray, qry: np.ndarray, mode='DOT'):
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
                score = np.sum(dot)
            elif self.data_type == 'PROTEIN':
                for i in range(len(ref)):
                    # print(f'pair: <{AMINO_ACID_MAPPING[f"{ref[i]}"]}, {AMINO_ACID_MAPPING[f"{qry[i]}"]}>')
                    s = BLOSUM62[ref[i]][qry[i]]
                    # print(f'score: {s}')
                    score += s
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
        abs_offset = abs(offset)
        if offset < 0: # pad ref left
            padded_L = max(self.ref_len+abs_offset, self.qry_len) # 598+13
        else: # pad qry left
            padded_L = max(self.ref_len, self.qry_len+abs_offset)

        padded_ref = 0
        padded_qry = 0
        if offset < 0: # pad ref left, qry right
            padded_ref = np.pad(self.ref, (padded_L-self.ref_len, 0), mode='constant')
            padded_qry = np.pad(self.qry, (0, padded_L-self.qry_len), mode='constant')
        else : # pad qry left, ref right
            padded_ref = np.pad(self.ref, (0, padded_L-self.ref_len), mode='constant')
            padded_qry = np.pad(self.qry, (padded_L-self.qry_len, 0), mode='constant')
        
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
        for i in range (sliding_wndw_start_idx, sliding_wndw_end_idx):
            score = self._get_score(padded_ref[i:i+self.wndw_size], padded_qry[i:i+self.wndw_size])
            ##### debug
            # print(score)
            #####
            if score > self.threshold:
                score_list.append(score)
                if offset < 0:
                    # print(f'offset: {offset}')
                    # print(f'append {i-offset}')
                    ref_segment_list.append(i-abs_offset)
                else:
                    # print(f'offset: {offset}')
                    # print(f'append {i}')
                    ref_segment_list.append(i)
            
        ref_segments = [[i, i+self.wndw_size] for i in ref_segment_list]

        ##### debug
        # print(f'ref: {ref_segments}')
        # print(f'offset: {offset}')
        # score_list = np.array(score_list)
        # histogram, _ = np.histogram(score_list, [0, 5, 10, 15, 20, 25, 30, 35])
        # print(histogram)
        #####

        # combine adjacent segments
        i = 0
        for i in range(len(ref_segments)-1):
            j = i+1
            while j < len(ref_segments):
                # combine
                if (ref_segments[i][1] == ref_segments[j][0]) and (ref_segments[i][1] - ref_segments[i][0] != self.maximum_segment_length):
                    ref_segments[i][1] = ref_segments[j][1]
                    score_list[i] += score_list[j]
                    del ref_segments[j]
                    del score_list[j]
                else: j += 1

        ref_segments = np.array(ref_segments)
        score_list = np.array(score_list)

        if verbose:
            print(f'ref segments: {ref_segments}')
        
        return ref_segments, score_list

    def get_all_homologous_segments(self) -> list:
        '''
            return list of HomologousSegmentSet
        '''
        # print(f'cross correlation: {self.cross_cor}')
        top_offsets = self.cross_cor.argsort()[-self.n:] # get top n of offset (k)
        print(f'top offsets score: {self.cross_cor[top_offsets]}')
        L = len(self.ref) if len(self.ref) >= len(self.qry) else len(self.qry)
        top_offsets -= (L - 1) # change range from (0, 2*l-1) to (-l+1, l-1)
        print(f'top offset: {top_offsets}')
        all_segment_set = []
        total_segments = 0
        for offset in top_offsets:
            ref_segment_list, score_list = self._get_segment(offset)
            total_segments += ref_segment_list.shape[0]
            # save in np 2D array shape = (n, 2)
            segment_set = HomologousSegmentSet(offset, ref_segment_list, score_list, self.cross_cor[offset+L-1])
            all_segment_set.append(segment_set)
            segment_set.print_info()
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
    while homologous_segments_set[index].count <= 0: index += 1
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