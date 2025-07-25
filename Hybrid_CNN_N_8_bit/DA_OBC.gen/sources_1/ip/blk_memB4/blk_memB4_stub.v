// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jun 24 20:55:44 2025
// Host        : CANOPUS637 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Boyang/Desktop/m1_CNN_small_r/DA_OBC.gen/sources_1/ip/blk_memB4/blk_memB4_stub.v
// Design      : blk_memB4
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu29p-fsga2577-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *)
module blk_memB4(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[4:0],dina[575:0],douta[575:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [4:0]addra;
  input [575:0]dina;
  output [575:0]douta;
endmodule
