import numpy as np
import math

def gen_address(N):
  stages = int(math.log2(N))
  address =  np.array([0])
  for i in range(1, stages+1):
    address = np.concatenate((address, address+2**(stages-i)))

  with open("address_verilog.txt", "w") as f:
    for i in range(len(address)):
      f.write(f"{i}: begin\n")
      f.write(f"  output_buf_real_w[{address[i]}] = fft_2_out_real;\n")
      f.write(f"  output_buf_imag_w[{address[i]}] = fft_2_out_imag;\n")
      f.write("end\n")

def gen_twiddle_factor(N):
  num_of_twiddle = N//2
  
  with open("twiddle_verilog.txt", "w") as f:
    for i in range(num_of_twiddle):
      f.write(f"parameter TWIDDLE_FACTOR_{i}_REAL = 8'sb\n")
      f.write(f"parameter TWIDDLE_FACTOR_{i}_IMAG = 8'sb\n")

def gen_assign_twiddle(N):
  num_of_twiddle = N//2

  with open("assign_twiddle_verilog.txt", "w") as f:
    for i in range(num_of_twiddle):
      f.write(f"assign twiddle_factor_real[{i}] = TWIDDLE_FACTOR_{i}_REAL;\n")
      f.write(f"assign twiddle_factor_imag[{i}] = TWIDDLE_FACTOR_{i}_IMAG;\n")

def main():
  N = 512
  gen_address(N)
  gen_twiddle_factor(N)
  gen_assign_twiddle(N)



if __name__ == '__main__':
  main()
