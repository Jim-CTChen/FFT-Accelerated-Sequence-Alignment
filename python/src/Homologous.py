import numpy as np
from Aligner import *
from HomologousSegmentSet import HomologousSegmentSet

class Homologous(object):
    def __init__(self, ref: np.ndarray, qry: np.ndarray, cross_cor, score_system='DOT', threshold=180, n=16, wndw_size=30, l=150):
        # assert len(ref) == len(qry)
        assert type(ref) == np.ndarray 
        assert type(qry) == np.ndarray

        self.ref = ref
        self.qry = qry
        self.ref_len = ref.shape[0]
        self.qry_len = qry.shape[0]
        self.cross_cor = cross_cor      # c(k)
        self.threshold = threshold      # threshold for homologous segments
        self.n = n                      # check for top n cross-correlation value
        self.wndw_size = wndw_size      # window size for sliding window
        self.maximum_segment_length = l # maximum length for homologous segment)
    
    def _get_score(self, ref, qry, mode='SW'):
        '''
            use different score system to calculate score between ref & qry
            mode: 
                'SW' for SmithWaterman
                'DOT' for dot product
                default 'DOT'
        '''
        if mode == 'SW':
            SW = Aligner(ref, qry, alg='SW')
            return SW.calculate_score()
        elif mode == 'DOT':
            dot = np.equal(ref, qry)
            return np.sum(dot)
        
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
            padded_L = max(self.ref_len+abs_offset, self.qry_len)
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
                    ref_segment_list.append(i-offset)
                else:
                    # print(f'offset: {offset}')
                    # print(f'append {i}')
                    ref_segment_list.append(i)
            
        ref_segments = [[i, i+self.wndw_size] for i in ref_segment_list]

        ##### debug
        # print(f'ref: {ref_segments}')
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
        top_offsets = self.cross_cor.argsort()[-self.n:] # get top n of offset (k)
        # print(f'top offsets score: {self.cross_cor[top_offsets]}')
        top_offsets -= (len(self.ref) - 1) # change range from (0, 2*l-1) to (-l+1, l-1)
        # print(f'top offsets: {top_offsets}')
        all_segment_set = []
        total_segments = 0
        for offset in top_offsets:
            ref_segment_list, score_list = self._get_segment(offset)
            total_segments += ref_segment_list.shape[0]
            # save in np 2D array shape = (n, 2)
            segment_set = HomologousSegmentSet(offset, ref_segment_list, score_list)
            all_segment_set.append(segment_set)
            
        return total_segments, all_segment_set
