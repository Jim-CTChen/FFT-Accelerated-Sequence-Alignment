import numpy as np
from HomologousSegmentSet import HomologousSegmentSet


class ReduceSearchSpace(object):
    '''
        homologous_segment_sets: list of HomologousSegmentSet
    '''
    def __init__(self, homologous_segment_sets: list, ref_len, qry_len):
        self.homologous_segment_sets = homologous_segment_sets
        self.num_of_set = len(homologous_segment_sets)
        # self.sequence_length = l
        self.ref_len = ref_len
        self.qry_len = qry_len
    
    def _out_of_range(self, coord, current) -> bool:
        if coord[0] >= current[0] and coord[1] >= current[1]: return False
        else: return True
    
    def _get_candidate(self, coc:np.ndarray, coc_index:np.ndarray) -> list:
        '''
            get candidates from candidate of candidate (coc)
            input:
                coc (candidate of candidate): [[x, y], ...]
                coc_index: list of index corresponding to each coc

            remove coc that are covered by others
            after removing covered coc, the rest of coc are candidates
            return candidates list and their coc_index(belong to which offset group)
        '''
        assert len(coc) == len(coc_index)


        if coc.shape[0] == 1:
            return coc, coc_index

        candidate_list = []
        candidate_index_list = []

        # first sort by y, then x
        ind = np.lexsort((coc[:, 1], coc[:, 0]))
        sorted_coc = coc[ind]
        sorted_coc_index = coc_index[ind]

        while sorted_coc.shape[0] != 0:
            # if one coord's y is the smallest, then this coord must be candidate
            # argmin return first coord with min y
            candidate_idx = np.argmin(sorted_coc, axis=0)[1] # [1] for y index
            # add candidate to list
            candidate_index_list.append(sorted_coc_index[candidate_idx])
            candidate_list.append(sorted_coc[candidate_idx])

            # since candidate has min y coord
            # and sorted_coc has been sorted by x
            # therefore, coc listed behind has >= x coord, and >= y coord
            # remove all of them
            # and also remove the candidate
            sorted_coc_index = sorted_coc_index[:candidate_idx]
            sorted_coc = sorted_coc[:candidate_idx]
        # print(candidate_list)
        # print(candidate_index_list)

        return candidate_list, candidate_index_list

    def reduce(self, verbose=False) -> np.ndarray:
        '''
            return list of key points
            key_points = [[x, y], ...]
        '''
        # pointer for each set, set the pointer to last coord
        set_len = np.array([len(set) for set in self.homologous_segment_sets])
        current_coord = (0, 0)

        key_points = []

        # testing self._get_candidate
        # l = np.array([[10, 12], [11, 11], [12, 10], [12, 12], [13, 11], [11, 13], [10, 16]])
        # idx = np.arange(len(l))
        # candidate, candidate_set_idx = self._get_candidate(l, idx)
        # print(candidate)
        # print(candidate_set_idx)
        # quit()

        it = 0
        while sum(set_len) != 0:
            if verbose:
                print(f'iteration: {it} ================')
                it += 1
                print(f'current coord: {current_coord}')
                for idx, set in enumerate(self.homologous_segment_sets):
                    if len(set) == 0: continue
                    print(f'next coord in set {idx}: {set.coords[0]}')

            # get candidate
            coc = [] # candidate_of_candidate
            coc_set_idx = [] # record the segment set each coc comes from
            for idx, set in enumerate(self.homologous_segment_sets):
                if len(set) != 0:
                    coc.append(set.coords[0])
                    coc_set_idx.append(idx)

            coc = np.array(coc)
            coc_set_idx = np.array(coc_set_idx)
            candidate, candidate_set_idx = self._get_candidate(coc, coc_set_idx)

            if verbose:
                print(f'candidate of candidate (coc): {coc}')
                print(f'coc\'s set index: {coc_set_idx}')
                print(f'candidate: {candidate}')
                print(f'candidate_set_idx: {candidate_set_idx}')

            # choosing path with bigger end pointer (more segment left on that segment set)
            choosed = set_len[candidate_set_idx].argmax()
            choosed_set = candidate_set_idx[choosed]
            new_key_point = candidate[choosed]
            key_points.append(new_key_point)

            # reset current coord to newly selected key point
            current_coord = key_points[-1] 

            # remove key point from set
            self.homologous_segment_sets[choosed_set].coords = self.homologous_segment_sets[choosed_set].coords[1:]

            # remove coord out of range by moving set pointers
            for idx, set in enumerate(self.homologous_segment_sets):
                while len(set) != 0 and self._out_of_range(set.coords[0], current_coord):
                    set.coords = set.coords[1:]
                    
            # if all sets' ptr reach 0, then end
            # if (sum(set_len) == 0):
            #     break
            set_len = np.array([len(set) for set in self.homologous_segment_sets])

        key_points = np.array(key_points)

        if verbose:
            print(f'key points: {key_points}')
        return key_points

    def _get_candidate_backward(self, coc:np.ndarray, coc_index:np.ndarray) -> list:
        '''
            get candidates from candidate of candidate (coc)
            input:
                coc (candidate of candidate): [[x, y], ...]
                coc_index: list of index corresponding to each coc

            remove coc that are covered by others
            after removing covered coc, the rest of coc are candidates
            return candidates list and their coc_index(belong to which offset group)
        '''
        assert len(coc) == len(coc_index)


        if coc.shape[0] == 1:
            return coc, coc_index

        candidate_list = []
        candidate_index_list = []

        # first sort by y, then x
        ind = np.lexsort((coc[:, 1], coc[:, 0]))
        sorted_coc = coc[ind]
        sorted_coc_index = coc_index[ind]

        while sorted_coc.shape[0] != 0:
            # if one coord's y is the biggest, then this coord must be candidate
            candidate_idx = np.argmax(sorted_coc, axis=0)[1] # argmax return first coord with max y
            candidate_index_list.append(sorted_coc_index[candidate_idx])
            candidate_list.append(sorted_coc[candidate_idx])

            # since candidate has max y coord
            # (and among all coc with max y, candidate's x coord is min)
            # and coc listed ahead has <= x coord
            # remove coord listed ahead candidate & has less x coord
            x = sorted_coc[candidate_idx][0]
            # remove candidate
            sorted_coc_index = np.delete(sorted_coc_index, candidate_idx, axis=0)
            sorted_coc = np.delete(sorted_coc, candidate_idx, axis=0)
            # remove coc with smaller x coord than y_max's x coord
            sorted_coc_index = sorted_coc_index[sorted_coc[:,0] >= x]
            sorted_coc = sorted_coc[sorted_coc[:,0] >= x]
        # print(candidate_list)
        # print(candidate_index_list)
        

        return candidate_list, candidate_index_list

    def reduce_backward(self, verbose=False) -> np.ndarray:
        '''
            return list of key points
            key_points = [[x, y], ...]
        '''
        # print(len(self.homologous_segment_sets))
        # pointer for each set, set the pointer to last coord
        set_ptr = np.array([len(set.coords) for set in self.homologous_segment_sets])
        current_coord = (self.ref_len, self.qry_len)

        key_points = []

        # testing self._get_candidate
        # l = np.array([[10, 12], [11, 11], [12, 10], [12, 12], [13, 11], [11, 13], [10, 16]])
        # idx = np.arange(len(l))
        # candidate, candidate_set_idx = self._get_candidate(l, idx)

        it = 0
        while sum(set_ptr) != 0:
            if verbose:
                print(f'iteration: {it} ================')
                it += 1
                print(f'current coord: {current_coord}')
                print(f'pointers: {set_ptr}')
                for idx, set in enumerate(self.homologous_segment_sets):
                    if set_ptr[idx] == 0: continue
                    print(f'set of idx {idx}: {set.coords[:set_ptr[idx]]}')

            # get candidate
            coc = [] # candidate_of_candidate
            coc_set_idx = [] # record the segment set each coc comes from
            for idx, set in enumerate(self.homologous_segment_sets):
                if set_ptr[idx] != 0:
                    coc.append(set.coords[set_ptr[idx]-1])
                    coc_set_idx.append(idx)

            coc = np.array(coc)
            coc_set_idx = np.array(coc_set_idx)
            candidate, candidate_set_idx = self._get_candidate_backward(coc, coc_set_idx)

            if verbose:
                print(f'candidate of candidate (coc): {coc}')
                print(f'coc\'s set index: {coc_set_idx}')
                print(f'candidate: {candidate}')
                print(f'candidate_set_idx: {candidate_set_idx}')

            # choosing path with bigger end pointer (more segment left on that segment set)
            choosed = set_ptr[candidate_set_idx].argmax()
            choosed_set = candidate_set_idx[choosed]
            new_key_point = candidate[choosed]
            key_points.append(new_key_point)

            # reset current coord to newly selected key point
            current_coord = key_points[-1] 

            # move current key point's set pointer
            set_ptr[choosed_set] -= 1

            # remove coord out of range by moving set pointers
            for idx, set in enumerate(self.homologous_segment_sets):
                while set_ptr[idx] != 0 and self._out_of_range(set.coords[set_ptr[idx]-1], current_coord):
                    set_ptr[idx] -= 1
                    
            # if all sets' ptr reach 0, then end
            # if (sum(set_ptr) == 0):
            #     break

        key_points = np.array(key_points)
        key_points = np.flip(key_points, axis=0) # from small coord to big

        if verbose:
            print(f'key points: {key_points}')
        return key_points

def main():
    coc = np.array([
        [1, 2],
        [3, 4],
        [2, 1]
    ])
    reducer = ReduceSearchSpace([1, 2, 3], None, None)
    candidate = reducer._get_candidate(coc, np.array([0,1,2]))
    print(candidate)


if __name__ == '__main__':
    main()