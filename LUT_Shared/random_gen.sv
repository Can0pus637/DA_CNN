// random_gen.sv  --  ��ַÿ�ĸ��£�B_temp ÿ B_UPDATE_PERIOD �ĸ���
module random_gen #(
  parameter int K               = 8,     // 4 �ı���
  parameter int DATA_WIDTH_B    = 8,     // 1..16
  parameter int ADDR_UPDATE_PERIOD = 1,   // ��ַˢ�����ڣ��ģ�
  parameter int B_UPDATE_PERIOD    = 16,   // B_temp ˢ�����ڣ��ģ�--�ؼ�
  parameter logic [7:0] SEED_ADDR = 8'hD3,
  parameter logic [7:0] SEED_B    = 8'hA5
)(
  input  logic clk,
  input  logic rst,
  output logic update_pulse_addr,                         // ��ַ��������
  output logic update_pulse_b,                            // B ��������
  output logic gen_done,                                  // �״ζ����ɺ� =1
  output logic [K-2:0] addr_array,                        // K-1 λ��ַ��LSB �� LUT �ڲ��� 1
  output logic signed [DATA_WIDTH_B-1:0] B_temp [K]       // K ��Ȩ��
);
  // ����
  // synthesis translate_off
  initial begin
    if (DATA_WIDTH_B < 1 || DATA_WIDTH_B > 16) $fatal(1, "DATA_WIDTH_B must be 1..16");
    if ((K % 4) != 0)                          $fatal(1, "K must be multiple of 4");
    if (ADDR_UPDATE_PERIOD < 1)                $fatal(1, "ADDR_UPDATE_PERIOD >= 1");
    if (B_UPDATE_PERIOD    < 1)                $fatal(1, "B_UPDATE_PERIOD >= 1");
  end
  // synthesis translate_on

  // 16-bit LFSR
  function automatic [15:0] lfsr16_next(input [15:0] s);
    logic fb; begin
      fb = s[15] ^ s[13] ^ s[12] ^ s[10];
      return {s[14:0], fb};
    end
  endfunction

  // ״̬
  logic [15:0] s_addr, s_b;
  logic [15:0] r_addr, r_b;

  // ������
  localparam int CW_A = (ADDR_UPDATE_PERIOD <= 1) ? 1 : $clog2(ADDR_UPDATE_PERIOD);
  localparam int CW_B = (B_UPDATE_PERIOD    <= 1) ? 1 : $clog2(B_UPDATE_PERIOD);
  logic [CW_A-1:0] ctr_addr;
  logic [CW_B-1:0] ctr_b;

  int i;

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      s_addr <= {SEED_ADDR, SEED_ADDR ^ 8'h9B};
      s_b    <= {SEED_B,    SEED_B    ^ 8'hC7};

      ctr_addr <= '0;
      ctr_b    <= '0;

      addr_array <= '0;
      for (i=0; i<K; i++) B_temp[i] <= '0;

      update_pulse_addr <= 1'b0;
      update_pulse_b    <= 1'b0;
      gen_done          <= 1'b0;

    end else begin
      // ===== ��ַ���£�Ĭ��ÿ�ģ� =====
      if (ctr_addr == ADDR_UPDATE_PERIOD-1) begin
        r_addr = s_addr;
        for (i=0; i<K-1; i++) begin
          r_addr = lfsr16_next(r_addr);
          addr_array[i] <= r_addr[0];  // ֱ�������λ�������ַλ
        end
        s_addr <= r_addr;
        ctr_addr <= '0;
        update_pulse_addr <= 1'b1;
      end else begin
        ctr_addr <= ctr_addr + 1'b1;
        update_pulse_addr <= 1'b0;
      end

      // ===== B_temp ���£��ؼ���ÿ B_UPDATE_PERIOD �ģ�=====
      if (ctr_b == B_UPDATE_PERIOD-1) begin
        r_b = s_b;
        for (i=0; i<K; i++) begin
          r_b = lfsr16_next(r_b);
          B_temp[i] <= $signed(r_b[DATA_WIDTH_B-1:0]);
        end
        s_b <= r_b;
        ctr_b <= '0;
        update_pulse_b <= 1'b1;
        gen_done <= 1'b1; // �״� B ���ɺ���λ
      end else begin
        ctr_b <= ctr_b + 1'b1;
        update_pulse_b <= 1'b0;
      end
    end
  end
endmodule
