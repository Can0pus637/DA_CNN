`timescale 1ns/1ps
module GEMM #(
    parameter int DATA_WIDTH_A = 8,
    parameter int DATA_WIDTH_B = 8,
    parameter int DATA_WIDTH_bias = 8,
    parameter int DATA_WIDTH_output=8,
    parameter int M = 100,
    parameter int N = 8,
    parameter int K = 27,
    parameter int M_tile   = 32,
    parameter int N_tile   = 8,
    parameter int K_tile   = 9
         
)(
    input  logic  clk,

    input  logic  rst,
    input  logic signed[DATA_WIDTH_A-1:0] A[M][K],
    input  logic signed[DATA_WIDTH_B-1:0] B[K][N],
    input  logic LAYER_done,
    output logic signed[DATA_WIDTH_output-1:0] C_out[N_tile],
    output logic  [15:0] GEMM_aim_n,GEMM_aim_m,GEMM_aim_t1,GEMM_t0,GEMM_t1,
    output logic GEMM_done,GEMM_done1,GEMM_done2,write_EN
);
    localparam int End_time = M % M_tile;
    logic signed[DATA_WIDTH_A-1:0] A_mat [M_tile][K_tile];
    logic signed[DATA_WIDTH_B-1:0] B_mat [K_tile][N_tile];
    //logic signed[DATA_WIDTH_output-1:0] C_mat[N_tile];
    logic cycle_done;

    logic [31:0]  cnt;
    logic [15:0]  GEMM_k,GEMM_n,GEMM_m;          // 0¨E7
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
               
                GEMM_aim_t1<=0;
                GEMM_t0<=0;
                GEMM_t1<=0;
                GEMM_k <= 0;  
                GEMM_n <= 0;  
                GEMM_m <= 0;  
                GEMM_aim_n<=0;
                GEMM_aim_m<=0;
                GEMM_done1<=0;
                GEMM_done2<=0;
                write_EN<=0;
                for (int i = 0; i < N_tile; i++)
                     C_out[i] <= '0;
        end else if(LAYER_done||GEMM_done) begin
                GEMM_aim_t1<=0;
                GEMM_t0<=0;
                GEMM_t1<=0;
                GEMM_k <= 0;  
                GEMM_n <= 0;  
                GEMM_m <= 0;  
                GEMM_aim_n<=0;
                GEMM_aim_m<=0;
                GEMM_done1<=0;
                GEMM_done2<=0;
                write_EN<=0;
                for (int i = 0; i < N_tile; i++)
                     C_out[i] <= '0;
        
        end else begin

if ((GEMM_t0 == DATA_WIDTH_A-1)) begin
      GEMM_t0         <= 0;
      GEMM_aim_t1     <=GEMM_t1;
      GEMM_aim_n      <= GEMM_n;
      GEMM_aim_m      <= GEMM_m;
      write_EN        <=1;
      if (GEMM_t1 == M_tile-1) begin
        GEMM_t1 <= 0;
        if ((GEMM_k+1)*K_tile >= K) begin
          GEMM_k <= 0;
          if ((GEMM_m+1)*M_tile >= M) begin
            GEMM_m <= 0;
            if ((GEMM_n+1)*N_tile >= N)
              GEMM_n <= 0;
            else
              GEMM_n <= GEMM_n + 1;
          end else
            GEMM_m <= GEMM_m + 1;
        end else
          GEMM_k <= GEMM_k + 1;
      end else begin
        GEMM_t1 <= GEMM_t1 + 1;
      end
    end else begin
      GEMM_t0 <= GEMM_t0 + 1;
    end
         
    //if(GEMM_t0<N_tile)  C_out[GEMM_aim_t1+GEMM_aim_m*M_tile][GEMM_t0+GEMM_aim_n*N_tile]<=C_out[GEMM_aim_t1+GEMM_aim_m*M_tile][GEMM_t0+GEMM_aim_n*N_tile]+C_mat[GEMM_t0];
    GEMM_done<=((GEMM_n+1)*N_tile >= N)&&((GEMM_m+1)*M_tile >= M)&&((GEMM_k+1)*K_tile >= K)&&(GEMM_t1 == End_time)&&(GEMM_t0 == DATA_WIDTH_A-1);
   

     end
 end    
     
    always_comb begin
        for(int i=0;i<M_tile;i++)
            for(int j=0;j<K_tile;j++)
                begin
                    if((i+GEMM_m*M_tile<M)&&(j+GEMM_k*K_tile<K))
                        A_mat[i][j]=A[i+GEMM_m*M_tile][j+GEMM_k*K_tile];
                    else
                        A_mat[i][j]=0;
                end
        for(int i=0;i<N_tile;i++)
            for(int j=0;j<K_tile;j++)
                begin
                    if((i+GEMM_n*N_tile<N)&&(j+GEMM_k*K_tile<K))
                        B_mat[j][i]=B[j+GEMM_k*K_tile][i+GEMM_n*N_tile];
                    else
                        B_mat[j][i]=0;
                end    
    end
    
    
    
    
    
    
    
    
    Array_Input #(
        .DATA_WIDTH_A(DATA_WIDTH_A),
        .DATA_WIDTH_B(DATA_WIDTH_B),
        .DATA_WIDTH_bias    (DATA_WIDTH_bias),
        .DATA_WIDTH_output  (DATA_WIDTH_output),
        .M(M_tile),
        .N(N_tile),
        .K(K_tile)
    ) u_Array_Input (
        .clk      (clk),
        .rst      (rst),
        .gen_done (~(LAYER_done||GEMM_done)),
        .A        (A_mat),
        .B        (B_mat),
        .final_out(C_out)
       // .bias (bias)
    );
endmodule

