# RTL simulation
## 8 point
ncverilog tb.v FFT.v +access+r +define+point8

# SYN simulation
ncverilog tb.v FFT_syn.v +access+r +define+point8 +define+SDF