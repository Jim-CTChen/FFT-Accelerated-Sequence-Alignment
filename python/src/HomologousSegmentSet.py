import numpy as np

class HomologousSegmentSet(object):
    '''
        record segments for each offset

        offset: ref.position - qry.position
        segment: 2D array, [[start_idx, end_idx], ...] (should be sorted by start_idx)
        score: score for each segment
    '''
    def __init__(self, offset, segments: np.ndarray, score: np.ndarray, correlation):
        self.offset = offset
        self.ref_segments = segments
        self.score = score
        self.coords = self._segment_to_coord()
        self.count = len(segments)
        self.correlation_score = correlation

    def print_info(self, print_segment:bool =False):
        '''
            print homologous segment set info
            param:
                print_segment (bool): print all segment
        '''
        print(f'--- Homologous Segment Set Info ---')
        print(f'offset: {self.offset}')
        print(f'total segments: {self.count}')
        print(f'cross correlation score: {self.correlation_score}')
        if print_segment:
            print(f'printing segments:')
            for i in range(len(self.ref_segments)):
                print(f'ref: {self.ref_segments[i]}, qry: {self.qry_segments[i]}')
        print(f'----------------------------------')
    
    def _segment_to_coord(self):
        coord = [
            [(seg[0]+seg[1])//2, ((seg[0]+seg[1])//2-self.offset)]
            for seg in self.ref_segments
        ]
        return np.array(coord)

    def __len__(self):
        return len(self.coords)

    @property
    def qry_segments(self):
        return self.ref_segments - self.offset