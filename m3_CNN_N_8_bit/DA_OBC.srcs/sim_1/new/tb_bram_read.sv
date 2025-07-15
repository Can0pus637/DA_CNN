`timescale 1ns/1ps
module tb_bram_dual;

  localparam DATA_W = 16;
  localparam DEPTH  = 16;
  localparam ADDR_W = $clog2(DEPTH);

  // ʱ��
  logic clk = 0; always #5 clk = ~clk;

  // д��
  logic        we;
  logic [ADDR_W-1:0] addr_w;
  logic [DATA_W-1:0] din;

  // ����
  logic [ADDR_W-1:0] addr_r;
  logic [DATA_W-1:0] dout;

  // IP ʵ�� -- �˿����� stub ��ȫһ�£�
  blk_mem_gen_0 u_bram (
    .clka (clk), .ena (1'b1), .wea (we),      // Port A
    .addra(addr_w), .dina(din),      
    .clkb (clk), .enb (1'b1),                 // Port B
    .addrb(addr_r), .doutb(dout)
  );

  initial begin
    // 1) д 16 ����
    we = 1;
    for (int i=0; i<DEPTH; i++) begin
      @(posedge clk);
      addr_w = i;
      din    = i;
    end
    we = 0;                 // �ر�д

    // 2) ������
    @(posedge clk);
    for (int i=0; i<DEPTH; i++) begin
      @(posedge clk) addr_r = i;   // ����ַ
      @(posedge clk) $display("R[%0d]=%0d", i, dout); // ��һ��������
    end
    $finish;
  end
endmodule
