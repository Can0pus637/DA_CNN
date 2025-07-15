module Array_Input #(
    parameter int DATA_WIDTH_A = 8,
    parameter int DATA_WIDTH_B = 8,
    parameter int DATA_WIDTH_bias = 8,
    parameter int DATA_WIDTH_output=8,
    parameter M = 1,
    parameter N = 1,
    parameter K = 7,
    parameter int LUT_WIDTH  = DATA_WIDTH_B + $clog2(K)
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
logic   A0_array    ;
logic [K-2:0] addr_array  ;
logic signed [DATA_WIDTH_A-1:0] A_change [K];
logic signed [DATA_WIDTH_B-1:0] B_temp [N][K];
logic signed [DATA_WIDTH_B + $clog2(K)-1:0] B_sum [N];//offset
logic signed [DATA_WIDTH_B + $clog2(K):0] totaloffset [N];

logic signed [LUT_WIDTH-1:0]  C_out [N];
logic [DATA_WIDTH_A-1:0] Anot ;
logic [K-2:0] bit_array ;
genvar i, j, k, ibit,col;

logic [7:0] m,aim_m;
logic [7:0] t;
always_ff @(posedge clk or posedge rst) begin
    if (rst||(!gen_done)) begin
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
   for (int j = 0; j < N; j = j + 1) begin: gen_cols_B   
      for (int k = 0; k < K; k = k + 1) begin
         B_temp[j][k] = B[k][j]; 
      end
   end
   for (int col = 0; col < N; col++) begin
        B_sum[col] = '0;  
      for (int row = 0; row < K; row++) begin
         B_sum[col] += B[row][col];
      end
   end
end
   
always_comb begin
    for (int j = 0; j < K; j = j + 1) begin
        A_change[j]={~A[m][j][DATA_WIDTH_A-1],A[m][j][DATA_WIDTH_A-2:0]};
    end
        A0_array = A_change[0][t]; 

        Anot=~A0_array;
    for (int j = 1; j < K; j = j + 1) begin: gen_addr2
        bit_array[j-1]=A_change[j][t];
        addr_array[j-1] = Anot ^bit_array[j-1] ;
    end
       
    for (int col = 0; col < N; col = col + 1) begin
            if(gen_done)
                if(bias_en)
                    totaloffset[col]=(B_sum[col]>>>(DATA_WIDTH_B))-bias[col]<<<1;
                else
                    totaloffset[col]=(B_sum[col]>>>(DATA_WIDTH_B));//-bias[col];
            else
                totaloffset[col]=0;
            if(t==0)
                final_out[col] = (C_out[col]  - totaloffset[col])>>>1; 
    end
end
 
generate
    for (j = 0; j < N; j = j + 1) begin: gen_cols
          LUT #(
            .DATA_WIDTH_A(DATA_WIDTH_A),
            .DATA_WIDTH_B(DATA_WIDTH_B),
            .M(M), .N(N), .K(K)
          ) LUT_inst (
            .rst        (rst),
            .clk        (clk),
            .A0         (A0_array),
            .gen_done   (gen_done),
            .addr_array (addr_array),
            .B          (B_temp[j]),
            .C_out      (C_out[j]),
            .t          (t)
          
          );
        end    
endgenerate
endmodule
