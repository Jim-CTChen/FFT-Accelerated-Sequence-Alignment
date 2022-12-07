import sys
def bin2decimal_2complement(x:str, d=0):
  '''
    convert 2's complement binary to decimal
    param:
      x: binary format (2's complement)
      d: place for decimal point
    example:
      x = 110, d = 0 >> -2
      x = 0111, d = 1 >> 3.5
  '''
  sign = x[0] == '1'
  x = x[1:]

  # deal with 2's complement
  if sign:
    meet_1 = False
    x = list(x)
    for i in reversed(range(len(x))):
      if meet_1: x[i] = '0' if x[i] == '1' else '1'
      elif x[i] == '1': meet_1 = True
    x = ''.join(x)

  if d == 0: x += '.'
  else: x = x[:-d] + '.' + x[-d:]

  whole_str, dec_str = str(x).split(".")
  
  # whole part
  whole_str = whole_str[::-1]
  whole = 0
  for p, b in enumerate(whole_str):
    if b == '1': whole += pow(2, p)
  
  # dec part
  dec = 0
  for p, b in enumerate(dec_str):
    if b == '1': dec += pow(2, -(p+1))

  return whole+dec if not sign else -(whole+dec)

def main():
  shift = 8
  if len(sys.argv) >= 2: shift = int(sys.argv[1])
  while True:
    bit = input()
    d = bin2decimal_2complement(bit, shift)
    print(d)

if __name__ == '__main__':
  main()