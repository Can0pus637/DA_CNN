`timescale 1ns / 1ps

module LUT#(
    parameter int DATA_WIDTH_A = 16,
    parameter int DATA_WIDTH_B = 16,
    parameter M=9,
    parameter N=9,
    parameter K=9,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K),
   
    parameter sK=(K+1)/2
)(
    input rst,
    input clk,
    input gen_done,
    input  logic   A0 ,
    input  logic [K-2:0] addr_array   ,
  //  input  logic signed [DATA_WIDTH-1:0] B[K],
    input logic signed [DATA_WIDTH_B-1:0] B_temp [K],
    input logic [7:0] t,
    output logic signed  [LUT_WIDTH-1:0] C_out
    
);

    genvar k;
    logic clr;
    logic signed [DATA_WIDTH_B:0] I_B_A_array  [sK];
    logic signed [DATA_WIDTH_B:0] I_B_M_array  [sK];
 
    
    logic signed [DATA_WIDTH_B:0] choose_MA_array [sK];
    logic signed [LUT_WIDTH-1:0] LUT_out;

generate

    for (k = 0; k < sK; k = k + 1) begin : gen_addsub
    wire add_a,add_b;
    wire signed [DATA_WIDTH_B-1:0] a_in;
    wire signed [DATA_WIDTH_B-1:0] b_in;
    
      assign add_a = (2*k == 0) ? 1'b1  :  addr_array[2*k-1]; 
      // 对奇数下标 2*k+1，如果越界当 0 处理，也恒正；否则用 addr_array[2*k]
      assign add_b = ((2*k+1) < K) ?  addr_array[2*k] : 1'b1;             

      assign a_in = B_temp[2*k];
      assign b_in = (2*k+1 < K)? B_temp[2*k+1]: '0;

      // 四态 adder_sub：+a_in/-a_in  ＋  +b_in/-b_in
      adder_sub #(.WIDTH(DATA_WIDTH_B)) u_adsub (
        .a     ( a_in         ),
        .b     ( b_in         ),
        .add_a ( add_a        ),
        .add_b ( add_b        ),
        .y     ( choose_MA_array[k] )
      );
    end
  endgenerate



  
always_comb begin
    //Accumulate the selected sums or differences to compute the LUT sum, preparing it for input into the SA for further processing
if (gen_done)begin
LUT_out=choose_MA_array[0];
for (int k = 1; k < sK; k = k + 1) 
      LUT_out += choose_MA_array[k];  
    end else
    LUT_out=0;
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
        .gen_done(gen_done),
        .C_in(LUT_out),
        .C_out(C_out),
 
        .A0(A0 )
      
    );
endmodule

module adder_sub #(
  parameter int WIDTH = 16
) (
  input  logic signed [WIDTH-1:0] a,
  input  logic signed [WIDTH-1:0] b,
  input  logic                    add_a,   // 是否取反 a
  input  logic                    add_b,   // 是否取反 b
  output logic signed [WIDTH:0] y
);
  logic signed [WIDTH-1:0] a_op;
  logic signed [WIDTH-1:0] b_op; 
  logic  signed [1:0]cin;
  always_comb begin
    a_op = add_a ? a : ~a;
    b_op = add_b ? b : ~b;
  // 2) 进位 = inv_a OR inv_b
    cin[0] = ~(add_a & add_b);
    cin[1]=0;
  // 3) 一路加法
     y = a_op + b_op + cin;
    end
endmodule

