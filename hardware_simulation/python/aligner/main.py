import numpy as np
import random
import copy
import sys
sys.path.insert(1, '/Users/ctchen/Desktop/special_project/Lu/110/code/python/src')
sys.path.insert(1, '../max_offset')
from quantize import float_to_fixed_bin
from Aligner import Aligner
from config import AMINO_ACID
from CrossCorrelation import CrossCorrelation
from Homologous import Homologous
from ReduceSearchSpace import ReduceSearchSpace
from DynamicProgramming import DPEngine

ENCODED_AMINO_ACID = np.array(list(AMINO_ACID.values()))

def random_gen_testcase_without_keypoint(N, M):
  ref = np.random.choice(ENCODED_AMINO_ACID, N)
  qry = np.random.choice(ENCODED_AMINO_ACID, M)
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

  aligner = Aligner(ref, qry, alg='NW', data_type='PROTEIN')
  golden = aligner.calculate_score()
  golden_bit = float_to_fixed_bin(golden, 16, 0)
  with open('pattern/golden.txt', 'w') as f:
    f.write(golden_bit)
    f.write(f' // {golden}')

  

  while True:
    i, j = None, None
    i = int(input())
    j = int(input())
    print(f'at location (ref, qry) = ({i}, {j})')
    print(f'E: {aligner.insertion_matrix[j][i]}')
    print(f'F: {aligner.deletion_matrix[j][i]}')
    print(f'V: {aligner.score_matrix[j][i]}')
  # print(aligner.deletion_matrix[0][0])
  # print(aligner.insertion_matrix[0][0])
  # print(aligner.score_matrix[0][1])
  # print(aligner.deletion_matrix[0][1])
  # print(aligner.insertion_matrix[0][1])
  pass

def random_gen_testcase_one_keypoint_with_specific_mode(N, M, B, case):
  '''
    Testing specific one mode with one key point
    params:
      N: ref sequence length
      M: qry sequence length
      B: number of PEs
      case: PE array movement cases [1, 2, 3, 4]
  '''
  random.seed(N+M+B+case)
  if case not in [1,2,3,4]:
    print('case error! Only 1, 2, 3, 4!')
    return

  # check if N, M is big enough to generate case for given mode
  if N < 2*B :
    print('N must > 2*B!')
    return
  if M < B:
    print('M must > B!')
    return
  if case == 3 and N < 3*B//2:
    print('N must > 1.5*B for case 3!')
    return

  # random generate two sequences
  ref = np.random.choice(ENCODED_AMINO_ACID, N)
  qry = np.random.choice(ENCODED_AMINO_ACID, M)
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

  # generate specific one key point corresponding to given control mode
  i = 1
  j = 32
  # while True:
  #   if as
  if case == 1:
    while True:
      key_i = random.randint(1, N)
      key_j = random.randint(1, M)
      if key_i <= B//2+2: continue
      if key_j <= B//2+2: continue
      if (key_i+key_j) <= B+2: continue
      if (key_i+key_j) >= N+1: continue
      if (key_i-i) >= (3*B//2) and (key_j-j) <= (B//2+1): break
      if (key_i-i) < (3*B//2) and (key_i-i)-(key_j-j) >= B-1: break
  elif case == 2:
    while True:
      key_i = random.randint(1, N)
      key_j = random.randint(1, M)
      if key_i <= B//2+2: continue
      if key_j <= B//2+2: continue
      if (key_i+key_j) <= B+2: continue
      if (key_i+key_j) >= M+1: continue
      if (key_i-i) < (3*B//2) and (key_i-i)-(key_j-j) < B-1: break
  elif case == 3:
    while True:
      key_i = random.randint(1, N)
      key_j = random.randint(1, M)
      pos_i = (key_i-i)%B
      if key_i <= B//2+2: continue
      if key_j <= B//2+2: continue
      if (key_i+key_j) <= B+1: continue
      if (key_i+key_j) >= N+1: continue
      if (key_i+key_j) >= M+1: continue
      if (key_i-i) >= (3*B//2) and (key_j-j) > B//2+1 and pos_i < B//2: break
  elif case == 4:
    while True:
      key_i = random.randint(1, N)
      key_j = random.randint(1, M)
      pos_i = (key_i-i)%B
      if key_i <= B//2+2: continue
      if key_j <= B//2+2: continue
      if (key_i+key_j) <= B+1: continue
      if (key_i+key_j) >= N+1: continue
      if (key_i+key_j) >= M+1: continue
      if (key_i-i) >= (3*B//2) and (key_j-j) > B//2+1 and pos_i >= B//2: break

  key_points = np.array([[key_i, key_j]])
  print(f'ref len, qry len: ({N}, {M})')
  print(f'key points: ({key_i}, {key_j})')

  with open('pattern/key_point.txt', 'w') as f:
    f.write(float_to_fixed_bin(1, 9, 0))
    f.write(f' // 1')
    f.write('\n')
    f.write(float_to_fixed_bin(key_i, 9, 0))
    f.write(f" // {key_i}")
    f.write('\n')
    f.write(float_to_fixed_bin(key_j, 9, 0))
    f.write(f" // {key_j}")
    f.write('\n')

  # alignment and calculate golden score
  aligner = Aligner(ref, qry, alg='NW', data_type='PROTEIN')
  golden, _ = aligner.calculate_score_hardware_reduced(key_points)

  golden_bit = float_to_fixed_bin(golden, 16, 0)
  with open('pattern/golden.txt', 'w') as f:
    f.write(golden_bit)
    f.write(f' // {golden}')

  while True:
    i, j = None, None
    i = int(input())
    j = int(input())
    print(f'at location (ref, qry) = ({i}, {j})')
    print(f'(ref, qry): ({ref[i-1]}, {qry[j-1]})')
    print(f'E: {aligner.insertion_matrix[j][i]}')
    print(f'F: {aligner.deletion_matrix[j][i]}')
    print(f'V: {aligner.score_matrix[j][i]}')

def random_gen_testcase_multiple_keypoint(N, M, B, n):
  '''
  Testing specific one mode with one key point
  params:
    N: ref sequence length
    M: qry sequence length
    B: number of PEs
    n: number of keypoints
  '''
  random.seed(N+M+B+n)

  # check if N, M is big enough to generate case for given mode
  if N < 2*B :
    print('N must > 2*B!')
    return
  if M < B:
    print('M must > B!')
    return
  
  # random generate two sequences
  ref = np.random.choice(ENCODED_AMINO_ACID, N)
  qry = np.random.choice(ENCODED_AMINO_ACID, M)
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

  current_key_i = B//2
  current_key_j = B//2
  key_points = []
  for i in range(n):
    key_i = random.randint(current_key_i+3, N-(3*(n-i-1)))
    key_j = random.randint(current_key_j+3, M-(3*(n-i-1)))
    key_points.append([key_i, key_j])
    current_key_i = key_i
    current_key_j = key_j

  key_points = np.array(key_points)
  print(f'ref len, qry len: ({N}, {M})')
  print(f'key points: {key_points}')

  with open('pattern/key_point.txt', 'w') as f:
    f.write(float_to_fixed_bin(n, 9, 0))
    f.write(f' // {n}')
    f.write('\n')
    for k in key_points:
      f.write(float_to_fixed_bin(k[0], 9, 0))
      f.write(f" // {k[0]}")
      f.write('\n')
      f.write(float_to_fixed_bin(k[1], 9, 0))
      f.write(f" // {k[1]}")
      f.write('\n')

  # alignment and calculate golden score
  aligner = Aligner(ref, qry, alg='NW', data_type='PROTEIN')
  golden, _ = aligner.calculate_score_hardware_reduced(key_points)

  golden_bit = float_to_fixed_bin(golden, 16, 0)
  with open('pattern/golden.txt', 'w') as f:
    f.write(golden_bit)
    f.write(f' // {golden}')

  while True:
    i, j = None, None
    i = int(input())
    j = int(input())
    print(f'at location (ref, qry) = ({i}, {j})')
    print(f'(ref, qry): ({ref[i-1]}, {qry[j-1]})')
    print(f'E: {aligner.insertion_matrix[j][i]}')
    print(f'F: {aligner.deletion_matrix[j][i]}')
    print(f'V: {aligner.score_matrix[j][i]}')

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
  homologous_window_size = 16
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

    with open('pattern/key_point.txt', 'w') as f:
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
    dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, buffer=0, band=band)
    golden, _ = dp_engine.dp_in_reduced_space(key_points)
    # dp_engine.traceback()
    # reduced_operation_cycles = dp_engine.dp_operation_cycles
  else:
    print('no key point!')
    dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, band=band)
    golden = dp_engine.dp_normal()

  with open('pattern/golden.txt', 'w') as f:
    f.write(float_to_fixed_bin(golden, 16, 0))
    f.write(f' // {golden}')

  while True:
    i, j = None, None
    i = int(input())
    j = int(input())
    print(f'at location (ref, qry) = ({i}, {j})')
    print(f'(ref, qry): ({ref[i-1]}, {qry[j-1]})')
    print(f'E: {dp_engine.aligner.insertion_matrix[j][i]}')
    print(f'F: {dp_engine.aligner.deletion_matrix[j][i]}')
    print(f'V: {dp_engine.aligner.score_matrix[j][i]}')

def main():
  np.random.seed(1225)

  '''
    Test case 0~12:  random generate, no keypoint, test Dataflow control mode 0 & 1
    Test case 13~22: random generate, one keypoint, test full function
    Test case 23~27: random generate, multiple keypoint
    Test case 28+:   generate case with FASTA file 
  '''
  # random_gen_testcase_without_keypoint(ref_len, qry_len)
  # test case 0
  # random_gen_testcase_without_keypoint(32, 32)
  # test case 1
  # random_gen_testcase_without_keypoint(32, 64)
  # test case 2
  # random_gen_testcase_without_keypoint(64, 32)
  # test case 3
  # random_gen_testcase_without_keypoint(31, 29)
  # test case 4
  # random_gen_testcase_without_keypoint(14, 27)
  # test case 5
  # random_gen_testcase_without_keypoint(30, 5)
  # test case 6
  # random_gen_testcase_without_keypoint(64, 64)
  # test case 7
  # random_gen_testcase_without_keypoint(64, 96)
  # test case 8
  # random_gen_testcase_without_keypoint(96, 64)
  # test case 9
  # random_gen_testcase_without_keypoint(65, 65)
  # test case 10
  # random_gen_testcase_without_keypoint(135, 167)
  # test case 11
  # random_gen_testcase_without_keypoint(196, 20)
  # test case 12
  # random_gen_testcase_without_keypoint(12, 244)
  # test case 13
  # random_gen_testcase_without_keypoint(255, 219)

  # random_gen_testcase_one_keypoint_with_specific_mode(ref_len, qry_len, B, movement_case)
  # test case 14
  # random_gen_testcase_one_keypoint_with_specific_mode(96, 96, 32, 1)
  # test case 15
  # random_gen_testcase_one_keypoint_with_specific_mode(134, 96, 32, 1)
  # test case 16
  # random_gen_testcase_one_keypoint_with_specific_mode(247, 154, 32, 1)
  # test case 17
  # random_gen_testcase_one_keypoint_with_specific_mode(96, 96, 32, 2)
  # test case 18
  # random_gen_testcase_one_keypoint_with_specific_mode(156, 129, 32, 2)
  # test case 19
  # random_gen_testcase_one_keypoint_with_specific_mode(156, 129, 32, 3)
  # test case 20
  # random_gen_testcase_one_keypoint_with_specific_mode(145, 240, 32, 3)
  # test case 21
  # random_gen_testcase_one_keypoint_with_specific_mode(201, 179, 32, 4)
  # test case 22
  # random_gen_testcase_one_keypoint_with_specific_mode(326, 402, 32, 4)

  # random_gen_testcase_multiple_keypoint(ref_len, qry_len, band, num_of_keypoint)
  # test case 23
  # random_gen_testcase_multiple_keypoint(128, 128, 32, 2)
  # test case 24
  # random_gen_testcase_multiple_keypoint(183, 315, 32, 3)
  # test case 25
  # random_gen_testcase_multiple_keypoint(399, 500, 32, 5)
  # test case 26
  # random_gen_testcase_multiple_keypoint(401, 501, 32, 10)
  # test case 27
  # random_gen_testcase_multiple_keypoint(401, 501, 32, 12)

  out_prefix = '../../../data/FASTA/protein/homfam/'
  # test case 28
  # gen_testcase_with_FASTA_file(out_prefix+'ref', out_prefix+'qry')
  # test case 29
  # gen_testcase_with_FASTA_file(out_prefix+'B7JD71_BACC0_2-459', out_prefix+'C3E531_BACTU_2-459')
  # test case 30
  # gen_testcase_with_FASTA_file(out_prefix+'a', out_prefix+'b')
  # test case 31
  gen_testcase_with_FASTA_file(out_prefix+'c', out_prefix+'d')



if __name__ == '__main__':
  main()