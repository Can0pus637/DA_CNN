`timescale 1ns/1ps

module tb_Array_Input;

  //-- �������� --  
  localparam int DATA_WIDTH_A      = 8;
  localparam int DATA_WIDTH_B      = 8;
  localparam int DATA_WIDTH_bias   = 8;
  localparam int DATA_WIDTH_output = 8;
  localparam int M                = 4;  // ��С���ά�ȷ���۲�
  localparam int N                = 3;
  localparam int K                = 5;

  //-- ʱ���븴λ --  
  logic clk;
  logic rst;

  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz
  end

  initial begin
    rst = 1;
    #20 rst = 0;
  end

  //-- DUT �ӿ� --  
  logic                       gen_done;
  logic signed [DATA_WIDTH_A-1:0]     A    [M][K];
  logic signed [DATA_WIDTH_B-1:0]     B    [K][N];
  logic signed [DATA_WIDTH_bias-1:0]  bias [N];
  logic signed [DATA_WIDTH_output-1:0] final_out [N];

  //-- DUT ʵ���� --  
  Array_Input #(
    .DATA_WIDTH_A      (DATA_WIDTH_A),
    .DATA_WIDTH_B      (DATA_WIDTH_B),
    .DATA_WIDTH_bias   (DATA_WIDTH_bias),
    .DATA_WIDTH_output (DATA_WIDTH_output),
    .M                 (M),
    .N                 (N),
    .K                 (K)
  ) dut (
    .clk       (clk),
    .rst       (rst),
    .gen_done  (gen_done),
    .A         (A),
    .B         (B),
    .bias      (bias),
    .final_out (final_out)
  );

  //-- �������� --  
  initial begin
    // �ȸ�λ����
    @(negedge rst);
    // ������ A��B��bias
    for (int i = 0; i < M; i++)
      for (int k = 0; k < K; k++)
        A[i][k] = $urandom_range(-2**(DATA_WIDTH_A-1), 2**(DATA_WIDTH_A-1)-1);
    for (int k = 0; k < K; k++)
      for (int j = 0; j < N; j++)
        B[k][j] = $urandom_range(-2**(DATA_WIDTH_B-1), 2**(DATA_WIDTH_B-1)-1);
    for (int j = 0; j < N; j++)
      bias[j] = 0;

    // �� DUT ��ʼ����
    gen_done = 1;
    #1000;
    // ֹͣ����
    $finish;
  end

  //-- ÿ�Ĵ�ӡ���� A��B��final_out --  
  always_ff @(posedge clk) begin
    if (!rst && gen_done) begin
      $display("=== Cycle %0t ===", $time);
      
      // ��ӡ A
      $write("A = [\n");
      for (int i = 0; i < M; i++) begin
        $write("  ");
        for (int k = 0; k < K; k++)
          $write("%0d ", A[i][k]);
        $write("\n");
      end
      $write("]\n");
      
      // ��ӡ B
      $write("B = [\n");
      for (int k = 0; k < K; k++) begin
        $write("  ");
        for (int j = 0; j < N; j++)
          $write("%0d ", B[k][j]);
        $write("\n");
      end
      $write("]\n");
      
      // ��ӡ final_out
      $write("final_out = [\n");

        for (int j = 0; j < N; j++)
          $write("%0d ", final_out[j]);

     
      $write("]\n\n");
    end
  end

endmodule
