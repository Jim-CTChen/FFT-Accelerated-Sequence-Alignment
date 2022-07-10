import numpy as np

class HomologousSegmentSet(object):
    '''
        record segments for each offset

        offset: ref.position - qry.position
        segment: 2D array, [[start_idx, end_idx], ...] (should be sorted by start_idx)
        score: score for each segment
    '''
    def __init__(self, offset, segments: np.ndarray, score: np.ndarray):
        self.offset = offset
        self.ref_segments = segments
        self.score = score
        self.coords = self._segment_to_coord()
        self.count = len(segments)
    
    def _segment_to_coord(self):
        coord = [
            [(seg[0]+seg[1])//2, ((seg[0]+seg[1])//2-self.offset)]
            for seg in self.ref_segments
        ]
        return np.array(coord)

    @property
    def qry_segments(self):
        return self.ref_segments - self.offset