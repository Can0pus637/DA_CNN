`timescale 1ns / 1ps

module tb_LetNet;
  // Parameters (must match DUT)
    localparam int DATA_WIDTH_map    = 8;
    localparam int DATA_WIDTH_kernel = 8;
    localparam int Map_DEEPTH        = 32*32;
    localparam int Kernel1_DEEPTH    = 150;
    localparam int Kernel2_DEEPTH    = 324;
    localparam int Kernel3_DEEPTH    = 2400;
    localparam int Kernel4_DEEPTH    = 2304;
    localparam int Kernel5_DEEPTH    = 512;
    localparam int Kernel6_DEEPTH    = 320;
    localparam int M_tile                = 1;
    localparam int K_tile                = 6;
    localparam int N_tile                = 1;
    localparam int CHUNK_M               = 1;
    localparam int CHUNK_K               = 6;
    localparam int CHUNK_N               = 1;

  // DUT I/Os
  reg           clk_p, clk_n, rst;
  wire          clk,write;
  wire [3:0]    out;
    logic print_enable;
  // Instantiate differential clock input buffer
  IBUFGDS clkgen (
    .O(clk),
    .I(clk_p),
    .IB(clk_n)
  );

  // Instantiate DUT
  LetNet u_LetNet (
    .clk_p(clk_p),
    .clk_n(clk_n),
    .rst  (rst),
    .out  (out)
  );

  // Clock generation
  initial begin
    clk_p = 0;

    forever #5 clk_p = ~clk_p;
  end
  initial begin
    clk_n = 1;
    forever #5 clk_n = ~clk_n;
  end

  // Release reset after a few cycles
  initial begin
    rst = 1;
    repeat (10) @(posedge clk);
    rst = 0;
  end

  // Optional: finish after a fixed time


  //-------------------------------------------------------------------------------
  // Print every clock edge via always_ff
  //-------------------------------------------------------------------------------
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
    
    print_enable <= 0;
    end else begin
      if (!rst 
      && // (u_LetNet.u_layerX.t==0)
      //&&u_LetNet.u_layerX.rd_k==0
      //&&u_LetNet.u_layerX.rd_n==0
     // &&u_LetNet.u_layerX.rd_mi==0
     // ||
     (
     // u_LetNet.u_layerX.Layer==4||
      u_LetNet.u_layerX.LAYER_done==1)
      
      ) begin






     
      
      

      $display("im2_flattenA_addr = %0d",  u_LetNet.u_layerX.im2_flattenA_Adder);
      $display("im2_flattenB_addr = %0d",  u_LetNet.u_layerX.im2_flattenB_Adder);

      //dump_kernel1( u_LetNet.u_layerX.Kernel_input1);
  
      //print_layer_ram2_layer2();dump_kernel2( u_LetNet.u_layerX.Kernel_input2);
   
      //print_layer_ram1_layer3();//dump_kernel3( u_LetNet.u_layerX.Kernel_input3);
    
      //print_layer_ram2_layer4();
      //dump_kernel4( u_LetNet.u_layerX.Kernel_input4);
     
      //print_layer_ram1_layer5();dump_kernel5( u_LetNet.u_layerX.Kernel_input5);
     
     // print_layer_ram2_layer6();dump_kernel6( u_LetNet.u_layerX.Kernel_input1);
     
      //print_LAYER_Result();
      
      $display("time[%0t] ", $time);
      $display("layer_ram1[Adder_Layer1] = %0d",  u_LetNet.u_layerX.layer_ram1[ u_LetNet.u_layerX.Adder_Layer1]);
      
      //$display("row_data_kernel1 = %b", row_data_kernel1);
      //$display("row_data_map     = %b", row_data_map);
      //$display("addr             = %0d",addr);
      //$display("rst_Net          = %0d",rst_Net);
      $display("old_data = %0d",    u_LetNet.u_layerX.old_data);
      $display("col_padding = %0d", u_LetNet.u_layerX.col_padding);
      $display("row_padding = %0d", u_LetNet.u_layerX.row_padding);
      $display("Adder_Layer1 = %0d",u_LetNet.u_layerX.Adder_Layer1);

      $display("Layer=%0d  M=%0d N=%0d K=%0d,out = %0d ",
                 u_LetNet.Layer,   u_LetNet.M,  u_LetNet.N,  u_LetNet.K,out);
      
      $display("LAERY.t = %0d,cal_k = %0d cal_m=%0d cal_n=%0d  ",
                u_LetNet.u_layerX.t,  u_LetNet.u_layerX.cal_k,  u_LetNet.u_layerX.cal_m, u_LetNet.u_layerX.cal_n);
      $display("LAERY.t = %0d,aim_k = %0d aim_m=%0d aim_n=%0d  ",
                 u_LetNet.u_layerX.t,  u_LetNet.u_layerX.aim_k,  u_LetNet.u_layerX.aim_m, u_LetNet.u_layerX.aim_n);  
      $display("C_out = %0d",
                u_LetNet.u_layerX.u_Array_Input.C_out[0]);
      $display("row_padding = %0d,col_padding = %0d",
                u_LetNet.u_layerX.row_padding, u_LetNet.u_layerX.col_padding);         
               
      $display("ArrayInput t=%0d ",  u_LetNet.u_layerX.u_Array_Input.t);
      $display("im2_cnt = %0d im2_done = %0d",  u_LetNet.u_layerX.im2_cnt, u_LetNet.u_layerX.im2_done);
      $display("C_out",  u_LetNet.u_layerX.u_Array_Input.C_out[0]);
     

      print_GEMM_Result();
      $display("layer4_sum0=%d layer4_sum1=%d layer4_sum2=%d layer4_sum3=%d",  u_LetNet.u_layerX.layer4_sum[0], u_LetNet.u_layerX.layer4_sum[1], u_LetNet.u_layerX.layer4_sum[2], u_LetNet.u_layerX.layer4_sum[3]);
      

      $display("im2_flattenA_Adder",  u_LetNet.u_layerX.im2_flattenA_Adder);
      $display("im2_flattenB_Adder",  u_LetNet.u_layerX.im2_flattenB_Adder);
      if( u_LetNet.u_layerX.Layer==0) begin
            print_layer_ram2_start();print_layer_ram1_layer1();
      end
      if( u_LetNet.u_layerX.Layer==1) begin
            print_layer_ram2_layer2();
      end
      if( u_LetNet.u_layerX.Layer==2) begin
            print_layer_ram1_layer3();
      end
      if( u_LetNet.u_layerX.Layer==3) begin
            print_layer_ram2_layer4();
      end       
      if( u_LetNet.u_layerX.Layer==4) begin
            print_layer_ram1_layer5();
      end
      if( u_LetNet.u_layerX.Layer==5) begin
            Final_result();
      end
     // if( u_LetNet.u_layerX.Layer==5) begin
           // print_layer_ram2_layer6();
      //end
      $display("STRIDE",  u_LetNet.u_layerX.STRIDE);
      $display("LAERY.t = %0d,rd_k = %0d rd_mi=%0d rd_mj=%0d rd_n=%0d LAYER_done=%0d LAYER_rd_done=%0d LAYER_cal_done=%0d LAYER_aim_done=%0d  ",
                u_LetNet.u_layerX.t,   u_LetNet.u_layerX.rd_k,  u_LetNet.u_layerX.rd_mi,  u_LetNet.u_layerX.rd_mj, u_LetNet.u_layerX.rd_n,
                u_LetNet.u_layerX.LAYER_done,  u_LetNet.u_layerX.LAYER_rd_done,  u_LetNet.u_layerX.LAYER_cal_done,  u_LetNet.u_layerX.LAYER_aim_done);
      $display("v_idx = %0d",  u_LetNet.u_layerX.u_im2.v_idx);
      $display("u_idx = %0d",  u_LetNet.u_layerX.u_im2.u_idx);
      $display("c_idx = %0d",  u_LetNet.u_layerX.u_im2.c_idx);
      $display("Last_Number = %0d",  u_LetNet.u_layerX.Last_Number);
      $display("setzeroA = %0d",  u_LetNet.u_layerX.setzeroA);
      $display("setzeroB = %0d",  u_LetNet.u_layerX.setzeroB);
      print_flattenA_reg();
      print_flattenB_reg();
      print_flattenA();
      print_flattenB();
      $display("--------------------------------------------------");
      end
    end
  end

  //-------------------------------------------------------------------------------
  // Tasks to display arrays
  //-------------------------------------------------------------------------------
  
  
task Final_result;
      for (int i = 0; i < 10; i++) begin
        $write("Final_result \n ",);
        $write("%0d  ",   u_LetNet.u_layerX.Final_layer[i]);
        end
         $write("\n");
endtask
  task display_map;
    integer i;
    begin
      $display("\n--- Map_input (total %0d elements) ---", Map_DEEPTH);
      for (i = 0; i < Map_DEEPTH; i++) begin
        $write("%0d ",   u_LetNet.u_layerX.layer_ram2[i]);
        if ((i+1) % 32 == 0) $write("\n");
      end
      $display("\n--------------------------------------");
    end
  endtask

  task display_kernel1;
    integer i;
    begin
      $display("\n--- Kernel1_input (total %0d elements) ---", Kernel1_DEEPTH);
      for (i = 0; i < Kernel1_DEEPTH; i++) begin
        $write("%0d ",    u_LetNet.u_layerX.Kernel_input1[i]);
        if ((i+1) % 16 == 0) $write("\n");
      end
      $display("\n-----------------------------------------");
    end
  endtask

  task display_kernel2;
    integer i;
    begin
      $display("\n--- Kernel2_input (total %0d elements) ---", Kernel2_DEEPTH);
      for (i = 0; i < Kernel2_DEEPTH; i++) begin
        $write("%0d ",   u_LetNet.u_layerX.Kernel_input2[i]);
        if ((i+1) % 16 == 0) $write("\n");
      end
      $display("\n-----------------------------------------");
    end
  endtask

  task display_kernel3;
    integer i;
    begin
      $display("\n--- Kernel3_input (total %0d elements) ---", Kernel3_DEEPTH);
      for (i = 0; i < Kernel3_DEEPTH; i++) begin
        $write("%0d ",   u_LetNet.u_layerX.Kernel_input3[i]);
        if ((i+1) % 16 == 0) $write("\n");
      end
      $display("\n-----------------------------------------");
    end
  endtask

  task display_kernel4;
    integer i;
    begin
      $display("\n--- Kernel4_input (total %0d elements) ---", Kernel4_DEEPTH);
      for (i = 0; i < Kernel4_DEEPTH; i++) begin
        $write("%0d ",   u_LetNet.u_layerX.Kernel_input4[i]);
        if ((i+1) % 16 == 0) $write("\n");
      end
      $display("\n-----------------------------------------");
    end
  endtask

  task display_kernel5;
    integer i;
    begin
      $display("\n--- Kernel5_input (total %0d elements) ---", Kernel5_DEEPTH);
      for (i = 0; i < Kernel5_DEEPTH; i++) begin
        $write("%0d ",  u_LetNet.u_layerX.Kernel_input5[i]);
        if ((i+1) % 16 == 0) $write("\n");
      end
      $display("\n-----------------------------------------");
    end
  endtask

  task display_kernel6;
    integer i;
    begin
      $display("\n--- Kernel6_input (total %0d elements) ---", Kernel6_DEEPTH);
      for (i = 0; i < Kernel6_DEEPTH; i++) begin
        $write("%0d ", u_LetNet.u_layerX.Kernel_input6[i]);
        if ((i+1) % 16 == 0) $write("\n");
      end
      $display("\n-----------------------------------------");
    end
  endtask
// =============================================================
// 把 kernel 打印成 MATLAB 赋值语句
// 调用后直接在仿真终端复制 → MATLAB 粘贴 → run
// 生成的变量名：kernel_<tag>      维度 [K_H K_W NUM_C oc_max] (int8)
// =============================================================
task automatic dump_kernel_block
  (input string tag,
   input int    oc_max,                 // 输出通道总数
   input int    NUM_C,                  // 输入通道数
   input int    K_H,                    // kernel height
   input int    K_W,                    // kernel width
   input logic signed [DATA_WIDTH_kernel-1:0] mem[]    // 扁平 kernel
  );
  int addr;
  string mvar;

  // ---------- MATLAB 变量名 ----------
  mvar = {"kernel_", tag};

  // ---------- 1) 预分配 ----------
  $display("%% ===== %s : MATLAB kernel dump =====", tag);
  $display("%s = zeros(%0d,%0d,%0d,%0d,'int8');\n",
           mvar, K_H, K_W, NUM_C, oc_max);

  // ---------- 2) 逐 block 打印 ----------
  for (int oc = 0; oc < oc_max; oc++) begin
      for (int c = 0; c < NUM_C; c++) begin
          // 起始行：kernel(:,:,Cin,Cout) = [
          $display("%s(:,:, %0d, %0d) = [", mvar, c+1, oc+1);

          for (int u = 0; u < K_H; u++) begin
              $write("    ");  // 缩进

              // 打一行数据
              for (int v = 0; v < K_W; v++) begin
                  addr = oc*(NUM_C*K_H*K_W) + c*(K_H*K_W) + u*K_W + v;
                  $write("%4d", mem[addr]);
                  if (v != K_W-1)  $write(" ");
              end

              // 行尾分号（除最后一行外加 ';'）
              if (u != K_H-1)
                  $display(";");
              else
                  $display("");
          end

          // 结束括号
          $display("];\n");
      end
  end
  $display("%% ===== dump finished =====\n");
endtask




//==============================================================
// ★ 六个"一键"任务 -- 直接打印整层
//==============================================================

// ① kernel1 : 6  ×1×5×5
task automatic dump_kernel1 (input logic signed [DATA_WIDTH_kernel-1:0] mem[]);
  dump_kernel_block("kernel1", /*oc_max=*/6,  /*NUM_C=*/1, 5, 5, mem);
endtask

// ② kernel2 : 6  ×6×3×3
task automatic dump_kernel2 (input logic signed [DATA_WIDTH_kernel-1:0] mem[]);
  dump_kernel_block("kernel2", /*oc_max=*/6,  /*NUM_C=*/6, 3, 3, mem);
endtask

// ③ kernel3 : 16 ×6×5×5
task automatic dump_kernel3 (input logic signed [DATA_WIDTH_kernel-1:0] mem[]);
  dump_kernel_block("kernel3", /*oc_max=*/16, /*NUM_C=*/6, 5, 5, mem);
endtask

// ④ kernel4 : 16 ×16×3×3
task automatic dump_kernel4 (input logic signed [DATA_WIDTH_kernel-1:0] mem[]);
  dump_kernel_block("kernel4", /*oc_max=*/16, /*NUM_C=*/16, 3, 3, mem);
endtask

// ⑤ kernel5 : 32 ×16×1×1
task automatic dump_kernel5 (input logic signed [DATA_WIDTH_kernel-1:0] mem[]);
  dump_kernel_block("kernel5", /*oc_max=*/32, /*NUM_C=*/16, 1, 1, mem);
endtask

// ⑥ kernel6 : 10 ×32×1×1
task automatic dump_kernel6 (input logic signed [DATA_WIDTH_kernel-1:0] mem[]);
  dump_kernel_block("kernel6", /*oc_max=*/10, /*NUM_C=*/32, 1, 1, mem);
endtask
//task print_layer_input_A;
//  int idx, ch, r, c;
//  begin
//    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
//    for (ch = 0; ch <  u_LetNet.Y3; ch++) begin
//      $display("map_input_ch%0d = [", ch);
//      for (r = 0; r <  u_LetNet.Y2; r++) begin
//        for (c = 0; c <  u_LetNet.Y1; c++) begin
//          idx = ch * ( u_LetNet.Y1 *  u_LetNet.Y2)
//              + r  *   u_LetNet.Y1
//              + c;
//          $write("%0d",  u_LetNet.layer_input_A[idx]);
//          if (c !=  u_LetNet.Y1-1)
//            $write(" ");
//        end
//        if (r !=  u_LetNet.Y2-1)
//          $write(";\n");
//        else
//          $write("\n");
//      end
//      $display("];\n");
//    end
//  end
//endtask
task print_layer_ram2_start;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 1; ch++) begin
      $display("Ram2_layer1_input_map");
      $display("map_input_RAM2  %0d = [", ch);
      for (r = 0; r < 32; r++) begin
        for (c = 0; c < 32; c++) begin
          idx = ch * (32 * 32)
              + r  *  32
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram2[idx]);
          if (c != 32)
            $write(" ");
        end
        if (r != 32-1)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask
task print_layer_ram1_layer1;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 2; ch++) begin
      $display("Ram1_layer1_Result&&layer2_Input");
      $display("map_input_RAM1  %0d = [", ch);
      for (r = 0; r < 29; r++) begin
        for (c = 0; c < 29; c++) begin
          idx = ch * (29 * 29)
              + r  *  29
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram1[idx]);
          if (c != 29)
            $write(" ");
        end
        if (r != 29-1)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask
  task print_layer_ram2_layer2;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 6; ch++) begin
    $display("Ram2_layer2");
      $display("map_input_RAM2  %0d = [", ch);
      for (r = 0; r < 14; r++) begin
        for (c = 0; c < 14; c++) begin
          idx = ch * (14 * 14)
              + r  *  14
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram2[idx]);
          if (c != 14)
            $write(" ");
        end
        if (r != 14)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask

task print_layer_ram1_layer3;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 16; ch++) begin
    $display("Ram1_layer3");
      $display("map_input_RAM1  %0d = [", ch);
      for (r = 0; r < 11; r++) begin
        for (c = 0; c < 11; c++) begin
          idx = ch * (11 * 11)
              + r  *  11
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram1[idx]);
          if (c != 11)
            $write(" ");
        end
        if (r != 11-1)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask
  
  task print_layer_ram2_layer4;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 16; ch++) begin
    $display("Ram2_layer4");
      $display("map_input_RAM1  %0d = [", ch);
      for (r = 0; r < 1; r++) begin
        for (c = 0; c < 1; c++) begin
          idx = ch * (1 * 1)
              + r  *  1
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram2[idx]);
          if (c != 1)
            $write(" ");
        end
        if (r != 1-1)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask
  task print_layer_ram1_layer5;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 32; ch++) begin
    $display("Ram1_layer5");
      $display("map_input_RAM1  %0d = [", ch);
      for (r = 0; r < 1; r++) begin
        for (c = 0; c < 1; c++) begin
          idx = ch * (1 * 1)
              + r  *  1
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram1[idx]);
          if (c != 1)
            $write(" ");
        end
        if (r != 1-1)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask
    task print_layer_ram2_layer6;
  int idx, ch, r, c;
  begin
    // 假设 layer_input_A 的维度是 [Y3][Y2][Y1] 展平的 Y3 个通道，每个通道 Y2 行 Y1 列
    for (ch = 0; ch < 10; ch++) begin
    $display("Ram2_layer6");
      $display("map_input_RAM1  %0d = [", ch);
      for (r = 0; r < 1; r++) begin
        for (c = 0; c < 1; c++) begin
          idx = ch * (1 * 1)
              + r  *  1
              + c;
          $write("%0d",  u_LetNet.u_layerX.layer_ram2[idx]);
          if (c != 1)
            $write(" ");
        end
        if (r != 1-1)
          $write(";\n");
        else
          $write("\n");
      end
      $display("];\n");
    end
  end
  endtask
  
  
  






task print_flattenA;
  integer mm, kk;
  // 输出头
  $display("flattenA = [");
  for (mm = 0; mm < CHUNK_M; mm = mm + 1) begin
    // 每行前面两个空格
    $write("  ");
    for (kk = 0; kk < CHUNK_K; kk = kk + 1) begin
      $write("%0d",  u_LetNet.u_layerX.flattenA[mm][kk]);
      if (kk < CHUNK_K-1)
        $write(", ");
    end
    // 行末加分号或换行
    if (mm < CHUNK_M-1)
      $write(";\n");
    else
      $write("\n");
  end
  // 输出尾
  $display("];");
endtask

task print_flattenA_reg;
  integer mm, kk;
  // 输出头
  $display("flattenA = [");
  for (mm = 0; mm < CHUNK_M; mm = mm + 1) begin
    // 每行前面两个空格
    $write("  ");
    for (kk = 0; kk < CHUNK_K; kk = kk + 1) begin
      $write("%0d",  u_LetNet.u_layerX.flattenA_buffer[mm][kk]);
      if (kk < CHUNK_K-1)
        $write(", ");
    end
    // 行末加分号或换行
    if (mm < CHUNK_M-1)
      $write(";\n");
    else
      $write("\n");
  end
  // 输出尾
  $display("];");
endtask
// ---------- print_flattenB (MATLAB 格式) ----------
task print_flattenB;
  integer kk, nn;
  $display("flattenB = [");
  for (kk = 0; kk < CHUNK_K; kk = kk + 1) begin
    $write("  ");
    for (nn = 0; nn < CHUNK_N; nn = nn + 1) begin
      $write("%0d",  u_LetNet.u_layerX.flattenB[kk][nn]);
      if (nn < CHUNK_N-1)
        $write(", ");
    end
    if (kk < CHUNK_K-1)
      $write(";\n");
    else
      $write("\n");
  end
  $display("];");
endtask
task print_flattenB_reg;
  integer kk, nn;
  $display("flattenB = [");
  for (kk = 0; kk < CHUNK_K; kk = kk + 1) begin
    $write("  ");
    for (nn = 0; nn < CHUNK_N; nn = nn + 1) begin
      $write("%0d",  u_LetNet.u_layerX.flattenB_buffer[kk][nn]);
      if (nn < CHUNK_N-1)
        $write(", ");
    end
    if (kk < CHUNK_K-1)
      $write(";\n");
    else
      $write("\n");
  end
  $display("];");
endtask
  // ------------------------------------------------------------
  // 按通道打印 LAYER_Result：N 个通道，每通道 M 个值
  // ------------------------------------------------------------
  task automatic print_LAYER_Result;
    integer ch, i, idx;
    begin
      $display("--- LAYER_Result 按通道输出: 共 %0d 通道 × 每通道 %0d 值 ---",  u_LetNet.N,  u_LetNet.M);
      for (ch = 0; ch <  u_LetNet.N; ch = ch + 1) begin
        $write("通道%0d:", ch);
        for (i = 0; i <  u_LetNet.M; i = i + 1) begin
          // 原始是一维数组，行主序存储：第 i 行第 ch 列
          idx = i  + ch*  u_LetNet.M;
          $write(" %0d",  u_LetNet.u_layerX.layer_ram1[idx]);
        end
        $write("\n");
      end
      $write("\n");
    end
  endtask


 task automatic print_C_mat;
    integer i, j;
    begin
      $display("--- C_mat^T [%0dx%0d] ---", N_tile, M_tile);
      // Now we have N_tile rows, each with M_tile columns
      for (i = 0; i < N_tile; i = i + 1) begin

          $write(" %0d ",  u_LetNet.u_layerX.GEMM_Result[i]);
        

      end
      $write("\n");
    end
  endtask
  task print_GEMM_Result;
    integer kk, nn;
    $display("--- GEMM_Result [%0dx%0d] ---", CHUNK_M, CHUNK_N);

      for (nn = 0; nn <CHUNK_N ; nn++)
        $write("\n %0d\n",  u_LetNet.u_layerX.GEMM_Result[nn]);
    
  endtask

endmodule
