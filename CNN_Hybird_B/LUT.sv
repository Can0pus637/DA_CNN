`timescale 1ns / 1ps

module LUT#(
    parameter int DATA_WIDTH_A = 16,
    parameter int DATA_WIDTH_B = 16,
    parameter M=9,
    parameter N=9,
    parameter K=9,
    parameter int SUM_WIDTH  = DATA_WIDTH_A+DATA_WIDTH_B ,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K),
   
    parameter sK=(K+1)/2
)(
    input rst,
    input clk,
    input gen_done,
    input  logic  A0 ,
    input  logic [K-2:0] addr_array  ,
  //  input  logic signed [DATA_WIDTH-1:0] B[K],
    input logic signed [DATA_WIDTH_B-1:0] B_temp  [K],

    input logic [7:0] t,
    output logic signed  [LUT_WIDTH-1:0] C_out
    
);

    genvar k;
    logic clr;
    logic signed [DATA_WIDTH_B-1:0] B_2 [K];
    logic signed [DATA_WIDTH_B-1:0] I_B_A_array  [sK];
    logic signed [DATA_WIDTH_B-1:0] I_B_M_array  [sK];
 
    
    logic signed [DATA_WIDTH_B-1:0] choose_MA_array [sK];
    logic signed [LUT_WIDTH-1:0] LUT_out;
    logic signed [DATA_WIDTH_B-1:0] B_M_array  [sK];
    logic signed [DATA_WIDTH_B-1:0] B_A_array  [sK];
    always_comb begin
        for(int i=0;i<K;i++)
            B_2[i]=B_temp [i]>>>1;
    end
    always_comb begin
        for ( int k = 0; k <sK; k = k + 1) begin
      
            //Compute the sums and differences of each pair of adjacent elements and store the results.
               if (2*k+1 < K) begin
                     B_A_array[k] = B_2[2*k] + B_2[2*k+1];
                     B_M_array[k] = B_2[2*k] - B_2[2*k+1];
               end else begin
                     B_A_array[k] = B_2[2*k];
                     B_M_array[k] = B_2[2*k];
               
            end
        end
     end


always_comb begin
  for (int k = 1; k < sK; k = k + 1) begin
  //First determine whether to invert the sum or difference
     if (addr_array[2*k-1]) begin
          I_B_M_array[k] =  B_M_array[k];
          I_B_A_array[k] =  B_A_array[k];
     end else begin//Swap the order here to facilitate subsequent use.
          I_B_M_array[k] = B_A_array[k];
          I_B_A_array[k] = B_M_array[k];
     end
    end
 // The first bit is not inverted by default (there's no negative case).
          I_B_M_array[0] =  B_M_array[0];
          I_B_A_array[0] =  B_A_array[0];
  for (int k = 0; k < sK; k = k + 1) begin
  //Select addition or subtraction based on the sign bit.
    if (addr_array[2*k])
        choose_MA_array[k] = I_B_A_array[k];
    else
        choose_MA_array[k] = I_B_M_array[k];
        
    end    

    //Accumulate the selected sums or differences to compute the LUT sum, preparing it for input into the SA for further processing
if (gen_done)begin
LUT_out=choose_MA_array[0];
for (int k = 1; k < sK; k = k + 1) begin
    if (addr_array[2*k - 1])
      LUT_out += choose_MA_array[k];
    else begin
     choose_MA_array[k] = -choose_MA_array[k];
     LUT_out =LUT_out+choose_MA_array[k];
     end
    //LUT_out += choose_MA_array[k]+1 ;

        end 
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
  
        .C_in(LUT_out),
        .C_out(C_out),
 
        .A0(A0)
      
    );
endmodule
