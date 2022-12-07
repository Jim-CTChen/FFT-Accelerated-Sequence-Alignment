import numpy as np
np.set_printoptions(suppress=True, precision=5)
N = 196
M = 271
a = np.random.random_sample((N))
b = np.random.random_sample((M))
L = M if M > N else N
same_l_a = a
same_l_b = b
if N < L: same_l_a = np.pad(a, (0, L-N), mode='constant')
elif M < L: same_l_b = np.pad(b, (0, L-M), mode='constant')
# print(f'a = {same_l_a}')
# print(f'b = {same_l_b}')

def shift(a, n):
    if n > 0:
        return np.pad(a, (n, 0), mode='constant')[:-n]
    else:
        return np.pad(a, (0, -n), mode='constant')[-n:]

if __name__ == '__main__':
    
    c = np.zeros(M+N-1)
    for k in range(M+N-1):
        c[k] = np.dot(same_l_b, shift(same_l_a, M-1-k))

    print("Brute-force cross-correlation:")
    # print(c.astype(float))
    print(f'length: {len(c)}')
    print(np.array_repr(c[0:10].astype(float)).replace('\n', ''))

    print("Numpy cross-correlation:")
    # print(np.correlate(a, b, "full").astype(float))
    print(f'length: {len(np.correlate(a, b, "full"))}')
    print(np.array_repr(np.correlate(a, b, "full").astype(float)[0:10]).replace('\n', ''))

    L_for_fft = 0
    if M+N < 4: L_for_fft = 4
    elif M+N < 8: L_for_fft = 8
    elif M+N < 16: L_for_fft = 16
    elif M+N < 32: L_for_fft = 32
    elif M+N < 64: L_for_fft = 64
    elif M+N < 128: L_for_fft = 128
    elif M+N < 256: L_for_fft = 256
    elif M+N < 512: L_for_fft = 512
    elif M+N < 1024: L_for_fft = 1024
    else:
        print('sequence too large')
        quit()

    a_pad = np.pad(a, (0, L_for_fft-len(a)), 'constant')
    b_pad = np.pad(b, (0, L_for_fft-len(b)), 'constant')
    f_a = np.fft.rfft(a_pad)
    f_b = np.fft.rfft(b_pad)
    f_b = np.conjugate(f_b)
    c = np.fft.irfft(f_a*f_b).astype(float)
    print("Numpy FFT cross-correlation:")
    # print(np.array_repr(c).replace('\n', ''))
    c = np.roll(c, M-1)[0:M+N-1]
    print(f'length: {len(c)}')
    print(np.array_repr(c[0:10]).replace('\n', ''))