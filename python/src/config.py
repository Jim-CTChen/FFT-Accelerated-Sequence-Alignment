NUCLEIC_ACID = {
  '-': 0,
  'A': 1,
  'T': 2,
  'C': 3,
  'G': 4,
  'U': 5,
  'R': 6,
  'Y': 7,
  'K': 8,
  'M': 9,
  'S': 10,
  'W': 11,
  'B': 12,
  'D': 13,
  'H': 14,
  'V': 15,
  'N': 16,
}

NUCLEIC_ACID_MAPPING = {
  '0': '-',
  '1': 'A',
  '2': 'T',
  '3': 'C',
  '4': 'G',
  '5': 'U',
  '6': 'R',
  '7': 'Y',
  '8': 'K',
  '9': 'M',
  '10': 'S',
  '11': 'W',
  '12': 'B',
  '13': 'D',
  '14': 'H',
  '15': 'V',
  '16': 'N',
}

AMINO_ACID = {
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

AMINO_ACID_MAPPING = {
  '0': '-',
  '1': 'A',
  '2': 'B',
  '3': 'C',
  '4': 'D',
  '5': 'E',
  '6': 'F',
  '7': 'G',
  '8': 'H',
  '9': 'I',
  '10': 'J',
  '11': 'K',
  '12': 'L',
  '13': 'M',
  '14': 'N',
  '15': 'O',
  '16': 'P',
  '17': 'Q',
  '18': 'R',
  '19': 'S',
  '20': 'T',
  '21': 'U',
  '22': 'V',
  '23': 'W',
  '24': 'X',
  '25': 'Y',
  '26': 'Z',
}

AMINO_ACID_20 = {
  'A': 1,
  'C': 3,
  'D': 4,
  'E': 5,
  'F': 6,
  'G': 7,
  'H': 8,
  'I': 9,
  'K': 11,
  'L': 12,
  'M': 13,
  'N': 14,
  'P': 16,
  'Q': 17,
  'R': 18,
  'S': 19,
  'T': 20,
  'V': 22,
  'W': 23,
  'Y': 25,
}

DNA_4 = {
  'A': 1,
  'T': 2,
  'C': 3,
  'G': 4,
}

RNA_4 = {
  'A': 1,
  'C': 3,
  'G': 4,
  'U': 5,
}

POLARITY_MAPPING = {
  '-': 0,
  'A': 8.1,
  'C': 5.5,
  'D': 13,
  'E': 12.3,
  'F': 5.2,
  'G': 9,
  'H': 10.4,
  'I': 5.2,
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
  'Y': 6.2,
}

VOLUME_MAPPING = {
  '-': 0,
  'A': 31,
  'C': 55,
  'D': 54,
  'E': 83,
  'F': 132,
  'G': 3,
  'H': 96,
  'I': 111,
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
  'Y': 136,
}

'''  -   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z'''
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