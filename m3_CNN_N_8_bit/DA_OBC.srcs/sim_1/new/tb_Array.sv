`timescale 1ns / 1ps

module tb_Array;
    // ����������DATA_WIDTH=2 �� A,B ��λ��C_out ��� = 2*2+1 = 5 λ
    localparam DATA_WIDTH = 2;
    localparam M = 4;
    localparam N = 4;
    localparam K = 4;

    // ʱ�� / ��λ / �����ź�
    reg clk;
    reg rst;
    reg gen_done;
    reg clr;

    // DUT ���룺4��4 ���� A��4��4 ���� B
    reg signed [DATA_WIDTH-1:0] A  [0:M-1][0:K-1];
    reg signed [DATA_WIDTH-1:0] B  [0:K-1][0:N-1];
    // DUT �����4��4 ���� C_out��ÿ��Ԫ�� 5 λ��
    wire signed [2*DATA_WIDTH+1:0] C_out [0:M-1][0:N-1];

    // ʵ���� DUT
    Array_Input #(
        .DATA_WIDTH(DATA_WIDTH),
        .M(M),
        .N(N),
        .K(K)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .gen_done(gen_done),
        .clr(clr),
        .A(A),
        .B(B),
        .C_out(C_out)
    );

    // 100 MHz ʱ������
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i, j;

    // ��ʼ���뼤��
    initial begin
        rst      = 1;
        gen_done = 0;
        clr      = 0;

        // -- ��һ������ --
        // A[i][j] = i - j
        for (i = 0; i < M; i = i + 1)
            for (j = 0; j < K; j = j + 1)
                A[i][j] = i - j;
        // B �Խ� +1������ -1
        for (i = 0; i < K; i = i + 1)
            for (j = 0; j < N; j = j + 1)
                B[i][j] = (i == j) ? 2'sd1 : -2'sd1;

        // �ͷŸ�λ����ʼ����
        #20 rst = 0;
        #10 gen_done = 1;
        $display(">> Dataset 1 applied @ %0t ns\n", $time);

        // �ȴ� 6 ��ʱ�����ڻ��ڶ�������
        repeat (6) @(posedge clk);

        // -- �ڶ������� --
        for (i = 0; i < M; i = i + 1)
            for (j = 0; j < K; j = j + 1)
                A[i][j] = (i + j) % 4 - 2;
        for (i = 0; i < K; i = i + 1)
            for (j = 0; j < N; j = j + 1)
                B[i][j] = (i * j) % 3 - 1;

        $display(">> Dataset 2 applied @ %0t ns\n", $time);

        // �ٵȴ��������ڹ۲����
        repeat (6) @(posedge clk);

        #20 $stop;
    end

    // ��ÿ��ʱ�������ش�ӡ��gen_done=1 �󣩾���
    always @(posedge clk) begin
        if (gen_done) begin
            print_arrays;
        end
    end

    // �����Է����ʽ��ӡ A��B��C_out ����
    task print_arrays;
    begin
        // ��ӡ A ����
        $display("A =");
        for (i = 0; i < M; i = i + 1) begin
            $write("  [");
            for (j = 0; j < K; j = j + 1) begin
                $write("%3d", A[i][j]);
                if (j < K-1) $write(" ");
            end
            $display(" ]");
        end
        // ��ӡ B ����
        $display("B =");
        for (i = 0; i < K; i = i + 1) begin
            $write("  [");
            for (j = 0; j < N; j = j + 1) begin
                $write("%3d", B[i][j]);
                if (j < N-1) $write(" ");
            end
            $display(" ]");
        end
        // ��ӡ C_out ����
        $display("C_out =");
        for (i = 0; i < M; i = i + 1) begin
            $write("  [");
            for (j = 0; j < N; j = j + 1) begin
                $write("%3d", C_out[i][j]);
                if (j < N-1) $write(" ");
            end
            $display(" ]");
        end
        $display("");  // ���зָ�
    end
    endtask

endmodule
