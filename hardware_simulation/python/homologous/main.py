import numpy as np
import random
import sys
sys.path.insert(1, '/Users/ctchen/Desktop/special_project/Lu/110/code/python/src')
sys.path.insert(1, '../max_offset')
from quantize import float_to_fixed_bin
from config import AMINO_ACID, BLOSUM62
from Homologous import Homologous
from CrossCorrelation import CrossCorrelation
from ReduceSearchSpace import ReduceSearchSpace

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

def calc_score(seq1, seq2):
  assert len(seq1) == len(seq2), 'length should be the same!'
  
  score = 0
  for i in range(len(seq1)):
    score += BLOSUM62[seq1[i]][seq2[i]]
  # print(score)
  return score

def sliding_window(seq1, seq2, offset, window_size=15, threshold=3):
  segment_set = []
  if offset >= 0:
    max_range = min(len(seq1)-offset-1, len(seq2)-1)-window_size+1
    for i in range(max_range+1):
      score = calc_score(seq1[i+offset:i+offset+window_size], seq2[i:i+window_size])
      if score > threshold:
        segment_set.append(i+offset+window_size//2)
  else:
    max_range = min(len(seq1)-1, len(seq2)+offset-1)-window_size+1
    for i in range(max_range+1):
      score = calc_score(seq1[i:i+window_size], seq2[i-offset:i-offset+window_size])
      if score > threshold:
        segment_set.append(i+window_size//2)
  return segment_set

def gen_testcase_with_FASTA_file(path_to_ref, path_to_qry, threshold, window_size, NUM_OF_PE, buffer):
  seq1 = read_FASTA(path_to_ref)
  seq2 = read_FASTA(path_to_qry)
  seq1_bit = [float_to_fixed_bin(i, 5, 0, signed=False) for i in seq1]
  seq2_bit = [float_to_fixed_bin(i, 5, 0, signed=False) for i in seq2]
  with open('pattern/seq1.txt', 'w') as f:
    f.write(float_to_fixed_bin(len(seq1), 9, 0))
    f.write(f' // {len(seq1)}')
    f.write('\n')
    for i in range(len(seq1_bit)):
      f.write(seq1_bit[i])
      f.write(f" // {seq1[i]}")
      f.write('\n')

  with open('pattern/seq2.txt', 'w') as f:
    f.write(float_to_fixed_bin(len(seq2), 9, 0))
    f.write(f' // {len(seq2)}')
    f.write('\n')
    for i in range(len(seq2_bit)):
      f.write(seq2_bit[i])
      f.write(f" // {seq2[i]}")
      f.write('\n')

  xcorr_module = CrossCorrelation(seq1, seq2, data_type='PROTEIN')
  xcorr = xcorr_module.XCorr()

  homologous = Homologous(seq1, seq2, xcorr, n=4, data_type='PROTEIN', threshold=threshold, wndw_size=window_size)
  total_segments, homologous_segments_sets = homologous.get_all_homologous_segments()
  
  offset = np.array([s.offset for s in homologous_segments_sets])
  offset_bit = [float_to_fixed_bin(i, 11, 0) for i in offset]
  
  with open('pattern/offset.txt', 'w') as f:
    for i in range(len(offset_bit)):
      f.write(offset_bit[i])
      f.write(f" // {offset[i]}")
      f.write('\n')

  for s in homologous_segments_sets:
    print(f'offset: {s.offset}')
    if len(s.coords) > 0: print(f'segments: {s.coords[:, 0]}')
    else: print('segments: []')

  reducer = ReduceSearchSpace(homologous_segments_sets, len(seq1), len(seq2), NUM_OF_PE, buffer)
  key_points = reducer.reduce()
  print(f'total key points found: {len(key_points)}')
  print(key_points)

  key_point_seq1 = key_points[:, 0]
  key_point_seq2 = key_points[:, 1]
  key_point_seq1_bit = [float_to_fixed_bin(i, 11, 0) for i in key_point_seq1]
  key_point_seq2_bit = [float_to_fixed_bin(i, 11, 0) for i in key_point_seq2]
  with open('pattern/golen_key_point_seq1.txt', 'w') as f:
    f.write(f"{float_to_fixed_bin(len(key_point_seq1), 11, 0)} // {len(key_point_seq1)}\n")
    for i in range(len(key_point_seq1)):
      f.write(key_point_seq1_bit[i])
      f.write(f" // {key_point_seq1[i]}")
      f.write('\n')

  with open('pattern/golen_key_point_seq2.txt', 'w') as f:
    f.write(f"{float_to_fixed_bin(len(key_point_seq2), 11, 0)} // {len(key_point_seq2)}\n")
    for i in range(len(key_point_seq2)):
      f.write(key_point_seq2_bit[i])
      f.write(f" // {key_point_seq2[i]}")
      f.write('\n')
  
def main():
  NUM_OF_SET = 4
  NUM_OF_PE = 32
  window_size = 17
  threshold = 18
  buffer_between_keypoint=4
  out_prefix = '../../../data/FASTA/protein/homfam/'

  ref = None
  qry = None

  # test case 0
  # ref = 'c'
  # qry = 'd'

  # test case 1
  # ref = 'a'
  # qry = 'b'

  # test case 2
  # ref = 'ref'
  # qry = 'qry'

  # test case 3
  # ref = 'e'
  # qry = 'f'

  # test case 4
  # ref = 'g'
  # qry = 'h'

  # test case 5
  # ref = '1-ref'
  # qry = '1-qry'

  # test case 6
  # ref = 'c'
  # qry = 'd'
  # threshold = 5

  # test case 7
  # ref = 'ref'
  # qry = 'qry'
  # threshold = 5

  # test case 8
  # ref = 'ref'
  # qry = 'qry'
  # threshold = 1

  # test case 9
  # ref = 'a'
  # qry = 'b'
  # threshold = 1
  # window_size = 13

  # test case 10
  ref = 'ref'
  qry = 'qry'
  threshold = 2
  window_size = 25


  gen_testcase_with_FASTA_file(out_prefix+ref, out_prefix+qry, threshold, window_size, NUM_OF_PE, buffer_between_keypoint)
  



if __name__ == '__main__':
  # b = np.array(BLOSUM62)
  # print(b.min())
  main()