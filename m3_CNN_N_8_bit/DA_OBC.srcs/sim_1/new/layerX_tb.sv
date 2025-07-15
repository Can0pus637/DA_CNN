`timescale 1ns/1ps

module tb_layerX;

  //==========================================================================
  // Parameters must match layerX defaults (override here for last layer)
  //==========================================================================
  localparam int DATA_WIDTH_kernel = 8;
  localparam int DATA_WIDTH_map    = 8;
  localparam int DATA_WIDTH_bias   = 8;
  localparam int DATA_WIDTH_output = 8;

  localparam int X1 = 5;
  localparam int X2 = 5;
  localparam int X3 = 1;
  localparam int X4 = 6;

  localparam int Y1 = 32;
  localparam int Y2 = 32;
  localparam int Y3 = X3;

  localparam int M_tile = 25;
  localparam int N_tile = 8;
  localparam int K_tile = 10;

  localparam int MAX_M = 784;
  localparam int MAX_N = 6;
  localparam int MAX_K = 150;

  
  localparam int CHUNK_M      = 100;
  localparam int CHUNK_K_MAX  = 27;
  localparam int CHUNK_N      = 4;

  //==========================================================================
  // Clock & reset
  //==========================================================================
  logic clk = 0, rst;
  always #5 clk = ~clk;   // 100 MHz

  initial begin
    rst = 1;
    #20;
    rst = 0;
  end

  //==========================================================================
  // DUT I/O signals
  //==========================================================================

  logic [2:0]             STRIDE;
  logic [$clog2(MAX_M):0] M, N, K,NUM_K;

  // full-size inputs
  logic signed [DATA_WIDTH_kernel-1:0] B [2400];
  logic signed [DATA_WIDTH_map-1:0]    A [5400];

  // chunked outputs
  wire signed [DATA_WIDTH_kernel-1:0] flattenA [0:CHUNK_M-1][0:CHUNK_K_MAX-1];
  wire signed [DATA_WIDTH_map-1:0]    flattenB [0:CHUNK_K_MAX-1][0:CHUNK_N-1];

  //==========================================================================
  // Instantiate layerX
  //==========================================================================
  layerX #(
    .DATA_WIDTH_kernel  (DATA_WIDTH_kernel),
    .DATA_WIDTH_map     (DATA_WIDTH_map),
    .DATA_WIDTH_bias    (DATA_WIDTH_bias),
    .DATA_WIDTH_output  (DATA_WIDTH_output),
    .X1             (X1),
    .X2             (X2),
    .X3             (X3),
    .X4             (X4),
    .Y1             (Y1),
    .Y2             (Y2),
    .Y3             (Y3),
    .M_tile             (M_tile),
    .N_tile             (N_tile),
    .K_tile             (K_tile),
    .MAX_M              (MAX_M),
    .MAX_N              (MAX_N),
    .MAX_K              (MAX_K),

    .CHUNK_M            (CHUNK_M),
    .CHUNK_K_MAX        (CHUNK_K_MAX),
    .CHUNK_N            (CHUNK_N)
  ) u_layerX (
    .clk      (clk),
    .rst      (rst),
    .NUM_K    (NUM_K),
 
    .B        (B),
    .A        (A),
    .M        (M),
    .N        (N),
    .K        (K)
   
 
  );

  //==========================================================================
  // Initialize dimensions and inputs
  //==========================================================================
  initial begin
    // layer parameters
 
    STRIDE = 1;
    M      = 784;
    N      = 6;
    K      = 1;

    // fill A with a simple increasing pattern
    for (int z = 0; z < 5400; z++)
          A[z] = z*10 +2**z;

    // fill B with a distinct pattern
    for (int m_idx = 0; m_idx < 2400; m_idx++)
            B[m_idx] = m_idx*10+2**m_idx ;
  end


 task print_A;
    integer z, i, j, addr;
    begin
      for (z = 0; z < Y3; z++) begin
        $display("A(:,:,%0d) = [", z+1);
        for (i = 0; i < Y2; i++) begin
          $write("  ");
          for (j = 0; j < Y1; j++) begin
            addr = z*(Y2*Y1) + i*Y1 + j;
            $write("%0d", A[addr]);
            if (j != Y1-1) $write(" ");
          end
          $write(";\n");
        end
        $display("];\n");
      end
    end
  endtask

  // ------------------------------------------------------------
  // Print 4D kernels B in MATLAB format
  // B(m_idx+1, c+1, :, :) = [ rows; … ];
  // ------------------------------------------------------------
  task print_B;
    integer m_idx, c, u, v, addr;
    begin
      for (m_idx = 0; m_idx < X4; m_idx++) begin
        for (c = 0; c < X3; c++) begin
          $display("B(%0d,%0d,:,:) = [", m_idx+1, c+1);
          for (u = 0; u < X2; u++) begin
            $write("  ");
            for (v = 0; v < X1; v++) begin
              addr = m_idx*(X3*X2*X1)
                   + c*(X2*X1)
                   + u*X1 + v;
              $write("%0d", B[addr]);
              if (v != X1-1) $write(" ");
            end
            $write(";\n");
          end
          $display("];\n");
        end
      end
    end
  endtask


// ---------- print_flattenA (MATLAB 格式) ----------
task print_flattenA;
  integer mm, kk;
  // 输出头
  $display("flattenA = [");
  for (mm = 0; mm < CHUNK_M; mm = mm + 1) begin
    // 每行前面两个空格
    $write("  ");
    for (kk = 0; kk < CHUNK_K_MAX; kk = kk + 1) begin
      $write("%0d", u_layerX.flattenA[mm][kk]);
      if (kk < CHUNK_K_MAX-1)
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
  for (kk = 0; kk < CHUNK_K_MAX; kk = kk + 1) begin
    $write("  ");
    for (nn = 0; nn < CHUNK_N; nn = nn + 1) begin
      $write("%0d", u_layerX.flattenB[kk][nn]);
      if (nn < CHUNK_N-1)
        $write(", ");
    end
    if (kk < CHUNK_K_MAX-1)
      $write(";\n");
    else
      $write("\n");
  end
  $display("];");
endtask

  
  task print_GEMM_Result;
    integer kk, nn;
    $display("--- GEMM_Result [%0dx%0d] ---", CHUNK_M, CHUNK_N);
    for (kk = 0; kk < CHUNK_N ; kk++) begin
      $write(" kk=%0d:", kk);
      for (nn = 0; nn <CHUNK_M ; nn++)
        $write(" %0d", u_layerX.GEMM_Result[nn][kk]);
      $write("\n");
    end
  endtask
  task automatic print_LAYER_Result;
    integer ch, i, idx;
    begin
      $display("--- LAYER_Result 按通道输出: 共 %0d 通道 × 每通道 %0d 值 ---", u_layerX.N, u_layerX.M);
      for (ch = 0; ch < u_layerX.N; ch = ch + 1) begin
        $write("通道%0d:", ch);
        for (i = 0; i < u_layerX.M; i = i + 1) begin
          // 原始是一维数组，行主序存储：第 i 行第 ch 列
          idx = i  + ch* u_layerX.M;
          $write(" %0d", u_layerX.LAYER_Result[idx]);
        end
        $write("\n");
      end
      $write("\n");
    end
  endtask

task print_A_mat;
  integer kk, nn;
  // 打头
  $display("A_mat = [");
  for (kk = 0; kk < M_tile; kk = kk + 1) begin
    // 每行前面缩进两个空格
    $write("  ");
    for (nn = 0; nn < K_tile; nn = nn + 1) begin
      $write("%0d", u_layerX.u_GEMM.A_mat[kk][nn]);
      if (nn < K_tile-1)
        $write(", ");
    end
    // 每行末尾加分号
    if (kk < M_tile-1)
      $write(";\n");
    else
      $write("\n");
  end
  // 收尾
  $display("];");
endtask

// 打印 B_mat 为 MATLAB 矩阵
task print_B_mat;
  integer kk, nn;
  $display("B_mat = [");
  for (kk = 0; kk < K_tile; kk = kk + 1) begin
    $write("  ");
    for (nn = 0; nn < N_tile; nn = nn + 1) begin
      $write("%0d", u_layerX.u_GEMM.B_mat[kk][nn]);
      if (nn < N_tile-1)
        $write(", ");
    end
    if (kk < K_tile-1)
      $write(";\n");
    else
      $write("\n");
  end
  $display("];");
endtask
task print_C_mat;
    integer kk, nn;
    $display("--- C_mat [%0dx%0d] ---", M_tile, N_tile);
    for (kk = 0; kk < M_tile ; kk++) begin
      $write(" kk=%0d:", kk);
      for (nn = 0; nn <N_tile ; nn++)
        $write(" %0d", u_layerX.u_GEMM.C_mat[kk][nn]);
      $write("\n");
    end
  endtask
  //==========================================================================
  // Monitor: every clock, call print tasks & display counters
  //==========================================================================
  always_ff @(posedge clk) begin
    if (!rst) begin

     //if((u_layerX.cnt>=2398&&u_layerX.cnt<=2402)||(u_layerX.cnt>=4798&&u_layerX.cnt<=4802)||(u_layerX.cnt>=7198&&u_layerX.cnt<=7202)) begin
      //if(u_layerX.CHUNK_done||(u_layerX.cnt>=38398&&u_layerX.cnt<=38402)||u_layerX.cnt>=76798)begin
      print_A();
      print_B();
      print_flattenA();
      print_flattenB();
      print_GEMM_Result();
      print_LAYER_Result();
      //end
      print_A_mat();
      print_B_mat();
      print_C_mat();
      $display("u_layer XTime %0t | t=%0d k=%0d m=%0d n=%0d aim_m=%0d aim_n=%0d  CHUNK_done=%d LAYER_done=%d\n",
               $time,
               u_layerX.t, u_layerX.k, u_layerX.m, u_layerX.n,
               u_layerX.aim_m, u_layerX.aim_n,u_layerX.CHUNK_done,u_layerX.LAYER_done);
      $display("u_GEMM Time %0t | t=%0d k=%0d m=%0d n=%0d GEMM_done=%0d GEMM_done1=%0d\n",
               $time,
               u_layerX.u_GEMM.t, u_layerX.u_GEMM.k, u_layerX.u_GEMM.m, u_layerX.u_GEMM.n,
               u_layerX.u_GEMM.GEMM_done,u_layerX.u_GEMM.GEMM_done1);
      $display("u_GEMM Time %0t ",
               $time,
               u_layerX.u_GEMM.u_Array_Input.t);
               //end
    end
  end

  //==========================================================================
  // Finish after some cycles
  //==========================================================================
  initial begin
    #5000;
 
  end

endmodule
