import random
import numpy as np
from config import DNA_4, RNA_4, AMINO_ACID_20

def random_gen_seq(len=None, lower_bound = 16, upper_bound = 512, data_type='DNA') -> np.ndarray:
    '''
        if !len: length range from [lower_bound, upper_bound]
        else: length = len
        data_type = 'DNA' | 'RNA' | 'PROTEIN'
    '''
    if not len:
        len = random.randint(lower_bound, upper_bound)
    seq = []
    if data_type == 'DNA':
        nucleic = list(DNA_4.values())
        for i in range(len):
            seq.append(nucleic[random.randint(0, 3)])
    elif data_type == 'RNA':
        nucleic = list(RNA_4.values())
        for i in range(len):
            seq.append(nucleic[random.randint(0, 3)])
    elif data_type == 'PROTEIN':
        amino_acid = list(AMINO_ACID_20.values())
        for i in range(len):
            seq.append(amino_acid[random.randint(0, 19)])

    return np.array(seq)