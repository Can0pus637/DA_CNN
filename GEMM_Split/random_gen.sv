// random_gen.sv  - A/B ֧�� <=16bit��ÿ M*DATA_WIDTH_A ��ʱ��ˢ��
module random_gen #(
  parameter int M = 2, N = 4, K = 8,
  parameter int DATA_WIDTH_A     = 16,   // 1..16
  parameter int DATA_WIDTH_B     = 8,   // 1..16
  parameter int DATA_WIDTH_bias  = 16,   // 1..16
  parameter int UPDATE_PERIOD    = M*DATA_WIDTH_A, // ��Ҫ��ÿ M*DATA_WIDTH_A ˢ��
  // 8bit �����Ա����ӿڣ�����ƴ��16bit��ֵ��ֱ��ʹ�ù̶�Ĭ��ֵ��
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

  // ---- ���ԣ�λ��Χ 1..16���ۺ�ʱ�ᱨ����籩¶���⣩ ----
  // synthesis translate_off
  initial begin
    if (DATA_WIDTH_A < 1 || DATA_WIDTH_A > 16) $fatal(1,"DATA_WIDTH_A must be 1..16");
    if (DATA_WIDTH_B < 1 || DATA_WIDTH_B > 16) $fatal(1,"DATA_WIDTH_B must be 1..16");
    if (DATA_WIDTH_bias < 1 || DATA_WIDTH_bias > 16) $fatal(1,"DATA_WIDTH_bias must be 1..16");
  end
  // synthesis translate_on

  // ������λ��
  localparam int CTR_W = (UPDATE_PERIOD <= 1) ? 1 : $clog2(UPDATE_PERIOD);
  logic [CTR_W-1:0] ctr;

  // 16-bit Fibonacci LFSR: x^16 + x^14 + x^13 + x^11 + 1
  function automatic [15:0] lfsr16_next(input [15:0] s);
    logic fb; begin
      fb = s[15] ^ s[13] ^ s[12] ^ s[10];
      return {s[14:0], fb};
    end
  endfunction

  // ͳһʹ�� 16-bit LFSR ״̬�������λ��Ŀ��λ��
  logic [15:0] sA16, sB16, sBias16;
  logic [15:0] tA16, tB16, tBias16;

  int im, ik, jn, kk; // for ѭ������

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      // ������ 8bit ���ӹ���16bit��ֵ��Ҳ���� {SEED, ~SEED}����������̶�����Ĭ�ϣ����ڸ���
      sA16    <= 16'hACE1;
      sB16    <= 16'h1D2B;
      sBias16 <= 16'hC33D;

      ctr <= '0;
      update_pulse <= 1'b0;
      gen_done <= 1'b0;

      // �������
      for (im=0; im<M; im++) for (ik=0; ik<K; ik++) A_out[im][ik]   <= '0;
      for (kk=0; kk<K; kk++) for (jn=0; jn<N; jn++) B_out[kk][jn]   <= '0;
      for (jn=0; jn<N; jn++)                      bias_out[jn]      <= '0;

    end else begin
      if (ctr == UPDATE_PERIOD-1) begin
        // ---- ���� A ----
        tA16 = sA16;
        for (im=0; im<M; im++) begin
          for (ik=0; ik<K; ik++) begin
            tA16 = lfsr16_next(tA16);
            // ��ȡ����λ�������������Ϊ�з���
            A_out[im][ik] <= $signed(tA16[DATA_WIDTH_A-1:0]);
          end
        end
        sA16 <= tA16;

        // ---- ���� B ----
        tB16 = sB16;
        for (kk=0; kk<K; kk++) begin
          for (jn=0; jn<N; jn++) begin
            tB16 = lfsr16_next(tB16);
            B_out[kk][jn] <= $signed(tB16[DATA_WIDTH_B-1:0]);
          end
        end
        sB16 <= tB16;

        // ---- ���� bias ----
        tBias16 = sBias16;
        for (jn=0; jn<N; jn++) begin
          tBias16 = lfsr16_next(tBias16);
          bias_out[jn] <= $signed(tBias16[DATA_WIDTH_bias-1:0]);
        end
        sBias16 <= tBias16;

        ctr <= '0;
        update_pulse <= 1'b1; // ˢ�µ�������
        gen_done <= 1'b1;     // �״����ɺ󱣳�Ϊ 1
      end else begin
        ctr <= ctr + 1'b1;
        update_pulse <= 1'b0;
        // gen_done ����
      end
    end
  end
endmodule
