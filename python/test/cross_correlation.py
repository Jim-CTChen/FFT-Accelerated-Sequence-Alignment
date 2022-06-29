import numpy as np
N = 2
M = 4
a = np.random.random_sample((N))
b = np.random.random_sample((M))
L = M if M > N else N
if N < L: a = np.pad(a, (0, L-N), mode='constant')
elif M < L: b = np.pad(b, (0, L-M), mode='constant')
print(f'a = {a}')
print(f'b = {b}')

def shift(a, n):
    if n > 0:
        return np.pad(a, (n, 0), mode='constant')[:-n]
    else:
        return np.pad(a, (0, -n), mode='constant')[-n:]

if __name__ == '__main__':
    np.set_printoptions(suppress=True)
    c = np.zeros(L*2-1)
    for k in range(L*2-1):
        c[k] = np.dot(b, shift(a, L-1-k))

    print("Brute-force cross-correlation:")
    # print(c.astype(float))
    print(np.array_repr(c.astype(float)).replace('\n', ''))

    print("Numpy cross-correlation:")
    # print(np.correlate(a, b, "full").astype(float))
    print(np.array_repr(np.correlate(a, b, "full").astype(float)).replace('\n', ''))

    a_pad = np.pad(a, (0, L), 'constant')
    b_pad = np.pad(b, (0, L), 'constant')
    b_pad_flip =  np.flip(b_pad)
    f_a = np.fft.rfft(a_pad)
    f_b = np.fft.rfft(b_pad_flip)
    c = np.fft.irfft(f_a*f_b).astype(float)
    print("Numpy FFT cross-correlation:")
    c = np.roll(c, L)[:2*L-1]
    # print(c)
    print(np.array_repr(c).replace('\n', ''))