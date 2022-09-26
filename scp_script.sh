#!/bin/zsh
#zsh scp_script.sh
source ~/.zshrc
cd FFT/verilog
scpFromDPSLab FFT/verilog/FFT_syn.ddc FFT/verilog/FFT_syn.sdf FFT/verilog/FFT_syn.v FFT/verilog/FFT.v FFT/verilog/tb.v FFT/verilog/readme.md
cd ../..