\# OBC-CNN: FPGA Acceleration with Offset-Binary Coding  



\## Overview  

This project implements a \*\*CNN accelerator based on Offset-Binary Coding (OBC)\*\*.  

By replacing traditional MAC operations with LUT-based multiplier-free designs, and enabling \*\*asymmetric quantization\*\* with multiple LUT architectures (Parallel / Shared / Split / Hybrid), the design achieves \*\*efficient inference and energy optimization\*\* on FPGA.  



\## Features  

\- Multiplier-free CNN acceleration using LUT + shift-accumulate  

\- Independent OBC representation for inputs/weights (asymmetric quantization)  

\- Multiple LUT architectures for performance–resource trade-offs  

\- Modified LeNet-5 (ReLU, stride conv, GAP) for better quantization robustness  

\- Fully implemented on \*\*Xilinx ZCU106 FPGA\*\*  



\## Results  

\- >98% accuracy on MNIST with low-bit weight quantization  

\- Hybrid LUT achieves the best resource and power efficiency  

\- High energy efficiency CNN acceleration on ZCU106 FPGA  



\## Environment  

\- Vivado 2020.2  

\- SystemVerilog / MATLAB  

\- Xilinx ZCU106 FPGA  



