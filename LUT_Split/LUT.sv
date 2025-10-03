`timescale 1ns / 1ps

module LUT#(
    parameter int DATA_WIDTH_A = 16,
    parameter int DATA_WIDTH_B = 16,
    parameter M=9,
    parameter N=9,
    parameter K=9,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K),
    parameter sK=(K+1)/2,
    localparam int NUM_LEVELS = (sK <= 1) ? 1 : $clog2(sK) + 1
)(
    input rst,
    input clk,
    input gen_done,
    input  logic   A0 ,
    input  logic [K-2:0] addr_array   ,
  //  input  logic signed [DATA_WIDTH-1:0] B[K],
    input logic signed [DATA_WIDTH_B-1:0] B_temp [K],
    input logic [7:0] t,
    output logic signed  [LUT_WIDTH:0] LUT_out
    
);
   
    logic [K-1:0] extended_addr;
    logic signed [DATA_WIDTH_B-1:0] B_2 [K];
    logic signed [DATA_WIDTH_B:0] B_Sum [K/2];

    assign extended_addr = {addr_array, 1'b1};
    always_comb begin
        for(int i=0;i<K;i++)
            B_2[i]=B_temp [i]>>>1;
    end
    
    always_comb begin
        if(gen_done)begin
            LUT_out=B_Sum[0];
            for(int i=1;i<K/2;i++)
                LUT_out=LUT_out+B_Sum [i];
            end else begin
                LUT_out=0;
            end
    end

    genvar i;
    generate
        for (i = 0; i < K/2; i++) begin : ADDS
            comb_adder #(.DATA_WIDTH_B(DATA_WIDTH_B)) u_adder (
                .W1(B_2[2*i]),
                .W2(B_2[2*i+1]),
                .sel(extended_addr[2*i+1:2*i]), 
                .Result(B_Sum[i])
            );
        end
    endgenerate


endmodule


module comb_adder #(
    parameter int DATA_WIDTH_B = 16
) (
    input  logic signed [DATA_WIDTH_B-1:0] W1,
    input  logic signed [DATA_WIDTH_B-1:0] W2,
    input  logic        [1:0]             sel,  
    output logic signed [DATA_WIDTH_B:0]  Result
);
    // 仅保留两条算术路径：sum 与 diff
    logic signed [DATA_WIDTH_B-1:0] sum;      // W1 + W2
    logic signed [DATA_WIDTH_B-1:0] diff;     // W1 - W2
    logic signed [DATA_WIDTH_B-1:0] neg_sum;  // -(W1 + W2)
    logic signed [DATA_WIDTH_B-1:0] neg_diff; // -(W1 - W2) == W2 - W1

    always_comb begin
        sum      = W1 + W2;
        diff     = W1 - W2;
        neg_sum  = -sum;     // 综合为 (~sum)+1
        neg_diff = -diff;    // 综合为 (~diff)+1

        // 保留一个大的四路选择器
        unique case (sel)
            2'b11: Result = sum;      // W1 + W2
            2'b00: Result = neg_sum;  // -(W1 + W2)
            2'b01: Result = diff;     // W1 - W2
            2'b10: Result = neg_diff; // W2 - W1
            default: Result = '0;
        endcase
    end
endmodule




