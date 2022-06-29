import numpy as np

Z = 0 # padding
A = 1
T = 2
C = 3
G = 4

def correlat_gt(seq1, seq2):
    return np.correlate(seq1, seq2, "full")

def seq2freq(seq):
    '''
        Convert nucleicide sequences to frequency sequence
    '''

    # pairwise
    freq_A = np.equal(seq, np.full(len(seq), A)).astype(int)
    freq_T = np.equal(seq, np.full(len(seq), T)).astype(int)
    freq_C = np.equal(seq, np.full(len(seq), C)).astype(int)
    freq_G = np.equal(seq, np.full(len(seq), G)).astype(int)

    # group wise
    # TODO
    
    return freq_A, freq_T, freq_C, freq_G

def pad_for_FFT(seq):
    '''
        pad for FFT (since numpy do circular FFT)
    '''
    pad_seq = np.pad(seq, (0, len(seq)), mode='constant')
    return pad_seq

def reverse_seq(seq):
    return np.flip(seq)

def FFT(seq):
    return np.fft.rfft(seq)

def iFFT(seq):
    c = np.fft.irfft(seq).astype(float)
    return c

def correlation(s1, t1):
    L = max(len(s1), len(t1))

    s1_FFT_pad, t1_FFT_pad = pad_for_FFT(s1), pad_for_FFT(t1)

    s1_A, s1_T, s1_C, s1_G = seq2freq(s1_FFT_pad)
    t1_A, t1_T, t1_C, t1_G = seq2freq(t1_FFT_pad)

    t1_A_r, t1_T_r, t1_C_r, t1_G_r = reverse_seq(t1_A), reverse_seq(t1_T), reverse_seq(t1_C), reverse_seq(t1_G)

    S1_A, S1_T, S1_C, S1_G = FFT(s1_A), FFT(s1_T), FFT(s1_C), FFT(s1_G)
    T1_A, T1_T, T1_C, T1_G = FFT(t1_A_r), FFT(t1_T_r), FFT(t1_C_r), FFT(t1_G_r)

    C_A = S1_A*T1_A
    C_T = S1_T*T1_T
    C_C = S1_C*T1_C
    C_G = S1_G*T1_G

    c_A = iFFT(C_A)
    c_T = iFFT(C_T)
    c_C = iFFT(C_C)
    c_G = iFFT(C_G)

    c_A = np.round(np.roll(c_A, L)[:2*L-1])
    c_T = np.round(np.roll(c_T, L)[:2*L-1])
    c_C = np.round(np.roll(c_C, L)[:2*L-1])
    c_G = np.round(np.roll(c_G, L)[:2*L-1])

    c = c_A+c_T+c_C+c_G

    # use ground truth to check error
    gt_s_A, gt_s_T, gt_s_C, gt_s_G = seq2freq(s1)
    gt_t_A, gt_t_T, gt_t_C, gt_t_G = seq2freq(t1)
    gt_A = np.correlate(gt_s_A, gt_t_A, mode='full')
    gt_T = np.correlate(gt_s_T, gt_t_T, mode='full')
    gt_C = np.correlate(gt_s_C, gt_t_C, mode='full')
    gt_G = np.correlate(gt_s_G, gt_t_G, mode='full')
    assert np.array_equiv(c_A, gt_A)
    assert np.array_equiv(c_T, gt_T)
    assert np.array_equiv(c_C, gt_C)
    assert np.array_equiv(c_G, gt_G)

    return c