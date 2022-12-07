from os import listdir
from os.path import isfile, join


def calculate_avg_length(file_prefix, test_case, post_fix) -> int:
  '''
  path: path to homfam test case
  '''
  path = file_prefix+test_case+post_fix

  total_len = 0
  total_seq = 0
  with open(path, 'r') as f:
    all_content_by_row = f.readlines()
    total_seq = len(all_content_by_row) // 2
    for i in range(1, len(all_content_by_row), 2):
      total_len += len(all_content_by_row[i])

  avg_len = total_len/total_seq
  print(f'Test case \"{test_case}\" has avg length: {avg_len:.2f} with total {total_seq} sequences')

  return 
  
def grep_test_cases(path):
  test_cases = [f.replace('_test-only.vie', '') for f in listdir(path) if isfile(join(path, f)) and '_test-only.vie' in f]
  test_cases.sort()
  return test_cases

def main():
  file_prefix = '../../data/homfam/'
  file_postfix = '_test-only.vie'
  # test_cases = ['aadh', 'aat', 'ace', 'asp', 'blm', 'blmb', 'cah', 'cyclo']
  test_cases = grep_test_cases(file_prefix)

  for test_case in test_cases:
    calculate_avg_length(file_prefix, test_case, file_postfix)
  

if __name__ == '__main__':
  main()