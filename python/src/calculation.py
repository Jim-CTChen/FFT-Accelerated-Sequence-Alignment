import numpy as np
from config import AMINO_ACID_20, BLOSUM62, VOLUME_MAPPING, POLARITY_MAPPING

def calculate_blosum62_avg():
  amino_idx = np.array([a for a in AMINO_ACID_20.values()])
  # print(f'amino index: {amino_idx}')

  blosum62 = np.array(BLOSUM62)
  blosum62_mean = blosum62.mean() # -0.5871056241426612
  # print(blosum62_mean)

  blosum62_20 = blosum62[np.ix_(amino_idx, amino_idx)] # only include 20 amino acid
  # print(blosum62_20)
  blosum62_20_mean = blosum62_20.mean() # -1.07
  # print(blosum62_20_mean)

  # remove diagonal, only calculate mismatch score
  diagonal = 0
  for i in range(blosum62_20.shape[0]):
    diagonal += blosum62_20[i,i]
    blosum62_20[i,i] = 0

  # sum / mismatch count 19*20
  blosum62_20_mismatch_mean = blosum62_20.sum()/(blosum62_20.size-blosum62_20.shape[0])
  blosum62_20_match_mean = diagonal/blosum62_20.shape[0]
  print(blosum62_20_mismatch_mean) # -1.43
  print(blosum62_20_match_mean) # 5.8

def calculate_polarity_volume_avg_std():
  polarity = np.array(list(POLARITY_MAPPING.values()))[1:] # remove '-'
  volume = np.array(list(VOLUME_MAPPING.values()))[1:]     # remove '-'
  polarity_mean = polarity.mean() # 8.323
  polarity_std = polarity.std()   # 2.559
  volume_mean = volume.mean()     # 84.02
  volume_std = volume.std()       # 40.856

  standardized_polarity_mapping = {}
  standardized_volume_mapping = {}

  for key, value in POLARITY_MAPPING.items():
    if key == '-': continue
    standardized_polarity_mapping[key] = (value-polarity_mean)/polarity_std

  for key, value in VOLUME_MAPPING.items():
    if key == '-': continue
    standardized_volume_mapping[key] = (value-volume_mean)/volume_std
  print(standardized_volume_mapping)

def calculate_xcorr_mean():
  volume = np.array(list(VOLUME_MAPPING.values())) # remove '-'
  print(volume.sum())
  volume = volume.reshape(-1, 1)
  volume_mat = volume @ volume.T
  volume_match_score = 0
  for i in range(volume_mat.shape[0]):
    volume_match_score += volume_mat[i, i]
    volume_mat[i, i] = 0
  volume_match_mean = volume_match_score/(volume_mat.shape[0]-1) # minus '-' case
  volume_mismatch_mean = volume_mat.sum()/(volume_mat.size-volume_mat.shape[0])
  print(volume_match_mean) # 8729.25
  print(volume_mismatch_mean) # 6342.30735930736

  polarity = np.array(list(POLARITY_MAPPING.values())) # remove '-'
  print(polarity.sum())
  polarity = polarity.reshape(-1, 1)
  polarity_mat = polarity @ polarity.T
  polarity_match_score = 0
  for i in range(polarity_mat.shape[0]):
    polarity_match_score += polarity_mat[i, i]
    polarity_mat[i, i] = 0
  polarity_match_mean = polarity_match_score/(polarity_mat.shape[0]-1) # minus '-' case
  polarity_mismatch_mean = polarity_mat.sum()/(polarity_mat.size-polarity_mat.shape[0])
  print(polarity_match_mean) # 75.83523809523811
  print(polarity_mismatch_mean) # 62.68939393939394


def calculate_correlation_impact():
  pass

def main():
  calculate_xcorr_mean()

if __name__ == '__main__':
  main()
