import numpy as np
from Aligner import Aligner

class DPEngine(object):
    def __init__(self, ref: np.ndarray, qry: np.ndarray, alg='SW'):
        self.ref = ref  # x axis
        self.qry = qry  # y axis
        self.key_points = None
        algorithm = ['SW', 'NW']
        assert alg in algorithm
        self.alg = alg
        self.sw = Aligner(ref, qry, alg)

    def dp_in_reduced_space(self, key_points: np.ndarray) -> int:
        reduced_score = self.sw.calculate_score_in_reduced_space(key_points)
        print(f'reduced_score: {reduced_score}')
        return reduced_score

    def dp_normal(self) -> int:
        score = self.sw.calculate_score()
        print(f'score: {score}')
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