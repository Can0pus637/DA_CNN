`timescale 1ns / 1ps

module tb_LUT;
    // �������ź�����
    localparam DATA_WIDTH = 8;         // ��Ϊ 8 λ��
    localparam M = 4;
    localparam N = 4;
    localparam K = 4;

    reg rst;
    reg clk;
    reg gen_done;
    // �� reg �������� DUT �� input logic signed [DATA_WIDTH-1:0] A[K]
    reg signed [DATA_WIDTH-1:0] A [0:K-1];
    reg signed [DATA_WIDTH-1:0] B [0:K-1];
    // C_out ��� = 2*DATA_WIDTH + 3 = 19 λ������ 18:0��
    wire signed [2*DATA_WIDTH+5:0] C_out;

    // ʵ���� DUT
    LUT #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) DUT (
        .rst(rst),
        .clk(clk),
        .gen_done(gen_done),
        .A(A),
        .B(B),
        .C_out(C_out)
    );

    // ʱ�����ɣ�100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // ��ʼ���뼤��
    initial begin
        // 1) ��ʼ��λ���һ������
        rst = 1;
        gen_done = 0;
        // ��һ��ʾ�����ݣ�8 λ���ʾ��
        A[0] = 8'd1;  A[1] = 8'd1;
        A[2] = 8'd1;  A[3] = 8'd1;
        B[0] = 8'sd1; B[1] = 8'sd1;
        B[2] = 8'sd2; B[3] = 8'sd2;

        // ���ָ�λ 20 ns��Ȼ���ͷ�
        #20 rst = 0;

        // �ȴ�һ��ʱ�Ӻ����� gen_done
        #10 gen_done = 1;

        // 2) �ȴ� 12 ��ʱ�����ڣ�12 �� 10 ns = 120 ns�����ڵ� 12 ��ʱ������ڶ�������
        repeat (12) @(posedge clk);
        $display(">> Applying second dataset at time %0t ns", $time);
        // �ڶ���ʾ�����ݣ�8 λ���ʾ��
        A[0] = 8'd1;   A[1] = 8'd0;
        A[2] = 8'd1;   A[3] = 8'd1;
        B[0] = 8'sd3;  B[1] = 8'sd1;
        B[2] = 8'sd2;  B[3] = 8'sd2;

        // ���������㹻���ʱ�������Թ۲���
        #((DATA_WIDTH+5)*10);

        // ��ѡ����������
        //#10 $stop;
    end

    // ÿ��ʱ�������ش�ӡ�ź�״̬
    always @(posedge clk) begin
        $display("Time=%0t | rst=%b | gen_done=%b |  A=%0d,%0d,%0d,%0d | B=%0d,%0d,%0d,%0d | t=%0d | bit_array=%b | notA0=%b | addr=%b | LUT_out=%0d | C_out=%0d",
                 $time,
                 rst,
                 gen_done,
                 DUT.A[0], DUT.A[1], DUT.A[2], DUT.A[3],
                 DUT.B[0], DUT.B[1], DUT.B[2], DUT.B[3],
                 DUT.t,
                 DUT.bit_array,
                 DUT.notA0,
                 DUT.addr,
                 DUT.LUT_out,
                 C_out
        );
    end

endmodule
