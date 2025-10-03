`timescale 1ns / 1ps

module random_gen #(
  parameter int K               = 8,    // 4 的倍数
  parameter int DATA_WIDTH_B    = 8,    // 1..16
  parameter logic [7:0] SEED_ADDR = 8'hD3,
  parameter logic [7:0] SEED_B    = 8'hA5
)(
  input  logic clk,
  input  logic rst,
  output logic update_pulse,                           // 每拍=1
  output logic gen_done,                               // 首帧后=1
  output logic [K-2:0] addr_array,                     // 随机地址位（LUT 内部再拼 1'b1）
  output logic signed [DATA_WIDTH_B-1:0] B_temp [K]    // K 个随机权重
);
  // ---- 断言 ----
  // synthesis translate_off
  initial begin
    if (DATA_WIDTH_B < 1 || DATA_WIDTH_B > 16) $fatal(1, "DATA_WIDTH_B must be 1..16");
    if ((K % 4) != 0)                          $fatal(1, "K must be a multiple of 4");
  end
  // synthesis translate_on

  // 16-bit LFSR
  function automatic [15:0] lfsr16_next(input [15:0] s);
    logic fb; begin
      fb = s[15] ^ s[13] ^ s[12] ^ s[10];
      return {s[14:0], fb};
    end
  endfunction

  // LFSR 状态
  logic [15:0] s_addr, s_b;
  // 刷新滚动变量
  logic [15:0] r_addr, r_b;

  int i;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      s_addr <= {SEED_ADDR, SEED_ADDR ^ 8'h9B};
      s_b    <= {SEED_B,    SEED_B    ^ 8'hC7};

      addr_array   <= '0;
      for (i=0; i<K; i++) B_temp[i] <= '0;

      update_pulse <= 1'b0;   // 复位拍为0
      gen_done     <= 1'b0;
    end else begin
      // -- 每拍必刷新 -- //
      r_addr = s_addr;
      r_b    = s_b;

      for (i=0; i<K-1; i++) begin
        r_addr = lfsr16_next(r_addr);
        addr_array[i] <= r_addr[0];
      end

      for (i=0; i<K; i++) begin
        r_b = lfsr16_next(r_b);
        B_temp[i] <= $signed(r_b[DATA_WIDTH_B-1:0]);
      end

      s_addr <= r_addr;
      s_b    <= r_b;

      update_pulse <= 1'b1;   // 每拍高电平（等价每拍都有"脉冲"）
      gen_done     <= 1'b1;   // 首拍刷新后保持1
    end
  end
endmodule
