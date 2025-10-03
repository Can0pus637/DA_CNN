//──────────────────────────────────────────────────────────────
//  layerX.sv  -- 结果阵列 (MAX_Layer_DEEPTH=4704) 改为 Block-RAM
//──────────────────────────────────────────────────────────────
`timescale 1ns/1ps
module layerX #(
  parameter int Kernel1_DEEPTH    = 150,
  parameter int Kernel2_DEEPTH    = 324,
  parameter int Kernel3_DEEPTH    = 2400,
  parameter int Kernel4_DEEPTH    = 2304,
  parameter int Kernel5_DEEPTH    = 512,
  parameter int Kernel6_DEEPTH    = 320,
  parameter int DATA_WIDTH_kernel  = 8,
  parameter int DATA_WIDTH_map     = 8,
  parameter int DATA_WIDTH_bias    = 8,
  parameter int DATA_WIDTH_output  = 8,

  parameter int MAX_X1 = 5,  MAX_X2 = 5,  MAX_X3 = 32, MAX_X4 = 32,
  parameter int MAX_Y1 = 32, MAX_Y2 = 32, MAX_Y3 = MAX_X3,

  parameter int MAX_M  = 784,
  parameter int MAX_N  = 6,
  parameter int MAX_K  = 150,

  parameter int MAX_Map_DEEPTH    = 5046,
  parameter int MAX_Kernel_DEEPTH = 2400,

  parameter int Pack =8,
  parameter int CHUNK_M = 1,
  parameter int CHUNK_K = 5,
  parameter int CHUNK_N = 1
)(
  //------------------------------------------------------------
  // 顶层接口
  //------------------------------------------------------------
  input  logic                            clk,
  input  logic                            rst,

  // 尺寸 / 步幅 / 数据口（与你原版保持一致）
  input  logic [$clog2(MAX_X1):0]         X1,
  input  logic [$clog2(MAX_X2):0]         X2,
  input  logic [$clog2(MAX_X3):0]         X3,
  input  logic [$clog2(MAX_X4):0]         X4,

  input  logic [$clog2(MAX_Y1):0]         Y1,
  input  logic [$clog2(MAX_Y2):0]         Y2,
  input  logic [$clog2(MAX_Y3):0]         Y3,
  input  logic [2:0]                      STRIDE,
  input logic [$clog2(MAX_Y1):0]          next_Y1,      
  input logic [$clog2(MAX_Y2):0]          next_Y2,      
  input logic [$clog2(MAX_Y3):0]          next_Y3,//通道  
  input logic [$clog2(MAX_M):0]           padding_M,

  input  logic [$clog2(MAX_M):0]          M,Mij,
  input  logic [$clog2(MAX_N):0]          N,
  input  logic [$clog2(MAX_K):0]          K,

  input  logic [3:0]                      Layer,


  output logic                            LAYER_done,
output logic [3:0]out

 
);

    

    
    logic[$clog2(DATA_WIDTH_map):0]         im2_cnt;
    logic                                      write_en,update_adder,
                                               en_im2,im2_valid,setzeroA ,
                                               LAYER_rd_done,LAYER_cal_done,
                                               LAYER_aim_done,Last_Number;
    logic        [Pack-1:0]                     setzeroB;
    logic signed [DATA_WIDTH_map-1:0]          flattenA [CHUNK_M][CHUNK_K*Pack];
    logic signed [DATA_WIDTH_kernel-1:0]       flattenB [CHUNK_K*Pack][CHUNK_N];
    logic signed [DATA_WIDTH_kernel-1:0]       flattenA_buffer [CHUNK_M][CHUNK_K*Pack];
    logic signed [DATA_WIDTH_map-1:0]          flattenB_buffer [CHUNK_K*Pack][CHUNK_N];
    logic  [$clog2(MAX_Kernel_DEEPTH):0]       im2_flattenA_Adder[Pack] ;
    logic  [$clog2(MAX_Map_DEEPTH):0]          im2_flattenB_Adder[Pack] ;
    logic signed [2*(DATA_WIDTH_output):0]     layer4_sum[16];
    logic signed [DATA_WIDTH_output-1:0]       Final_layer[10];
    logic signed [DATA_WIDTH_output-1:0]       Sum;
  /////////////// 内部常量 & Block-RAM //////////////////////////////////
  localparam int ADDR_W = $clog2(MAX_Map_DEEPTH);

  logic  [DATA_WIDTH_kernel*Pack-1:0] Data_wide_kernel;
  
  (* ram_style="distributed" *)
  reg  [DATA_WIDTH_output*Pack-1:0] layer_ram1 [0:(MAX_Map_DEEPTH+ Pack - 1)/Pack-1];
  (* ram_style="distributed" *)
  reg  [DATA_WIDTH_output*Pack-1:0] layer_ram2 [0:(MAX_Map_DEEPTH+ Pack - 1)/Pack-1];
    (* ram_style="distributed" *)
  reg  [DATA_WIDTH_kernel*Pack-1:0] Kernel_input1 [0:(Kernel1_DEEPTH+ Pack - 1)/Pack-1];
  (* ram_style="distributed" *)                                  
  reg  [DATA_WIDTH_kernel*Pack-1:0] Kernel_input2 [0:(Kernel2_DEEPTH+ Pack - 1)/Pack-1];
    (* ram_style="distributed" *)                                
  reg  [DATA_WIDTH_kernel*Pack-1:0] Kernel_input3 [0:(Kernel3_DEEPTH+ Pack - 1)/Pack-1];
  (* ram_style="distributed" *)                                  
  reg  [DATA_WIDTH_kernel*Pack-1:0] Kernel_input4 [0:(Kernel4_DEEPTH+ Pack - 1)/Pack-1];
   (* ram_style="distributed" *)                                 
  reg  [DATA_WIDTH_kernel*Pack-1:0] Kernel_input5 [0:(Kernel5_DEEPTH+ Pack - 1)/Pack-1];
  (* ram_style="distributed" *)                                  
  reg  [DATA_WIDTH_kernel*Pack-1:0] Kernel_input6 [0:(Kernel6_DEEPTH+ Pack - 1)/Pack-1];
  (* ram_style="distributed" *)
  reg signed [DATA_WIDTH_bias-1:0] Bias1 [6];
  (* ram_style="distributed" *)
  reg signed [DATA_WIDTH_bias-1:0] Bias2 [6];
  (* ram_style="distributed" *)
  reg signed [DATA_WIDTH_bias-1:0] Bias3 [16];
  (* ram_style="distributed" *)
  reg signed [DATA_WIDTH_bias-1:0] Bias4 [16];
  (* ram_style="distributed" *)
  reg signed [DATA_WIDTH_bias-1:0] Bias5 [32];
  (* ram_style="distributed" *)
  reg signed [DATA_WIDTH_bias-1:0] Bias6 [10];

  
  /////////////// 计数器 / 寄存器（保持与你原版一致） ///////////////////
  logic signed [DATA_WIDTH_output-1:0] bias[CHUNK_N];
  logic [15:0] t, rd_k, rd_n, rd_mi,rd_mj,zero_padding_cnt0,zero_padding_cnt1,
                col_padding,row_padding,cal_n,cal_m,cal_k,aim_row_padding,aim_col_padding,
                aim_mi,aim_mj,cal_mi,cal_mj;
  logic [15:0] aim_n, aim_m,aim_k;          // 用于 idx 计算
  logic signed [DATA_WIDTH_output-1:0] GEMM_Result [0:0]; // CHUNK_N = 1
  logic [15:0]   global_row, global_col, Adder, Adder_Layer1,Adder_Reg,Adder_Padding,zero_padding_row,zero_padding_col;
  // 其他控制信号略（只要保持和你原版一致即可）
wire use_ram1 = (Layer == 0||Layer == 2||Layer == 4);
  //////////////////// 同步状态机示例 - 只含计数骨架 /////////////////////

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      t <= 0; rd_k <= 0; rd_n <= 0; rd_mi <= 0;rd_mj <= 0;update_adder<=0;
       cal_k <= 0; cal_n <= 0; cal_m <= 0; aim_mi<= 0;aim_mj<= 0;
       aim_k <= 0; aim_n <= 0; aim_m <= 0;cal_mi<= 0;cal_mj<= 0;
      LAYER_rd_done <= 0; LAYER_aim_done <= 0;LAYER_cal_done <= 0;
      zero_padding_cnt0<=0;zero_padding_cnt1<=0;
      row_padding<=0;col_padding<=0; 
      for(int i=0;i<16;i++) 
        layer4_sum[i]<=0;
      for(int i=0;i<10;i++) 
        Final_layer[i]<=0;
    end
    else begin
      
//if(im2_done)
if(LAYER_done)begin
      t <= 0;   
      cal_n   <=0;cal_m   <=0;cal_k   <=0; aim_mi<= 0;aim_mj<= 0;
      aim_n   <=0;aim_m   <=0;aim_k   <=0;cal_mi<= 0;cal_mj<= 0;
      rd_n    <=0;rd_k    <=0;rd_mi    <=0;rd_mj    <=0; 
     
end else begin
    if (t == DATA_WIDTH_map-1) begin
      t <= 0;
      cal_n   <= rd_n;
      cal_m   <= rd_mi * Mij + rd_mj;
      cal_k   <= rd_k;
      cal_mi  <=rd_mi;
      cal_mj  <=rd_mj;
      aim_n   <=   cal_n;
      aim_m   <=   cal_m;
      aim_k   <=   cal_k;
      aim_mi  <=cal_mi;
      aim_mj  <=cal_mj;
      if ((rd_k+1)*CHUNK_K*Pack >= K) begin
        rd_k <= 0;
        if (rd_n+1 >= N) begin
          rd_n <= 0;
          // 下面这段改成 if-else，确保 mi 只赋一次
          if (rd_mj + 1 >= Mij) begin
            rd_mj <= 0;
            if (rd_mi + 1 >= Mij)
              rd_mi <= 0;
            else
              rd_mi <= rd_mi + 1;
          end else begin
            rd_mj <= rd_mj + 1;
          end
        end else begin
          rd_n <= rd_n + 1;
        end
      end else begin
        rd_k <= rd_k + 1;
      end
    end else begin
      t <= t + 1;
    end
    
end
if(!LAYER_done)begin
 if((t==DATA_WIDTH_map-1)&&((rd_k+1)*CHUNK_K*Pack >= K) 
    &&((rd_n+1)*CHUNK_N >= N)&&(rd_mi+1>= Mij)&&(rd_mj+1>= Mij))
        LAYER_rd_done<=1;
 if((t==DATA_WIDTH_map-1)&&((cal_k+1)*CHUNK_K*Pack >= K) 
     &&((cal_n+1)*CHUNK_N >= N)&&(cal_m+1>= M))
        LAYER_cal_done<=1;
 if((t==1)&&((aim_k+1)*CHUNK_K*Pack >= K) 
    &&((aim_n+1)*CHUNK_N >= N)&&(aim_m+1>= M))
        LAYER_aim_done<=1;
end else begin
    LAYER_rd_done<=0;
    LAYER_cal_done<=0;
    LAYER_aim_done<=0;
  end  

    if(im2_cnt==DATA_WIDTH_map-1)
        begin
        for (int i=0; i<CHUNK_K*Pack; i=i+1) begin
            flattenB[i][0]<=flattenA_buffer[0][i];
            flattenA[0][i]<=flattenB_buffer[i][0];
            end
        end     
    if(!write_en)begin
        if(zero_padding_cnt0==next_Y1+next_Y2-1)begin
            zero_padding_cnt1<=zero_padding_cnt1+1;
            zero_padding_cnt0<=0;
            if(zero_padding_cnt1==next_Y3)begin
                zero_padding_cnt1<=0;
            end
        end else begin
            zero_padding_cnt0<=zero_padding_cnt0+1;
        end
    end  

    if(Layer==3&&(t==0))
         layer4_sum[cal_n]<=layer4_sum[cal_n]+GEMM_Result[0];
   // else if((t == DATA_WIDTH_map-1)&&(aim_k+1)*CHUNK_K>=K&&(aim_m + 1 >= M))
   //     layer4_sum[aim_n]<=0;
   if(Layer==5&&(t==0))
        Final_layer[cal_n]<=Final_layer[cal_n]+GEMM_Result[0];
    end
  end

  //////////////////// idx 计算 /////////////////////////////////////////

  always_comb begin
    global_row = aim_m * CHUNK_M;
    global_col = aim_n * CHUNK_N;
    
    if(Layer==0||Layer==2)   
        Adder_Layer1= ((aim_mi +1)* (Mij +1) +  aim_mj+1)+  aim_n *  padding_M;
    else if(Layer==1)
        Adder_Layer1= global_row + global_col * M;  
    else if(Layer==3||Layer==4||Layer==5)
        Adder_Layer1= aim_n; 

        
        
    if (zero_padding_cnt0 < next_Y1) begin
        zero_padding_row = zero_padding_cnt0;             // 首行
        zero_padding_col = 0;            // 0 … 28
    end else begin
        zero_padding_row = 0;    // 1 … 28
        zero_padding_col = zero_padding_cnt0 - next_Y1-1;             // 首列
    end
        Adder_Padding=zero_padding_cnt1 *padding_M+zero_padding_row+zero_padding_col*next_Y1;

  end

  //////////////////// Block-RAM 读写 ///////////////////////////////////
  



  assign LAYER_done  =(LAYER_rd_done&&LAYER_cal_done&&LAYER_aim_done);
  assign en_im2= ~LAYER_rd_done;   
  assign en_cal= im2_done &&(~LAYER_cal_done);
  
  assign write_en = (t==1) ;
  assign padding_en=((Layer==0)||(Layer==2))&&(t!=1);  
  assign Last_Number=((aim_k+1)*CHUNK_K*Pack >= K);
 localparam int LG_PACK = $clog2(Pack);
 logic [$clog2(MAX_Map_DEEPTH + Pack - 1):0]                         Deep_address_B[Pack]; 
 logic [LG_PACK-1:0]                                                 Word_address_B[Pack]; 
 logic [$clog2(MAX_Map_DEEPTH + Pack - 1):0]                         Deep_Layer_address,Deep_Padding_address; 
 logic [LG_PACK-1:0]                                                 Word_Layer_address,Word_Padding_address; 
 logic [$clog2(Kernel3_DEEPTH+ Pack - 1):0]                          Deep_address_A[Pack]; 
 logic [LG_PACK-1:0]                                                 Word_address_A[Pack]; 

  always_comb begin
  for(int i=0;i<Pack;i++)begin
    Word_address_B[i] = (Pack>1 ?im2_flattenB_Adder[i][LG_PACK-1:0]:0);       // = im2_flattenB_Adder % Pack
    Deep_address_B[i] = im2_flattenB_Adder[i] >> LG_PACK;                     // = im2_flattenB_Adder / Pack
    Word_address_A[i] = (Pack>1 ?im2_flattenA_Adder[i][LG_PACK-1:0]:0);  // = im2_flattenA_Adder % Pack
    Deep_address_A[i] = im2_flattenA_Adder[i] >> LG_PACK;    // = im2_flattenA_Adder / Pack
  end
  
    Word_Layer_address=(Pack>1 ?Adder_Layer1[LG_PACK-1:0]:0); 
    Deep_Layer_address=Adder_Layer1>> LG_PACK; 
    Word_Padding_address=(Pack>1 ?Adder_Padding[LG_PACK-1:0]:0); 
    Deep_Padding_address=Adder_Padding>> LG_PACK;
  end
  
  logic signed [DATA_WIDTH_output*Pack-1:0] wide_out_B;
  reg signed [DATA_WIDTH_output-1:0] old_data;
  always_ff @(posedge clk)
  if(!rst)
   if(use_ram1)begin
    old_data <= layer_ram1[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map];   
       if(im2_valid)
        for (int p = 0; p < Pack; p++)
         flattenB_buffer [im2_cnt*Pack + p][0]<=setzeroB[p] ? 0 :layer_ram2[Deep_address_B[p]][Word_address_B[p]*DATA_WIDTH_map +: DATA_WIDTH_map];
   end else begin
    old_data <= layer_ram2[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map];
      if(im2_valid)
       for (int p = 0; p < Pack; p++)
        flattenB_buffer [im2_cnt*Pack + p][0]<=setzeroB[p] ? 0 :layer_ram1[Deep_address_B[p]][Word_address_B[p]*DATA_WIDTH_map[p] +: DATA_WIDTH_map];
   end
 

    
            
  assign Sum=old_data + GEMM_Result[0];
  always_ff @(posedge clk)
    if (write_en)begin
      if(Layer!=3&&Layer!=5)begin
        if(use_ram1)
            if((aim_k==0)&&Last_Number)
                layer_ram1[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  (GEMM_Result[0]>0)?GEMM_Result[0]:{DATA_WIDTH_map{1'b0}};
            else if(aim_k==0)
                layer_ram1[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  GEMM_Result[0]; 
            else if(Last_Number)
                layer_ram1[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map]<=(Sum>0)?(Sum):{DATA_WIDTH_map{1'b0}};
            else    
                layer_ram1[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <= Sum; 
        else 
            if((aim_k==0)&&Last_Number)
                layer_ram2[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  (GEMM_Result[0]>0)?GEMM_Result[0]:{DATA_WIDTH_map{1'b0}}; 
            else if(aim_k==0)
                layer_ram2[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  GEMM_Result[0]; 
            else if(Last_Number)
                layer_ram2[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map]<=(Sum>0)?(Sum):{DATA_WIDTH_map{1'b0}};
            else
                layer_ram2[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <= Sum; 
       end else if((rd_mj + 1 >= Mij)&&(rd_mi + 1 >= Mij)&&(rd_k+1)*CHUNK_K >= K)begin
                layer_ram2[Deep_Layer_address][Word_Layer_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  ((layer4_sum[Adder_Layer1] <<< 5)+ (layer4_sum[Adder_Layer1] <<< 3) +  layer4_sum[Adder_Layer1])>>>10;  
                        
                end 
    end else  if(padding_en)
            if(use_ram1)
                layer_ram1[Deep_Padding_address][Word_Padding_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  {DATA_WIDTH_map{1'b0}}; 
            else 
                layer_ram2[Deep_Padding_address][Word_Padding_address*DATA_WIDTH_map +: DATA_WIDTH_map] <=  {DATA_WIDTH_map{1'b0}}; 
    
    
    
int max_val;
always_comb begin
if(Layer==6)begin
  max_val = Final_layer[0];
  out = 0;
  for (int i = 1; i < 10; i++) begin
    if (Final_layer[i] > max_val) begin
      max_val = Final_layer[i];
      out = i;
        end
     
     end

  end

  
  
end
    
    
    

im2 #(
  .DATA_WIDTH_map        (DATA_WIDTH_map),
  .MAX_X1           (MAX_X1),
  .MAX_X2           (MAX_X2),
  .MAX_X3           (MAX_X3),
  .MAX_Y1           (MAX_Y1),
  .MAX_Y2           (MAX_Y2),
  .MAX_Map_DEEPTH   (MAX_Map_DEEPTH),
  .MAX_Kernel_DEEPTH(MAX_Kernel_DEEPTH),
  .CHUNK_K          (CHUNK_K),
  .Pack             (Pack)
) u_im2 (
  .clk (clk),.rst (rst),
  .X1(X1),.X2(X2),.X3(X3),.Y1(Y1),.Y2 (Y2),
  .patch_i (rd_mi), .patch_j (rd_mj),
  .n  (rd_n), .k_grp (rd_k),         
  .en_im2         (en_im2), 
  .valid1          (im2_valid),
  .flattenA_addr  (im2_flattenA_Adder),
  .flattenB_addr  (im2_flattenB_Adder),
  .done           (im2_done),
  .k_cnt          (im2_cnt),
  .setzeroB        (setzeroB),
  .STRIDE           (STRIDE)
);

  Array_Input #(
      .DATA_WIDTH_A(DATA_WIDTH_map),
      .DATA_WIDTH_B(DATA_WIDTH_kernel),
      .DATA_WIDTH_bias(DATA_WIDTH_bias),
      .DATA_WIDTH_output(DATA_WIDTH_output),
      .M(CHUNK_M), .N(CHUNK_N), .K(CHUNK_K*Pack)
  ) u_Array_Input (
      .clk(clk), .rst(rst),
      .gen_done(en_cal),.bias_en(0),
      .A(flattenA), .B(flattenB),.bias(bias),
      .final_out(GEMM_Result)
  );
function automatic [Pack*DATA_WIDTH_map-1:0] prand
(
  input [Pack*DATA_WIDTH_map-1:0] idx
);
  // 位宽别名
  localparam int N = Pack*DATA_WIDTH_map;
  typedef logic [N-1:0] uN_t;

  // 常量（按 N 位截断/扩展），混洗强、各位近似独立
  localparam uN_t C1 = uN_t'(64'h9E3779B97F4A7C15);
  localparam uN_t C2 = uN_t'(64'hBF58476D1CE4E5B9);
  localparam uN_t C3 = uN_t'(64'h94D049BB133111EB);

  uN_t x;
  x  = uN_t'(idx) + C1;
  x ^= (x >> 30);
  x  = uN_t'(x * C2);   // 结果会被安全截断为 N 位
  x ^= (x >> 27);
  x  = uN_t'(x * C3);
  x ^= (x >> 31);
  return x;             // N 位输出
endfunction






always_ff @(posedge clk) begin
if(!rst)
  if (im2_valid) begin

        unique case (Layer)
        3'd0: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <=
                setzeroB[p] ? 0 :Kernel_input1[Deep_address_A[p]][Word_address_A[p]*DATA_WIDTH_kernel +: DATA_WIDTH_kernel];
        end
        3'd1: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <=
              setzeroB[p] ? 0 :Kernel_input2[Deep_address_A[p]][Word_address_A[p]*DATA_WIDTH_kernel +: DATA_WIDTH_kernel];
        end
        3'd2: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <=
              setzeroB[p] ? 0 :Kernel_input3[Deep_address_A[p]][Word_address_A[p]*DATA_WIDTH_kernel +: DATA_WIDTH_kernel];
        end
        3'd3: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <=
              setzeroB[p] ? 0 :Kernel_input4[Deep_address_A[p]][Word_address_A[p]*DATA_WIDTH_kernel +: DATA_WIDTH_kernel];
        end
        3'd4: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <=
              setzeroB[p] ? 0 :Kernel_input5[Deep_address_A[p]][Word_address_A[p]*DATA_WIDTH_kernel +: DATA_WIDTH_kernel];
        end
        3'd5: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <=
              setzeroB[p] ? 0 :Kernel_input6[Deep_address_A[p]][Word_address_A[p]*DATA_WIDTH_kernel +: DATA_WIDTH_kernel];
        end
        default: begin
          for (int p = 0; p < Pack; p++)
            flattenA_buffer[0][im2_cnt*Pack + p] <= '0;
        end
        endcase 
    end
  end



always_ff @(posedge clk) begin
if(!rst)
  if (im2_valid) begin
    unique case (Layer)
      3'd0: bias[0] <= Bias1[aim_n];
      3'd1: bias[0] <= Bias2[aim_n];
      3'd2: bias[0] <= Bias3[aim_n];
      3'd3: bias[0] <= Bias4[aim_n];
      3'd4: bias[0] <= Bias5[aim_n];
      3'd5: bias[0] <= Bias6[aim_n];
      default: bias[0] <=0;
    endcase
  end
end


initial begin 
    integer i;
    for (i = 0; i < 5046; i++)begin
        layer_ram2[i] = prand(i); 
        Kernel_input1[i]= prand(i);
        Kernel_input2[i]= prand(i);
        Kernel_input3[i]= prand(i);
        Kernel_input4[i]= prand(i);
        Kernel_input5[i]= prand(i);
        Kernel_input6[i]= prand(i);
   end


  for (i = 0; i < 6; i = i + 1) begin
    Bias1[i] = (i + 1) * 10;
    Bias2[i] = (i + 1) * 10;
  end

  for (i = 0; i < 16; i = i + 1) begin
    Bias3[i] = (i + 1) * 10;
    Bias4[i] = (i + 1) * 10;
  end

  for (i = 0; i < 32; i = i + 1) begin
    Bias5[i] = (i + 1) * 10;
  end


  for (i = 0; i < 10; i = i + 1) begin
    Bias6[i] = (i + 1) * 10;
 end

end
endmodule
