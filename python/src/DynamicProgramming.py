import numpy as np
from Aligner import Aligner
from config import DATA_TYPES, ALGORITHMS

class DPEngine(object):
    def __init__(self, ref: np.ndarray, qry: np.ndarray, alg='SW', data_type='PROTEIN', buffer=1/4, band=32):
        assert alg in ALGORITHMS
        assert data_type in DATA_TYPES
        self.ref = ref  # x axis
        self.qry = qry  # y axis
        self.key_points = None
        self.alg = alg
        self.band = band
        self.aligner = Aligner(ref, qry, alg, data_type, buffer, band)
        self.operation_cycles = 0 # cycle needed for aligner to DP

    def dp_in_reduced_space(self, key_points: np.ndarray) -> int:
        # reduced_score, reduced_ratio = self.aligner.calculate_score_in_reduced_space(key_points)
        reduced_score, dp_space_reduced_ratio = self.aligner.calculate_score_hardware_reduced(key_points)
        self.operation_cycles = self.aligner.operation_cycles
        return reduced_score, dp_space_reduced_ratio

    def dp_normal(self) -> int:
        # score = self.aligner.calculate_score()
        score_hw = self.aligner.calculate_score_hardware()
        self.operation_cycles = self.aligner.operation_cycles
        return score_hw

    @property
    def dp_operation_cycles(self):
        return self.operation_cycles

    def traceback(self):
        self.aligner.traceback()

    def show_score_matrix(self):
        self.aligner.show_score_matrix()

    @property
    def score_matrix(self):
        return self.aligner.score_matrix

    @property
    def path(self):
        return self.aligner.path

    @property
    def trace_matrix(self):
        return self.aligner.trace_matrix