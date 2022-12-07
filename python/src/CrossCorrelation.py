import numpy as np
import random
from config import DNA_4, RNA_4, POLARITY_MAPPING, VOLUME_MAPPING, AMINO_ACID_MAPPING
from config import VOLUME_MAPPING_4, VOLUME_MAPPING_8, VOLUME_MAPPING_16, VOLUME_MAPPING_32, VOLUME_MAPPING_64, VOLUME_MAPPING_RANDOM
from tool import random_gen_seq

class CrossCorrelation(object):
    # data_type
    data_type_list = ['DNA', 'RNA', 'PROTEIN']
    DNA = 0
    RNA = 1
    PROTEIN = 2

    def __init__(self, seq1: np.ndarray, seq2: np.ndarray, data_type: str='DNA', use_polarity: bool=False, quant_volume=0):
        '''
            len(seq1) should == len(seq2)
        '''
        assert type(seq1) == np.ndarray
        assert type(seq2) == np.ndarray
        assert data_type in self.data_type_list


        
        # self.seq1, self.seq2 = self._pad_seq(seq1, seq2)
        self.seq1, self.seq2 = seq1, seq2
        self.data_type = 0
        self.use_polarity = use_polarity

        if data_type == 'DNA': self.data_type = self.DNA
        elif data_type == 'RNA': self.data_type = self.RNA
        elif data_type == 'PROTEIN': self.data_type = self.PROTEIN

        if quant_volume == 0:
            self.volume_mapping = VOLUME_MAPPING
        elif quant_volume == 4:
            self.volume_mapping = VOLUME_MAPPING_4
        elif quant_volume == 8:
            self.volume_mapping = VOLUME_MAPPING_8
        elif quant_volume == 16:
            self.volume_mapping = VOLUME_MAPPING_16
        elif quant_volume == 32:
            self.volume_mapping = VOLUME_MAPPING_32
        elif quant_volume == 64:
            self.volume_mapping = VOLUME_MAPPING_64
        elif quant_volume == -1:
            self.volume_mapping = VOLUME_MAPPING_RANDOM
        
    
    def _pad_seq(self, seq1, seq2):
        '''
            pairwise padding to same length
        '''
        n = len(seq1)
        m = len(seq2)
        l = max(n, m)
        if n > m:
            seq2 = np.pad(seq2, (0, n-m), mode='constant')
        else:
            seq1 = np.pad(seq1, (0, m-n), mode='constant')
        
        return seq1, seq2

    def _seq2freq(self, seq, symbol):
        '''
            Convert nucleicide sequences to frequency sequence
            pairwise: turn into boolean array (in 0, 1 format)
        '''
        freq = 0

        # pairwise

        freq = np.equal(seq, np.full(len(seq), symbol)).astype(int)

        # group wise
        # TODO
        
        return freq
    
    def _seq2polarity(self, seq):
        p = []
        for n in seq:
            symbol = AMINO_ACID_MAPPING[f'{n}']
            p.append(POLARITY_MAPPING[symbol])
        return np.array(p)

    def _seq2volume(self, seq):
        v = []
        for n in seq:
            symbol = AMINO_ACID_MAPPING[f'{n}']
            v.append(self.volume_mapping[symbol])
        return np.array(v)

    def _pad_for_FFT(self, seq1, seq2):
        '''
            pad for FFT (since numpy do circular FFT)
        '''
        L = 0
        N, M = len(seq1), len(seq2)
        if N+M < 4: L = 4
        elif N+M < 8: L = 8
        elif N+M < 16: L = 16
        elif N+M < 32: L = 32
        elif N+M < 64: L = 64
        elif N+M < 128: L = 128
        elif N+M < 256: L = 256
        elif N+M < 512: L = 512
        elif N+M < 1024: L = 1024
        elif N+M < 2048: L = 2048
        else:
            print('sequence too long!')
            quit()
        seq1_pad = np.pad(seq1, (0, L-len(seq1)), mode='constant')
        seq2_pad = np.pad(seq2, (0, L-len(seq2)), mode='constant')
        
        return seq1_pad, seq2_pad

    def _reverse_seq(self, seq):
        return np.flip(seq)

    def _FFT(self, seq):
        return np.fft.rfft(seq)

    def _iFFT(self, seq):
        c = np.fft.irfft(seq).astype(float)
        return c

    def XCorr(self) -> np.ndarray:
        L = max(len(self.seq1), len(self.seq2))

        if self.data_type == self.DNA:
            s1_FFT_pad, t1_FFT_pad = self._pad_for_FFT(self.seq1, self.seq2)
            
            s1_A = self._seq2freq(s1_FFT_pad, DNA_4['A'])
            s1_T = self._seq2freq(s1_FFT_pad, DNA_4['T'])
            s1_C = self._seq2freq(s1_FFT_pad, DNA_4['C'])
            s1_G = self._seq2freq(s1_FFT_pad, DNA_4['G'])

            t1_A = self._seq2freq(t1_FFT_pad, DNA_4['A'])
            t1_T = self._seq2freq(t1_FFT_pad, DNA_4['T'])
            t1_C = self._seq2freq(t1_FFT_pad, DNA_4['C'])
            t1_G = self._seq2freq(t1_FFT_pad, DNA_4['G'])

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
            gt_s_A = self._seq2freq(self.seq1, DNA_4['A'])
            gt_s_T = self._seq2freq(self.seq1, DNA_4['T'])
            gt_s_C = self._seq2freq(self.seq1, DNA_4['C'])
            gt_s_G = self._seq2freq(self.seq1, DNA_4['G'])

            gt_t_A = self._seq2freq(self.seq2, DNA_4['A'])
            gt_t_T = self._seq2freq(self.seq2, DNA_4['T'])
            gt_t_C = self._seq2freq(self.seq2, DNA_4['C'])
            gt_t_G = self._seq2freq(self.seq2, DNA_4['G'])

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
            s1_FFT_pad, t1_FFT_pad = self._pad_for_FFT(self.seq1, self.seq2)

            s1_A = self._seq2freq(s1_FFT_pad, RNA_4['A'])
            s1_U = self._seq2freq(s1_FFT_pad, RNA_4['U'])
            s1_C = self._seq2freq(s1_FFT_pad, RNA_4['C'])
            s1_G = self._seq2freq(s1_FFT_pad, RNA_4['G'])

            t1_A = self._seq2freq(t1_FFT_pad, RNA_4['A'])
            t1_U = self._seq2freq(t1_FFT_pad, RNA_4['U'])
            t1_C = self._seq2freq(t1_FFT_pad, RNA_4['C'])
            t1_G = self._seq2freq(t1_FFT_pad, RNA_4['G'])

            t1_A_r = self._reverse_seq(t1_A) 
            t1_U_r = self._reverse_seq(t1_U) 
            t1_C_r = self._reverse_seq(t1_C) 
            t1_G_r = self._reverse_seq(t1_G) 

            S1_A = self._FFT(s1_A)
            S1_U = self._FFT(s1_U)
            S1_C = self._FFT(s1_C)
            S1_G = self._FFT(s1_G)

            T1_A = self._FFT(t1_A_r)
            T1_U = self._FFT(t1_U_r)
            T1_C = self._FFT(t1_C_r)
            T1_G = self._FFT(t1_G_r)

            C_A = S1_A*T1_A
            C_U = S1_U*T1_U
            C_C = S1_C*T1_C
            C_G = S1_G*T1_G

            c_A = self._iFFT(C_A)
            c_U = self._iFFT(C_U)
            c_C = self._iFFT(C_C)
            c_G = self._iFFT(C_G)

            c_A = np.round(np.roll(c_A, L)[:2*L-1])
            c_U = np.round(np.roll(c_U, L)[:2*L-1])
            c_C = np.round(np.roll(c_C, L)[:2*L-1])
            c_G = np.round(np.roll(c_G, L)[:2*L-1])

            c = c_A+c_U+c_C+c_G

            # use ground truth to check error
            gt_s_A = self._seq2freq(self.seq1, RNA_4['A'])
            gt_s_U = self._seq2freq(self.seq1, RNA_4['U'])
            gt_s_C = self._seq2freq(self.seq1, RNA_4['C'])
            gt_s_G = self._seq2freq(self.seq1, RNA_4['G'])

            gt_t_A = self._seq2freq(self.seq2, RNA_4['A'])
            gt_t_U = self._seq2freq(self.seq2, RNA_4['U'])
            gt_t_C = self._seq2freq(self.seq2, RNA_4['C'])
            gt_t_G = self._seq2freq(self.seq2, RNA_4['G'])

            gt_A = np.correlate(gt_s_A, gt_t_A, mode='full')
            gt_U = np.correlate(gt_s_U, gt_t_U, mode='full')
            gt_C = np.correlate(gt_s_C, gt_t_C, mode='full')
            gt_G = np.correlate(gt_s_G, gt_t_G, mode='full')
            
            assert np.array_equiv(c_A, gt_A)
            assert np.array_equiv(c_U, gt_U)
            assert np.array_equiv(c_C, gt_C)
            assert np.array_equiv(c_G, gt_G)

            return c
        
        elif self.data_type == self.PROTEIN:
            seq1_pad, seq2_pad = self._pad_for_FFT(self.seq1, self.seq2)

            seq1_p = self._seq2polarity(seq1_pad)
            seq2_p = self._seq2polarity(seq2_pad)
            seq1_v = self._seq2volume(seq1_pad)
            seq2_v = self._seq2volume(seq2_pad)

            seq1_p_fft = self._FFT(seq1_p)
            seq2_p_fft = self._FFT(seq2_p)
            seq1_v_fft = self._FFT(seq1_v)
            seq2_v_fft = self._FFT(seq2_v)

            C_P = seq1_p_fft*np.conjugate(seq2_p_fft)
            C_V = seq1_v_fft*np.conjugate(seq2_v_fft)

            c_p = self._iFFT(C_P)
            c_v = self._iFFT(C_V)

            c_p = (np.roll(c_p, len(self.seq2)-1)[:len(self.seq1)+len(self.seq2)-1])
            c_v = (np.roll(c_v, len(self.seq2)-1)[:len(self.seq1)+len(self.seq2)-1])
            # print(c_v[0])
            # print('volume correlation')
            # for i in range(len(c_v)):
            #     c_v[i] = round(c_v[i], 3)
            # print(c_v.tolist())

            # print(f'c_p: {c_p.max()}')
            # print(f'c_v: {c_v.max()}')
            # print(f'c: {c_p+c_v}')
            # print(f'max c: {max(c_p+c_v)}')

            gt_seq1_p = self._seq2polarity(self.seq1)
            gt_seq2_p = self._seq2polarity(self.seq2)
            gt_seq1_v = self._seq2volume(self.seq1)
            gt_seq2_v = self._seq2volume(self.seq2)

            gt_p = np.correlate(gt_seq1_p, gt_seq2_p, mode='full')
            gt_v = np.correlate(gt_seq1_v, gt_seq2_v, mode='full')
            
            # print(f"seq1 length {len(self.seq1)}")
            # print(f"seq2 length {len(self.seq2)}")
            # print(f"xcorr length {len(c_v)}")
            # print("xcorr")
            # print(c_v[:10])
            # print("gt")
            # print(gt_v[:10])
            assert len(c_v) == len(gt_v)
            assert len(c_p) == len(gt_p)
            for i in range(len(gt_v)):
                assert abs(c_v[i]-gt_v[i]) < 1 # tolerate some minor error
            for i in range(len(gt_p)):
                assert abs(c_p[i]-gt_p[i]) < 1 # tolerate some minor error
            if self.use_polarity: return 100*c_p+c_v
            else: return c_v


# def random_gen_seq(len=None, lower_bound = 16, upper_bound = 512, data_type='DNA') -> np.ndarray:
#     '''
#         if !len: length range from [lower_bound, upper_bound]
#         else: length = len
#         data_type = 'DNA' | 'RNA' | 'PROTEIN'
#     '''
#     if not len:
#         len = random.randint(lower_bound, upper_bound)
#     seq = []
#     if data_type == 'DNA':
#         nucleic = list(DNA_4.values())
#         for i in range(len):
#             seq.append(nucleic[random.randint(0, 3)])
#     elif data_type == 'RNA':
#         nucleic = list(RNA_4.values())
#         for i in range(len):
#             seq.append(nucleic[random.randint(0, 3)])
#     elif data_type == 'PROTEIN':
#         amino_acid = list(AMINO_ACID_20.values())
#         for i in range(len):
#             seq.append(amino_acid[random.randint(0, 19)])

#     return np.array(seq)

def test(data_type='DNA'):
    '''
        data_type = 'DNA' | 'RNA' | 'PROTEIN'
    '''
    ref = random_gen_seq(16, data_type=data_type)
    qry = random_gen_seq(16, data_type=data_type)


    # my xcorr
    my_xcorr = CrossCorrelation(ref, qry, data_type=data_type)
    c = my_xcorr.XCorr()


if __name__ == '__main__':
    random.seed(1)
    test('DNA')
    test('RNA')
    test('PROTEIN')
