`timescale 1ns / 1ps

module SA#(
    parameter int DATA_WIDTH_A = 8,
    parameter int DATA_WIDTH_B = 8,
    parameter M=4,
    parameter N=4,
    parameter K=4,
    parameter int SUM_WIDTH  = DATA_WIDTH_A+DATA_WIDTH_B ,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K)
    )(
    input clk,
    input rst,
    input logic  A0,
    input   logic signed [LUT_WIDTH-1:0] C_in,
    output  logic signed [LUT_WIDTH-1:0] C_out
    );
 
    logic signed [LUT_WIDTH-1:0] C_reg;
    always_comb begin
        C_out=C_reg;
    end

    always_ff @(posedge clk or posedge rst) begin
      if (rst ) begin
        C_reg <= 0;
      end else begin
        if (A0)
          C_reg <= (C_reg + C_in) >>> 1;
        else
          C_reg <= (C_reg - C_in) >>> 1;
      end
      
    end
        
endmodule
