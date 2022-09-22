'''
  DIF FFT processor based on radix-2 simulation
'''

import numpy as np
import random
import sys
import cmath, math
from quantize import float_to_fixed_bin
from fft import DIF_FFT, DIF_iFFT

def test(N=32):
  x = np.array([i+1 for i in range(N)])
  out = DIF_FFT(N, x)
  golden = np.fft.fft(np.array(x))
  diff = golden - out
  
  print('my answer:')
  print(out)
  print('golden:')
  print(golden)
  # print('diff:')
  # print(diff.sum())

  golden_rfft = np.fft.rfft(x)
  print(golden_rfft)
  # golden_irfft = np.fft.irfft(golden_rfft)
  # print(golden_irfft)



  # out_inverse = DIF_iFFT(N, out)
  # golden_inverse = np.fft.ifft(golden)
  # diff_inverse = golden_inverse-out_inverse
  # print(f'my inverse')
  # print(out_inverse)
  # print('golden inverse')
  # print(golden_inverse)
  # print(f'diff inverse:')
  # print(diff_inverse.sum())

def gen_testcase(N=32):
  random.seed(10)
  MAX_DATA = 127
  MIN_DATA = -128
  x = np.array([random.uniform(MIN_DATA, MAX_DATA) + random.uniform(MIN_DATA, MAX_DATA)*1j for _ in range(N)])
  # x = np.array([i for i in range(N//2)])
  x_real = x.real
  x_imag = x.imag
  x_real_bit = np.array([float_to_fixed_bin(re, 32, 8) for re in x_real])
  x_imag_bit = np.array([float_to_fixed_bin(im, 32, 8) for im in x_imag])
  
  with open('pattern/pat_real.txt', 'w') as f:
    for i in range(len(x_real_bit)):
      f.write(x_real_bit[i])
      f.write(f" // {round(x_real[i], 6)}")
      f.write('\n')
  
  with open('pattern/pat_imag.txt', 'w') as f:
    for i in range(len(x_imag_bit)):
      f.write(x_imag_bit[i])
      f.write(f" // {round(x_imag[i], 6)}")
      f.write('\n')

  golden = np.fft.fft(np.array(x))
  golden_real = golden.real
  golden_imag = golden.imag
  golden_real_bit = np.array([float_to_fixed_bin(re, 32, 8) for re in golden_real])
  golden_imag_bit = np.array([float_to_fixed_bin(im, 32, 8) for im in golden_imag])

  with open('pattern/gold_real.txt', 'w') as f:
    for i in range(len(golden_real_bit)):
      f.write(golden_real_bit[i])
      f.write(f" // {round(golden_real[i], 6)}")
      f.write('\n')
  
  with open('pattern/gold_imag.txt', 'w') as f:
    for i in range(len(golden_imag_bit)):
      f.write(golden_imag_bit[i])
      f.write(f" // {round(golden_imag[i], 6)}")
      f.write('\n')
  
def printWN(N=32, write=False):
  # np.set_printoptions(precision=4)
  WN = [(cmath.exp(2/N*math.pi*(-1j)))**i for i in range(N//2)]
  # print(WN)
  WN = np.array([(cmath.exp(2/N*math.pi*(-1j)))**i for i in range(N//2)])
  # print(WN)
  WN_real = WN.real
  WN_imag = WN.imag
  WN_real[abs(WN_real) < 0.001] = 0
  WN_imag[abs(WN_imag) < 0.001] = 0
  # print(WN_real)
  # print(WN_imag)
  # quit()

  WN_real_bit = np.array([float_to_fixed_bin(re, 8, 6) for re in WN_real])
  WN_imag_bit = np.array([float_to_fixed_bin(im, 8, 6) for im in WN_imag])
  if write:
    with open("WN.txt", 'w') as f:
      for i in range(len(WN_real_bit)):
        # if (i%2) == 0: continue
        f.write(WN_real_bit[i])
        f.write(f" // {round(WN_real[i], 6)}")
        f.write('\n')
        f.write(WN_imag_bit[i])
        f.write(f" // {round(WN_imag[i], 6)}")
        f.write('\n')

  for i in range(len(WN_real_bit)):
    # if (i%2) == 0: continue
    real = round(WN[i].real, 8)
    imag = round(WN[i].imag, 8)
    print(f'{i}: {real+imag*1j}')
    print(WN_real_bit[i])
    print(WN_imag_bit[i])
  # print(WN_real_bit)
  # print(WN_imag_bit)

  # print(np.array(WN))
  pass

def main():
  N = 256
  if len(sys.argv) >= 2: N = int(sys.argv[1])
  # test(N)
  gen_testcase(N)
  # printWN(N, True)
  


if __name__ == '__main__':
  main()