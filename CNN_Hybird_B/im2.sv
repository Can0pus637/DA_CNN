`timescale 1ns/1ps
module im2 #(
  parameter int DATA_WIDTH_kernel        = 8,    // 外层拍数 0…7
  parameter int CHUNK_K               = 8,    // 每组要用的元素数
  parameter int Pack               = 4,    // 每组要用的元素数
  parameter int MAX_X1            = 5,
  parameter int MAX_X2            = 5,
  parameter int MAX_X3            = 32,
  parameter int MAX_X4            = 32,
  parameter int MAX_Y1            = 32,
  parameter int MAX_Y2            = 32,
  parameter int MAX_Y3            = MAX_X3,
  parameter int MAX_Map_DEEPTH    = 5046,
  parameter int MAX_Kernel_DEEPTH = 2400

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
  output logic [$clog2(MAX_Kernel_DEEPTH)  :0]    flattenA_addr[Pack],
  output logic [$clog2(MAX_Map_DEEPTH) :0]    flattenB_addr[Pack],
  output logic [$clog2(MAX_Kernel_DEEPTH)  :0]    baseA,
  output logic [$clog2(MAX_Map_DEEPTH) :0]    baseB,
  
  output logic                   done,
  output logic [$clog2(DATA_WIDTH_kernel):0] k_cnt,
  output logic [Pack-1:0]setzeroB
);
logic valid;
always_ff @(posedge clk or posedge rst) begin
    if(rst||en_im2==0)begin
        done<=0;
        k_cnt<=0;
       
    end else if(!en_im2) begin
        k_cnt<=0;
       
    end else begin
        if(k_cnt<DATA_WIDTH_kernel-1)
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

logic [15:0] c_idx,u_idx,v_idx,v_tmp,u_tmp,c_tmp,v_next,u_next,c_next; 
wire [8:0] N_stride = X3 * X2 * X1; 
logic [7:0] a;
logic [15:0] flat_addr,flat_addr_next,flat_addr_1;



localparam int PATCH_BITS = 9;
logic [PATCH_BITS:0] flat_idx;


assign flat_idx = Pack*k_cnt+k_grp* CHUNK_K * Pack;
assign baseB = (patch_i * STRIDE) * Y1 + (patch_j * STRIDE);

assign baseA = n * N_stride + k_grp * CHUNK_K * Pack;

generate
  genvar pa;
  for(pa=0; pa<Pack; pa++) begin : G_A
    assign flattenA_addr[pa] = baseA + k_cnt*Pack + pa;
    assign setzeroB[pa]      = ((k_grp*CHUNK_K + k_cnt)*Pack + pa) >= (X1*X2*X3);
  end
endgenerate

generate
  genvar k;
  for (k = 0; k < Pack; k++) begin : G_B
    localparam int PB = PATCH_BITS;
    wire [PB:0] flat = flat_idx + k;

    // X1==X2，只分三种：1/1, 3/3, 5/5
    wire [PB:0] c_row =
         (X1==1) ? flat :
         (X1==3) ? (flat *911>>13) :
                    (flat*41>>10);       // X1==5

    wire [PB:0] rem1  =
         (X1==1) ? '0 :
         (X1==3) ? (flat - c_row*9) :
                    (flat - c_row*25); // X1==5

    wire [PB:0] u_row =
         (X1==1) ? '0 :
         (X1==3) ? (rem1 * 683>>11) :
                    (rem1 *205>>10 );        // X1==5

    wire [PB:0] v_col =
         (X1==1) ? rem1 :
         (X1==3) ? (rem1 - u_row*3) :
                    (rem1 - u_row*5);  // X1==5

    assign flattenB_addr[k] = baseB
                            + c_row * (Y1 * Y2)
                            + u_row * Y1
                            + v_col;
  end
endgenerate

endmodule
