// TopWrap_example.sv
module Top #(
  parameter int K = 32,
  parameter int DATA_WIDTH_B = 16,
  parameter int UPDATE_PERIOD = 16
)(
  input  logic clk,
  input  logic rst,
  output logic update_pulse,
  output logic gen_done,
  output logic signed [DATA_WIDTH_B + $clog2(K):0] LUT_out
);
  // 互连信号
  logic [K-2:0] addr_array;
  logic signed [DATA_WIDTH_B-1:0] B_temp [K];

  // 随机源
  random_gen #(
    .K(K),
    .DATA_WIDTH_B(DATA_WIDTH_B)
    
  ) u_rand (
    .clk(clk),
    .rst(rst),
   // .update_pulse(update_pulse),
    .gen_done(gen_done),
    .addr_array(addr_array),
    .B_temp(B_temp)
  );

  // LUT
  LUT #(
    .DATA_WIDTH_B(DATA_WIDTH_B),
    .K(K)
  ) u_lut (
    .rst(rst),
    .clk(clk),
    .gen_done(gen_done),
    .addr_array(addr_array),
    .B_temp(B_temp),
    .LUT_out(LUT_out)
  );
endmodule
