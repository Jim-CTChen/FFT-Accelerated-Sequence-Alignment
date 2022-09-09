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
from tool import random_gen_seq, effective_length, eval

def print_args(args):
    print(f'threshold: {args.threshold}')
    print(f'window_size: {args.window_size}')
    print(f'alg: {args.alg}')
    print(f'buffer: {args.buffer}')
    print(f'data_type: {args.data_type}')
    print(f'n: {args.n}')

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
    else: plt.savefig(f'{out_path}/fig_{name}.jpg')
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

def test_protein(ref, qry, ref_serial, qry_serial, args, out_path_prefix, split_pass=False):
    '''
        test on protein
        fixed threshold
        return has_segment, my_score, gt, reduced_ratio
    '''
    debug = False
    homologous_threshold = args.threshold
    homologous_window_size = args.window_size
    alg = args.alg
    buffer = args.buffer
    data_type = args.data_type
    n = args.n
    use_polarity = args.use_polarity
    
    cor = CrossCorrelation(ref, qry, data_type=data_type, use_polarity=use_polarity)
    c = cor.XCorr()
    
    threshold = homologous_threshold
    homologous = Homologous(ref, qry, c, threshold=threshold, data_type=data_type,\
        n=n, wndw_size=homologous_window_size) # use origin sequence
    total_segments, homologous_segments_sets = homologous.get_all_homologous_segments()
    all_sets = copy.deepcopy(homologous_segments_sets)
    

    if total_segments:
        if debug: print(f'Find total {total_segments} homologous segments!')
        # print('Reducing search space...')
        reducer = ReduceSearchSpace(all_sets, ref.shape[0], qry.shape[0])
        key_points = reducer.reduce()
        for idx, kp in enumerate(key_points):
            if idx == key_points.shape[0]-1: break
            next_kp = key_points[idx+1]
            assert kp[0] <= next_kp[0], f'error, {kp}, {next_kp}'
            assert kp[1] <= next_kp[1], f'error, {kp}, {next_kp}'

        # print('Running reduced DP...')
        dp_engine = DPEngine(ref, qry, alg=alg, data_type=data_type, buffer=buffer)
        my_score, reduced_ratio = dp_engine.dp_in_reduced_space(key_points)
        dp_engine.traceback()
    else:
        if debug: print('No segments found!')
    

    # print('Running normal DP...')
    dp_engine2 = DPEngine(ref, qry, alg=alg, data_type=data_type)
    gt = dp_engine2.dp_normal()
    dp_engine2.traceback()


    
    if total_segments:
        if split_pass:
            if eval(my_score, gt): out_path_prefix = f'{out_path_prefix}/pass'
            else: out_path_prefix = f'{out_path_prefix}/fail'

        with open(f'{out_path_prefix}/logfile_{ref_serial}_{qry_serial}.txt', 'w') as f:
            f.write(f'ref length: {len(ref)}\n')
            f.write(f'qry length: {len(qry)}\n')
            f.write(f'gt score: {gt}\n')
            if total_segments: 
                f.write(f'reduced score: {my_score}\n\n')
                f.write(f'reduced ratio: {reduced_ratio}')
                L = max(len(ref), len(qry))
                f.write(f'{total_segments} homologous segments found\n')
                f.write('printing homologous segments set:\n\n')
                for i, segment_set in enumerate(homologous_segments_sets):
                    f.write(f'set {i}:\n')
                    f.write(f'num of segment in set: {segment_set.count}\n')
                    f.write(f'offset: {segment_set.offset}\n')
                    eff_l = effective_length(segment_set.offset, len(ref), len(qry))
                    f.write(f'effective length: {eff_l}\n')
                    f.write(f'correlation: {c[segment_set.offset+(L - 1)]}\n')
                    f.write(f'printing segment, (coord, score)\n')
                    for i, coord in enumerate(segment_set.coords):
                        f.write(f'({coord}, {segment_set.score[i]})  ')
                    # ref_segment_index_start = segment_set.ref_segments[0][0]
                    # qry_segment_index_start = segment_set.qry_segments[0][0]
                    # segment_length = 16
                    # f.write(f'\nref: {ref[segment_set.ref_segments[0][0]:segment_set.ref_segments[0][1]]}')
                    # f.write(f'\nqry: {qry[segment_set.qry_segments[0][0]:segment_set.qry_segments[0][1]]}')
                    # score_list = []
                    # for i in range(segment_length):
                    #     score_list.append(BLOSUM62[ref[ref_segment_index_start+i]][qry[qry_segment_index_start+i]])
                    # score_list = np.array(score_list).astype(np.int32)
                    # f.write(f'\nsco: {score_list}')
                    f.write('\n\n')
                f.write('\n')
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
        plot_reduced(out_path_prefix, reduced_score_mat, score_mat, match, reduced_path, path,\
            xcorr=c, name=f'{ref_serial}_{qry_serial}', \
            title=f'{ref_serial} and {qry_serial}, threshold={threshold}', \
            bottom_txt=score, all_segment_sets=homologous_segments_sets, show=args.draw)
        return True, my_score, gt, reduced_ratio
    else:
        reduced_score_mat = None
        reduced_path = None
        score = f'gt: {gt}'
        plot(out_path_prefix, score_mat, match, path, xcorr=c, name=f'{ref_serial}_{qry_serial}',\
            title=f'{ref_serial} and {qry_serial}, threshold={threshold}', bottom_txt=score, show=args.draw)
        return False, gt, gt, 0

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
        run test_protein() by BAliBASE 3.0 .tfa file
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
    des, seqs = read_BBS_tfa(tfa_path)
    
    acc_list = []
    has_segment_count = 0
    pass_count = 0
    align_count = 0
    total_reduced_ratio = 0
    for j in range(len(seqs)):
        if align_count > 105: break # break if too much sequences in one tfa file
        ref = seqs[j]
        ref_serial = des[j]
        for i in range(j+1, len(seqs)):
            qry = seqs[i]
            qry_serial = des[i]
            has_segment, my_score, gt, reduced_ratio = test_protein(ref, qry, ref_serial, qry_serial, args, out_path, split_pass=True)
            align_count += 1
            total_reduced_ratio += reduced_ratio
            if has_segment:
                acc = 1 - (abs(my_score)-abs(gt))/abs(gt)
                has_segment_count += 1
                if my_score < gt*1.1 and my_score > gt*0.9: # within +- 10%
                    pass_count += 1
                acc_list.append(acc)
    print(f'number of cases have homologous segment: {has_segment_count}')
    avg_reduced_ratio_among_all = 0
    avg_reduced_ratio_among_reduced = 0
    if has_segment_count:
        avg_reduced_ratio_among_all = total_reduced_ratio/align_count
        avg_reduced_ratio_among_reduced = total_reduced_ratio/has_segment_count
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
        if args.buffer < 1 and args.buffer > 0:
            f.write(f'4. Buffer for keypoints: ((len(ref)+len(qry))/2) * {args.buffer}\n\n')
        elif args.buffer > 1:
            f.write(f'4. Buffer for keypoints: {args.buffer}\n\n')
        elif args.buffer <= 0:
            f.write(f'4. Buffer for keypoints: no buffer for keypoints\n\n')

        f.write(f'Number of cases have homologous segment: {has_segment_count}\n')
        if has_segment_count:
            f.write(f'avg acc of total {len(acc_list)} samples which have homologous segment: {sum(acc_list)/len(acc_list)}\n\n')
            f.write(f'segment hit rate = {has_segment_count}/{align_count} = {has_segment_count/align_count}\n')
            f.write(f'pass rate = {pass_count}/{has_segment_count} = {pass_count/has_segment_count}\n')
            f.write(f'avg reduced ratio among all alignment: {avg_reduced_ratio_among_all}\n')
            f.write(f'avg reduced ratio among reduced alignment: {avg_reduced_ratio_among_reduced}\n')
            f.write('acc list:\n')
            for acc in acc_list:
                f.write(str(acc))
                f.write('\n')
    
    return pass_count, has_segment_count, total_reduced_ratio, align_count

def tfa_experiment(args):
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
    ref_fasta_file = '../../data/FASTA/ref'
    ref_fasta_file = '../../data/FASTA/protein/BBS/1bmr_'
    ref_fasta_file = '../../data/FASTA/protein/BBS/1ac5_'
    ref_fasta_file = '../../data/FASTA/protein/BBS/1ivy_A'
    ref_fasta_file = '../../data/FASTA/protein/BBS/1ysc_'
    ref_fasta_file = '../../data/FASTA/protein/BBS/1buc_A'
    qry_fasta_file = '../../data/FASTA/qry'
    qry_fasta_file = '../../data/FASTA/protein/BBS/NF31_NAEFO'
    qry_fasta_file = '../../data/FASTA/protein/BBS/SCX6_CENLL'
    qry_fasta_file = '../../data/FASTA/protein/BBS/CPVL_HUMAN'
    qry_fasta_file = '../../data/FASTA/protein/BBS/RISC_HUMAN'
    qry_fasta_file = '../../data/FASTA/protein/BBS/NF31_NAEFO'
    qry_fasta_file = '../../data/FASTA/protein/BBS/1r2j_A'
    qry_fasta_file = '../../data/FASTA/protein/BBS/Q8jzn5'
    out_path = '../out'
    test_protein_by_FASTA(ref_fasta_file, qry_fasta_file, args, out_path)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--threshold', help='thershold for homologous segment', type=int, default='3')
    parser.add_argument('--window_size', help='size of sliding window', type=int, default='16')
    parser.add_argument('--alg', help='NW | SW', choices=ALGORITHMS, type=str, default='NW')
    parser.add_argument('--buffer', help='buffer around keypoint, < 1 then ratio to avg length, > 1 then exact width', type=float, default=32)
    parser.add_argument('--data_type', help='data type', choices=DATA_TYPES, type=str, default='PROTEIN')
    parser.add_argument('--n', help='choose n top offset for searching', type=int, default=4)
    parser.add_argument('--draw', help='draw plot or save plot', type=bool, default=False)
    parser.add_argument('--pair', help='run pair alignment', type=bool, default=False)
    parser.add_argument('--data_set', help='BAliBASE dataset number. e.g. 12 for RV12', type=int, default=12)
    parser.add_argument('--use_polarity', help='use polarity for xcorr as well', type=bool, default=False)
    args = parser.parse_args()

    show_args = True
    if show_args:
        print_args(args)

    if args.pair:
        fasta_experiment(args)
    else:
        tfa_experiment(args)
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