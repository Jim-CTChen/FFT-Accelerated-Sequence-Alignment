import numpy as np
import random
import copy
import sys
sys.path.insert(1, '/Users/ctchen/Desktop/special_project/Lu/110/code/python/src')
sys.path.insert(1, '../max_offset')
from quantize import float_to_fixed_bin
from Aligner import Aligner
from config import AMINO_ACID, VOLUME_MAPPING
from CrossCorrelation import CrossCorrelation
from Homologous import Homologous
from ReduceSearchSpace import ReduceSearchSpace
from DynamicProgramming import DPEngine

ENCODED_AMINO_ACID = np.array(list(AMINO_ACID.values()))
hardware_volume_mapping = list(VOLUME_MAPPING.values())

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

def gen_testcase_with_FASTA_file(path_to_ref, path_to_qry):
  ref = read_FASTA(path_to_ref)
  qry = read_FASTA(path_to_qry)
  ref_bit = [float_to_fixed_bin(i, 5, 0, signed=False) for i in ref]
  qry_bit = [float_to_fixed_bin(i, 5, 0, signed=False) for i in qry]
  with open('pattern/ref.txt', 'w') as f:
    f.write(float_to_fixed_bin(len(ref), 9, 0))
    f.write(f' // {len(ref)}')
    f.write('\n')
    for i in range(len(ref_bit)):
      f.write(ref_bit[i])
      f.write(f" // {ref[i]}")
      f.write('\n')

  with open('pattern/qry.txt', 'w') as f:
    f.write(float_to_fixed_bin(len(qry), 9, 0))
    f.write(f' // {len(qry)}')
    f.write('\n')
    for i in range(len(qry_bit)):
      f.write(qry_bit[i])
      f.write(f" // {qry[i]}")
      f.write('\n')

  homologous_threshold = 18
  homologous_window_size = 17
  alg = 'NW'
  data_type = 'PROTEIN'
  n = 4
  use_polarity = False
  quant_volume = 0
  band = 32

  cor = CrossCorrelation(ref, qry, data_type=data_type, use_polarity=use_polarity, quant_volume=quant_volume)
  c = cor.XCorr()
  threshold = homologous_threshold
  homologous = Homologous(ref, qry, c, threshold=threshold, data_type=data_type,\
      n=n, wndw_size=homologous_window_size, B=band) # use origin sequence
  total_segments, homologous_segments_sets = homologous.get_all_homologous_segments()
  all_sets = copy.deepcopy(homologous_segments_sets)
  reducible = total_segments != 0 # homologous segments exist

  offsets = [s.offset for s in homologous_segments_sets]
  offsets_bit = [float_to_fixed_bin(k, 11, 0) for k in offsets]
  with open('pattern/offset_golden.txt', 'w') as f:
    for i in range(len(offsets_bit)):
      f.write(offsets_bit[i])
      f.write(f"  // {offsets[i]}")
      f.write('\n')
  
  

  golden = 0;
  dp_engine = None
  if reducible:
    print(f'Find total {total_segments} homologous segments!')
    # print('Reducing search space...')
    reducer = ReduceSearchSpace(all_sets, ref.shape[0], qry.shape[0], B=band)
    key_points = reducer.reduce()
    for idx, kp in enumerate(key_points): # check segments are sorted in ascending order
        if idx == key_points.shape[0]-1: break
        next_kp = key_points[idx+1]
        assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
        assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

    with open('pattern/key_point_golden.txt', 'w') as f:
      f.write(float_to_fixed_bin(len(key_points), 9, 0))
      f.write(f' // {len(key_points)}')
      f.write('\n')
      for k in key_points:
        f.write(float_to_fixed_bin(k[0], 9, 0))
        f.write(f" // {k[0]}")
        f.write('\n')
        f.write(float_to_fixed_bin(k[1], 9, 0))
        f.write(f" // {k[1]}")
        f.write('\n')

    # print('Running reduced DP...')
    dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, band=band)
    golden, _ = dp_engine.dp_in_reduced_space(key_points)
    # dp_engine.traceback()
    # reduced_operation_cycles = dp_engine.dp_operation_cycles
  else:
    print('no key point!')
    dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, band=band)
    golden = dp_engine.dp_normal()

  with open('pattern/similarity_golden.txt', 'w') as f:
    f.write(float_to_fixed_bin(golden, 16, 0))
    f.write(f' // {golden}')

  N = len(ref)
  M = len(qry)
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
  fft_x = np.fft.fft(np.array(ref_volume))
  fft_y = np.fft.fft(np.array(qry_volume))
  golden = fft_x*np.conj(fft_y)
  golden_real = golden.real
  golden_imag = golden.imag
  ifft = golden_imag+golden_real*1j
  xcorr = np.fft.fft(ifft) / L
  xcorr = xcorr.imag

  xcorr_bit = np.array([float_to_fixed_bin(score, 60, 8) for score in xcorr])
  with open('pattern/xcorr_golden.txt', 'w') as f:
    for i in range(len(xcorr_bit)):
      f.write(xcorr_bit[i])
      f.write(f" // {round(xcorr[i], 6)}")
      f.write('\n')

def main():
  np.random.seed(1225)

  '''
    generate test case for MSA_accelerator
  '''

  datapath_prefix = '../../../data/FASTA/protein/homfam/'
  # test case 0
  # gen_testcase_with_FASTA_file(datapath_prefix+'g', datapath_prefix+'h')
  # test case 1
  # gen_testcase_with_FASTA_file(datapath_prefix+'e', datapath_prefix+'f')
  # test case 2
  # gen_testcase_with_FASTA_file(datapath_prefix+'a', datapath_prefix+'b')
  # test case 3
  # gen_testcase_with_FASTA_file(datapath_prefix+'c', datapath_prefix+'d')
  # test case 4
  gen_testcase_with_FASTA_file(datapath_prefix+'B7JD71_BACC0_2-459', datapath_prefix+'C3E531_BACTU_2-459')



if __name__ == '__main__':
  main()