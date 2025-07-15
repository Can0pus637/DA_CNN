`timescale 1ns/1ps

module tb_Array_Input;

  // =======================================================
  // 1) 参数定义（测试时为了简便取小尺寸）
  //    真正跑你设计时，可把这些改回原始值
  // =======================================================
  localparam int DATA_WIDTH_A      = 8;
  localparam int DATA_WIDTH_B      = 8;
  localparam int DATA_WIDTH_bias   = 8;
  localparam int DATA_WIDTH_output = 8;
  localparam int M                 = 1;
  localparam int N                 = 1;
  localparam int K                 = 4;
  localparam int LUT_WIDTH         = DATA_WIDTH_B + $clog2(K);

  // =======================================================
  // 2) 信号声明
  // =======================================================
  logic                             clk;
  logic                             rst;
  logic                             gen_done;
  logic                             bias_en;
  logic signed [DATA_WIDTH_A-1:0]   A       [M][K];
  logic signed [DATA_WIDTH_B-1:0]   B_matrix[K][N];
  logic signed [DATA_WIDTH_bias-1:0] bias_array [N];
  logic signed [DATA_WIDTH_output-1:0] final_out [N];

  // =======================================================
  // 3) DUT 实例化
  // =======================================================
  Array_Input #(
    .DATA_WIDTH_A(DATA_WIDTH_A),
    .DATA_WIDTH_B(DATA_WIDTH_B),
    .DATA_WIDTH_bias(DATA_WIDTH_bias),
    .DATA_WIDTH_output(DATA_WIDTH_output),
    .M(M),
    .N(N),
    .K(K),
    .LUT_WIDTH(LUT_WIDTH)
  ) dut (
    .clk       (clk),
    .rst       (rst),
    .gen_done  (gen_done),
    .bias_en   (bias_en),
    .A         (A),
    .B         (B_matrix),
    .bias      (bias_array),
    .final_out (final_out)
  );

  // =======================================================
  // 4) 时钟生成：10ns 一个周期
  // =======================================================
  initial clk = 0;
  always #5 clk = ~clk;

  // =======================================================
  // 5) 测试序列
  // =======================================================
  initial begin
    // 5.1) 复位 & 默认
    rst      = 1;
    gen_done = 0;
    bias_en  = 0;

    // 5.2) 准备测试向量
    // A: 2×4 矩阵
    A[0][0] =  30; A[0][1] =  41; A[0][2] = 22; A[0][3] =  40;
    A[1][0] =  31; A[1][1] =  30; A[1][2] = 3-1; A[1][3] =  32;
    // B: 4×2 矩阵
    B_matrix[0][0] =  78;  B_matrix[0][1] = 16;
    B_matrix[1][0] = -64;  B_matrix[1][1] =  72;
    B_matrix[2][0] =  55;  B_matrix[2][1] = -63;
    B_matrix[3][0] =  41;  B_matrix[3][1] =  45;
    // bias
    bias_array[0] = 1;
    bias_array[1] = 2;

    // 5.3) 解除复位，开启 gen_done & bias_en
    #20;
    rst      = 0;
    gen_done = 1;
    bias_en  = 1;

    // 5.4) 让内部指针跑几轮：t 在 0..3 循环三次
    repeat (DATA_WIDTH_A * 3) @(posedge clk);

    // 5.5) 停止仿真
    #10;
    $finish;
  end

  // =======================================================
  // 6) 每个时钟打印完整 A、B 和 final_out
  // =======================================================
  always @(posedge clk) begin
    if (!rst && gen_done) begin
      integer i;
      // 打印 A 矩阵
      $display("----- A matrix -----");
      for (i = 0; i < M; i = i + 1)
        $display("A[%0d] = %p", i, dut.A[i]);

      // 打印 B 矩阵
      $display("----- B matrix -----");
      for (i = 0; i < K; i = i + 1)
        $display("B[%0d] = %p", i, dut.B[i]);

      // 打印指针和输出
      $display("C_out[0] = %d", dut.C_out[0]);
      $display("LUT_out[0] = %d",  dut.gen_cols[0].LUT_inst.LUT_out);
      $display("addr_array[t] = %b",  dut.addr_array);
      $display("t = %0d, aim_m = %0d, final_out = %p",
               dut.t, dut.aim_m, final_out);
      $display("a_in = %0d, b_in = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[0].a_in, dut.gen_cols[0].LUT_inst.gen_addsub[0].b_in);         
      $display("add_a = %0d, add_b = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[0].add_a, dut.gen_cols[0].LUT_inst.gen_addsub[0].add_b); 
      $display("a = %0d, b = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[0].u_adsub.a, dut.gen_cols[0].LUT_inst.gen_addsub[0].u_adsub.b); 
      $display("a_op = %0d, b_op = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[0].u_adsub.a_op, dut.gen_cols[0].LUT_inst.gen_addsub[0].u_adsub.b_op); 
      $display("u_adsub.y = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[0].u_adsub.y); 
      $display("choose_MA_array = %0d",
               dut.gen_cols[0].LUT_inst.choose_MA_array[0]); 
               
      $display("a_in = %0d, b_in = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[1].a_in, dut.gen_cols[0].LUT_inst.gen_addsub[1].b_in);         
      $display("add_a = %0d, add_b = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[1].add_a, dut.gen_cols[0].LUT_inst.gen_addsub[1].add_b); 
      $display("a = %0d, b = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[1].u_adsub.a, dut.gen_cols[0].LUT_inst.gen_addsub[1].u_adsub.b); 
      $display("a_op = %0d, b_op = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[1].u_adsub.a_op, dut.gen_cols[0].LUT_inst.gen_addsub[1].u_adsub.b_op); 
      $display("u_adsub.y = %0d",
               dut.gen_cols[0].LUT_inst.gen_addsub[1].u_adsub.y); 
      $display("choose_MA_array = %0d",
               dut.gen_cols[0].LUT_inst.choose_MA_array[1]);      
               
               
      $display("=============================\n");
    end
  end

endmodule
