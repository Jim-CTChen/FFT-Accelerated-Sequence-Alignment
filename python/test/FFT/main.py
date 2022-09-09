'''
  DIF FFT processor based on radix-2 simulation
'''

import numpy as np
from fft import DIF_FFT, DIF_iFFT

def main():
  N = 16
  x = np.array([i for i in range(N)])
  out = DIF_FFT(N, x)
  golden = np.fft.fft(np.array(x))
  diff = golden - out
  
  print('my answer:')
  print(out)
  # print('golden:')
  # print(golden)
  # print('diff:')
  # print(diff.sum())

  golden_rfft = np.fft.rfft(x)
  print(golden_rfft)
  golden_irfft = np.fft.irfft(golden_rfft)
  print(golden_irfft)



  out_inverse = DIF_iFFT(N, out)
  golden_inverse = np.fft.ifft(golden)
  diff_inverse = golden_inverse-out_inverse
  # print(f'my inverse')
  # print(out_inverse)
  print('golden inverse')
  print(golden_inverse)
  # print(f'diff inverse:')
  # print(diff_inverse.sum())


if __name__ == '__main__':
  main()