module Array_Input #(
    parameter int DATA_WIDTH_A = 8,
    parameter int DATA_WIDTH_B = 8,
    parameter int DATA_WIDTH_bias = 8,
    parameter int DATA_WIDTH_output=8,
    parameter M = 1,
    parameter N = 1,
    parameter K = 7,

    localparam int K1 = (K+1)/2,
    localparam int K2 = K - K1,
    localparam int LUT_WIDTH1  = DATA_WIDTH_B + $clog2(K1),
    localparam int LUT_WIDTH2  = DATA_WIDTH_B + $clog2(K2)
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
        logic [DATA_WIDTH_A-1:0]   A0_array1 ;
        logic [DATA_WIDTH_A-1:0]   A0_array2 ;
        logic [K1-2:0] addr_array1   ;
        logic [K2-2:0] addr_array2   ;
        logic signed [DATA_WIDTH_A-1:0] A_change1 [K1];
        logic signed [DATA_WIDTH_A-1:0] A_change2 [K2];
        logic signed [DATA_WIDTH_B-1:0] B_temp1 [N][K1];
        logic signed [DATA_WIDTH_B-1:0] B_temp2 [N][K2];
        logic signed [DATA_WIDTH_B + $clog2(K)-1:0] B_sum [N];
        logic signed [LUT_WIDTH1-1:0]  C_out1 [N];
        logic signed [LUT_WIDTH2-1:0]  C_out2 [N];
        logic [DATA_WIDTH_A-1:0] Anot1 ;
        logic [DATA_WIDTH_A-1:0] Anot2 ;
        logic [K1-2:0] bit_array1 ;
        logic [K2-2:0] bit_array2 ;
        logic signed [DATA_WIDTH_B + $clog2(K)-1:0] B_sum [N];//offset
        logic signed [DATA_WIDTH_B + $clog2(K):0] totaloffset [N];
        
    genvar i, j, k, ibit;
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
        for (int j = 0; j < K; j = j + 1) begin
            if(j<K1)
            A_change1[j]={~A[m][j][DATA_WIDTH_A-1],A[m][j][DATA_WIDTH_A-2:0]};
            else
            A_change2[j-K1]={~A[m][j][DATA_WIDTH_A-1],A[m][j][DATA_WIDTH_A-2:0]};
     end
     
          A0_array1  = A_change1[0][t];
          A0_array2  = A_change2[0][t];
 
    end
    // 2) 按列 j 生成 B_temp[j]
    always_comb begin
            for (int j = 0; j < N; j = j + 1) begin: gen_cols_B
 
                for (int k = 0; k < K; k = k + 1) begin
                if(k<K1)
                   B_temp1[j][k] = B[k][j];
                else
                   B_temp2[j][k-K1] = B[k][j];  
            end
        end
    end
    
always_comb begin
  for (int col = 0; col < N; col++) begin
    B_sum[col] = '0;  
    for (int row = 0; row < K; row++) begin
      B_sum[col] += B[row][col];
    end
  end
end
always_comb begin
      Anot1 =~A0_array1 ;
      Anot2 =~A0_array2 ;
         for (int j = 1; j < K; j = j + 1) begin: gen_addr2


                     bit_array1  [j-1]=A_change1 [j][t];
                     bit_array2  [j-1]=A_change2 [j][t];
                     addr_array1  [j-1] = Anot1  ^bit_array1 [j-1] ;
                     addr_array2  [j-1] = Anot2  ^bit_array2 [j-1] ;
                    // assign addr_array[i][ibit][j-1] =  A[i][j][ibit]^(~A0_array[i]) ;    
    
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
                final_out[col] = (C_out1[col]+C_out2[col]  - totaloffset[col])>>>1; 
    end  
end
    // 3) 根据行 i 和列 j 同时实例化 LUT
    generate

            for (j = 0; j < N; j = j + 1) begin: gen_cols
          LUT #(
            .DATA_WIDTH_A(DATA_WIDTH_A),
            .DATA_WIDTH_B(DATA_WIDTH_B),
            .M(M), .N(N), .K(K1)
          ) LUT_inst1 (
            .rst        (rst),
            .clk        (clk),
            .A0         (A0_array1),
            .gen_done   (gen_done),
            .addr_array (addr_array1 ),
            .B          (B_temp1[j]),
            .t          (t),
            .C_out     (C_out1[j])
          );
        LUT #(
            .DATA_WIDTH_A(DATA_WIDTH_A),
            .DATA_WIDTH_B(DATA_WIDTH_B),
            .M(M), .N(N), .K(K2)
          ) LUT_inst2 (
            .rst        (rst),
            .clk        (clk),
            .A0         (A0_array2),
            .gen_done   (gen_done),
            .addr_array (addr_array2 ),
            .B          (B_temp2[j]),
            .t          (t),
            .C_out     (C_out2 [j])
          );
       end
   endgenerate
endmodule
