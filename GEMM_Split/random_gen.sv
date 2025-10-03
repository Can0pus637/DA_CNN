// random_gen.sv  - A/B 支持 <=16bit；每 M*DATA_WIDTH_A 个时钟刷新
module random_gen #(
  parameter int M = 2, N = 4, K = 8,
  parameter int DATA_WIDTH_A     = 16,   // 1..16
  parameter int DATA_WIDTH_B     = 8,   // 1..16
  parameter int DATA_WIDTH_bias  = 16,   // 1..16
  parameter int UPDATE_PERIOD    = M*DATA_WIDTH_A, // 按要求：每 M*DATA_WIDTH_A 刷新
  // 8bit 种子仍保留接口（用于拼成16bit初值或直接使用固定默认值）
  parameter logic [7:0] SEED_A    = 8'hA2,
  parameter logic [7:0] SEED_B    = 8'h5A,
  parameter logic [7:0] SEED_bias = 8'hC3
)(
  input  logic clk,
  input  logic rst,
  output logic signed [DATA_WIDTH_A-1:0]     A_out   [M][K],
  output logic signed [DATA_WIDTH_B-1:0]     B_out   [K][N],
  output logic signed [DATA_WIDTH_bias-1:0]  bias_out[N],
  output logic                               update_pulse,
  output logic                               gen_done
);

  // ---- 断言：位宽范围 1..16（综合时会报错更早暴露问题） ----
  // synthesis translate_off
  initial begin
    if (DATA_WIDTH_A < 1 || DATA_WIDTH_A > 16) $fatal(1,"DATA_WIDTH_A must be 1..16");
    if (DATA_WIDTH_B < 1 || DATA_WIDTH_B > 16) $fatal(1,"DATA_WIDTH_B must be 1..16");
    if (DATA_WIDTH_bias < 1 || DATA_WIDTH_bias > 16) $fatal(1,"DATA_WIDTH_bias must be 1..16");
  end
  // synthesis translate_on

  // 计数器位宽
  localparam int CTR_W = (UPDATE_PERIOD <= 1) ? 1 : $clog2(UPDATE_PERIOD);
  logic [CTR_W-1:0] ctr;

  // 16-bit Fibonacci LFSR: x^16 + x^14 + x^13 + x^11 + 1
  function automatic [15:0] lfsr16_next(input [15:0] s);
    logic fb; begin
      fb = s[15] ^ s[13] ^ s[12] ^ s[10];
      return {s[14:0], fb};
    end
  endfunction

  // 统一使用 16-bit LFSR 状态（按需截位成目标位宽）
  logic [15:0] sA16, sB16, sBias16;
  logic [15:0] tA16, tB16, tBias16;

  int im, ik, jn, kk; // for 循环变量

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      // 若想用 8bit 种子构造16bit初值，也可用 {SEED, ~SEED}；这里给出固定非零默认，便于复现
      sA16    <= 16'hACE1;
      sB16    <= 16'h1D2B;
      sBias16 <= 16'hC33D;

      ctr <= '0;
      update_pulse <= 1'b0;
      gen_done <= 1'b0;

      // 清零输出
      for (im=0; im<M; im++) for (ik=0; ik<K; ik++) A_out[im][ik]   <= '0;
      for (kk=0; kk<K; kk++) for (jn=0; jn<N; jn++) B_out[kk][jn]   <= '0;
      for (jn=0; jn<N; jn++)                      bias_out[jn]      <= '0;

    end else begin
      if (ctr == UPDATE_PERIOD-1) begin
        // ---- 生成 A ----
        tA16 = sA16;
        for (im=0; im<M; im++) begin
          for (ik=0; ik<K; ik++) begin
            tA16 = lfsr16_next(tA16);
            // 截取所需位宽并按两补码解释为有符号
            A_out[im][ik] <= $signed(tA16[DATA_WIDTH_A-1:0]);
          end
        end
        sA16 <= tA16;

        // ---- 生成 B ----
        tB16 = sB16;
        for (kk=0; kk<K; kk++) begin
          for (jn=0; jn<N; jn++) begin
            tB16 = lfsr16_next(tB16);
            B_out[kk][jn] <= $signed(tB16[DATA_WIDTH_B-1:0]);
          end
        end
        sB16 <= tB16;

        // ---- 生成 bias ----
        tBias16 = sBias16;
        for (jn=0; jn<N; jn++) begin
          tBias16 = lfsr16_next(tBias16);
          bias_out[jn] <= $signed(tBias16[DATA_WIDTH_bias-1:0]);
        end
        sBias16 <= tBias16;

        ctr <= '0;
        update_pulse <= 1'b1; // 刷新当拍脉冲
        gen_done <= 1'b1;     // 首次生成后保持为 1
      end else begin
        ctr <= ctr + 1'b1;
        update_pulse <= 1'b0;
        // gen_done 保持
      end
    end
  end
endmodule
