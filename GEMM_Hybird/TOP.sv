// TopWrap_example.sv
module Top #(
  parameter int M = 1, N = 1, K = 8,
  parameter int DATA_WIDTH_A = 8,
  parameter int DATA_WIDTH_B = 8,
  parameter int DATA_WIDTH_bias = DATA_WIDTH_B
)(
  input  logic clk,
  input  logic rst,
 // input  logic gen_done,   // 外部可选控制；若不用可绑 1'b0
  input  logic bias_en
);

  // 随机矩阵输出
  logic signed [DATA_WIDTH_A-1:0]     A_rand   [M][K];
  logic signed [DATA_WIDTH_B-1:0]     B_rand   [K][N];
  logic signed [DATA_WIDTH_bias-1:0]  bias_rand[N];
  logic                               update_pulse;
  logic                               rand_gen_done;   // 来自 random_gen 的 gen_done

  // 随机发生器：每 16 拍更新一次；首次生成完成后 rand_gen_done 会一直为 1
  (* DONT_TOUCH = "true" *)
  random_gen #(
    .M(M), .N(N), .K(K),
    .DATA_WIDTH_A(DATA_WIDTH_A),
    .DATA_WIDTH_B(DATA_WIDTH_B),
    .DATA_WIDTH_bias(DATA_WIDTH_bias),
    .UPDATE_PERIOD(M*DATA_WIDTH_A),
    .SEED_A(8'hA5), .SEED_B(8'h5A), .SEED_bias(8'hC3)
  ) u_rand (
    .clk(clk), .rst(rst),
    .A_out(A_rand), .B_out(B_rand), .bias_out(bias_rand),
    .update_pulse(update_pulse),
    .gen_done(rand_gen_done)
  );

  // 给 DUT 的 gen_done：默认外部和内部 OR 合并（需要的话可改成只用 rand_gen_done）
  logic gen_done_to_dut;
  assign gen_done_to_dut =  rand_gen_done;
  // 如果只想用内部：
  // assign gen_done_to_dut = rand_gen_done;

  // DUT：保持原样（用随机矩阵当作"外部输入"）
  logic signed [DATA_WIDTH_B-1:0] final_out [N];

  (* DONT_TOUCH = "true" *)
  Array_Input #(
    .DATA_WIDTH_A(DATA_WIDTH_A),
    .DATA_WIDTH_B(DATA_WIDTH_B),
    .DATA_WIDTH_bias(DATA_WIDTH_bias),
    .DATA_WIDTH_output(DATA_WIDTH_B),
    .M(M), .N(N), .K(K)
  ) dut (
    .clk(clk), .rst(rst),
    .gen_done(gen_done_to_dut),
    .bias_en(bias_en),
    .A(A_rand),
    .B(B_rand),
    .bias(bias_rand),
    .final_out(final_out)
  );

endmodule
