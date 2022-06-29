'''
    pseudo code for homologous algorithm
'''

# segment list = seg_list[seg]
# seg = {start_idx, end_idx, offset}
# current position = pos {x, y}

pos = {'x' : 0, 'y' : 0}
pos.x = 0
pos.y = 0
L = 512
window_size = 30
segment_lists = [16*[]]
end_flag = False
while ~end_flag:
    candidate_list = []
    for segment_list in segment_lists:
        if end_flag: end_flag = segment_list[0].end_idx == 0 # if all segment_list has zero end_idx, it means finish

        if (segment_list[-1].end_idx > pos.x) or (segment_list[-1].end_idx + segment_list.offset):
            # out of consider
            del segment_list[-1]
        else: candidate_list.append(segment_list[-1])
    
    
