`timescale 1ns/1ps

module tb_GEMM;

  //-- �����ò�������� DUT ��һһ��Ӧ�� --  
  localparam int DATA_WIDTH_A      = 8;
  localparam int DATA_WIDTH_B      = 8;
  localparam int DATA_WIDTH_bias   = 8;
  localparam int DATA_WIDTH_output = 8;
  // �ⲿȫ����ߴ�
  localparam int M    = 4;
  localparam int K    = 3;
  localparam int N    = 8;
  // �ڲ� Tile �ߴ�
  localparam int M_tile = 2;
  localparam int K_tile = 3;
  localparam int N_tile = 8;

  //-- ʱ�� & ��λ --  
  logic clk, rst;
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz
  end
  initial begin
    rst = 1;
    #20 rst = 0;
  end

  //-- DUT ����ӿ� --  
  logic signed [DATA_WIDTH_A-1:0] A    [M][K];
  logic signed [DATA_WIDTH_B-1:0] B    [K][N];
  logic                            LAYER_done;
  logic signed [DATA_WIDTH_output-1:0] C_out [M][N];
  logic                            GEMM_done, GEMM_done1, GEMM_done2;

  //-- ʵ���� DUT --  
  GEMM #(
    .DATA_WIDTH_A      (DATA_WIDTH_A),
    .DATA_WIDTH_B      (DATA_WIDTH_B),
    .DATA_WIDTH_bias   (DATA_WIDTH_bias),
    .DATA_WIDTH_output (DATA_WIDTH_output),
    .M                 (M),
    .N                 (N),
    .K                 (K),
    .M_tile            (M_tile),
    .N_tile            (N_tile),
    .K_tile            (K_tile)
  ) dut (
    .clk        (clk),
    .rst        (rst),
    .A          (A),
    .B          (B),
    .LAYER_done (LAYER_done),
    .C_out      (C_out),
    .GEMM_done  (GEMM_done),
    .GEMM_done1 (GEMM_done1),
    .GEMM_done2 (GEMM_done2)
  );

  //-- ����������� --  
  initial begin
    @(negedge rst);
    // �����ֵ A[4��5]
    for (int i = 0; i < M; i++)
      for (int k = 0; k < K; k++)
        A[i][k] = $urandom_range(-50,50);
    // �����ֵ B[5��3]
    for (int k = 0; k < K; k++)
      for (int j = 0; j < N; j++)
        B[k][j] = $urandom_range(-50,50);

    // ���� LAYER_done ��ʼ����
    LAYER_done = 0;
    // �ȴ����� GEMM ���
    wait (GEMM_done);
    #20 $finish;
  end

  //-- ÿ��ʱ�Ӵ�ӡ������ --  
  always_ff @(posedge clk) begin
    if (!rst && !LAYER_done) begin
      $display("==== Cycle %0t ====", $time);

      // �ⲿ A��4��5��
      $display("A (4��5) =");
      for (int i = 0; i < M; i++) begin
        $write("  ");
        for (int kk = 0; kk < K; kk++)
          $write("%0d ", A[i][kk]);
        $write("\n");
      end

      // �ⲿ B��5��3��
      $display("B (5��3) =");
      for (int kk = 0; kk < K; kk++) begin
        $write("  ");
        for (int jj = 0; jj < N; jj++)
          $write("%0d ", B[kk][jj]);
        $write("\n");
      end

      // �ڲ� A_mat��2��3��
      $display("A_mat (2��3) =");
      for (int ii = 0; ii < M_tile; ii++) begin
        $write("  ");
        for (int jj = 0; jj < K_tile; jj++)
          $write("%0d ", dut.A_mat[ii][jj]);
        $write("\n");
      end

      // �ڲ� B_mat��3��2��
      $display("B_mat (3��2) =");
      for (int kk = 0; kk < K_tile; kk++) begin
        $write("  ");
        for (int jj = 0; jj < N_tile; jj++)
          $write("%0d ", dut.B_mat[kk][jj]);
        $write("\n");
      end

      // �ڲ� C_mat��һά���� 2��
      $display("C_mat (2) =");
      for (int jj = 0; jj < N_tile; jj++)
        $display("  %0d", dut.C_mat[jj]);

      // ������� C_out��4��3��
      $display("C_out (4��3) =");
      for (int ii = 0; ii < M; ii++) begin
        $write("  ");
        for (int jj = 0; jj < N; jj++)
          $write("%0d ", C_out[ii][jj]);
        $write("\n");
      end

      $display("");
                $display("t0=%0d t1=%0d m=%0d n=%0d k=%0d", dut.t0,dut.t1,dut.m,dut.n,dut.k);
              $display(" aim_t1=%0d aim_m=%0d aim_n=%0d ", dut.aim_t1,dut.aim_m,dut.aim_n);
    $display(" GEMM_done=%0d GEMM_done1=%0d GEMM_done2=%0d ", dut.GEMM_done,dut.GEMM_done1,dut.GEMM_done2);
    end
  end

endmodule
