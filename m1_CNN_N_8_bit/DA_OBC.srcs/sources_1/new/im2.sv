`timescale 1ns/1ps
module im2 #(
  parameter int DATA_WIDTH_map        = 8,    // 外层拍数 0…7
  parameter int CHUNK_K               = 5,    // 每组要用的元素数
  // 设计上限
  parameter int MAX_X1            = 5,
  parameter int MAX_X2            = 5,
  parameter int MAX_X3            = 32,
  parameter int MAX_X4            = 32,
  parameter int MAX_Y1            = 32,
  parameter int MAX_Y2            = 32,
  parameter int MAX_Map_DEEPTH    = 5046,
  parameter int MAX_Kernel_DEEPTH = 2400,
  localparam int AW_MAP  = $clog2(MAX_Map_DEEPTH)+1,
  localparam int AW_KERN = $clog2(MAX_Kernel_DEEPTH)+1
)(
  input  logic                   clk,
  input  logic                   rst,
  input  logic                   en_im2,

  input  logic [$clog2(MAX_X1):0] X1,
  input  logic [$clog2(MAX_X2):0] X2,
  input  logic [$clog2(MAX_X3):0] X3,
  input  logic [$clog2(MAX_Y1):0] Y1,
  input  logic [$clog2(MAX_Y2):0] Y2,
  input  logic [$clog2(MAX_Y2):0] patch_i,
  input  logic [$clog2(MAX_Y1):0] patch_j,
  input  logic [15:0]            n,
  input  logic [15:0]            k_grp,
  input  logic [2:0]             STRIDE,
  output logic                   valid1,
  output logic [AW_MAP  :0]    flattenA_addr,baseA,
  output logic [AW_KERN :0]    flattenB_addr,baseB,
  output logic                   done,
  output logic [$clog2(DATA_WIDTH_map):0] k_cnt,
  output setzeroB
);
logic valid;
always_ff @(posedge clk or posedge rst) begin
    if(rst||en_im2==0)begin
        done<=0;
        k_cnt<=0;
       
    end else if(!en_im2) begin
        k_cnt<=0;
       
    end else begin
        if(k_cnt<DATA_WIDTH_map-1)
            k_cnt<=k_cnt+1;
        else begin
            k_cnt<=0;
            done<=1;
        end
        
        

    end
end


  
  
  //==============================================================
// 0) 使能：只在有效拍 (k_cnt < CHUNK_K) 读取 A/B
//==============================================================
assign valid = (en_im2 && (k_cnt < CHUNK_K))&&(k_grp * CHUNK_K + k_cnt<X1 * X2 * X3);
assign valid1 = (en_im2 && (k_cnt < CHUNK_K));

int c_idx,u_idx,v_idx; 
wire [31:0] N_stride = X3 * X2 * X1; 



 always_ff @(posedge clk or posedge rst) begin
  if (rst||en_im2==0) begin
    c_idx<=0; u_idx<=0; v_idx<=0;
  end
  else if (valid) begin
//    if(k_cnt==0&&k_grp==0)begin
//        c_idx<=0;
//        v_idx <= v_idx + 1;
   // end else
    if (v_idx == X1-1) begin
      v_idx <= 0;
      if (u_idx == X2-1) begin
        u_idx <= 0;
        c_idx <= (c_idx >= X3-1) ? 0 : c_idx + 1;

      end else
        u_idx <= u_idx + 1;
    end else
      v_idx <= v_idx + 1;
  end
end

//--------------------------------------------------
// 组合得到 4 段偏移
//--------------------------------------------------
assign baseA  = (patch_i * STRIDE) * Y1 + (patch_j * STRIDE);//0+2
assign baseB  = n * N_stride + k_grp * CHUNK_K;
assign flattenA_addr= baseA
           + c_idx * (Y1*Y2)
           + u_idx * Y1
           + v_idx;
assign flattenB_addr= baseB+k_cnt;
assign setzeroB=(k_grp * CHUNK_K + k_cnt>=X1 * X2 * X3);
  
  
  
  
  
endmodule
