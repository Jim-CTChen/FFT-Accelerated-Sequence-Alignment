from random import random
import numpy as np
import matplotlib.pyplot as plt
from config import NUCLEIC_ACID_MAPPING, AMINO_ACID_MAPPING, BLOSUM62
from tool import random_gen_seq

class Aligner(object):
    '''
        Alignment Engine
        Align pairwise sequences
        Smith-Waterman or Needleman-Wunch
    '''
    DUMMY, DELETION, INSERTION, MATCH = range(4)

    def __init__(self, ref: np.ndarray, qry: np.ndarray, alg='SW', data_type='DNA-RNA'):
        '''
            parameter:
            ref: np.ndarray, reference sequence
            qry: np.ndarray, query sequence
            alg: string {'SW', 'NW'}, scoring algorithm
        '''
        assert type(ref) == np.ndarray
        assert type(qry) == np.ndarray
        algorithm = ['SW', 'NW']
        assert alg in algorithm
        data_types = ['DNA-RNA', 'PROTEIN']
        assert data_type in data_types
        
        self.ref = ref # x axis
        self.qry = qry # y axis
        self.score_matrix     = np.zeros((len(qry)+1, len(ref)+1)) # pad for, zero border
        self.insertion_matrix = np.zeros((len(qry)+1, len(ref)+1)) # pad for, zero border
        self.deletion_matrix  = np.zeros((len(qry)+1, len(ref)+1)) # pad for, zero border
        self.trace_matrix     = np.zeros((len(qry)+1, len(ref)+1)) # pad for, zero border

        self.match_score = 8
        self.mismatch_score = -5
        if data_type == 'DNA-RNA':
            self.gap_open_penalty = -7
            self.gap_ext_penalty = -3
        else:
            self.gap_open_penalty = -11
            self.gap_ext_penalty = -1

        self.alg = alg
        self.data_type = data_type

        self.mapping = NUCLEIC_ACID_MAPPING if data_type == 'DNA-RNA' else AMINO_ACID_MAPPING
        self.path = []

    def _reset_matrix(self):
        self.insertion_matrix.fill(0)
        self.deletion_matrix.fill(0)
        self.score_matrix.fill(0)
        self.trace_matrix.fill(self.DUMMY)
        if self.alg == 'NW':
            # init boundary condition
            self.insertion_matrix[0][1] = self.gap_open_penalty
            self.deletion_matrix[0][1] = self.gap_open_penalty
            self.score_matrix[0][1] = self.gap_open_penalty
            self.insertion_matrix[1][0] = self.gap_open_penalty
            self.deletion_matrix[1][0] = self.gap_open_penalty
            self.score_matrix[1][0] = self.gap_open_penalty
            for i in range(2, self.score_matrix.shape[0]):
                self.insertion_matrix[i][0] = self.insertion_matrix[i-1][0] + self.gap_ext_penalty
                self.deletion_matrix[i][0] = self.deletion_matrix[i-1][0] + self.gap_ext_penalty
                self.score_matrix[i][0] = self.score_matrix[i-1][0] + self.gap_ext_penalty
            for j in range(2, self.score_matrix.shape[1]):
                self.insertion_matrix[0][j] = self.insertion_matrix[0][j-1] + self.gap_ext_penalty
                self.deletion_matrix[0][j] = self.deletion_matrix[0][j-1] + self.gap_ext_penalty
                self.score_matrix[0][j] = self.score_matrix[0][j-1] + self.gap_ext_penalty
            
            for i in range(1, self.score_matrix.shape[0]):
                self.trace_matrix[i][0] = self.INSERTION
            for j in range(1, self.score_matrix.shape[1]):
                self.trace_matrix[0][j] = self.DELETION

    def calculate_score(self):
        '''
            Perform SW or NW and calculate total score
        '''
        self._reset_matrix()
        # there are zero border, so start from 1 ~ len-1
        for i in range(1, self.score_matrix.shape[0]):     # i for y-axis, qry, insertion
            for j in range(1, self.score_matrix.shape[1]): # j for x-axis, ref, deletion
                self.deletion_matrix[i][j] = max(self.deletion_matrix[i][j-1]+self.gap_ext_penalty, self.score_matrix[i][j-1]+self.gap_open_penalty)
                self.insertion_matrix[i][j]  = max(self.insertion_matrix[i-1][j]+self.gap_ext_penalty, self.score_matrix[i-1][j]+self.gap_open_penalty)
                # i-1 and j-1 are origin coord (because of padding)
                
                w = 0
                if self.data_type == 'DNA-RNA':
                    w = self.match_score if self.ref[j-1] == self.qry[i-1] else self.mismatch_score
                elif self.data_type == 'PROTEIN':
                    w = BLOSUM62[self.ref[j-1]][self.qry[i-1]]
                
                insertion = (self.insertion_matrix[i][j], self.INSERTION)
                deletion  = (self.deletion_matrix[i][j], self.DELETION)
                match = (self.score_matrix[i-1][j-1]+w, self.MATCH)
                if self.alg == 'SW':
                    self.score_matrix[i][j], self.trace_matrix[i][j] = max(
                        match,
                        deletion,
                        insertion
                    )
                    if self.score_matrix[i][j] < 0: self.score_matrix[i][j] = 0
                elif self.alg == 'NW':
                    self.score_matrix[i][j], self.trace_matrix[i][j] = max(
                        match,
                        deletion,
                        insertion
                    )

        return self.score_matrix.max()

    def print_score_matrix(self):
        '''Print the scoring matrix.
            ex:
                    A   T   C   G   A
                0   0   0   0   0   0
            A   0   2   1   2   1   2
            T   0   1   1   1   1   1
            C   0   0   3   2   3   2
            G   0   2   2   5   4   5
            A   0   1   4   4   7   6
        '''
        print(' '*12, end='')
        for r in self.ref:
            print('{0:>6}'.format(self.mapping[f'{r}']), end='')
        print()
        for i, row in enumerate(self.score_matrix.astype(int)):
            if i != 0:
                print('{0:>6}'.format(self.mapping[f'{self.qry[i-1]}']), end='')
            else:
                print(' '*6, end='')
            for col in row:
                print('{0:>6}'.format(col), end='')
            print()
    
    def print_trace_matrix(self):
        '''Print the scoring matrix.
            'D' for DELETION
            'I' for INSERTION
            'M' for MATCH
            '0' for DUMMY
            ex:
                    A   T   C   G   A
                0   D   D   D   D   D
            A   I   M   D   D   D   M
            T   I   I   M   D   D   D
            C   I   I   I   M   D   D
            G   I   I   I   I   M   D
            A   I   M   I   I   I   M
        '''
        # DUMMY, DELETION, INSERTION, MATCH = range(4)
        SYMBOL = [0, 'D', 'I', 'M']
        print(' '*6*2, end='')
        for r in self.ref:
            print('{0:>6}'.format(self.mapping[f'{r}']), end='')
        print()
        for i, row in enumerate(self.trace_matrix.astype(int)):
            if i != 0:
                print('{0:>6}'.format(self.mapping[f'{self.qry[i-1]}']), end='')
            else:
                print(' '*6, end='')
            for col in row:
                print('{0:>6}'.format(SYMBOL[col]), end='')
            print()

    def show_score_matrix(self):
        plt.imshow(self.score_matrix, cmap='hot', interpolation='nearest')
        plt.show()
        # plt.imsave('mat.jpg', self.score_matrix, cmap='hot')

    def calculate_score_in_reduced_space(self, key_points: np.ndarray) -> int:
        '''
            key_points should be sorted by ascending order
        '''
        # FIXME: update trace matrix
        # check if key points are sorted by ascending order
        for idx, kp in enumerate(key_points):
            if idx == key_points.shape[0]-1: break
            next_kp = key_points[idx+1]
            assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
            assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'
        
        self._reset_matrix()

        # add right buttom corner(end point) to key point
        end_point = np.array([[self.ref.shape[0], self.qry.shape[0]]])
        key_points = np.concatenate((key_points, end_point), axis=0)


        x = 1 # there are zero border, so start from 1
        y = 1 # there are zero border, so start from 1
        for k_p in key_points:
            print(f'key point: {k_p}')
            if k_p[0] == k_p[1] == 0:
                continue
            for i in range(y, k_p[1]+1):      # y axis, qry
                for j in range(x, k_p[0]+1):  # x axis, ref
                    self.insertion_matrix[i][j] = max(self.insertion_matrix[i][j-1]+self.gap_ext_penalty, self.score_matrix[i][j-1]+self.gap_open_penalty)
                    self.deletion_matrix[i][j]  = max(self.deletion_matrix[i-1][j]+self.gap_ext_penalty, self.score_matrix[i-1][j]+self.gap_open_penalty)
                    # i-1 and j-1 are origin coord (because of padding)
                    w = 0
                    if self.data_type == 'DNA-RNA':
                        w = self.match_score if self.ref[j-1] == self.qry[i-1] else self.mismatch_score
                    elif self.data_type == 'PROTEIN':
                        w = BLOSUM62[self.ref[j-1]][self.qry[i-1]]

                    if self.alg == 'SW':
                        self.score_matrix[i][j] = max(
                            self.score_matrix[i-1][j-1]+w,
                            self.insertion_matrix[i][j],
                            self.deletion_matrix[i][j],
                            0
                        )
                    elif self.alg == 'NW':
                        self.score_matrix[i][j] = max(
                            self.score_matrix[i-1][j-1]+w,
                            self.insertion_matrix[i][j],
                            self.deletion_matrix[i][j]
                        )
                        pass
            x = k_p[0]
            y = k_p[1]

        return self.score_matrix.max()

    def traceback(self):
        '''
            Find the optimal path through the matrix. 
        '''
        GAP_SYMBOL_MAPPING = 0
        aligned_ref = []
        aligned_qry = []
        if self.alg == 'SW':
            y, x = np.unravel_index(np.argmax(self.score_matrix, axis=None), self.score_matrix.shape)
        elif self.alg == 'NW':
            x, y = self.ref.shape[0], self.qry.shape[0]

        while x != 1 and y != 1:
            if self.alg == 'SW' and not self.score_matrix[y][x]: break
            self.path.append([x, y])
            if self.trace_matrix[y][x] == self.MATCH:
                aligned_ref.append(self.ref[x-1])
                aligned_qry.append(self.qry[y-1])
                x -= 1
                y -= 1
            elif self.trace_matrix[y][x] == self.INSERTION:
                aligned_ref.append(GAP_SYMBOL_MAPPING)
                aligned_qry.append(self.qry[y-1])
                y -= 1
            elif self.trace_matrix[y][x] == self.DELETION:
                aligned_ref.append(self.ref[x-1])
                aligned_qry.append(GAP_SYMBOL_MAPPING)
                x -= 1
            else:
                assert False, f'something wrong when trace back with trace_matrix at (x, y) = ({x}, {y}), score: {self.score_matrix[y][x]}, trace: {self.trace_matrix[y][x]}'


        aligned_ref = [str(s) for s in reversed(aligned_ref)]
        aligned_qry = [str(s) for s in reversed(aligned_qry)]

        return self.format_alignment(aligned_ref), self.format_alignment(aligned_qry)
        
    def format_alignment(self, seq):
        alignment = []
        for s in seq:
            try:
                nucleic = self.mapping[s]
            except KeyError:
                nucleic = s
                # raise ValueError(f'exist unrecognizable symbol: {s}')
            alignment.append(nucleic)
        
        return ''.join(alignment)

if __name__ == '__main__':
    np.set_printoptions(suppress=True)

    # test data 1, 109-1 special project data
    print('=========== Test 1 ===========')
    s1 = np.loadtxt('../../data/109-1_data/s1.dat').flatten().astype(int)
    t1 = np.loadtxt('../../data/109-1_data/t1.dat').flatten().astype(int)
    ans = '0x'
    with open('../../data/109-1_data/golden1.dat', 'r') as f:
        ans += f.readline()[:-1]
    ans = int(ans, base=16)
    sw = Aligner(s1, t1)
    score = sw.calculate_score()


    print(f'Final score: {score}')
    print(f'Golden: {ans}')

    # test data 2, 109-1 special project data
    print('=========== Test 2 ===========')
    s2 = np.loadtxt('../../data/109-1_data/s2.dat').flatten()
    t2 = np.loadtxt('../../data/109-1_data/t2.dat').flatten()
    ans = '0x'
    with open('../../data/109-1_data/golden2.dat', 'r') as f:
        ans += f.readline()[:-1]
    ans = int(ans, base=16)
    sw = Aligner(s2, t2)
    score = sw.calculate_score()

    print(f'Final score: {score}')
    print(f'Golden: {ans}')

    # test data 3, test reduce scoring
    print('=========== Test 3 ===========')
    L = 4
    t = np.array([1, 2, 3, 4])
    ref = np.concatenate((t,)*int(L//4))
    qry = ref
    ans = sw.match_score*L
    sw = Aligner(ref, qry)
    score = sw.calculate_score()
    print('score matrix:')
    sw.print_score_matrix()

    key_points = np.array([[i, i] for i in range(0, L, 2)])

    print(f'Final score: {score}')
    reduced_score = sw.calculate_score_in_reduced_space(key_points)
    print('score matrix:')
    sw.print_score_matrix()
    print(f'Final reduced score: {reduced_score}')
    print(f'Golden: {ans}')

    test data 4
    print('=========== Test 4 ===========')
    L = 8
    t = np.array([1, 2, 3, 4])
    qry = np.concatenate((t,)*int(L//4))
    ref = np.concatenate((qry, qry))
    print(f'ref: {ref}')
    print(f'qry: {qry}')
    ans = sw.match_score*L
    sw = Aligner(ref, qry, alg='SW')
    print(f'Final score: {score}')
    score = sw.calculate_score()
    print('score matrix:')
    sw.print_score_matrix()

    key_points = np.array([[i, i] for i in range(0, L, 2)])

    reduced_score = sw.calculate_score_in_reduced_space(key_points)
    print('score matrix:')
    sw.print_score_matrix()
    print(f'Final reduced score: {reduced_score}')
    print(f'Golden: {ans}')
    ref, qry = sw.traceback()
    print(f'aligned ref: {ref}')
    print(f'aligned qry: {qry}')
    print('score matrix:')
    
    # test data 5, protein
    
    ref = random_gen_seq(len=16, data_type='PROTEIN')
    qry = random_gen_seq(len=16, data_type='PROTEIN')
    sw = Aligner(ref, qry, data_type='PROTEIN')
    score = sw.calculate_score()
    print(f'score: {score}')
    sw.print_score_matrix()