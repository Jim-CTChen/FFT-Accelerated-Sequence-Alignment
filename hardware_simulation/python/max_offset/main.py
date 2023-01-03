'''
  DIF FFT processor based on radix-2 simulation
'''

import numpy as np
import random
import os
import sys
sys.path.insert(1, '/Users/ctchen/Desktop/special_project/Lu/110/code/python/src')
import cmath, math
from quantize import float_to_fixed_bin
from fft import DIF_FFT, DIF_iFFT
from config import AMINO_ACID, VOLUME_MAPPING, VOLUME_MAPPING_32
from CrossCorrelation import CrossCorrelation
from Homologous import Homologous

# hardware_volume_mapping = list(VOLUME_MAPPING.values())
hardware_volume_mapping = list(VOLUME_MAPPING_32.values())

def read_FASTA(path):
  symbol = AMINO_ACID

  sequence = []
  with open(path, 'r') as f:
    description = f.readline()[1:-1]
    while True:
      char = f.read(1)
      if not char:
        break
      elif char == '\n':
        continue
      elif char not in symbol.keys():
        raise ValueError(f'including unkown symbol "{char}"')
      sequence.append(symbol[char])

  sequence = np.array(sequence)
  return sequence

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

def gen_testcase_FFT(N=32):
  random.seed(10)
  MAX_DATA = 31
  MIN_DATA = -32

  x = np.array([random.uniform(MIN_DATA, MAX_DATA) + random.uniform(MIN_DATA, MAX_DATA)*1j for _ in range(N)])
  # x = np.array([i for i in range(N)])
  x_real = x.real
  x_imag = x.imag
  x_real_bit = np.array([float_to_fixed_bin(re, 32, 8) for re in x_real])
  x_imag_bit = np.array([float_to_fixed_bin(im, 32, 8) for im in x_imag])
  
  with open('pattern/FFT/pat_real.txt', 'w') as f:
    for i in range(len(x_real_bit)):
      f.write(x_real_bit[i])
      f.write(f" // {round(x_real[i], 6)}")
      f.write('\n')
  
  with open('pattern/FFT/pat_imag.txt', 'w') as f:
    for i in range(len(x_imag_bit)):
      f.write(x_imag_bit[i])
      f.write(f" // {round(x_imag[i], 6)}")
      f.write('\n')

  golden = np.fft.fft(np.array(x))
  golden_real = golden.real
  golden_imag = golden.imag
  golden_real_bit = np.array([float_to_fixed_bin(re, 32, 8) for re in golden_real])
  golden_imag_bit = np.array([float_to_fixed_bin(im, 32, 8) for im in golden_imag])

  with open('pattern/FFT/gold_real.txt', 'w') as f:
    for i in range(len(golden_real_bit)):
      f.write(golden_real_bit[i])
      f.write(f" // {round(golden_real[i], 6)}")
      f.write('\n')
  
  with open('pattern/FFT/gold_imag.txt', 'w') as f:
    for i in range(len(golden_imag_bit)):
      f.write(golden_imag_bit[i])
      f.write(f" // {round(golden_imag[i], 6)}")
      f.write('\n')
  
def gen_testcase_for_max_offset_and_xcorr(case_num):
  random.seed(10)

  # case 0
  if case_num == 0:
    N = 32
    M = 32
    ref = np.array([i%len(hardware_volume_mapping) for i in range(N)])
    qry = np.array([i%len(hardware_volume_mapping) for i in range(N)])
  # case 1
  elif case_num == 1:
    N = 32
    M = 32
    ref = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(N)])
    qry = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(M)])
  # case 2
  elif case_num == 2:
    N = 64
    M = 64
    ref = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(N)])
    qry = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(M)])
  elif case_num == 3:
    N = 93
    M = 82
    ref = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(N)])
    qry = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(M)])
  elif case_num == 4:
    N = 201
    M = 91
    ref = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(N)])
    qry = np.array([random.randint(0, len(hardware_volume_mapping)-1) for i in range(M)])
  elif case_num == 5:
    ref = read_FASTA('../../../data/FASTA/protein/homfam/c')
    qry = read_FASTA('../../../data/FASTA/protein/homfam/d')
    N = len(ref)
    M = len(qry)
  elif case_num == 6:
    N = 4
    M = 4
    ref = np.array([i%len(hardware_volume_mapping) for i in range(N)])
    qry = np.array([i%len(hardware_volume_mapping) for i in range(N)])

  # write ref, qry
  ref_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in ref])
  qry_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in qry])
  with open('pattern/max_offset/ref.txt', 'w') as f:
    f.write(float_to_fixed_bin(N, 9, 0))
    f.write('\n')
    for i in range(len(ref_bit)):
      f.write(ref_bit[i])
      f.write(f" // {round(ref[i], 6)}")
      f.write('\n')
  with open('pattern/max_offset/qry.txt', 'w') as f:
    f.write(float_to_fixed_bin(M, 9, 0))
    f.write('\n')
    for i in range(len(qry_bit)):
      f.write(qry_bit[i])
      f.write(f" // {round(qry[i], 6)}")
      f.write('\n')

  L = 8
  if M+N > 256: L = 512
  elif M+N > 128: L = 256
  elif M+N > 64: L = 128
  elif M+N > 32: L = 64
  elif M+N > 16: L = 32
  elif M+N > 8: L = 16

  ref_pad = np.pad(ref, (0, L-N), 'constant', constant_values=0)
  qry_pad = np.pad(qry, (0, L-M), 'constant', constant_values=0)
  ref_volume = [hardware_volume_mapping[i] for i in ref_pad]
  qry_volume = [hardware_volume_mapping[i] for i in qry_pad]
  ref_volume_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in ref_volume])
  qry_volume_bit = np.array([float_to_fixed_bin(i, 9, 0) for i in qry_volume])
  with open('pattern/xcorr/ref_volume.txt', 'w') as f:
    for i in range(len(ref_volume_bit)):
      f.write(ref_volume_bit[i])
      f.write(f" // {ref_volume[i]}")
      f.write('\n')
  with open('pattern/xcorr/qry_volume.txt', 'w') as f:
    for i in range(len(qry_volume_bit)):
      f.write(qry_volume_bit[i])
      f.write(f" // {qry_volume[i]}")
      f.write('\n')

  homologous_threshold = 18
  homologous_window_size = 16
  alg = 'NW'
  data_type = 'PROTEIN'
  n = 4
  use_polarity = False
  quant_volume = 0
  band = 32

  cor = CrossCorrelation(ref, qry, data_type=data_type, use_polarity=use_polarity, quant_volume=quant_volume)
  xcorr = cor.XCorr()
  threshold = homologous_threshold
  homologous = Homologous(ref, qry, xcorr, threshold=threshold, data_type=data_type,\
      n=n, wndw_size=homologous_window_size, B=band) # use origin sequence
  _, homologous_segments_sets = homologous.get_all_homologous_segments()
  offsets = [s.offset for s in homologous_segments_sets]

  offsets_bit = [float_to_fixed_bin(k, 11, 0) for k in offsets]
  with open('pattern/max_offset/golden.txt', 'w') as f:
    for i in range(len(offsets_bit)):
      f.write(offsets_bit[i])
      f.write(f"  // {offsets[i]}")
      f.write('\n')

  fft_x = np.fft.fft(np.array(ref_volume))
  fft_y = np.fft.fft(np.array(qry_volume))
  golden = fft_x*np.conj(fft_y)
  golden_real = golden.real
  golden_imag = golden.imag
  ifft = golden_imag+golden_real*1j
  # print(golden)
  ifft_out = np.fft.fft(ifft)
  xcorr = ifft_out/L
  # xcorr = np.fft.fft(ifft) / L
  xcorr = xcorr.imag

  mul_input_real_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in golden_real])
  mul_input_imag_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in golden_imag])
  with open('pattern/xcorr/mul_input_real.txt', 'w') as f:
    for i in range(len(mul_input_real_bit)):
      f.write(mul_input_real_bit[i])
      f.write(f" // {round(golden_real[i], 6)}")
      f.write('\n')
  with open('pattern/xcorr/mul_input_imag.txt', 'w') as f:
    for i in range(len(mul_input_imag_bit)):
      f.write(mul_input_imag_bit[i])
      f.write(f" // {round(golden_imag[i], 6)}")
      f.write('\n')

  ifft_output_real_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in ifft_out.real])
  ifft_output_imag_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in ifft_out.imag])
  with open('pattern/xcorr/ifft_output_real.txt', 'w') as f:
    for i in range(len(ifft_output_real_bit)):
      f.write(ifft_output_real_bit[i])
      f.write(f" // {round(ifft_out.real[i], 6)}")
      f.write('\n')
  with open('pattern/xcorr/ifft_output_imag.txt', 'w') as f:
    for i in range(len(ifft_output_imag_bit)):
      f.write(ifft_output_imag_bit[i])
      f.write(f" // {round(ifft_out.imag[i], 6)}")
      f.write('\n')

  xcorr_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in xcorr])
  with open('pattern/xcorr/golden.txt', 'w') as f:
    for i in range(len(xcorr_bit)):
      f.write(xcorr_bit[i])
      f.write(f" // {round(xcorr[i], 6)}")
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
  os.system(f'mkdir -p ./pattern/max_offset')
  os.system(f'mkdir -p ./pattern/xcorr')
  os.system(f'mkdir -p ./pattern/FFT')
  N = 32
  if len(sys.argv) >= 2: N = int(sys.argv[1])
  # FFT_sim(N)
  # Xcorr_sim(N)
  gen_testcase_FFT(N)
  # gen_testcase_for_max_offset_and_xcorr(case_num=6)
  # printWN(N, True)
  


if __name__ == '__main__':
  main()