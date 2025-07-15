`timescale 1ns / 1ps

module tb_Array;
    // 参数声明：DATA_WIDTH=2 → A,B 两位；C_out 宽度 = 2*2+1 = 5 位
    localparam DATA_WIDTH = 2;
    localparam M = 4;
    localparam N = 4;
    localparam K = 4;

    // 时钟 / 复位 / 控制信号
    reg clk;
    reg rst;
    reg gen_done;
    reg clr;

    // DUT 输入：4×4 矩阵 A、4×4 矩阵 B
    reg signed [DATA_WIDTH-1:0] A  [0:M-1][0:K-1];
    reg signed [DATA_WIDTH-1:0] B  [0:K-1][0:N-1];
    // DUT 输出：4×4 矩阵 C_out，每个元素 5 位宽
    wire signed [2*DATA_WIDTH+1:0] C_out [0:M-1][0:N-1];

    // 实例化 DUT
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

    // 100 MHz 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    integer i, j;

    // 初始化与激励
    initial begin
        rst      = 1;
        gen_done = 0;
        clr      = 0;

        // -- 第一组数据 --
        // A[i][j] = i - j
        for (i = 0; i < M; i = i + 1)
            for (j = 0; j < K; j = j + 1)
                A[i][j] = i - j;
        // B 对角 +1，其它 -1
        for (i = 0; i < K; i = i + 1)
            for (j = 0; j < N; j = j + 1)
                B[i][j] = (i == j) ? 2'sd1 : -2'sd1;

        // 释放复位并开始计算
        #20 rst = 0;
        #10 gen_done = 1;
        $display(">> Dataset 1 applied @ %0t ns\n", $time);

        // 等待 6 个时钟周期换第二组数据
        repeat (6) @(posedge clk);

        // -- 第二组数据 --
        for (i = 0; i < M; i = i + 1)
            for (j = 0; j < K; j = j + 1)
                A[i][j] = (i + j) % 4 - 2;
        for (i = 0; i < K; i = i + 1)
            for (j = 0; j < N; j = j + 1)
                B[i][j] = (i * j) % 3 - 1;

        $display(">> Dataset 2 applied @ %0t ns\n", $time);

        // 再等待若干周期观察输出
        repeat (6) @(posedge clk);

        #20 $stop;
    end

    // 在每个时钟上升沿打印（gen_done=1 后）矩阵
    always @(posedge clk) begin
        if (gen_done) begin
            print_arrays;
        end
    end

    // 任务：以方块格式打印 A、B、C_out 矩阵
    task print_arrays;
    begin
        // 打印 A 矩阵
        $display("A =");
        for (i = 0; i < M; i = i + 1) begin
            $write("  [");
            for (j = 0; j < K; j = j + 1) begin
                $write("%3d", A[i][j]);
                if (j < K-1) $write(" ");
            end
            $display(" ]");
        end
        // 打印 B 矩阵
        $display("B =");
        for (i = 0; i < K; i = i + 1) begin
            $write("  [");
            for (j = 0; j < N; j = j + 1) begin
                $write("%3d", B[i][j]);
                if (j < N-1) $write(" ");
            end
            $display(" ]");
        end
        // 打印 C_out 矩阵
        $display("C_out =");
        for (i = 0; i < M; i = i + 1) begin
            $write("  [");
            for (j = 0; j < N; j = j + 1) begin
                $write("%3d", C_out[i][j]);
                if (j < N-1) $write(" ");
            end
            $display(" ]");
        end
        $display("");  // 空行分隔
    end
    endtask

endmodule
