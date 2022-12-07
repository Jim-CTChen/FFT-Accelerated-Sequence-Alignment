import numpy as np
import random
import sys
sys.path.insert(1, '/Users/ctchen/Desktop/special_project/Lu/110/code/python/src')
sys.path.insert(1, '../max_offset')
from quantize import float_to_fixed_bin
from Homologous import Homologous
from CrossCorrelation import CrossCorrelation
from ReduceSearchSpace import ReduceSearchSpace

BLOSUM62 = [
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
  [  0,  4,  0,  0, -2, -1, -2,  0, -2, -1,  0, -1, -1, -1, -2,  0, -1, -1, -1,  1,  0,  0,  0, -3,  0, -2,  0], 
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
  [  0,  0,  0,  9, -3, -4, -2, -3, -3, -1,  0, -3, -1, -1, -3,  0, -3, -3, -3, -1, -1,  0, -1, -2,  0, -2,  0], 
  [  0, -2,  0, -3,  6,  2, -3, -1, -1, -3,  0, -1, -4, -3,  1,  0, -1,  0, -2,  0, -1,  0, -3, -4,  0, -3,  0], 
  [  0, -1,  0, -1,  2,  5, -3, -2,  0, -3,  0,  1, -3, -2,  0,  0, -1,  2,  0,  0, -1,  0, -2, -3,  0, -2,  0], 
  [  0, -2,  0, -2, -3, -3,  6, -3, -1,  0,  0, -3,  0,  0, -3,  0, -4, -3, -3, -2, -2,  0, -1,  1,  0,  3,  0], 
  [  0,  0,  0, -3, -1, -2, -3,  6, -2, -3,  0, -2, -4, -3,  0,  0, -2, -2, -2,  0, -2,  0, -3, -2,  0, -3,  0], 
  [  0, -2,  0, -3, -1,  0, -1, -2,  8, -3,  0, -1, -3, -2,  1,  0, -2,  0,  0, -1, -2,  0, -3, -2,  0,  2,  0], 
  [  0, -1,  0, -1, -3, -3,  0, -4, -3,  4,  0, -3,  2,  1, -3,  0, -3, -3, -3, -2, -1,  0,  3, -3,  0, -1,  0], 
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
  [  0, -1,  0, -3, -1,  1, -3, -2, -1, -3,  0,  5, -2, -1,  0,  0, -1,  1,  2,  0, -1,  0, -2, -3,  0, -2,  0], 
  [  0, -1,  0, -1, -4, -3,  0, -4, -3,  2,  0, -2,  4,  2, -3,  0, -4, -3, -3, -3, -2,  0,  2, -3,  0, -2,  0], 
  [  0, -1,  0, -1, -3, -2,  0, -3, -2,  1,  0, -1,  2,  5, -2,  0, -2,  0, -1, -1, -1,  0,  1, -1,  0, -1,  0], 
  [  0, -2,  0, -3,  1,  0, -3,  0,  1, -3,  0,  0, -3, -2,  6,  0, -2,  0,  0,  1,  0,  0, -3, -4,  0, -2,  0], 
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
  [  0, -1,  0, -3, -1, -1, -4, -2, -2, -3,  0, -1, -3, -2, -2,  0,  7, -1, -2, -1,  -1, 0, -2, -4,  0, -3,  0], 
  [  0, -1,  0, -3,  0,  2, -3, -2,  0, -3,  0,  1, -2,  0,  0,  0, -1,  5,  1,  0, -1,  0, -2, -2,  0, -1,  0], 
  [  0, -1,  0, -3, -2,  0, -3, -2,  0, -3,  0,  2, -2, -1,  0,  0, -2,  1,  5, -1, -1,  0, -3, -3,  0, -2,  0], 
  [  0,  1,  0, -1,  0,  0, -2,  0, -1, -2,  0,  0, -2, -1,  1,  0, -1,  0, -1,  4,  1,  0, -2, -3,  0, -2,  0], 
  [  0,  0,  0, -1, -1, -1, -2, -2, -2, -1,  0, -1, -1, -1,  0,  0, -1, -1, -1,  1,  5,  0,  0, -2,  0, -2,  0], 
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
  [  0,  0,  0, -1, -3, -2, -1, -3, -3,  3,  0, -2,  1,  1, -3,  0, -2, -2, -3, -2,  0,  0,  4, -3,  0, -1,  0], 
  [  0, -3,  0, -2, -4, -3,  1, -2, -2, -3,  0, -3, -2, -1, -4,  0, -4, -2, -3, -3, -2,  0, -3, 11,  0,  2,  0], 
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
  [  0, -2,  0, -2, -3, -2,  3, -3,  2, -1,  0, -2, -1, -1, -2,  0, -3, -1, -2, -2, -2,  0, -1,  2,  0,  7,  0], 
  [  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0], 
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

def main():
  NUM_OF_SET = 4
  NUM_OF_PE = 32
  window_size = 15
  threshold = 3
  # N = 32
  # M = 32
  # seq1 = np.array([i%15 for i in range(N)])
  # seq2 = np.array([i%15 for i in range(M)])

  seq1 = "GGSLARTEATGYGSVYFANEMLKKSGGSLEGKKCSVSGAGNVAIYTVEKLYEFGALPITVSDSTGFVYDKDGIDTQLLKRLKEVERKGLSDYTDFRKNAVFTPVKAYKEGTNGVWSVPCDAAFPSATQNELHLVDIKTLYNNGCRLVCEGANMPSTLDAIDFMISKKDFLFGPAKAANAGGVATSGLEMAQNASMQKWSFEEVDKKLHDIMRNIFNESYDTSVEFGDAGNLVLGANIAGFRKVADAMIDQG"
  seq1 = "LVSGSGNVAQFAIEKLLEYGAIPMSLSDSNGTIIEPNGFTSEQLKQIMELKNVKRGRISEYTALSSTAKYYEGKRPWAVYEGSVDVILPCATQNEVTGEEALRVIKQGVKYVAEGANMPSTDEAIHAYHANKVFYGPAKASNAGGVATSGLEMTQNSNRIQWSAERVDEELHNIMRSIFQQCKETAEK"
  seq2 = "GINHKEFGVTSTGVVRFAEITMADLGIDMVNHPFSVKFTGGPNGDVAGNAMRIMLERYPRMQIRLILDGTAALYDPKGARHGELERILLKEDLDGFNPQALHEGGFMLFRSGSRTEGLRTLYRKATMGGDGLTEQWISIDEFSREFGDLPFTTQADLFIPGGGRPETIDARNWERFFLPDGTPSARAIIEGANSFITPDARVQLQKRGVIIMRDASANKCGVISSSYEIIANLLMADAEFLAEKEEYVGGVIAILEKR"
  seq2 = "GSQARTEATGYGTVYFVKHLLADKNDTFEGKKVAVSGSGNVAIYAMEKATELGATVITCSDSSGFVYDPEGIDVALVKELKEKNRERISKYVETRKGATYYDKESVWDFETAYDIALPCATQNEINEKQAAILVKNGVKVVAEGANMPCTLEAVAVFAKSAVIYCPGKAANAGGVAVSALEMSQNAERLAWSFEKVDGMLDQIMQNIYETCRDTANEYQARDNFVLGANIAGFEKVAAAMLSQG"
  seq1 = np.array([hardware_amino_mapping[f'{c}'] for c in seq1])
  seq2 = np.array([hardware_amino_mapping[f'{c}'] for c in seq2])

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

  reducer = ReduceSearchSpace(homologous_segments_sets, len(seq1), len(seq2), B=NUM_OF_PE)
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
  



if __name__ == '__main__':
  main()