import os
import random

import numpy as np
import argparse
from datetime import datetime
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

from Homologous import Homologous
from CrossCorrelation import CrossCorrelation
from ReduceSearchSpace import ReduceSearchSpace
from HomologousSegmentSet import HomologousSegmentSet
from DynamicProgramming import DPEngine
from config import NUCLEIC_ACID, AMINO_ACID
from Aligner import Aligner

Z = 0 # padding
A = 1
T = 2
C = 3
G = 4

def plot(mat1, mat2, trace, path, seed):
    # plt.figure(0)
    # plt.imshow(mat1, cmap='hot', interpolation='nearest')
    # plt.figure(1)
    # plt.scatter(path[:, 0], path[:, 1])
    # plt.imshow(mat2, cmap='hot', interpolation='nearest')
    # cmap = ListedColormap(['black', 'w'])
    # plt.matshow(trace==3, cmap=cmap)
    # plt.show()

    fig, axs = plt.subplots(2,2)
    axs[0, 0].imshow(mat1, cmap='hot', interpolation='nearest')
    axs[0, 0].scatter(path[:, 0], path[:, 1], s=3)
    axs[0, 1].imshow(mat2, cmap='hot', interpolation='nearest')
    cmap = ListedColormap(['black', 'w'])
    axs[1, 0].matshow(trace==3, cmap=cmap)
    plt.savefig(f'fig_{seed}.jpg')
    plt.show()

def read_FASTA(path, mol_type='DNA-RNA'):
    '''
        read in FASTA format
        return description and sequence
        input:
            path (str): path for FASTA file
            mol_type (str): {'DNA-RNA', 'PROTEIN}
        output:
            description (str): description for sequence
            sequence (np.ndarray): sequence 
    '''
    mode_list = ['DNA-RNA', 'PROTEIN']
    if mol_type not in mode_list:
        raise ValueError
    
    symbol = None
    if mol_type == 'DNA-RNA':
        symbol = NUCLEIC_ACID
    elif mol_type == 'PROTEIN':
        symbol = AMINO_ACID

    sequence = []
    description = None
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
    return description, sequence

def read_sequence(path):
    '''
        read in sequence in 0123 format
        return description and sequence
        input:
            path (str): path for data file
        output:
            description (str): description for sequence
            sequence (np.ndarray): sequence
    '''
    description = f'sequence read from {path}'
    sequence = np.loadtxt(path).flatten()+1 # turn ATCG, 0123 to ATCG, 1234
    # print(sequence.shape)
    # print(sequence)
    return description, sequence

def pad_seq(seq1, seq2):
    '''
        pairwise padding to same length
    '''
    n = len(seq1)
    m = len(seq2)
    l = max(n, m)
    if n > m:
        seq2 = np.pad(seq2, (0, n-m), mode='constant')
    else:
        seq1 = np.pad(seq1, (0, m-n), mode='constant')
    
    return seq1, seq2

def random_gen_qry(len=None, limit = 512) -> np.ndarray:
    if not len:
        len = random.randint(128, limit)
    qry = []
    for i in range(len):
        qry.append(random.randint(1, 4))
    return np.array(qry)

def test():
     # np.set_printoptions(suppress=True)
    seed = 1
    

    parser = argparse.ArgumentParser()
    score_system_choice = ['DOT', 'SW']
    # parser.add_argument('--ref', help='reference sequence accession', type=str, default=accession['l_336'])
    parser.add_argument('--ref', help='reference sequence accession', type=str, default="OK413509.1")
    # parser.add_argument('--qry', help='query sequence accession', type=str, default=accession['l_598'])
    parser.add_argument('--score', help='score system for sliding window ', type=str, default='SW', choices=score_system_choice)
    parser.add_argument('--threshold', help='thershold for homologous segment', type=int, default='15')
    parser.add_argument('--window_size', help='size of sliding window', type=int, default='25')
    args = parser.parse_args()

    homologous_score_system = args.score
    homologous_threshold = args.threshold
    homologous_window_size = args.window_size
    
    ref_accession = args.ref
    # qry_accession = args.qry
    FASTA_prefix = '../../data/FASTA'
    ref_path = os.path.join(FASTA_prefix, ref_accession)
    # qry_path = os.path.join(FASTA_prefix, qry_accession)

    _, ref = read_FASTA(ref_path)
    # _, qry = read_FASTA(qry_path)
    stop = False
    while not stop:
        seed += 1
        print(f'seed: {seed}')
        random.seed(seed)
        qry = random_gen_qry(len=256,limit=len(ref))
        # acc_score = calculate_acc_score(ref, qry)
        # print(f'NW score: {acc_score}')

        # pad ref, qry to same length
        ref_pad, qry_pad = pad_seq(ref, qry)

        L = len(ref_pad) # length for sequences

        # print('XCorr')
        cor = CrossCorrelation(ref_pad, qry_pad)
        c = cor.XCorr()
        

        # print('Find homologous segment')
        homologous = Homologous(ref, qry, c, threshold=homologous_threshold,\
            wndw_size=homologous_window_size, score_system=homologous_score_system) # use origin sequence
        total_segments, homologous_segments_set = homologous.get_all_homologous_segments()
        if total_segments:
            stop = True
    print(f'Find total {total_segments} homologous segments')
    print(f'ref len: {ref.shape[0]}')
    print(f'qry len: {qry.shape[0]}')
    print(f'std of c: {np.std(c)}')
    print(f'seed: {seed}')

    if total_segments != 0:
        # range_of_xcorr = np.max(c)-np.min(c)
        # _ = plt.hist(c, bins=int(range_of_xcorr))
        # plt.show()
        print('Reducing search space...')
        reducer = ReduceSearchSpace(homologous_segments_set, ref.shape[0], qry.shape[0])
        key_points = reducer.reduce(verbose=False)
        for idx, kp in enumerate(key_points):
            if idx == key_points.shape[0]-1: break
            next_kp = key_points[idx+1]
            assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
            assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

        print('Running reduced DP...')
        dp_engine = DPEngine(ref, qry, 'SW')
        my_score = dp_engine.dp_in_reduced_space(key_points)

    else: # no homologous segments found
        print('No homologous segments found!')
        print('Run normal DP directly')

    print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, 'SW')
    gt = dp_engine2.dp_normal()
    
    with open(f'logfile_{seed}.txt', 'w') as f:
        f.write(f'ref: length = {len(ref)}\n')
        f.write(np.array2string(ref))
        f.write('\n\n')
        
        f.write(f'qry: length = {len(qry)}\n')
        f.write(np.array2string(qry))
        f.write('\n\n')

        f.write(f'gt score: {gt}\n')
        f.write(f'reduced score: {my_score}\n\n')
        f.write(f'keypoints:\n')
        for k in key_points:
            f.writelines(str(k))
    reduced_mat = dp_engine.score_matrix
    normal_mat = dp_engine2.score_matrix
    dp_engine2.traceback()
    path = np.array(dp_engine2.path)
    trace = dp_engine2.trace_matrix
    plot(reduced_mat, normal_mat, trace, path, seed=seed)
    

def calculate_fft_score(ref:list, qry:list, homologous_threshold, homologous_window_size, homologous_score_system):
    ref_pad, qry_pad = pad_seq(ref, qry)
    cor = CrossCorrelation(ref_pad, qry_pad)
    c = cor.XCorr()
    homologous = Homologous(ref, qry, c, threshold=homologous_threshold,\
        wndw_size=homologous_window_size, score_system=homologous_score_system)

def calculate_acc_score(ref: np.ndarray, qry: np.ndarray):
    SW = Aligner(np.array(ref), np.array(qry), alg='NW')
    score = SW.calculate_score()
    return score

accession = {
    'l_336': 'MW820281.1',
    'l_598': 'OK413509.1',
    'wuhan': 'NC_045512.2',
    'variant': 'ON249061.1',
    'l_2260': 'OM647895.1',
    'l_2078': 'MQ262985.1',
    'l_3360': 'OM066777.1',
}


def test_traceback():
    ref_path = ''
    qry_path = ''
    _, ref = read_FASTA('../../data/FASTA/ref')
    _, qry = read_FASTA('../../data/FASTA/qry')

    nw = Aligner(ref, qry, 'NW')
    nw.calculate_score()
    print(f'score matrix:')
    nw.print_score_matrix()
    aligned_ref, aligned_qry = nw.traceback()
    print(f'trace matrix:')
    nw.print_trace_matrix()
    print(f'alignment ref: {aligned_ref}')
    print(f'alignment qry: {aligned_qry}')

def main():
    # np.set_printoptions(suppress=True)
    seed = 150000
    

    parser = argparse.ArgumentParser()
    score_system_choice = ['DOT', 'SW']
    # parser.add_argument('--ref', help='reference sequence accession', type=str, default=accession['l_336'])
    parser.add_argument('--ref', help='reference sequence accession', type=str, default="OK413509.1")
    # parser.add_argument('--qry', help='query sequence accession', type=str, default=accession['l_598'])
    parser.add_argument('--score', help='score system for sliding window ', type=str, default='SW', choices=score_system_choice)
    parser.add_argument('--threshold', help='thershold for homologous segment', type=int, default='15')
    parser.add_argument('--window_size', help='size of sliding window', type=int, default='30')
    args = parser.parse_args()

    homologous_score_system = args.score
    homologous_threshold = args.threshold
    homologous_window_size = args.window_size
    
    ref_accession = args.ref
    # qry_accession = args.qry
    FASTA_prefix = '../../data/FASTA'
    ref_path = os.path.join(FASTA_prefix, ref_accession)
    # qry_path = os.path.join(FASTA_prefix, qry_accession)

    _, ref = read_FASTA(ref_path)
    # _, qry = read_FASTA(qry_path)
    stop = False
    while not stop:
        seed += 1
        random.seed(seed)
        qry = random_gen_qry(limit=len(ref))
        # acc_score = calculate_acc_score(ref, qry)
        # print(f'NW score: {acc_score}')

        # pad ref, qry to same length
        ref_pad, qry_pad = pad_seq(ref, qry)

        L = len(ref_pad) # length for sequences

        print('XCorr')
        cor = CrossCorrelation(ref_pad, qry_pad)
        c = cor.XCorr()

        print('Find homologous segment')
        homologous = Homologous(ref, qry, c, threshold=homologous_threshold,\
            wndw_size=homologous_window_size, score_system=homologous_score_system) # use origin sequence
        total_segments, homologous_segments_set = homologous.get_all_homologous_segments()
        if total_segments:
            stop = True
    print(f'Find total {total_segments} homologous segments')
    print(f'ref len: {ref.shape[0]}')
    print(f'qry len: {qry.shape[0]}')
        

    if total_segments != 0:
        print('Reducing search space...')
        reducer = ReduceSearchSpace(homologous_segments_set, ref.shape[0], qry.shape[0])
        key_points = reducer.reduce(verbose=False)
        for idx, kp in enumerate(key_points):
            if idx == key_points.shape[0]-1: break
            next_kp = key_points[idx+1]
            assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
            assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

        print('Running reduced DP...')
        dp_engine = DPEngine(ref, qry, 'SW')
        dp_engine.dp_in_reduced_space(key_points)

    else: # no homologous segments found
        print('No homologous segments found!')
        print('Run normal DP directly')

    print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, 'SW')
    dp_engine2.dp_normal()

    reduced_mat = dp_engine.score_matrix()
    normal_mat = dp_engine2.score_matrix()
    show_matrix(reduced_mat, normal_mat)
    


def test_read():
    description, test = read_FASTA('../../data/FASTA/NC_045512.2')
    print(description)
    print(test)

def check_len(path):
    _, seq = read_FASTA(path)
    print(f'len of seq: {seq.shape[0]}')

if __name__ == '__main__':
    # prefix = '../../data/FASTA/'
    # accession = 'OM066777.1'
    # check_len(os.path.join(prefix, accession))

    # main()
    test()