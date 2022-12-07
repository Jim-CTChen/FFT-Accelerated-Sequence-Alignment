import os
import random

import numpy as np
import argparse
import datetime
import matplotlib.pyplot as plt
import copy
from matplotlib.colors import ListedColormap

from Homologous import Homologous
from CrossCorrelation import CrossCorrelation
from ReduceSearchSpace import ReduceSearchSpace
from HomologousSegmentSet import HomologousSegmentSet
from DynamicProgramming import DPEngine
from config import NUCLEIC_ACID, AMINO_ACID, DATA_TYPES, ALGORITHMS, BLOSUM62
from Aligner import Aligner
from tool import random_gen_seq, effective_length, evaluate

'''
    Look at test_protein(), test_protein_by_TFA(), homfam_experiment()
'''

def print_args(args):
    print(f'threshold: {args.threshold}')
    print(f'window_size: {args.window_size}')
    print(f'alg: {args.alg}')
    print(f'buffer: {args.buffer}')
    print(f'data_type: {args.data_type}')
    print(f'n: {args.n}')

def arg_string(args):
    arg_str = ''
    arg_str += f'0. Data type: {args.data_type}\n'
    arg_str += f'1. Algorithm: {args.alg}\n'
    arg_str += f'2. Threshold: {args.threshold}\n'
    arg_str += f'3. Window size: {args.window_size}\n'
    arg_str += f'4. Num of PEs (band): {args.band}\n'
    arg_str += f'5. Num of homologous sets (n): {args.n}\n'
    arg_str += f'6. Use of polarity: {args.use_polarity}\n'
    arg_str += f'7. Quntization strategy: {args.quant_volume}\n'
    arg_str += f'8. Resume: {args.resume}\n'
    arg_str += f'9. Error tolerance: {args.error_tolerance}\n'

    return arg_str

def plot_reduced(out_path, reduced_score_mat, score_mat, match, reduced_trace_path, trace_path, xcorr, name, title, bottom_txt, all_segment_sets, show=False):

    fig, axs = plt.subplots(2,2, dpi=160)
    (h, w) = score_mat.shape

    # reduced score matrix with trace path
    axs[0, 0].imshow(reduced_score_mat, cmap='hot', interpolation='nearest')
    axs[0, 0].scatter(reduced_trace_path[:, 0], reduced_trace_path[:, 1], s=2, c='m')

    # full score matrix with trace path
    axs[0, 1].imshow(score_mat, cmap='hot')
    axs[0, 1].scatter(trace_path[:, 0], trace_path[:, 1], s=2, c='b')

    # score map with offset (thickness represents correlation score)
    axs[1, 0].imshow(score_mat, cmap='hot')
    axs[1, 0].scatter(trace_path[:, 0], trace_path[:, 1], s=2, c='b')
    axs[1, 0].scatter(reduced_trace_path[:, 0], reduced_trace_path[:, 1], s=2, c='m')
    score_list = np.sort(xcorr)[-len(all_segment_sets):]
    score_range = np.ptp(score_list)
    score_range = 1 if not score_range else score_range
    score_min = score_list.min()
    score_max = score_list.max()

    for homologous_set in all_segment_sets:
        offset = homologous_set.offset
        score = homologous_set.correlation_score
        x, y = None, None
        if offset >= 0:
            if offset+h < w:
                x, y = [offset, offset+h-1], [0, h-1]
            else:
                x, y = [offset, w-1], [0, w-offset-1]
        else:
            if w-offset < h:
                x, y = [0, w-1], [-offset, w-offset-1]
            else:
                x, y = [0, h+offset-1], [-offset, h-1]
        # axs[1, 0].plot(x, y, '-g', linewidth=(1+2*(score-score_min)/score_range))
        axs[1, 0].plot(x, y, '-g', linewidth=(1))

        for coord in homologous_set.coords:
            x, y = coord
            axs[1, 0].plot(x, y, 'x', c='k', zorder=10)


    # match dot map
    # cmap = ListedColormap(['black', 'w'])
    # axs[1, 0].matshow(match, cmap=cmap)

    # cross correlation histogram
    top_corr = np.sort(xcorr.astype(np.int32))[-50:]
    _ = axs[1, 1].hist(top_corr)
    fig.text(.5, .02, bottom_txt, ha='center')
    fig.text(.5, .9, title, ha='center')
    if show: plt.show()
    else: plt.savefig(f'{out_path}/{name}.jpg')
    plt.close()

def plot(out_path, score_mat, match, trace_path, xcorr, name, title, bottom_txt, show=False):
    fig, axs = plt.subplots(2,2, dpi=160)
    axs[0, 1].imshow(score_mat, cmap='hot')
    axs[0, 1].scatter(trace_path[:, 0], trace_path[:, 1], s=3)
    cmap = ListedColormap(['black', 'w'])
    axs[1, 0].matshow(match, cmap=cmap)
    range_of_xcorr = np.max(xcorr)-np.min(xcorr)
    # _ = axs[1, 1].hist(xcorr, bins=int(range_of_xcorr))
    fig.text(.5, .02, bottom_txt, ha='center')
    fig.text(.5, .9, title, ha='center')
    # if show: plt.show()
    # plt.savefig(f'{out_path}/fig_{name}.jpg')
    plt.close()

def read_FASTA(path, data_type='DNA'):
    '''
        read in FASTA format (single sequnce in one file)
        return description and sequence
        input:
            path (str): path for FASTA file
            data_type (str): {'DNA', 'RNA', 'PROTEIN}
        output:
            description (str): description for sequence
            sequence (np.ndarray): sequence 
    '''
    if data_type not in DATA_TYPES:
        print(f'data type {data_type} not valid!')
        quit()

    symbol = None
    if data_type == 'DNA' or data_type == 'RNA':
        symbol = NUCLEIC_ACID
    elif data_type == 'PROTEIN':
        symbol = AMINO_ACID
    else:
        print(f'data type {data_type} not valid!')
        quit()

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
    '''
    DEPRECATED!!!
    '''
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
        total_segments, homologous_segments_sets = homologous.get_all_homologous_segments()
        if total_segments:
            stop = True
    print(f'Find total {total_segments} homologous segments')
    print(f'ref len: {ref.shape[0]}')
    print(f'qry len: {qry.shape[0]}')
    print(f'std of c: {np.std(c)}')

    if total_segments != 0:
        
        print('Reducing search space...')
        reducer = ReduceSearchSpace(homologous_segments_sets, ref.shape[0], qry.shape[0])
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
        DEPRECATED!!!
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
        total_segments, homologous_segments_sets = homologous.get_all_homologous_segments()
        if total_segments > 0: stop = True
        else: threshold -= 1

    print(f'Find total {total_segments} homologous segments, threshold = {threshold}')
    print(f'ref len: {ref.shape[0]}')
    print(f'qry len: {qry.shape[0]}')
    print(f'std of c: {np.std(c)}')

    print('Reducing search space...')
    reducer = ReduceSearchSpace(homologous_segments_sets, ref.shape[0], qry.shape[0])
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

def test_protein_by_FASTA(ref_path, qry_path, args, out_path):
    '''
        run test_protein() by FASTA format
        input: 
            ref_path: reference sequence fasta file path
            qry_path: query sequence fasta file path
            args: arguments
            out_path: path for output files
    '''

    _, ref = read_FASTA(ref_path, args.data_type)
    _, qry = read_FASTA(qry_path, args.data_type)

    ref_accession = ref_path.split('/')[-1]
    qry_accession = qry_path.split('/')[-1]

    test_protein(ref, qry, ref_accession, qry_accession, args, out_path)

def test_protein_by_TFA(tfa_path, out_path, args):
    '''
        DEPRECATED!!!
        run test_protein() by .tfa file(BAliBASE 3.0)
        param:
            tfa_path(str): path to .tfa file
            out_path(str): output file path
            args: arguments
        output:
            pass count
            has segment count
            total reduced ratio
            alignment count
    '''
    print(f'Testing TFA file: {tfa_path}')
    des, seqs = read_BBS_tfa(tfa_path) # same for vie file from homfam
    
    acc_list = []
    has_segment_count = 0
    pass_count = 0
    align_count = 0
    total_reduced_ratio = 0
    total_reduced_cycle_ratio = 0
    total_full_DP_cycle = 0
    total_reduced_DP_cycle = 0
    if len(seqs) < 20:
        for j in range(len(seqs)):
            ref = seqs[j]
            ref_serial = des[j].replace("/", "_")
            for i in range(j+1, len(seqs)):
                qry = seqs[i]
                qry_serial = des[i].replace("/", "_")
                # print(f"check {f'{out_path}/pass/{ref_serial}_{qry_serial}.txt'}")
                if args.resume and (os.path.exists(f'{out_path}/pass/{ref_serial}_{qry_serial}.txt') or 
                                    os.path.exists(f'{out_path}/fail/{ref_serial}_{qry_serial}.txt')): 
                    print('pass this alignment')
                    continue
                has_segment, my_score, gt, reduced_ratio, reduced_cycle_ratio, full_operation_cycles, reduced_operation_cycles = test_protein(ref, qry, ref_serial, qry_serial, args, out_path, split_pass=True)
                align_count += 1
                total_reduced_ratio += reduced_ratio
                total_reduced_cycle_ratio += reduced_cycle_ratio
                total_full_DP_cycle += full_operation_cycles
                total_reduced_DP_cycle += reduced_operation_cycles
                if has_segment:
                    acc = 1 - (abs(my_score)-abs(gt))/abs(gt)
                    has_segment_count += 1
                    if evaluate(my_score, gt): pass_count += 1
                    acc_list.append(acc)
    else: # too much sequence, random select ref and qry
        for i in range(500):
            print(f'aligning alignment {i}')
            a, b = random.randint(0, len(seqs)-1), random.randint(0, len(seqs)-1)
            ref_id = min(a, b)
            qry_id = max(a, b)
            ref = seqs[ref_id]
            ref_serial = ref_id
            qry = seqs[qry_id]
            qry_serial = qry_id
            # print(f"check {f'{out_path}/pass/{ref_serial}_{qry_serial}.txt'}")
            if args.resume and (os.path.exists(f'{out_path}/pass/{ref_serial}_{qry_serial}.txt') or 
                                os.path.exists(f'{out_path}/fail/{ref_serial}_{qry_serial}.txt')): 
                print('pass this alignment')
                continue
            has_segment, my_score, gt, reduced_ratio, reduced_cycle_ratio, full_operation_cycles, reduced_operation_cycles = test_protein(ref, qry, ref_serial, qry_serial, args, out_path, split_pass=True)
            align_count += 1
            total_reduced_ratio += reduced_ratio
            total_reduced_cycle_ratio += reduced_cycle_ratio
            total_full_DP_cycle += full_operation_cycles
            total_reduced_DP_cycle += reduced_operation_cycles

            if has_segment:
                acc = 1 - (abs(my_score)-abs(gt))/abs(gt)
                has_segment_count += 1
                if evaluate(my_score, gt): pass_count += 1
                acc_list.append(acc)
    print(f'number of cases have homologous segment: {has_segment_count}')
    avg_reduced_ratio_among_all = 0
    avg_reduced_ratio_among_reduced = 0
    avg_reduced_cycle_ratio_among_all = 0
    avg_full_DP_cycle = 0
    avg_reduced_DP_cycle = 0
    if has_segment_count:
        avg_reduced_ratio_among_all = total_reduced_ratio/align_count
        avg_reduced_ratio_among_reduced = total_reduced_ratio/has_segment_count
        avg_reduced_cycle_ratio_among_all = total_reduced_cycle_ratio/align_count
        avg_full_DP_cycle = total_full_DP_cycle/align_count
        avg_reduced_DP_cycle = total_reduced_DP_cycle/align_count
        
        pass_rate = pass_count/has_segment_count
        print(f'pass rate = {pass_count}/{has_segment_count} = {pass_rate}%')
        print(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}')
    with open(f'{out_path}/acc_log.txt', 'w') as f:
        f.write(str(datetime.datetime.now().date()))
        f.write('\n\n')
        f.write(f'.tfa path: {tfa_path}\n\n')
        f.write('Settings:\n')
        f.write(f'1. Algorithm: {args.alg}\n')
        f.write(f'2. Window size: {args.window_size}\n')
        f.write(f'3. Threshold: {args.threshold}\n')
        f.write(f'4. n: {args.n}\n')
        f.write(f'5. B: {args.band}')
        # if args.buffer < 1 and args.buffer > 0:
        #     f.write(f'4. Buffer for keypoints: ((len(ref)+len(qry))/2) * {args.buffer}\n\n')
        # elif args.buffer > 1:
        #     f.write(f'4. Buffer for keypoints: {args.buffer}\n\n')
        # elif args.buffer <= 0:
        #     f.write(f'4. Buffer for keypoints: no buffer for keypoints\n\n')

        f.write(f'Number of cases have homologous segment: {has_segment_count}\n')
        if has_segment_count:
            f.write(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}\n\n')
            f.write(f'segment hit rate = {has_segment_count}/{align_count} = {has_segment_count/align_count}\n')
            f.write(f'pass rate = {pass_count}/{has_segment_count} = {pass_count/has_segment_count}\n')
            f.write(f'avg reduced ratio among all alignment: {avg_reduced_ratio_among_all}\n')
            f.write(f'avg reduced ratio among reduced alignment: {avg_reduced_ratio_among_reduced}\n')
            f.write(f'avg reduced cycle ratio among all alignment: {avg_reduced_cycle_ratio_among_all}\n')
            f.write(f'avg full DP cycle among all alignment: {avg_full_DP_cycle}\n')
            f.write(f'avg reduced DP cycle among all alignment: {avg_reduced_DP_cycle}\n')
            f.write('acc list:\n')
            for acc in acc_list:
                f.write(str(acc))
                f.write('\n')
    
    return pass_count, has_segment_count, total_reduced_ratio, align_count, total_reduced_cycle_ratio

def tfa_experiment(args):
    '''
        run test on BAliBASE 3.0
        DEPRECATED!!!
    '''
    data_set = str(args.data_set)
    tfa_path_prefix = f'../../data/bb3_release/RV{data_set}'
    out_path_prefix = f'../out/BAliBASE3.0/new/bbs_RV{data_set}_{args.alg}/threshold_{args.threshold}_{args.window_size}/n_{args.n}/buffer_{args.buffer}'
    print(f'writing to {out_path_prefix}')

    total_pass_count = 0
    total_has_segment_count = 0
    total_reduced_ratio = 0
    total_align_count = 0

    # run through several test cases
    test_case_numbers = ['001', '002', '003', '004', '005', '006', '007', '008']
    test_cases = [f'BB{data_set}{n}' for n in test_case_numbers]
    # test_cases = ['BB12001', 'BB12002', 'BB12003', 'BB12004', 'BB12005', 'BB12006', 'BB12007', 'BB12008']
    # test_cases = ['BB11001', 'BB11002', 'BB11003', 'BB11004', 'BB11005', 'BB11006', 'BB11007', 'BB11008']
    # test_cases = ['BB20001', 'BB20002', 'BB20007', 'BB20011', 'BB20012', 'BB20017', 'BB20020', 'BB20029']
    for case_number in test_cases:
        os.system(f'mkdir -p {out_path_prefix}/{case_number}/pass')
        os.system(f'mkdir -p {out_path_prefix}/{case_number}/fail')
        tfa_path = f'{tfa_path_prefix}/{case_number}.tfa'
        out_path = f'{out_path_prefix}/{case_number}'
        pass_count, has_segment_count, reduced_ratio, align_count = test_protein_by_TFA(tfa_path, out_path, args)
        total_pass_count += pass_count
        total_has_segment_count += has_segment_count
        total_reduced_ratio += reduced_ratio
        total_align_count += align_count

    # calculate overall metrix
    avg_pass_rate = total_pass_count/total_has_segment_count
    avg_hit_rate = total_has_segment_count/total_align_count
    avg_reduced_ratio_among_all = total_reduced_ratio/total_align_count
    avg_reduced_ratio_among_reduced = total_reduced_ratio/total_has_segment_count

    print(f'----------------------------------------------------------')
    print(f'segment hit rate = has segment count / align count')
    print(f'segment hit rate = {total_has_segment_count}/{total_align_count} = {avg_hit_rate}')
    print(f'pass rate = pass count / has segment count')
    print(f'pass rate = {total_pass_count}/{total_has_segment_count} = {avg_pass_rate}')
    print(f'avg reduced ratio among all alignments: {avg_reduced_ratio_among_all}')
    print(f'avg reduced ratio among reduced alignments: {avg_reduced_ratio_among_reduced}')
    print(f'----------------------------------------------------------')
    
    # write log file
    with open(f'{out_path_prefix}/acc_log.txt', 'w') as f:
        f.write(str(datetime.datetime.now().date()))
        f.write('\n\n')
        f.write(f'Dataset: RV{args.data_set}\n')
        f.write('\n')

        f.write('Settings:\n')
        f.write(f'1. Algorithm: {args.alg}\n')
        f.write(f'2. Window size: {args.window_size}\n')
        f.write(f'3. Threshold: {args.threshold}\n')
        if args.buffer < 1 and args.buffer > 0:
            f.write(f'4. Buffer for keypoints: ((len(ref)+len(qry))/2) * {args.buffer}\n')
        elif args.buffer > 1:
            f.write(f'4. Buffer for keypoints: {args.buffer}\n')
        elif args.buffer <= 0:
            f.write(f'4. Buffer for keypoints: no buffer for keypoints\n')
        
        f.write(f'5. n: {args.n}\n')
        f.write(f'6. Use polarity for xcorr: {args.use_polarity}\n')
        f.write(f'\n')

        f.write(f'segment hit rate = has segment count / align count\n')
        f.write(f'segment hit rate = {total_has_segment_count}/{total_align_count} = {avg_hit_rate}\n')
        f.write(f'pass rate = pass count / has segment count\n')
        f.write(f'pass rate = {total_pass_count}/{total_has_segment_count} = {avg_pass_rate}\n')
        f.write(f'avg reduced ratio among all alignments = {avg_reduced_ratio_among_all}\n')
        f.write(f'avg reduced ratio among reduced alignments = {avg_reduced_ratio_among_reduced}\n')

def fasta_experiment(args):
    ref_fasta_file = '../../data/FASTA/protein/BBS/1bmr_'
    ref_fasta_file = '../../data/FASTA/protein/homfam/A0RR57_CAMFF_202-452'
    ref_fasta_file = '../../data/FASTA/protein/ref'
    ref_fasta_file = '../../data/FASTA/protein/homfam/C9P9N1_VIBFU_33-379'
    ref_fasta_file = '../../data/FASTA/protein/homfam/ref'
    ref_fasta_file = '../../data/FASTA/protein/homfam/B7JD71_BACC0_2-459'
    ref_fasta_file = '../../data/FASTA/protein/homfam/a'
    ref_fasta_file = '../../data/FASTA/protein/homfam/c'

    qry_fasta_file = '../../data/FASTA/protein/BBS/NF31_NAEFO'
    qry_fasta_file = '../../data/FASTA/protein/homfam/C6MSZ9_9DELT_610-880'
    qry_fasta_file = '../../data/FASTA/protein/qry'
    qry_fasta_file = '../../data/FASTA/protein/homfam/A6X9W0_CRAGI_2-192'
    qry_fasta_file = '../../data/FASTA/protein/homfam/qry'
    qry_fasta_file = '../../data/FASTA/protein/homfam/C3E531_BACTU_2-459'
    qry_fasta_file = '../../data/FASTA/protein/homfam/b'
    qry_fasta_file = '../../data/FASTA/protein/homfam/d'
    out_path = '../out'
    print('pair')
    print(arg_string(args))
    args.log_each_alignment = True
    test_protein_by_FASTA(ref_fasta_file, qry_fasta_file, args, out_path)

def test_protein(ref: np.ndarray, qry: np.ndarray, ref_serial, qry_serial, args, out_path_prefix, split_pass=False):
    '''
        test on protein
        fixed threshold
        param:
            ref: ref sequence
            qry: qry sequence
            ref_serial: ref seq's serial number (for output logfile name)
            qry_serial: qry seq's serial number (for output logfile name) 
            args: alignment argument (input by main.py argparser)
            output_path_prefix: for output logfiles
            split_pass: split pass/fail cases into different directory under [output_path_prefix]
        output:
            reducible(bool): if homologous segment exist -> reducible
            reduced_score(reduced): calculated reduced score
            golden_score(full): full DP score
            reduced_cycle: operation cycle needed for PE running on reduced DP space
            full_cycle: operation cycle neede for PE running on full DP space
    '''
    debug = False
    homologous_threshold = args.threshold
    homologous_window_size = args.window_size
    alg = args.alg
    buffer = args.buffer
    data_type = args.data_type
    n = args.n
    use_polarity = args.use_polarity
    quant_volume = args.quant_volume
    band = args.band
    
    # calculating cross correlation
    cor = CrossCorrelation(ref, qry, data_type=data_type, use_polarity=use_polarity, quant_volume=quant_volume)
    c = cor.XCorr()
    
    # finding homologous segments
    threshold = homologous_threshold
    homologous = Homologous(ref, qry, c, threshold=threshold, data_type=data_type,\
        n=n, wndw_size=homologous_window_size, B=args.band) # use origin sequence
    total_segments, homologous_segments_sets = homologous.get_all_homologous_segments()
    all_sets = copy.deepcopy(homologous_segments_sets)
    reducible = total_segments != 0 # homologous segments exist
    
    dp_space_reduced_ratio = None
    reduced_score = None
    key_points = []
    reduced_operation_cycles = None
    if reducible:
        if debug: print(f'Find total {total_segments} homologous segments!')
        # print('Reducing search space...')
        reducer = ReduceSearchSpace(all_sets, ref.shape[0], qry.shape[0], B=args.band)
        key_points = reducer.reduce()
        for idx, kp in enumerate(key_points): # check segments are sorted in ascending order
            if idx == key_points.shape[0]-1: break
            next_kp = key_points[idx+1]
            assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
            assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

        # print('Running reduced DP...')
        dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, buffer=buffer, band=band)
        reduced_score, dp_space_reduced_ratio = dp_engine.dp_in_reduced_space(key_points)
        dp_engine.traceback()
        reduced_operation_cycles = dp_engine.dp_operation_cycles
    else:
        if debug: print('No segments found!')
        dp_space_reduced_ratio = 0
    

    # print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, alg=alg, data_type=data_type, band=band)
    golden_score = dp_engine2.dp_normal()
    dp_engine2.traceback()
    full_operation_cycles = dp_engine2.dp_operation_cycles

    # np.savetxt("reduced_dp_score_matrix.txt", dp_engine.aligner.score_matrix.astype(np.int32), fmt='%d')
    # np.savetxt("full_dp_score_matrix.txt", dp_engine2.aligner.score_matrix.astype(np.int32), fmt='%d')
    

    if not reducible:
        reduced_score = golden_score
        reduced_operation_cycles = full_operation_cycles

    reduced_cycle_ratio = (full_operation_cycles-reduced_operation_cycles)/full_operation_cycles
    if reducible:
        if split_pass:
            if evaluate(reduced_score, golden_score, args.error_tolerance): out_path_prefix = f'{out_path_prefix}/pass'
            else: out_path_prefix = f'{out_path_prefix}/fail'
        # print(f'writing to {f"{out_path_prefix}/{ref_serial}_{qry_serial}.txt"}')
        # logging single alignment log file
        if args.log_each_alignment:
            with open(f'{out_path_prefix}/{ref_serial}_{qry_serial}.txt', 'w') as f:
                f.write(f'ref length: {len(ref)}\n')
                f.write(f'qry length: {len(qry)}\n')
                f.write(f'golden score: {golden_score}\n')
                f.write(f'reduced score: {reduced_score}\n\n')
                f.write(f'reduced ratio: {dp_space_reduced_ratio}\n')
                f.write(f'full DP cycle: {full_operation_cycles}\n')
                f.write(f'reduced DP cycle: {reduced_operation_cycles}\n')
                f.write(f'reduced cycle ratio: {reduced_cycle_ratio}\n\n')
                f.write(f'{total_segments} homologous segments found\n')
                f.write('printing homologous segments set:\n')
                for i, segment_set in enumerate(homologous_segments_sets):
                    f.write(f'set {i}:\n')
                    f.write(f'num of segment in set: {segment_set.count}\n')
                    f.write(f'offset: {segment_set.offset}\n')
                    eff_l = effective_length(segment_set.offset, len(ref), len(qry))
                    f.write(f'effective length: {eff_l}\n')
                    f.write(f'correlation: {c[segment_set.offset+(len(qry) - 1)]}\n')
                    f.write(f'printing segment, (coord, score)\n')
                    for i, coord in enumerate(segment_set.coords):
                        f.write(f'({coord}, {segment_set.score[i]}) ')
                    f.write('\n\n')
                f.write('\n')
                f.write(f'keypoints:\n')
                f.write(f'total key points found: {len(key_points)}\n')
                for k in key_points:
                    f.writelines(str(k))
    else: print('no segment found!')
    match = np.zeros((len(qry), len(ref)))
    for i in range(len(qry)):
        match[i] = (ref == np.full(len(ref), qry[i]))

    score_mat = dp_engine2.score_matrix
    path = np.array(dp_engine2.path)
    if reducible:
        reduced_score_mat = dp_engine.score_matrix
        reduced_path = np.array(dp_engine.path)
        score = f'reduced_score/golden_score: {reduced_score}/{golden_score}'
        if args.log_each_alignment:
            plot_reduced(out_path_prefix, reduced_score_mat, score_mat, match, reduced_path, path,\
                xcorr=c, name=f'{ref_serial}_{qry_serial}', \
                title=f'{ref_serial} and {qry_serial}, threshold={threshold}', \
                bottom_txt=score, all_segment_sets=homologous_segments_sets, show=args.draw)
        if args.draw: dp_engine.aligner.show_trace_matrix()
    # else:
    #     score = f'golden score: {golden_score}'
    #     plot(out_path_prefix, score_mat, match, path, xcorr=c, name=f'{ref_serial}_{qry_serial}',\
    #         title=f'{ref_serial} and {qry_serial}, threshold={threshold}', bottom_txt=score, show=args.draw)
    
    return reducible, reduced_score, golden_score, full_operation_cycles, reduced_operation_cycles


def test_on_vie(vie_path, out_path, args):
    '''
        run test_protein() by vie file(homfam)
        param:
            vie_path(str): path to .vie file
            out_path(str): output file path
            args: arguments
        output:
            pass count
            has segment count
            total reduced ratio
            alignment count
    '''
    print(f'Testing vie file: {vie_path}')
    des, seqs = read_BBS_tfa(vie_path)
    
    acc_list = []
    reducible_alignment_count = 0
    pass_count = 0
    alignment_count = 0
    total_full_DP_cycle = 0
    total_reduced_DP_cycle = 0
    total_sequence_length = 0

    for i in range(500): # sample 500 pairs of sequences
        print(f'aligning alignment {i}')
        a, b = random.randint(0, len(seqs)-1), random.randint(0, len(seqs)-1)
        ref_id = min(a, b)
        qry_id = max(a, b)
        ref = seqs[ref_id]
        ref_serial = ref_id
        qry = seqs[qry_id]
        qry_serial = qry_id
        # print(f"check {f'{out_path}/pass/{ref_serial}_{qry_serial}.txt'}")
        # if file exist and resume, pass this alignment
        if args.resume and (os.path.exists(f'{out_path}/pass/{ref_serial}_{qry_serial}.txt') or 
                            os.path.exists(f'{out_path}/fail/{ref_serial}_{qry_serial}.txt')): 
            print('pass this alignment')
            continue
        # if i != 440: continue
        reducible, reduced_score, golden_score, full_operation_cycles, reduced_operation_cycles = test_protein(ref, qry, ref_serial, qry_serial, args, out_path, split_pass=True)
        alignment_count += 1
        total_full_DP_cycle += full_operation_cycles
        total_reduced_DP_cycle += reduced_operation_cycles
        total_sequence_length += len(ref)
        total_sequence_length += len(qry)

        if reducible:
            acc = 1 - (abs(reduced_score)-abs(golden_score))/abs(golden_score)
            reducible_alignment_count += 1
            if evaluate(reduced_score, golden_score, args.error_tolerance): pass_count += 1
            acc_list.append(acc)
    print(f'number of cases have homologous segment: {reducible_alignment_count}')
    avg_seqence_length = total_sequence_length/(alignment_count*2)
    avg_reduced_cycle_ratio_among_all = 0
    avg_full_DP_cycle = 0
    avg_reduced_DP_cycle = 0
    if reducible_alignment_count:
        hit_rate = reducible_alignment_count/alignment_count
        pass_rate = pass_count/reducible_alignment_count
        avg_full_DP_cycle = total_full_DP_cycle/alignment_count
        avg_reduced_DP_cycle = total_reduced_DP_cycle/alignment_count
        avg_reduced_cycle_ratio_among_all = (total_full_DP_cycle-total_reduced_DP_cycle)/total_full_DP_cycle
        if reducible_alignment_count:
            print(f'----------------------------------------------------------')
            print(f'Arguments:')
            print(arg_string(args))
            print(f'----------------------------------------------------------')
            print(f'Result:')
            print(f'1. Hit rate                 = {reducible_alignment_count}/{alignment_count} = {hit_rate:.3f}')
            print(f'2. Pass rate                = {pass_count}/{reducible_alignment_count} = {pass_rate:.3f}')
            print(f'3. Avg full DP cycle        = {avg_full_DP_cycle:.3f}')
            print(f'4. avg reduced DP cycle     = {avg_reduced_DP_cycle:.3f}')
            print(f'5. Avg reduced cycle ratio  = {avg_reduced_cycle_ratio_among_all:.3f}')
            print(f'6. Avg sequence length      = {avg_seqence_length:.3f}')
            print(f'----------------------------------------------------------')
        # print(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}')
    with open(f'{out_path}/acc_log.txt', 'w') as f:
        f.write(str(datetime.datetime.now().date()))
        f.write('\n\n')
        f.write(f'.vie path: {vie_path}\n\n')
        f.write('Arguments:\n')
        f.write(arg_string(args))
        f.write('\n')

        f.write(f'Number of cases have homologous segment: {reducible_alignment_count}\n')
        if reducible_alignment_count:
            # f.write(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}\n\n')
            f.write(f'1. Hit rate                 = {reducible_alignment_count}/{alignment_count} = {hit_rate:.3f}\n')
            f.write(f'2. Pass rate                = {pass_count}/{reducible_alignment_count} = {pass_rate:.3f}\n')
            f.write(f'3. Avg full DP cycle        = {avg_full_DP_cycle:.3f}\n')
            f.write(f'4. avg reduced DP cycle     = {avg_reduced_DP_cycle:.3f}\n')
            f.write(f'5. Avg reduced cycle ratio  = {avg_reduced_cycle_ratio_among_all:.3f}\n')
            f.write(f'6. Avg sequence length      = {avg_seqence_length:.3f}\n')
            f.write('\n')
            f.write('Notes:\n')
            f.write('1. Hit rate:  reducible alignments/total aligments  (i.e. homologous segments exist)\n')
            f.write('2. Pass rate: accurate alignments/reducible aligments  (i.e. reduced score == golden score)\n')

            # f.write('acc list:\n')
            # for acc in acc_list:
            #     f.write(str(acc))
            #     f.write('\n')
        else:
            f.write('No reducible aligment found!')
    

def homfam_experiment(args):
    '''
        run test on homfam
    '''
    test_case = args.test_case
    vie_path_prefix = f'../../data/homfam'
    if args.quant_volume == 0: 
        out_path_prefix = f'../out/homfam_test/{args.alg}/threshold_{args.threshold}_{args.window_size}/n_{args.n}/band_{args.band}/{test_case}'
        # out_path_prefix = f'../out/homfam/{args.alg}/threshold_{args.threshold}_{args.window_size}/n_{args.n}/buffer_{args.buffer}/{test_case}'

    else: out_path_prefix = f'../out/homfam_quant{args.quant_volume}/{args.alg}/threshold_{args.threshold}_{args.window_size}/n_{args.n}/buffer_{args.buffer}/{test_case}'
    print(f'writing to {out_path_prefix}')

    os.system(f'mkdir -p {out_path_prefix}/pass')
    os.system(f'mkdir -p {out_path_prefix}/fail')
    vie_path = f'{vie_path_prefix}/{test_case}_test-only.vie'
    out_path = f'{out_path_prefix}'
    test_on_vie(vie_path, out_path, args)


def main():
    np.set_printoptions(precision=4)
    random.seed(1225)
    VOLUME_QUANTIZE_OPTION = [-1, 0, 4, 8, 16, 32, 64]
    parser = argparse.ArgumentParser()
    parser.add_argument('--threshold', help='thershold for homologous segment', type=int, default='18')
    parser.add_argument('--window_size', help='size of sliding window', type=int, default='16')
    parser.add_argument('--alg', help='NW | SW', choices=ALGORITHMS, type=str, default='NW')
    parser.add_argument('--buffer', help='buffer around keypoint, < 1 then ratio to avg length, > 1 then exact width', type=float, default=32)
    parser.add_argument('--data_type', help='data type', choices=DATA_TYPES, type=str, default='PROTEIN')
    parser.add_argument('--n', help='choose n top offset for searching', type=int, default=4)
    parser.add_argument('--draw', help='draw plot or save plot', type=bool, default=False)
    parser.add_argument('--pair', help='run pair alignment', type=bool, default=False)
    parser.add_argument('--data_set', help='BAliBASE dataset number. e.g. 12 for RV12', type=int, default=12)
    parser.add_argument('--test_case', help='homfam dataset id. e.g. aadh for aadh_test-only.vie', type=str, default='aadh')
    parser.add_argument('--use_polarity', help='use polarity for xcorr as well', type=bool, default=False)
    parser.add_argument('--quant_volume', help='use quantized volume, 0 for no quantize', choices=VOLUME_QUANTIZE_OPTION, type=int, default=0)
    parser.add_argument('--band', help='PE array length', type=int, default=32)
    parser.add_argument('--resume', help='skip exist alignment if file found', type=bool, default=False)
    parser.add_argument('--error_tolerance', help='range from [0, 1), tolerate error ratio', type=float, default=0)
    parser.add_argument('--log_each_alignment', help='generate logfile & graph for each alignment', type=bool, default=False)
    args = parser.parse_args()

    show_args = True
    if show_args:
        print_args(args)

    if args.pair:
        fasta_experiment(args)
    else:
        # tfa_experiment(args)
        homfam_experiment(args)
    pass


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