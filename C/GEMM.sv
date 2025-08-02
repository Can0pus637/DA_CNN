module GEMM #(
    parameter int DATA_WIDTH_A =    8,//kernel
    parameter int DATA_WIDTH_B =    8,//map
    parameter int DATA_WIDTH_bias = DATA_WIDTH_B,
    parameter int DATA_WIDTH_output=DATA_WIDTH_B,
    parameter M = 2,
    parameter N = 4,
    parameter K =128,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K),
 
    parameter sK=(K+1)/2
)(
    input  logic                       clk,
    input  logic                       rst,
    input  logic                       gen_done,
    input  logic                       bias_en,
    input  logic signed [DATA_WIDTH_A-1:0] A [M][K],
    input  logic signed [DATA_WIDTH_B-1:0] B [K][N],
    input  logic signed [DATA_WIDTH_bias-1:0] bias [N],
    output logic signed [DATA_WIDTH_output-1:0]  final_out [N]
);
        logic    A0_array   ;
        logic [K-2:0] addr_array   ;
        logic signed [DATA_WIDTH_A-1:0] A_change [K];
        logic signed [DATA_WIDTH_B-1:0] B_temp [N][K];
        logic signed [DATA_WIDTH_B + $clog2(K)-1:0] B_sum [N];
        logic signed [LUT_WIDTH-1:0]  C_out [N];
        logic [DATA_WIDTH_A-1:0] Anot ;
        logic signed [DATA_WIDTH_B + $clog2(K):0] totaloffset [N];//offset
        logic [K-2:0] bit_array  ;
       // logic signed [DATA_WIDTH_B:0] B_MA_array  [N][2][sK];
       logic signed [DATA_WIDTH_B:0] B_M_array  [N][sK];
       logic signed [DATA_WIDTH_B:0] B_A_array  [N][sK];
    genvar i, j, k, ibit,col;
    logic [7:0] t,m,aim_m;
////calculated address////
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
        t <= 0;
        m <=0;
        aim_m<=0;
    end else if (gen_done) begin
        if (t == DATA_WIDTH_A-1) begin
                t <= 0;  
                aim_m<=m;
            if (m == M-1)
                m <= 0;  
            else
                m <= m + 1;           
        end else begin
                t <= t + 1;
        end 
    end
end



    always_comb begin
        
            for (int j = 0; j < K; j = j + 1) begin
                A_change[j]={~A[m][j][DATA_WIDTH_A-1],A[m][j][DATA_WIDTH_A-2:0]};
            end
              A0_array = A_change[0][t];
        end
always_comb begin
             Anot =~A0_array ;
             for (int j = 1; j < K; j = j + 1) begin: gen_addr2
                    //Invert the A0, and prepare to invert it together with the subsequent bits

                         //Transpose the binary array to obtain the address prototype
                         bit_array  [j-1]=A_change [j][t];
                         //Perform XOR to obtain the final address.
                         addr_array  [j-1] = Anot   ^bit_array  [j-1] ;
                 
             end
         end
 

 
 always_comb begin
    for (int j = 0; j < N; j = j + 1) begin: gen_cols_B   
      for (int k = 0; k < K; k = k + 1) begin
         B_temp[j][k] = B[k][j]; 
      end
   end
     //Calculate the sum of B to offset the final result.
       for (int col = 0; col < N; col++) begin
         B_sum[col] = '0;  
         for (int row = 0; row < K; row++) begin
           B_sum[col] =B_sum[col]+ B[row][col];
         end
       end
     end
     

always_comb begin
         for (int col = 0; col < N; col = col + 1) begin
            //assign totaloffset[col]=(B_sum[col]>>>(DATA_WIDTH_B))-bias[col];
            if(gen_done)
                if(bias_en)
                    totaloffset[col]=(B_sum[col]>>>(DATA_WIDTH_A))-bias[col];
                else
                    totaloffset[col]=(B_sum[col]>>>(DATA_WIDTH_A));//-bias[col];
   
            else
               totaloffset[col]=0;
            if(t==0)
               final_out[col] = C_out[col]- totaloffset[col];
        end
        
end

    generate
        for (j = 0; j < N; j = j + 1) begin: gen_cols
          LUT #(
            .DATA_WIDTH_A(DATA_WIDTH_A),
            .DATA_WIDTH_B(DATA_WIDTH_B),
            .M(M), .N(N), .K(K)
          ) LUT_inst (
            .t        (t),
            .rst      (rst),
            .clk      (clk),
            .A0 (A0_array ),
            .gen_done (gen_done),
            .addr_array(addr_array ),
            .C_out     (C_out[j]),
            .B_temp(B_temp[j])
          );
       end
       
   endgenerate
endmodule
