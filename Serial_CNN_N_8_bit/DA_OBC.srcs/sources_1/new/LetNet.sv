//LetNet-5

`timescale 1ns / 1ps
module LetNet #(
    parameter int DATA_WIDTH_map          = 8,
    parameter int DATA_WIDTH_kernel       = 8,
    parameter int DATA_WIDTH_bias         = 8,
    parameter int DATA_WIDTH_output       = 8,
    parameter int NUM_LAYERS              = 6,
    parameter int MAX_X1                  =5,//1//1//3//5//3//5
    parameter int MAX_X2                  =5,//1//1//3//5//3//5
    parameter int MAX_X3                  =32,//32//16//16//6//6//1
    parameter int MAX_X4                  =32,//10//32//16//16//6//6
    parameter int MAX_Y1                  =32,//1//1//11//14//29//32
    parameter int MAX_Y2                  =32,//1//1//11//14//29//32
    parameter int MAX_Y3                  = MAX_X3,
    parameter int MAX_M                   = 784,
    parameter int MAX_K                   = 150,
    parameter int MAX_N                   = 32,
    parameter int CHUNK_M                 = 1,  
    parameter int CHUNK_K                 = 7,  //25
    parameter int CHUNK_N                 = 1,   


    parameter int MAX_Map_DEEPTH          = 5046,
    parameter int MAX_Kernel_DEEPTH       = 2400,
    parameter int MAX_Layer_DEEPTH        = 4704,
    parameter int Kernel1_DEEPTH          = 150,
    parameter int Kernel2_DEEPTH          = 324,
    parameter int Kernel3_DEEPTH          = 2400,
    parameter int Kernel4_DEEPTH          = 2304,
    parameter int Kernel5_DEEPTH          = 512,
    parameter int Kernel6_DEEPTH          = 320,
    parameter int Map_DEEPTH              = 1024
)(
    input  clk_p,
    input  clk_n,
    input  logic  rst ,
    output logic [3:0]out

);
  wire clk;
  IBUFGDS clkgen (
    .O(clk), .I(clk_p), .IB(clk_n)
  );
    logic [$clog2(MAX_X1):0]                X1;       
    logic [$clog2(MAX_X2):0]                X2;       
    logic [$clog2(MAX_X3):0]                X3;//通道   
    logic [$clog2(MAX_X4):0]                X4;//个数                          
    logic [$clog2(MAX_Y1):0]                Y1;      
    logic [$clog2(MAX_Y2):0]                Y2;      
    logic [$clog2(MAX_Y3):0]                Y3;//通道                                           
    logic [2:0]                             STRIDE;  
    logic [1:0]                             STRIDE_base;
    
    logic [$clog2(MAX_M):0]                 padding_M;
    logic [$clog2(MAX_M):0]                 M,Mij;
    logic [$clog2(MAX_N):0]                 N;
    logic [$clog2(MAX_K):0]                 K;

    logic [$clog2(MAX_X1):0]                next_X1;       
    logic [$clog2(MAX_X2):0]                next_X2;       
    logic [$clog2(MAX_X3):0]                next_X3;//通道   
    logic [$clog2(MAX_X4):0]                next_X4;//个数                          
    logic [$clog2(MAX_Y1):0]                next_Y1;      
    logic [$clog2(MAX_Y2):0]                next_Y2;      
    logic [$clog2(MAX_Y3):0]                next_Y3;//通道                                           
    logic [2:0]                             next_STRIDE;  
    logic [1:0]                             next_STRIDE_base;

    logic [$clog2(MAX_M):0]                 next_M;
    logic [$clog2(MAX_N):0]                 next_N;
    logic [$clog2(MAX_K):0]                 next_K;




    logic        [3:0]                      Layer;
    logic                                   LAYER_done1,LAYER_done;


    logic        [1:0]                      next_Padding;
    int out_idx,in_r,in_col,in_idx;
      
   always_ff@(posedge clk or posedge rst)begin
   if(rst)begin//1
        Layer<=0;

   end else begin 
        if(Layer== 0&&LAYER_done==1)begin//2
            Layer<=1;

            end                 
        else if(Layer== 1&&LAYER_done==1)begin//3
             Layer<=2;

             end
           
        else if(Layer==2&&LAYER_done==1)begin//4
             Layer<=3;

           end
           
        else if(Layer==3&&LAYER_done==1)begin//5
          Layer<=4;

            end
        else if(Layer==4&&LAYER_done==1)begin//6
          Layer<=5;       

            end
        else if(Layer==5&&LAYER_done==1)begin//end
            Layer<=6; 
          
            end

           
   end
end
   always_comb begin
        if(Layer==0) begin//(9DATA_WIDTH_kernel+1)*numM*numN*numK)
                //1 
                X1          =5;//1
                X2          =5;
                X3          =1;
                X4          =6;
                Y1          =32;
                Y2          =32;
                Y3          =1;
                STRIDE_base =0;
            
                //X1*X2*NUM_K<=27      
                next_X1          =3;//1
                next_X2          =3;
                next_X3          =6;
                next_X4          =6;
                next_Y1          =29;
                next_Y2          =29;
                next_Y3          =6;
                next_STRIDE_base =1;
                next_Padding     =1;
 
        end else if(Layer== 1)begin
                X1         =3;//2
                X2         =3;
                X3         =6;
                X4         =6;
                Y1         =29;
                Y2         =29;
                Y3         =6;
                STRIDE_base=1; 
             
         
                next_X1         =5;//3
                next_X2         =5;
                next_X3         =6;
                next_X4         =16;
                next_Y1         =14;
                next_Y2         =14;
                next_Y3         =6;
                next_STRIDE_base=0;  
                next_Padding    =0;
 
 
        end else if(Layer==2)begin
  //3      
                X1         =5;//3
                X2         =5;
                X3         =6;
                X4         =16;
                Y1         =14;
                Y2         =14;
                Y3         =6;
                STRIDE_base=0;  
          
                
                next_X1         =3;//4
                next_X2         =3;
                next_X3         =16;
                next_X4         =16;
                next_Y1         =11;
                next_Y2         =11;
                next_Y3         =16;
                next_STRIDE_base=1;
                next_Padding=1;

        end else if(Layer==3)begin
     //4
                X1         =3;//4
                X2         =3;
                X3         =16;
                X4         =16;
                Y1         =11;
                Y2         =11;
                Y3         =16;
                STRIDE_base=1;
                
                next_X1         =1;//5
                next_X2         =1;
                next_X3         =16;
                next_X4         =32;
                next_Y1         =1;
                next_Y2         =1;
                next_Y3         =16;
                next_STRIDE_base=0; 
                next_Padding    =0;

        end else if(Layer==4)begin
                X1         =1;//5
                X2         =1;
                X3         =16;
                X4         =32;
                Y1         =1;
                Y2         =1;
                Y3         =16;
                STRIDE_base=0;               
                next_Padding    =0;
                
        end else if(Layer==5)begin
                //6
                X1         =1;//6
                X2         =1;
                X3         =32;
                X4         =10;
                Y1         =1;
                Y2         =1;
                Y3         =32;
                STRIDE_base=0; 
                next_Padding    =0;

  
        end 

            N          =X4;
            K          =X3 * X2 * X1;
            padding_M  =((((Y1 - X1) >>> STRIDE_base) + 1)+next_Padding)*((((Y2 - X2) >>> STRIDE_base) + 1)+next_Padding);
            Mij         =((((Y1 - X1) >>> STRIDE_base) + 1));
            M          =((((Y1 - X1) >>> STRIDE_base) + 1))*((((Y2 - X2) >>> STRIDE_base) + 1));
            STRIDE     =1<<<STRIDE_base;
   end
   

layerX #(
  // ---- 卷积核深度 ----
  .Kernel1_DEEPTH     (Kernel1_DEEPTH),
  .Kernel2_DEEPTH     (Kernel2_DEEPTH),
  .Kernel3_DEEPTH     (Kernel3_DEEPTH),
  .Kernel4_DEEPTH     (Kernel4_DEEPTH),
  .Kernel5_DEEPTH     (Kernel5_DEEPTH),
  .Kernel6_DEEPTH     (Kernel6_DEEPTH),
  // ---- 数据位宽 ----
  .DATA_WIDTH_kernel  (DATA_WIDTH_kernel),
  .DATA_WIDTH_map     (DATA_WIDTH_map),
  .DATA_WIDTH_bias    (DATA_WIDTH_bias),
  .DATA_WIDTH_output  (DATA_WIDTH_output),
  // ---- 尺寸最大值 ----
  .MAX_X1             (MAX_X1),
  .MAX_X2             (MAX_X2),
  .MAX_X3             (MAX_X3),
  .MAX_X4             (MAX_X4),
  .MAX_Y1             (MAX_Y1),
  .MAX_Y2             (MAX_Y2),
  .MAX_Y3             (MAX_Y3),
  // ---- M/N/K 最大值 ----
  .MAX_M              (MAX_M),
  .MAX_N              (MAX_N),
  .MAX_K              (MAX_K),
  // ---- 深度最大值 ----
  .MAX_Map_DEEPTH     (MAX_Map_DEEPTH),
  .MAX_Kernel_DEEPTH  (MAX_Kernel_DEEPTH),
  // ---- 分块大小 ----
  .CHUNK_M            (CHUNK_M),
  .CHUNK_K            (CHUNK_K),
  .CHUNK_N            (CHUNK_N)
) u_layerX (
  // 时钟与复位
  .clk            (clk),
  .rst            (rst),
  // 尺寸 / 步幅 / 通道下标
  .X1             (X1),
  .X2             (X2),
  .X3             (X3),
  .X4             (X4),
  .Y1             (Y1),
  .Y2             (Y2),
  .Y3             (Y3),
  .STRIDE         (STRIDE),
  .next_Y1        (next_Y1),
  .next_Y2        (next_Y2),
  .next_Y3        (next_Y3),
  .padding_M      (padding_M),
  // 矩阵维度
  .M              (M),
  .Mij            (Mij),
  .N              (N),
  .K              (K),
  // 层序号与完成标志
  .Layer          (Layer),
  .LAYER_done     (LAYER_done),
  // 输出
  .out            (out)
);

endmodule
