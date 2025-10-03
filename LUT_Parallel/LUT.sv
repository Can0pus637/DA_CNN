`timescale 1ns / 1ps

module LUT#(
    parameter int DATA_WIDTH_A = 8,
    parameter int DATA_WIDTH_B = 8,
    parameter M=4,
    parameter N=4,
    parameter K=4,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K),
    parameter sK=(K+1)/2,
    localparam int NUM_LEVELS = (sK <= 1) ? 1 : $clog2(sK) + 1
)(
    input rst,
    input clk,
    input gen_done,

    input  logic [K-2:0] addr_array   ,
  //  input  logic signed [DATA_WIDTH-1:0] B[K],
    input logic signed [DATA_WIDTH_B-1:0] B_temp [K],

    output logic signed  [LUT_WIDTH:0] LUT_out
    
);
    logic signed [DATA_WIDTH_B-1:0] B_2 [K];

    logic [K-1:0] extended_addr;
    logic signed [DATA_WIDTH_B:0] B_Sum [K/4];
    assign extended_addr = {addr_array, 1'b1};
    always_comb begin
        for(int i=0;i<K;i++)
            B_2[i]=B_temp [i]>>>1;
    end
    always_comb begin
        if(gen_done)begin
            LUT_out=B_Sum[0];
            for(int i=1;i<K/4;i++)
                LUT_out=LUT_out+B_Sum [i];
            end else begin
                LUT_out=0;
            end
    end
genvar i;
    generate
        for (i = 0; i < K; i += 4) begin : combine_blk
            combine_W #(.WIDTH(DATA_WIDTH_B)) u_combine_W (
                .W1           (B_2[i + 0]),
                .W2           (B_2[i + 1]),
                .W3           (B_2[i + 2]),
                .W4           (B_2[i + 3]),
                .four_bit_addr(extended_addr[i + 3 : i]), // 每 4 位切片，实例 0 用 [3:0]，1 用 [7:4] …
                .Out           (B_Sum[i/4])
            );
        end
    endgenerate

endmodule

module combine_W #(
    parameter int WIDTH = 16                     
      
) (
    input  logic signed [WIDTH-1:0] W1,
    input  logic signed [WIDTH-1:0] W2,
    input  logic signed [WIDTH-1:0] W3,
    input  logic signed [WIDTH-1:0] W4,
    input logic [3:0]four_bit_addr,
    output logic signed [WIDTH:0] Out
);
    logic signed [WIDTH:0] W_Out [7:0] ;
    logic signed [WIDTH:0] W1_ext ;
    logic signed [WIDTH:0] W2_ext ;
    logic signed [WIDTH:0] W3_ext ;
    logic signed [WIDTH:0] W4_ext ;
                  
    logic signed [WIDTH:0] W_Sub ;             
    logic signed [WIDTH:0] W_Sum ; 
    logic signed [WIDTH:0] t6; 
    logic signed [WIDTH:0] two_W_Sub ;
    logic signed [WIDTH:0] two_W4 ;
    logic signed [WIDTH:0] two_W3 ;
    logic signed [WIDTH:0] two_W2 ;
    logic  [2:0] high3;
    always_comb begin
     if(four_bit_addr[0])
       W1_ext = W1;
     else
       W1_ext = -W1;
       
       W2_ext = W2;
       W3_ext = W3;
       W4_ext = W4;
       W_Sub = W4_ext + W3_ext;
       W_Sum = W1_ext + W2_ext + W_Sub;
       two_W_Sub = W_Sub  <<<1 ;
       two_W4    = W4_ext <<<1 ;
       two_W3    = W3_ext <<<1 ;
       two_W2    = W2_ext <<<1 ;
t6 = W_Sum - two_W2;
    case (four_bit_addr[3:1]) // high3
        3'b111: Out = W_Sum;                      // W_Out[7]
        3'b101: Out = W_Sum - two_W3;             // W_Out[5]
        3'b011: Out = W_Sum - two_W4;             // W_Out[3]
        3'b001: Out = W_Sum - two_W_Sub;          // W_Out[1]
        3'b110: Out = t6;                         // W_Out[6]
        3'b000: Out = t6 - two_W_Sub;             // W_Out[0]
        3'b010: Out = t6 - two_W4;                // W_Out[2]
        3'b100: Out = t6 - two_W3;                // W_Out[4]
        default: Out = '0;
    endcase

    end
endmodule