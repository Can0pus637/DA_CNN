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
    output logic signed  [LUT_WIDTH-1:0] C_out
    
);
    logic signed [LUT_WIDTH-1:0] LUT_out;
    logic [K-1:0] extended_addr;
    logic signed [DATA_WIDTH_B-1:0] B_2 [K];
    logic signed [DATA_WIDTH_B-1:0] B_Sum [K/2];

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

    SA #(
         .DATA_WIDTH_A(DATA_WIDTH_A),
        .DATA_WIDTH_B(DATA_WIDTH_B),
        .M(M),
        .N(N),
        .K(K)

    ) SA (
        .clk(clk),
        .rst(rst),
        //.gen_done(gen_done),
        .C_in(LUT_out),
        .C_out(C_out),
 
        .A0(A0 )
      
    );
endmodule

module comb_adder #(
    parameter int DATA_WIDTH_B = 16
) (
    input  logic signed [DATA_WIDTH_B-1:0] W1,
    input  logic signed [DATA_WIDTH_B-1:0] W2,
    output logic signed [DATA_WIDTH_B-1:0]   Result,
    input  logic        [1:0] sel  
);
    logic signed [DATA_WIDTH_B-1:0]   Sum[4];
    assign Sum[3] = W1 + W2;//l1
    assign Sum[0] = -Sum[3];//00
    assign Sum[1] = Sum[3]-(2*W2 );//01
    assign Sum[2] = Sum[3]-(2*W1);//10
    assign Result = Sum[sel];
    
endmodule


