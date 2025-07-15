`timescale 1ns / 1ps

module tb_TOP_OBC;
  // Parameters (match TOP_OBC)
  parameter int DATA_WIDTH_map    = 8;
  parameter int DATA_WIDTH_kernel = 8;
  parameter int DATA_WIDTH_con_bias = 8;
  parameter int P      = 5;
  parameter int Q      = 5;
  parameter int X      = 3;
  parameter int Y      = 3;
  parameter int Z      = 1;
  parameter int STRIDE = 1;
  parameter int R = ((P - X)/STRIDE) + 1;
  parameter int C = ((Q - Y)/STRIDE) + 1;
  parameter int N = R * C;
  parameter int K = X * Y;
  parameter int M = Z;
  parameter int SUM_WIDTH = DATA_WIDTH_map + DATA_WIDTH_kernel + $clog2(K);
  parameter int FC_OUT      = 10;
  // Clock and reset
  logic clk_p, clk_n;
  logic rst;

  // Inputs
  logic signed [DATA_WIDTH_map-1:0]     input_map    [0:P-1][0:Q-1];
  logic signed [DATA_WIDTH_kernel-1:0]  input_kernel [0:Z-1][0:X-1][0:Y-1];
  logic signed [DATA_WIDTH_con_bias-1:0]con_bias     [0:N-1];

  // Instantiate DUT
  logic signed [SUM_WIDTH-1:0] dummy_res[0:FC_OUT-1][0:Z-1]; // dummy for port binding
  TOP_OBC #(
    .DATA_WIDTH_map(DATA_WIDTH_map),
    .DATA_WIDTH_kernel(DATA_WIDTH_kernel),
    .DATA_WIDTH_con_bias(DATA_WIDTH_con_bias),
    .P(P), .Q(Q), .X(X), .Y(Y), .Z(Z), .STRIDE(STRIDE)
  ) dut (
    .clk_p(clk_p), .clk_n(clk_n), .rst(rst),
    .input_map(input_map), .input_kernel(input_kernel),
    .con_bias(con_bias), .CNN_result(dummy_res)
  );

  // Differential clock
  initial begin
    clk_p = 0; clk_n = 1;
    forever #5 {clk_p, clk_n} = {~clk_p, ~clk_n};
  end

  // Reset pulse
  initial begin
    rst = 1; #20; rst = 0;
  end

  // Stimulus: initialize inputs after reset
  initial begin
    wait (!rst);
    // input_map values 0..P*Q-1
    for (int i = 0; i < P; i++)
      for (int j = 0; j < Q; j++)
        input_map[i][j] = i*Q + j;
    // input_kernel values 0..Z*X*Y-1
    for (int k = 0; k < Z; k++)
      for (int i = 0; i < X; i++)
        for (int j = 0; j < Y; j++)
          input_kernel[k][i][j] = k*X*Y + i*Y + j;
    // con_bias values 0..N-1
    for (int idx = 0; idx < N; idx++)
      con_bias[idx] = idx;
  end

  // Monitor at each rising edge of internal clk
  always @(posedge dut.clk) begin
    // Time stamp
    $display("\n=== Time %0t ===", $time);
    // Print input_map
    $display("input_map:");
    for (int i = 0; i < P; i++) begin
      $write("  ");
      for (int j = 0; j < Q; j++)
        $write("%0d ", input_map[i][j]);
      $display("");
    end
    // Print input_kernel per z
    for (int k = 0; k < Z; k++) begin
      $display("input_kernel (z=%0d):", k);
      for (int i = 0; i < X; i++) begin
        $write("  ");
        for (int j = 0; j < Y; j++)
          $write("%0d ", input_kernel[k][i][j]);
        $display("");
      end
    end
    // Print con_bias vector
    $display("con_bias:");
    $write("  ");
    for (int idx = 0; idx < N; idx++)
      $write("%0d ", con_bias[idx]);
    $display("");
    // Print flatten_map 2D [K][N]
    $display("flatten_map:");
    for (int m = 0; m < K; m++) begin
      $write("  ");
      for (int n = 0; n < N; n++)
        $write("%0d ", dut.u_convolution.flatten_map[m][n]);
      $display("");
    end
    // Print flatten_kernel 2D [M][K]
    $display("flatten_kernel:");
    for (int zz = 0; zz < M; zz++) begin
      $write("  ");
      for (int kk = 0; kk < K; kk++)
        $write("%0d ", dut.u_convolution.flatten_kernel[zz][kk]);
      $display("");
    end
    // Print C_tensor per z
    for (int k = 0; k < Z; k++) begin
      $display("C_tensor (z=%0d):", k);
      for (int i = 0; i < R; i++) begin
        $write("  ");
        for (int j = 0; j < C; j++)
          $write("%0d ", dut.u_convolution.C_tensor[k][i][j]);
        $display("");
      end
    end
$display("C_out partial view (4x4):");
  for (int i = 0; i < M; i++) begin
    $write("row%0d: ", i);
    for (int j = 0; j < N; j++) begin
      $write("%0d ", dut.u_convolution.C_out[i][j]);
    end
    $write("\n");
  
      
    end
  end

endmodule