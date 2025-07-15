`timescale 1ns / 1ps

module LUT#(
    parameter int DATA_WIDTH_A = 16,
    parameter int DATA_WIDTH_B = 16,
    parameter M=9,
    parameter N=9,
    parameter K=9,
    
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K)
   
)(
    input rst,
    input clk,
    input gen_done,
    input  logic [DATA_WIDTH_A-1:0] A0 ,
    input  logic [K-2:0] addr_array  [DATA_WIDTH_A],
    input  logic signed [DATA_WIDTH_B-1:0] B[K],
    input  logic [7:0] t,
    output logic signed  [LUT_WIDTH-1:0] C_out
    
);
    logic signed [LUT_WIDTH-1:0] LUT_out;

always_comb begin
if (gen_done)begin
LUT_out=B[0];
for (int i = 0; i < K-1; i = i + 1) begin
  if (addr_array[t][i])
    LUT_out = LUT_out + B[i+1];
  else
    LUT_out = LUT_out - B[i+1];
end  
end else LUT_out=0;
end


    SA #(
         .DATA_WIDTH_A(DATA_WIDTH_A),
        .DATA_WIDTH_B(DATA_WIDTH_B),
        .M(M),
        .N(N),
        .K(K)
    ) SA (
        .clk(clk),
        .rst(rst),
        .C_in(LUT_out),
        .C_out(C_out),
        .A0(A0[t]) 
    );
endmodule
