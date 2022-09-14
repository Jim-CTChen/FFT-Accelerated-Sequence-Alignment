import numpy as np
import cmath
import math

def butterfly(A, B, W):
  '''
    output A, B
  '''
  Are = np.real(A)
  Aim = np.imag(A)
  Bre = np.real(B)
  Bim = np.imag(B)
  Wre = np.real(W)
  Wim = np.imag(W)

  Are_out = (Are+Bre)
  Aim_out = (Aim+Bim)

  Re_diff = Are-Bre
  Im_diff = Aim-Bim

  Bre_out = Re_diff*Wre - Im_diff*Wim
  Bim_out = Re_diff*Wim + Im_diff*Wre

  return [Are_out+Aim_out*1j, Bre_out+Bim_out*1j]

def FFT_8_point(): 
  N = 8 # point of FFT

  x = [i for i in range(N)]
  X = [i for i in range(N)]
  WN = [(cmath.exp(2/N*math.pi*(-1j)))**i for i in range(4)]

  X1 = [0, 0, 0, 0]
  X2 = [0, 0, 0, 0]
  X3 = [0, 0]
  X4 = [0, 0]
  X5 = [0, 0]
  X6 = [0, 0]

  X1[0], X2[0] = butterfly(x[0], x[4], WN[0])
  X1[1], X2[1] = butterfly(x[1], x[5], WN[1])
  X1[2], X2[2] = butterfly(x[2], x[6], WN[2])
  X1[3], X2[3] = butterfly(x[3], x[7], WN[3])

  X3[0], X4[0] = butterfly(X1[0], X1[2], WN[0])
  X3[1], X4[1] = butterfly(X1[1], X1[3], WN[2])

  X5[0], X6[0] = butterfly(X2[0], X2[2], WN[0])
  X5[1], X6[1] = butterfly(X2[1], X2[3], WN[2])

  X[0], X[4] = butterfly(X3[0], X3[1], WN[0])
  X[2], X[2] = butterfly(X4[0], X4[1], WN[0])
  X[1], X[5] = butterfly(X5[0], X5[1], WN[0])
  X[3], X[7] = butterfly(X6[0], X6[1], WN[0])

  print("DIF FFT:")
  print(X)

  print("np FFT")
  print(np.fft.fft(np.array(x)))

def DIF_FFT(N: int, x: np.ndarray) -> np.ndarray:
  '''
    perform DIF FFT based on radix-2
    param:
      N: point of FFT
      x: data (length = N)
    return FFT(x)
  '''
  if len(x) != N:
    print(f'{N} point FFT but receive data of length {len(x)}!')
    quit()

  WN = [(cmath.exp(2/N*math.pi*(-1j)))**i for i in range(N//2)]
  raw = DIF_FFT_one_stage(N, x, WN)

  # calculate address
  stages = int(math.log2(N))
  address =  np.array([0])
  for i in range(1, stages+1):
    address = np.concatenate((address, address+2**(stages-i)))

  # print(address)
  return np.array(raw)[address]

def DIF_FFT_one_stage(N, x, WN):
  '''
    handle one stage of DIF FFT
    recursively do DIF FFT
    divide N point FFT into N/2 FFT
    param:
      N: point of FFT
      x: input data (length = N)
      WN: twiddle factor (length = N/2)
    return list of output (length should be N)
  '''
  if len(x) != N:
    print(f'{N} point FFT but receive data of length {len(x)}!')
    quit()
  if len(WN) != N//2:
    print(f'{N} point FFT should have {N/2} Ws!')
    quit()
  # print(f'N: {N}')
  # print(f'WN: {WN}')

  if N == 2:
    X = butterfly(x[0], x[1], WN[0])
    print(N)
    print(X)
    return X
  else:
    X = [0 for i in range(N)]
    for i in range(N//2):
      X[i], X[i+N//2] = butterfly(x[i], x[i+N//2], WN[i])
    print(f'N:{N}')
    print(f'X:{X}')
    next_WN = [WN[2*j] for j in range(N//4)]
    out_1 = DIF_FFT_one_stage(N//2, X[:N//2], next_WN)
    out_2 = DIF_FFT_one_stage(N//2, X[N//2:], next_WN)
    out = out_1+out_2
    if len(out) != N:
      print(f'output length = {len(out)}, not equal to N = {N}!')
      quit()
    return out

def DIF_iFFT(N: int, X: np.ndarray) -> np.ndarray:
  '''
    perform inverse FFT by FFT
    param:
      N: point of FFT
      X: data (length = N) (np.ndarray)
  '''
  if type(X) != np.ndarray:
    print('Type error! X should be type of np.ndarray')
    quit()
  if len(X) != N:
    print(f'len(X) = {len(X)}, not equal to {N}')
    quit()

  swap_X = (X.imag).astype(np.complex128)
  swap_X += X.real*1j

  out = DIF_FFT(N, swap_X)
  out_re = out.real
  out_im = out.imag
  out.real = out_im
  out.imag = out_re
  out /= N
  return out

