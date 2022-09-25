'''
  quantize polarity & volume
'''

from cmath import polar


POLARITY_MAPPING = {
  '-': 0,
  'A': 8.1,
  'B': 12.3,
  'C': 5.5,
  'D': 13,
  'E': 12.3,
  'F': 5.2,
  'G': 9,
  'H': 10.4,
  'I': 5.2,
  'J': 5,
  'K': 11.3,
  'L': 4.9,
  'M': 5.7,
  'N': 11.6,
  'P': 8,
  'Q': 10.5,
  'R': 10.5,
  'S': 9.2,
  'T': 8.6,
  'V': 5.9,
  'W': 5.4,
  'X': 8.3,
  'Y': 6.2,
  'Z': 11.4
}

VOLUME_MAPPING = {
  '-': 0,
  'A': 31,
  'B': 55,
  'C': 55,
  'D': 54,
  'E': 83,
  'F': 132,
  'G': 3,
  'H': 96,
  'I': 111,
  'J': 111,
  'K': 119,
  'L': 111,
  'M': 105,
  'N': 56,
  'P': 32.5,
  'Q': 85,
  'R': 124,
  'S': 32,
  'T': 61,
  'V': 84,
  'W': 170,
  'X': 84,
  'Y': 136,
  'Z': 84
}

def quantize_volume_polarity():
  MAX = 3

  # quantize polarity
  polarity_max = max(list(POLARITY_MAPPING.values()))
  scale = MAX/polarity_max
  quant_polarity = {}
  for amino, polarity in POLARITY_MAPPING.items():
    quant_polarity[f'{str(amino)}'] = round(polarity*scale)

  # quantize volume
  volume_max = max(list(VOLUME_MAPPING.values()))
  scale = MAX/volume_max
  quant_volume = {}
  for amino, volume in VOLUME_MAPPING.items():
    quant_volume[f'{str(amino)}'] = round(volume*scale)
  
  print(quant_polarity)
  print(quant_volume)

def main():
  quantize_volume_polarity()


if __name__ == '__main__':
  main()