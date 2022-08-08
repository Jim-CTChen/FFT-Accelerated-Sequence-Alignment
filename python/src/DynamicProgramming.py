import numpy as np
from Aligner import Aligner
from config import DATA_TYPES, ALGORITHMS

class DPEngine(object):
    def __init__(self, ref: np.ndarray, qry: np.ndarray, alg='SW', data_type='PROTEIN', buffer=1/4):
        assert alg in ALGORITHMS
        assert data_type in DATA_TYPES
        self.ref = ref  # x axis
        self.qry = qry  # y axis
        self.key_points = None
        self.alg = alg
        self.sw = Aligner(ref, qry, alg, data_type, buffer)

    def dp_in_reduced_space(self, key_points: np.ndarray) -> int:
        reduced_score, reduced_ratio = self.sw.calculate_score_in_reduced_space(key_points)
        return reduced_score, reduced_ratio

    def dp_normal(self) -> int:
        score = self.sw.calculate_score()
        return score

    def traceback(self):
        self.sw.traceback()

    def show_score_matrix(self):
        self.sw.show_score_matrix()

    @property
    def score_matrix(self):
        return self.sw.score_matrix

    @property
    def path(self):
        return self.sw.path

    @property
    def trace_matrix(self):
        return self.sw.trace_matrix