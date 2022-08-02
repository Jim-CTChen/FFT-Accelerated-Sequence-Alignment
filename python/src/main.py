import os
import random

import numpy as np
import argparse
import datetime
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap

from Homologous import Homologous
from CrossCorrelation import CrossCorrelation
from ReduceSearchSpace import ReduceSearchSpace
from HomologousSegmentSet import HomologousSegmentSet
from DynamicProgramming import DPEngine
from config import NUCLEIC_ACID, AMINO_ACID, DATA_TYPES, ALGORITHMS
from Aligner import Aligner
from tool import random_gen_seq

Z = 0 # padding
A = 1
T = 2
C = 3
G = 4

def plot_reduced(out_path, reduced_score_mat, score_mat, match, reduced_trace_path, trace_path, xcorr, name, title, bottom_txt, show=False):
    # print(f'match: {int(np.sum(match))}/{int(match.shape[0]*match.shape[1])}')
    fig, axs = plt.subplots(2,2)
    axs[0, 0].imshow(reduced_score_mat, cmap='hot', interpolation='nearest')
    axs[0, 0].scatter(reduced_trace_path[:, 0], reduced_trace_path[:, 1], s=3)
    axs[0, 1].imshow(score_mat, cmap='hot')
    axs[0, 1].scatter(trace_path[:, 0], trace_path[:, 1], s=3)
    cmap = ListedColormap(['black', 'w'])
    axs[1, 0].matshow(match, cmap=cmap)
    range_of_xcorr = np.max(xcorr)-np.min(xcorr)
    _ = axs[1, 1].hist(xcorr, bins=int(range_of_xcorr))
    fig.text(.5, .02, bottom_txt, ha='center')
    fig.text(.5, .9, title, ha='center')
    if show: plt.show()
    plt.savefig(f'{out_path}/fig_{name}.jpg')
    plt.close()

def plot(out_path, score_mat, match, trace_path, xcorr, name, title, bottom_txt, show=False):
    # print(f'match: {int(np.sum(match))}/{int(match.shape[0]*match.shape[1])}')
    fig, axs = plt.subplots(2,2)
    axs[0, 1].imshow(score_mat, cmap='hot')
    axs[0, 1].scatter(trace_path[:, 0], trace_path[:, 1], s=3)
    cmap = ListedColormap(['black', 'w'])
    axs[1, 0].matshow(match, cmap=cmap)
    range_of_xcorr = np.max(xcorr)-np.min(xcorr)
    _ = axs[1, 1].hist(xcorr, bins=int(range_of_xcorr))
    fig.text(.5, .02, bottom_txt, ha='center')
    fig.text(.5, .9, title, ha='center')
    if show: plt.show()
    plt.savefig(f'{out_path}/fig_{name}.jpg')
    plt.close()

def read_FASTA(path, mol_type='DNA-RNA'):
    '''
        read in FASTA format (single sequnce in one file)
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

def read_BBS_tfa(path):
    '''
        read BAliBase 3.0 .msf (non-aligned full length sequences .tfa file)
        return multiple amino sequneces
    '''
    symbol = AMINO_ACID
    sequences = []
    descriptions = []
    with open(path, 'r') as f:
        seq = []
        while True:
            line = f.readline()
            if not line:
                if len(seq): sequences.append(seq)
                break
            elif line[0] == '>':
                descriptions.append(line[1:-1])
                if len(seq):
                    sequences.append(seq)
                    seq = []
            else:
                seq = [*seq, *list(line)[:-1]]
    for j in range(len(sequences)):
        seq = sequences[j]
        for i in range(len(seq)):
            seq[i] = symbol[seq[i]]
        sequences[j] = np.array(seq)
    return descriptions, sequences

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

def test_DNA(seed):
     # np.set_printoptions(suppress=True)

    parser = argparse.ArgumentParser()
    score_system_choice = ['DOT', 'SW']
    # parser.add_argument('--ref', help='reference sequence accession', type=str, default=accession['l_336'])
    parser.add_argument('--ref', help='reference sequence accession', type=str, default="OK413509.1")
    # parser.add_argument('--qry', help='query sequence accession', type=str, default=accession['l_598'])
    parser.add_argument('--score', help='score system for sliding window ', type=str, default='SW', choices=score_system_choice)
    parser.add_argument('--threshold', help='thershold for homologous segment', type=int, default='12')
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
        print(f'seed: {seed}')
        random.seed(seed)
        seed += 1
        qry = random_gen_seq(len=256)

        # print('XCorr')
        cor = CrossCorrelation(ref, qry)
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
        my_score = dp_engine.dp_in_reduced_space(key_points)

    else: # no homologous segments found
        print('No homologous segments found!')
        print('Run normal DP directly')

    print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, 'SW')
    gt = dp_engine2.dp_normal()
    print(f'seed: {seed}')
    
    with open(f'../out/logfile_{seed}.txt', 'w') as f:
        f.write(f'gt score: {gt}\n')
        f.write(f'reduced score: {my_score}\n\n')

        f.write(f'ref: length = {len(ref)}\n')
        f.write(np.array2string(ref))
        f.write('\n\n')
        
        f.write(f'../out/qry: length = {len(qry)}\n')
        f.write(np.array2string(qry))
        f.write('\n\n')

        f.write(f'keypoints:\n')
        for k in key_points:
            f.writelines(str(k))
    match = np.zeros((len(qry), len(ref)))
    for i in range(len(qry)):
        match[i] = (ref == np.full(len(ref), qry[i]))
    reduced_mat = dp_engine.score_matrix
    normal_mat = dp_engine2.score_matrix
    dp_engine2.traceback()
    path = np.array(dp_engine2.path)
    score = f'myscore/gt: {my_score}/{gt}'
    plot(reduced_mat, normal_mat, match, path, xcorr=c, name=seed, title=f'seed: {seed}', bottom_txt=score)
    return seed, my_score/gt
    
def test_protein_non_fixed_threshold(ref, qry, ref_serial, qry_serial, args, alg='SW'):
    '''
        test on protein
        reduce threshold if no segment found
    '''
     # np.set_printoptions(suppress=True)
    homologous_threshold = args.threshold
    homologous_window_size = args.window_size
    
    cor = CrossCorrelation(ref, qry)
    c = cor.XCorr()
    

    # print('Find homologous segment')
    stop = False
    threshold = homologous_threshold
    while not stop: # if no segment found, reduce threshold and run again
        homologous = Homologous(ref, qry, c, threshold=threshold,\
            wndw_size=homologous_window_size) # use origin sequence
        total_segments, homologous_segments_set = homologous.get_all_homologous_segments()
        if total_segments > 0: stop = True
        else: threshold -= 1

    print(f'Find total {total_segments} homologous segments, threshold = {threshold}')
    print(f'ref len: {ref.shape[0]}')
    print(f'qry len: {qry.shape[0]}')
    print(f'std of c: {np.std(c)}')

    print('Reducing search space...')
    reducer = ReduceSearchSpace(homologous_segments_set, ref.shape[0], qry.shape[0])
    key_points = reducer.reduce(verbose=False)
    for idx, kp in enumerate(key_points):
        if idx == key_points.shape[0]-1: break
        next_kp = key_points[idx+1]
        assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
        assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

    print('Running reduced DP...')
    dp_engine = DPEngine(ref, qry, alg=alg)
    my_score = dp_engine.dp_in_reduced_space(key_points, wndw_size=homologous_window_size)
    dp_engine.traceback()
    

    print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, alg=alg)
    gt = dp_engine2.dp_normal()
    dp_engine2.traceback()
    
    with open(f'../out/logfile_{ref_serial}_{qry_serial}.txt', 'w') as f:
        f.write(f'gt score: {gt}\n')
        f.write(f'reduced score: {my_score}\n\n')

        f.write(f'threshold = {threshold}\n\n')

        f.write(f'ref: length = {len(ref)}\n')
        f.write(np.array2string(ref))
        f.write('\n\n')
        
        f.write(f'qry: length = {len(qry)}\n')
        f.write(np.array2string(qry))
        f.write('\n\n')

        f.write(f'keypoints:\n')
        for k in key_points:
            f.writelines(str(k))
    match = np.zeros((len(qry), len(ref)))
    for i in range(len(qry)):
        match[i] = (ref == np.full(len(ref), qry[i]))

    score_mat = dp_engine2.score_matrix
    path = np.array(dp_engine2.path)
    reduced_score_mat = dp_engine.score_matrix
    reduced_path = np.array(dp_engine.path)
    score = f'myscore/gt: {my_score}/{gt}'
    plot(reduced_score_mat, score_mat, match, reduced_path, path, xcorr=c, name=f'{ref_serial}_{qry_serial}' ,title=f'{ref_serial} and {qry_serial}, threshold={threshold}', bottom_txt=score)
    return 1-abs(gt-my_score)/abs(gt)

def test_protein(ref, qry, ref_serial, qry_serial, args, out_path):
    '''
        test on protein
        fixed threshold
        return # of cases which are correct (+- 10% of gt)
    '''
    homologous_threshold = args.threshold
    homologous_window_size = args.window_size
    alg = args.alg
    buffer = args.buffer
    data_type = args.data_type
    
    cor = CrossCorrelation(ref, qry)
    c = cor.XCorr()
    
    threshold = homologous_threshold
    homologous = Homologous(ref, qry, c, threshold=threshold,\
        wndw_size=homologous_window_size) # use origin sequence
    total_segments, homologous_segments_set = homologous.get_all_homologous_segments()

    

    if total_segments:
        print(f'Find total {total_segments} homologous segments!')
        # print('Reducing search space...')
        reducer = ReduceSearchSpace(homologous_segments_set, ref.shape[0], qry.shape[0])
        key_points = reducer.reduce(verbose=False)
        for idx, kp in enumerate(key_points):
            if idx == key_points.shape[0]-1: break
            next_kp = key_points[idx+1]
            assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
            assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

        # print('Running reduced DP...')
        dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, buffer=buffer)
        my_score = dp_engine.dp_in_reduced_space(key_points)
        dp_engine.traceback()
    else:
        print('No segments found!')
    

    # print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, alg=alg, data_type=data_type)
    gt = dp_engine2.dp_normal()
    dp_engine2.traceback()
    
    with open(f'{out_path}/logfile_{ref_serial}_{qry_serial}.txt', 'w') as f:
        f.write(f'gt score: {gt}\n')
        if total_segments: f.write(f'reduced score: {my_score}\n\n')

        if total_segments:
            f.write(f'{total_segments} homologous segments found\n')
            f.write('printing homologous segments set:\n')
            for i, segment_set in enumerate(homologous_segments_set):
                f.write(f'set {i}:\n')
                f.write(f'num of segment in set: {segment_set.count}\n')
                f.write(f'offset: {segment_set.offset}\n')
                f.write(f'correlation: {c[segment_set.offset+(len(ref) - 1)]}\n\n')
            f.write('\n\n')
            f.write(f'keypoints:\n')
            for k in key_points:
                f.writelines(str(k))
        else:
            f.write('no homologous segment found')
    match = np.zeros((len(qry), len(ref)))
    for i in range(len(qry)):
        match[i] = (ref == np.full(len(ref), qry[i]))

    score_mat = dp_engine2.score_matrix
    path = np.array(dp_engine2.path)
    if total_segments:
        reduced_score_mat = dp_engine.score_matrix
        reduced_path = np.array(dp_engine.path)
        score = f'myscore/gt: {my_score}/{gt}'
        plot_reduced(out_path, reduced_score_mat, score_mat, match, reduced_path, path, xcorr=c, name=f'{ref_serial}_{qry_serial}' ,title=f'{ref_serial} and {qry_serial}, threshold={threshold}', bottom_txt=score, show=False)
        return True, my_score, gt
    else:
        reduced_score_mat = None
        reduced_path = None
        score = f'gt: {gt}'
        plot(out_path, score_mat, match, path, xcorr=c, name=f'{ref_serial}_{qry_serial}' ,title=f'{ref_serial} and {qry_serial}, threshold={threshold}', bottom_txt=score, show=False)
        return False, 1, 1

def test_protein_by_FASTA(ref_accession, qry_accession, args, path_prefix='../../data/FASTA/protein/mafft_sample'):
    '''
        run test_protein() by FASTA format
        input: 
            ref_accession: ref's accession
            qry_accession: qry's accession
            alg: 'SW' | 'NW'
            path_prefix: path prefix for two FASTA file
        make sure ref & qry FASTA file is named by accession
        for example: ref_accession = OK413509.1, then should exist FASTA file {path_prefix}_OK413509.1
    '''
    ref_path = os.path.join(path_prefix, ref_accession)
    qry_path = os.path.join(path_prefix, qry_accession)

    _, ref = read_FASTA(ref_path, 'PROTEIN')
    _, qry = read_FASTA(qry_path, 'PROTEIN')
    test_protein(ref, qry, ref_accession, qry_accession, args)

def test_protein_by_TFA(tfa_path, out_path, args):
    '''
        run test_protein() by BAliBASE 3.0 .tfa file
        input: path to .tfa file
        (
            only run the first sequence vs others, 
            i.e. first sequence as ref and others as qrys
        )
    '''
    print(f'Testing TFA file: {tfa_path}')
    des, seqs = read_BBS_tfa(tfa_path)
    
    acc_list = []
    has_segment_count = 0
    pass_count = 0
    align_count = 0
    for j in range(len(seqs)):
        ref = seqs[j]
        ref_serial = des[j]
        for i in range(j+1, len(seqs)):
            qry = seqs[i]
            qry_serial = des[i]
            has_segment, my_score, gt = test_protein(ref, qry, ref_serial, qry_serial, args, out_path=out_path)
            align_count += 1
            if has_segment:
                acc = 1 - (abs(my_score)-abs(gt))/abs(gt)
                has_segment_count += 1
                if my_score < gt*1.1 and my_score > gt*0.9: # within +- 10%
                    pass_count += 1
                acc_list.append(acc)
    print(f'number of cases have homologous segment: {has_segment_count}')
    if has_segment_count:
        pass_rate = pass_count/has_segment_count
        print(f'pass rate = {pass_count}/{has_segment_count} = {pass_rate}')
        print(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}')
    with open(f'{out_path}/acc_log.txt', 'w') as f:
        f.write(str(datetime.datetime.now().date()))
        f.write('\n\n')
        f.write(f'.tfa path: {tfa_path}\n\n')
        f.write('Settings:\n')
        f.write(f'1. Algorithm: {args.alg}\n')
        f.write(f'2. Window size: {args.window_size}\n')
        f.write(f'3. Threshold: {args.threshold}\n')
        if args.buffer < 1 and args.buffer > 0:
            f.write(f'4. Buffer for keypoints: ((len(ref)+len(qry))/2) * {args.buffer}\n\n')
        elif args.buffer > 1:
            f.write(f'4. Buffer for keypoints: {args.buffer}\n\n')
        elif args.buffer <= 0:
            f.write(f'4. Buffer for keypoints: no buffer for keypoints\n\n')

        f.write(f'Number of cases have homologous segment: {has_segment_count}\n')
        if has_segment_count:
            f.write(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}\n\n')
            f.write(f'pass rate = {pass_count}/{has_segment_count} = {pass_count/has_segment_count}\n')
            f.write('acc list:\n')
            for acc in acc_list:
                f.write(str(acc))
                f.write('\n')
    
    return pass_count, has_segment_count, align_count


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--threshold', help='thershold for homologous segment', type=int, default='10')
    parser.add_argument('--window_size', help='size of sliding window', type=int, default='35')
    parser.add_argument('--alg', help='NW | SW', choices=ALGORITHMS, type=str, default='NW')
    parser.add_argument('--buffer', help='buffer around keypoint, < 1 then ratio to avg length, > 1 then exact width', type=float, default=10)
    parser.add_argument('--data_type', help='data type', choices=DATA_TYPES, type=str, default='PROTEIN')
    args = parser.parse_args()

    show_args = True
    if show_args:
        print(f'threshold: {args.threshold}')
        print(f'window_size: {args.window_size}')
        print(f'alg: {args.alg}')
        print(f'buffer: {args.buffer}')
        print(f'data_type: {args.data_type}')

    tfa_path_prefix = f'../../data/bb3_release/RV12'
    out_path_prefix = f'../out/BAliBASE3.0/bbs_RV12_{args.alg}/threshold_{args.threshold}_{args.window_size}/buffer_{args.buffer}'
    os.system(f'mkdir -p {out_path_prefix}/BB12001')
    os.system(f'mkdir -p {out_path_prefix}/BB12002')
    os.system(f'mkdir -p {out_path_prefix}/BB12003')
    os.system(f'mkdir -p {out_path_prefix}/BB12004')
    os.system(f'mkdir -p {out_path_prefix}/BB12005')

    # out_path_prefix = '../out'
    # test_protein_by_TFA(f'{tfa_path_prefix}/BB12002.tfa', out_path_prefix, args)
    total_pass_count = 0
    total_has_segment_count = 0
    total_align_count = 0

    case_number = 'BB12001'
    tfa_path = f'{tfa_path_prefix}/{case_number}.tfa'
    out_path = f'{out_path_prefix}/{case_number}'
    pass_count, has_segment_count, align_count = test_protein_by_TFA(tfa_path, out_path, args)
    total_pass_count += pass_count
    total_has_segment_count += has_segment_count
    total_align_count += align_count

    case_number = 'BB12002'
    tfa_path = f'{tfa_path_prefix}/{case_number}.tfa'
    out_path = f'{out_path_prefix}/{case_number}'
    pass_count, has_segment_count, align_count = test_protein_by_TFA(tfa_path, out_path, args)
    total_pass_count += pass_count
    total_has_segment_count += has_segment_count
    total_align_count += align_count

    case_number = 'BB12003'
    tfa_path = f'{tfa_path_prefix}/{case_number}.tfa'
    out_path = f'{out_path_prefix}/{case_number}'
    pass_count, has_segment_count, align_count = test_protein_by_TFA(tfa_path, out_path, args)
    total_pass_count += pass_count
    total_has_segment_count += has_segment_count
    total_align_count += align_count

    case_number = 'BB12004'
    tfa_path = f'{tfa_path_prefix}/{case_number}.tfa'
    out_path = f'{out_path_prefix}/{case_number}'
    pass_count, has_segment_count, align_count = test_protein_by_TFA(tfa_path, out_path, args)
    total_pass_count += pass_count
    total_has_segment_count += has_segment_count
    total_align_count += align_count

    case_number = 'BB12005'
    tfa_path = f'{tfa_path_prefix}/{case_number}.tfa'
    out_path = f'{out_path_prefix}/{case_number}'
    pass_count, has_segment_count, align_count = test_protein_by_TFA(tfa_path, out_path, args)
    total_pass_count += pass_count
    total_has_segment_count += has_segment_count
    total_align_count += align_count

    print(f'segment hit rate = has segment count / align count')
    print(f'segment hit rate = {total_has_segment_count}/{total_align_count} = {total_has_segment_count/total_align_count}')
    print(f'pass rate = pass count / has segment count')
    print(f'pass rate = {total_pass_count}/{total_has_segment_count} = {total_pass_count/total_has_segment_count}')
    
    with open(f'{out_path_prefix}/acc_log.txt', 'w') as f:
        f.write(str(datetime.datetime.now().date()))
        f.write('\n\n')
        f.write(f'.tfa path: {tfa_path}\n\n')
        f.write('Settings:\n')
        f.write(f'1. Algorithm: {args.alg}\n')
        f.write(f'2. Window size: {args.window_size}\n')
        f.write(f'3. Threshold: {args.threshold}\n')
        if args.buffer < 1 and args.buffer > 0:
            f.write(f'4. Buffer for keypoints: ((len(ref)+len(qry))/2) * {args.buffer}\n\n')
        elif args.buffer > 1:
            f.write(f'4. Buffer for keypoints: {args.buffer}\n\n')
        elif args.buffer <= 0:
            f.write(f'4. Buffer for keypoints: no buffer for keypoints\n\n')
        f.write(f'segment hit rate = has segment count / align count\n')
        f.write(f'segment hit rate = {total_has_segment_count}/{total_align_count} = {total_has_segment_count/total_align_count}\n')
        f.write(f'pass rate = pass count / has segment count\n')
        f.write(f'pass rate = {total_pass_count}/{total_has_segment_count} = {total_pass_count/total_has_segment_count}')


if __name__ == '__main__':
    main()


    quit()

    seed = 0
    acc_list = []

    # DNA
    # while len(acc_list) < 20:
    #     seed, acc = test_DNA(seed)
    #     acc_list.append(acc)
    # print(f'avg acc of total {len(acc_list)} sample: {sum(acc_list)/len(acc_list)}')

    # protein
    ref_accession = 'L15228'
    qry_accession = 'L21195'
    test_protein_by_FASTA(ref_accession, qry_accession, args)

    qry_accession = 'A45229'
    test_protein_by_FASTA(ref_accession, qry_accession, args)

    qry_accession = 'B45229'
    test_protein_by_FASTA(ref_accession, qry_accession, args)

    qry_accession = 'L21195'
    test_protein_by_FASTA(ref_accession, qry_accession, args)