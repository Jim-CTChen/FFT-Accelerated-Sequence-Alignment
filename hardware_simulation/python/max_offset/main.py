'''
  DIF FFT processor based on radix-2 simulation
'''

import numpy as np
import random
import sys
import cmath, math
from quantize import float_to_fixed_bin
from fft import DIF_FFT, DIF_iFFT

hardware_volume_mapping = [
  0, 31, 55, 55, 54, 83, 132, 3, 96, 111, 111, 119, 111,
  105, 56, 0, 33, 85, 124, 32, 61, 0, 84, 170, 84, 136, 84
]

hardware_amino_mapping = {
  '-': 0,
  'A': 1,
  'B': 2,
  'C': 3,
  'D': 4,
  'E': 5,
  'F': 6,
  'G': 7,
  'H': 8,
  'I': 9,
  'J': 10,
  'K': 11,
  'L': 12,
  'M': 13,
  'N': 14,
  'O': 15,
  'P': 16,
  'Q': 17,
  'R': 18,
  'S': 19,
  'T': 20,
  'U': 21,
  'V': 22,
  'W': 23,
  'X': 24,
  'Y': 25,
  'Z': 26,
}

def Xcorr_sim(N=32):
  x = np.array([i+1 for i in range(N)])
  y = np.array([i+1 for i in range(N)])
  # out = DIF_FFT(N, x)
  golden_x = np.fft.fft(np.array(x))
  golden_y = np.fft.fft(np.array(y))
  
  print('golden x:')
  print(golden_x)
  print('golden y:')
  print(golden_y)

  print('golden x*y')
  print(golden_x*golden_y)

  # golden_rfft = np.fft.rfft(x)
  # print(golden_rfft)
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
  pass

def FFT_sim(N=32):
  x = np.array([i for i in range(N)])
  out = DIF_FFT(N, x)
  golden = np.fft.fft(np.array(x))
  golden_real = golden.real
  golden_imag = golden.imag
  golden_real_bit = np.array([float_to_fixed_bin(re, 17, 2) for re in golden_real])
  golden_imag_bit = np.array([float_to_fixed_bin(re, 17, 2) for re in golden_imag])
  print(golden_real)
  print(golden_imag)
  quit()
  diff = golden - out
  
  print('my answer:')
  print(out)
  print('golden:')
  print(golden)
  # print('diff:')
  # print(diff.sum())

  golden_rfft = np.fft.rfft(x)
  print(golden_rfft)

def gen_testcase_Xcorr(N=32):
  random.seed(10)
  MAX_DATA = 31
  MIN_DATA = 0
  # x = np.array([random.randint(MIN_DATA, MAX_DATA) for _ in range(N)])
  # y = np.array([random.randint(MIN_DATA, MAX_DATA) for _ in range(N)])
  x = np.array([hardware_volume_mapping[i%len(hardware_volume_mapping)] for i in range(N)])
  y = np.array([hardware_volume_mapping[i%len(hardware_volume_mapping)] for i in range(N)])
  x = np.pad(x, (0, N), 'constant', constant_values=0)
  y = np.pad(y, (0, N), 'constant', constant_values=0)
  x_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in x])
  y_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in y])
  
  with open('pattern/seq1.txt', 'w') as f:
    for i in range(len(x_bit)):
      f.write(x_bit[i])
      f.write(f" // {x[i]}")
      f.write('\n')
  with open('pattern/seq2.txt', 'w') as f:
    for i in range(len(y_bit)):
      f.write(y_bit[i])
      f.write(f" // {y[i]}")
      f.write('\n')
  # print(np.correlate(x, y, "full"))
  fft_x = np.fft.fft(np.array(x))
  fft_y = np.fft.fft(np.array(y))
  golden = fft_x*np.conj(fft_y)
  golden_real = golden.real
  golden_imag = golden.imag
  ifft = golden_imag+golden_real*1j
  golden = np.fft.fft(ifft) / N
  golden_real = golden.imag
  golden_imag = golden.real
  golden_real_bit = np.array([float_to_fixed_bin(re, 50, 8) for re in golden_real])
  golden_imag_bit = np.array([float_to_fixed_bin(im, 50, 8) for im in golden_imag])

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

def gen_testcase_FFT(N=32):
  random.seed(10)
  MAX_DATA = 127
  MIN_DATA = -128
  # x = np.array([random.uniform(MIN_DATA, MAX_DATA) + random.uniform(MIN_DATA, MAX_DATA)*1j for _ in range(N)])
  x = np.array([i for i in range(N)])
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
  
def gen_testcase_max_offset(N=32):
  seq1 = "GGSLARTEATGYGSVYFANEMLKKSGGSLEGKKCSVSGAGNVAIYTVEKLYEFGALPITVSDSTGFVYDKDGIDTQLLKRLKEVERKGLSDYTDFRKNAVFTPVKAYKEGTNGVWSVPCDAAFPSATQNELHLVDIKTLYNNGCRLVCEGANMPSTLDAIDFMISKKDFLFGPAKAANAGGVATSGLEMAQNASMQKWSFEEVDKKLHDIMRNIFNESYDTSVEFGDAGNLVLGANIAGFRKVADAMIDQG"
  seq2 = "GINHKEFGVTSTGVVRFAEITMADLGIDMVNHPFSVKFTGGPNGDVAGNAMRIMLERYPRMQIRLILDGTAALYDPKGARHGELERILLKEDLDGFNPQALHEGGFMLFRSGSRTEGLRTLYRKATMGGDGLTEQWISIDEFSREFGDLPFTTQADLFIPGGGRPETIDARNWERFFLPDGTPSARAIIEGANSFITPDARVQLQKRGVIIMRDASANKCGVISSSYEIIANLLMADAEFLAEKEEYVGGVIAILEKR"
  # N = 160 # seq1
  # M = 100 # seq2
  N = len(seq1)
  M = len(seq2)
  random.seed(10)
  # x = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(N)])
  # y = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(M)])
  x = [hardware_amino_mapping[f'{c}'] for c in seq1]
  y = [hardware_amino_mapping[f'{c}'] for c in seq2]
  # x = np.array([i%len(hardware_volume_mapping) for i in range(N)])
  # y = np.array([i%len(hardware_volume_mapping) for i in range(M)])
  x_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in x])
  y_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in y])
  
  with open('pattern/max_offset_pat1.txt', 'w') as f:
    f.write(float_to_fixed_bin(N, 9, 0))
    f.write('\n')
    for i in range(len(x_bit)):
      f.write(x_bit[i])
      f.write(f" // {round(x[i], 6)}")
      f.write('\n')
  
  with open('pattern/max_offset_pat2.txt', 'w') as f:
    f.write(float_to_fixed_bin(M, 9, 0))
    f.write('\n')
    for i in range(len(y_bit)):
      f.write(y_bit[i])
      f.write(f" // {round(y[i], 6)}")
      f.write('\n')
  L = 8
  if M+N > 256: L = 512
  elif M+N > 128: L = 256
  elif M+N > 64: L = 128
  elif M+N > 32: L = 64
  elif M+N > 16: L = 32
  elif M+N > 8: L = 16

  x_pad = np.pad(x, (0, L-N), 'constant', constant_values=0)
  y_pad = np.pad(y, (0, L-M), 'constant', constant_values=0)
  x_volume = [hardware_volume_mapping[i] for i in x_pad]
  y_volume = [hardware_volume_mapping[i] for i in y_pad]
  x_volume_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in x_volume])
  y_volume_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in y_volume])
  with open('pattern/xcorr_seq1.txt', 'w') as f:
    for i in range(len(x_volume_bit)):
      f.write(x_volume_bit[i])
      f.write(f" // {x_volume[i]}")
      f.write('\n')
  with open('pattern/xcorr_seq2.txt', 'w') as f:
    for i in range(len(y_volume_bit)):
      f.write(y_volume_bit[i])
      f.write(f" // {y_volume[i]}")
      f.write('\n')

  fft_x = np.fft.fft(np.array(x_volume))
  fft_y = np.fft.fft(np.array(y_volume))
  golden = fft_x*np.conj(fft_y)
  golden_real = golden.real
  golden_imag = golden.imag
  ifft = golden_imag+golden_real*1j
  xcorr = np.fft.fft(ifft) / L
  xcorr = xcorr.imag
  # print(np.fft.ifft(golden))
  top_k = xcorr.argsort()[-4:][::-1]
  # print(len(seq1))
  # print(len(seq2))
  # print(len(xcorr))

  for i in range(len(top_k)):
    if top_k[i] > N:
      top_k[i] = top_k[i] - L
  top_k_bit = [float_to_fixed_bin(k, 11, 0) for k in top_k]

  xcorr_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in xcorr])
  with open('pattern/xcorr_golden.txt', 'w') as f:
    for i in range(len(xcorr_bit)):
      f.write(xcorr_bit[i])
      f.write(f" // {round(xcorr[i], 6)}")
      f.write('\n')

  with open('pattern/max_offset_golden.txt', 'w') as f:
    for i in range(len(top_k_bit)):
      f.write(top_k_bit[i])
      f.write(f"  // {top_k[i]}")
      f.write('\n')

def printWN(N=32, write=True):
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

  WN_real_bit = np.array([float_to_fixed_bin(re, 16, 14) for re in WN_real])
  WN_imag_bit = np.array([float_to_fixed_bin(im, 16, 14) for im in WN_imag])
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
  N = 32
  if len(sys.argv) >= 2: N = int(sys.argv[1])
  # FFT_sim(N)
  # Xcorr_sim(N)
  # gen_testcase_FFT(N)
  # gen_testcase_Xcorr(N)
  gen_testcase_max_offset(N)
  # printWN(N, True)
  


if __name__ == '__main__':
  main()