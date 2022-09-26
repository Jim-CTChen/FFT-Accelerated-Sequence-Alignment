import sys

def decimal2bin(x):
  return bin(x).lstrip("0b")

def bin2decimal(x):
  return int(x, 2)

def twos_complement(x, bits):
  raw = decimal2bin((1 << bits) - bin2decimal(x))
  return "0"*(bits-len(raw))+raw

def float2bin(x, bits = 3):
  '''
    convert floating number into binary number
    param:
      x: floating number to be converted
      bits: number of bits the output will be
    output:
      bit_string: binary string
      shift: if shift > 0, then shift left "shift" times, 
             otherwise shift right "shift" times

    Divide possible inputs into 3 cases:
      case 1: x's whole part bits > bits
        x = 101111.11, bits = 4
        >> bit_string = 1011, shift = 2
      case 2: x > 1 and x's whole part bits < bits
        x = 11.11011, bits = 4
        >> bit_string = 11.11, shift = -2
      case 3: x < 1
        x = 0.00011011, bits = 4
        >> bit_string = 1101, shift = -7
  '''

  # sign bit
  bits -= 1

  # handle negative input
  negative = False 
  if x < 0:
    negative = True
    x = -x
  
  # split() separates whole number and decimal
  # part and stores it in two separate variables
  whole, dec = str(x).split(".")

  # Convert both whole number and decimal 
  # part from string type to integer type
  whole = int(whole)
  dec = float("0."+dec)

  bit_string = None
  shift = None

  if whole > 0:
    binary_whole = bin(whole).lstrip("0b")
    if len(binary_whole) > bits:
      # case 1
      # print('case 1')
      # whole part exceed bits
      bit_string = binary_whole[:bits]
      shift = len(binary_whole) - bits
    else:
      # case 2
      # print('case 2')
      bit_string = binary_whole
      shift = -(bits-len(binary_whole))
      decimal_bits = bits-len(binary_whole)
      # Iterate "decimal_bits" times for decimal part
      for x in range(decimal_bits):
        # if decimal part = 0, then end
        if not dec:
          # add trailing zeros to match "bits"
          bit_string += '0'*(decimal_bits-x)
          break

        # Multiply the decimal value by 2
        # and separate the whole number part
        # and decimal part
        whole, dec = str(dec * 2).split(".")

        # Convert the decimal part to float again
        dec = float("0."+dec)

        # Keep adding the integer parts
        # receive to the result variable
        bit_string += whole
  else:
    # case 3
    # print('case 3')
    bit_string = ""
    number_of_bits = 0
    shift = 0
    while number_of_bits != bits:
      # if decimal part = 0, then end
      if not dec:
        # add trailing zeros to match "bits"
        bit_string += '0'*(bits-number_of_bits)
        shift -= (bits-number_of_bits)
        return bit_string, shift

      # Multiply the decimal value by 2
      # and separate the whole number part
      # and decimal part
      whole, dec = str(dec * 2).split(".")
      shift -= 1

      # Convert the decimal part to float again
      dec = float("0."+dec)

      # number_of_bits > 0 means there's already a leading "1", so start counting number of bits even if whole == 0
      # if number_of_bits == 0, then wait for whole == 1 to start counting
      if whole == '1' or number_of_bits:
        bit_string += whole
        number_of_bits += 1

  if negative:
    bit_string = "1"+twos_complement(bit_string, bits)
  else:
    bit_string = "0"+bit_string
  return bit_string, shift

def binary_presenter(bit_string, shift):
  '''
    presenter for function "float2bin"'s output
    turn bit_string & shift into binary format
    param:
      bit_string = bit string in 2's complement
      shift = shift for decimal point
    for example:
      bit_string = 1001
      shift = 2
      output = 100100
      ---
      bit_string = 1011
      shift = -4
      output = 0.1011
  '''
  if shift >= 0:
    binary = bit_string + "0"*shift
  else:
    if -shift > len(bit_string):
      binary = "0." + "0"*(-shift-len(bit_string)) + bit_string
    else:
      binary = bit_string[:len(bit_string)+shift] + "." + bit_string[len(bit_string)+shift:]
  return binary

def float_to_float_bin(x, bits):
  bit_string, shift = float2bin(x, bits)
  print(f'floating number: {x}, bits: {bits}')
  print(f'bit string: {bit_string}')
  print(f'shift: {shift}')
  print(f'binary: {binary_presenter(bit_string, shift)}')

######################################

def float_to_fixed_bin(x, bits = 20, decimal_place=8, verbose=False):
  '''
    convert floating number into binary format (fixed point)
    param:
      x: floating number to be converted
      bits: number of bits the output will be
      decimal_place: where to place decimal point
    output:
      bit_string: binary string (length = bits)
  '''
  x = round(x, decimal_place+2)
  # print(f'x: {x}')
  # sign bit
  bits -= 1

  # handle negative input
  negative = False if x >= 0 else True
  if negative: x = -x
  # split() separates whole number and decimal
  # part and stores it in two separate variables
  x = str(x)
  if (x.find(".") == -1): x += "."
  whole, dec = x.split(".")

  # Convert both whole number and decimal 
  # part from string type to integer type
  whole = int(whole)
  dec = float("0."+dec)

  bit_string = None

  # whole part
  whole_bits = bits-decimal_place # -1 for sign bit
  whole_bitstring = bin(whole).lstrip("0b")
  whole_bitstring = "0"*(whole_bits-len(whole_bitstring))+whole_bitstring

  # decimal part
  decimal_bitstring = ""
  decimal_place += 1 # for rounding
  for i in range(decimal_place):
    # if decimal part = 0, then end
    if not dec or dec <= 0.000000001:
      # add trailing zeros to match "bits"
      decimal_bitstring += '0'*(decimal_place-i)
      break

    # Multiply the decimal value by 2
    # and separate the whole number part
    # and decimal part
    whole, dec = str(dec * 2).split(".")

    # Convert the decimal part to float again
    dec = float("0."+dec)

    # Keep adding the integer parts
    # receive to the result variable
    decimal_bitstring += whole


  bit_string = whole_bitstring+decimal_bitstring

  # round last digit
  if decimal_place > 0:
    # print('before round')
    # print(bit_string)
    if bit_string[-1] == '1':
      round_string = ""
      bit_string = bit_string[:-1]
      flip = True
      for bit in reversed(bit_string):
        if flip:
          if bit == '0':
            round_string = "1" + round_string
            flip = False
          else:
            round_string = "0" + round_string
        else:
          round_string = bit + round_string
      bit_string = round_string
    else: bit_string = bit_string[:-1]
    # print('after round')
    # print(bit_string)

  if negative:
    bit_string = "1"+twos_complement(bit_string, bits)
  else:
    bit_string = "0"+bit_string

  if verbose: print(bit_string)

  return bit_string
  




def main():
  x = 0.9238795325112867
  bits = 20
  decimal_place = 8
  if len(sys.argv) >= 2: x = float(sys.argv[1])
  if len(sys.argv) >= 3: bits = int(sys.argv[2])
  if len(sys.argv) >= 4: decimal_place = int(sys.argv[3])

  # floating point binary
  # float_to_float_bin(x, bits)

  # fixed point binary
  float_to_fixed_bin(x, bits, decimal_place, True)

  
  

if __name__ == '__main__':
  '''
    usage: python3 quantize.py [x] [bits]
  '''
  main()