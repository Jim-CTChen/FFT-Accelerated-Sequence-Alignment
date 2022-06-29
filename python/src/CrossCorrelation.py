import numpy as np

class CrossCorrelation(object):
    # data_type
    data_type_list = ['DNA', 'RNA', 'PROTEIN']
    DNA = 0
    RNA = 1
    PROTEIN = 2

    # mode
    mode_list = ['pair', 'group']
    PAIR_MODE = 0
    GROUP_MODE = 1

    Z = 0 # zero padding
    A = 1
    T = 2
    C = 3
    G = 4
    U = 5

    def __init__(self, seq1: np.ndarray, seq2: np.ndarray, data_type: str='DNA', mode: str='pair'):
        assert type(seq1) == np.ndarray
        assert type(seq2) == np.ndarray
        assert data_type in self.data_type_list
        assert mode in self.mode_list
        assert len(seq1) == len(seq2)

        self.seq1 = seq1
        self.seq2 = seq2
        self.mode = 0
        self.data_type = 0

        if data_type == 'DNA': self.data_type = self.DNA
        elif data_type == 'RNA': self.data_type = self.RNA
        elif data_type == 'PROTEIN': self.data_type = self.PROTEIN
        
        if mode == 'PAIR': self.mode = self.PAIR
        elif mode == 'GROUP': self.mode = self.GROUP
    
    def _seq2freq(self, seq, symbol):
        '''
            Convert nucleicide sequences to frequency sequence
            pairwise: turn into boolean array (in 0, 1 format)
        '''
        freq = 0

        # pairwise
        if self.mode == self.PAIR_MODE:
            freq = np.equal(seq, np.full(len(seq), symbol)).astype(int)

        # group wise
        # TODO
        
        return freq
    
    def _pad_for_FFT(self, seq):
        '''
            pad for FFT (since numpy do circular FFT)
        '''
        pad_seq = np.pad(seq, (0, len(seq)), mode='constant')
        return pad_seq

    def _reverse_seq(self, seq):
        return np.flip(seq)

    def _FFT(self, seq):
        return np.fft.rfft(seq)

    def _iFFT(self, seq):
        c = np.fft.irfft(seq).astype(float)
        return c

    def XCorr(self):
        L = max(len(self.seq1), len(self.seq2))

        if self.data_type == self.DNA:
            s1_FFT_pad = self._pad_for_FFT(self.seq1)
            t1_FFT_pad = self._pad_for_FFT(self.seq2)

            s1_A = self._seq2freq(s1_FFT_pad, self.A)
            s1_T = self._seq2freq(s1_FFT_pad, self.T)
            s1_C = self._seq2freq(s1_FFT_pad, self.C)
            s1_G = self._seq2freq(s1_FFT_pad, self.G)

            t1_A = self._seq2freq(t1_FFT_pad, self.A)
            t1_T = self._seq2freq(t1_FFT_pad, self.T)
            t1_C = self._seq2freq(t1_FFT_pad, self.C)
            t1_G = self._seq2freq(t1_FFT_pad, self.G)

            t1_A_r = self._reverse_seq(t1_A) 
            t1_T_r = self._reverse_seq(t1_T) 
            t1_C_r = self._reverse_seq(t1_C) 
            t1_G_r = self._reverse_seq(t1_G) 

            S1_A = self._FFT(s1_A)
            S1_T = self._FFT(s1_T)
            S1_C = self._FFT(s1_C)
            S1_G = self._FFT(s1_G)

            T1_A = self._FFT(t1_A_r)
            T1_T = self._FFT(t1_T_r)
            T1_C = self._FFT(t1_C_r)
            T1_G = self._FFT(t1_G_r)

            C_A = S1_A*T1_A
            C_T = S1_T*T1_T
            C_C = S1_C*T1_C
            C_G = S1_G*T1_G

            c_A = self._iFFT(C_A)
            c_T = self._iFFT(C_T)
            c_C = self._iFFT(C_C)
            c_G = self._iFFT(C_G)

            c_A = np.round(np.roll(c_A, L)[:2*L-1])
            c_T = np.round(np.roll(c_T, L)[:2*L-1])
            c_C = np.round(np.roll(c_C, L)[:2*L-1])
            c_G = np.round(np.roll(c_G, L)[:2*L-1])

            c = c_A+c_T+c_C+c_G

            # use ground truth to check error
            gt_s_A = self._seq2freq(self.seq1, self.A)
            gt_s_T = self._seq2freq(self.seq1, self.T)
            gt_s_C = self._seq2freq(self.seq1, self.C)
            gt_s_G = self._seq2freq(self.seq1, self.G)

            gt_t_A = self._seq2freq(self.seq2, self.A)
            gt_t_T = self._seq2freq(self.seq2, self.T)
            gt_t_C = self._seq2freq(self.seq2, self.C)
            gt_t_G = self._seq2freq(self.seq2, self.G)

            gt_A = np.correlate(gt_s_A, gt_t_A, mode='full')
            gt_T = np.correlate(gt_s_T, gt_t_T, mode='full')
            gt_C = np.correlate(gt_s_C, gt_t_C, mode='full')
            gt_G = np.correlate(gt_s_G, gt_t_G, mode='full')
            
            assert np.array_equiv(c_A, gt_A)
            assert np.array_equiv(c_T, gt_T)
            assert np.array_equiv(c_C, gt_C)
            assert np.array_equiv(c_G, gt_G)

            return c

        elif self.data_type == self.RNA:
            return -1
        elif self.data_type == self.PROTEIN:
            return -1