'''
    Given window_size, sequence length L, maximum segment length,
    calculatee maximum # of homologous segments we can find
'''


WINDOW_SIZE = 30
L = 512
MAX_SEGMENT_LENGTH = 150
seq1_segments = [[i, i+30] for i in range (0, L-WINDOW_SIZE)]
# print(seq1_segments)

for i in range(len(seq1_segments)-1):
    j = i+1
    while j < len(seq1_segments):
        if (seq1_segments[i][1] == seq1_segments[j][0]) and (seq1_segments[i][1]-seq1_segments[i][0] != MAX_SEGMENT_LENGTH): # combine
            seq1_segments[i][1] = seq1_segments[j][1]
            del seq1_segments[j]
        else: j += 1

print(seq1_segments)
print(f'len: {len(seq1_segments)}')