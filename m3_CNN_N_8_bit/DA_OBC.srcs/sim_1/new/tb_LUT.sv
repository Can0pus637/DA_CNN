`timescale 1ns / 1ps

module tb_LUT;
    // 参数和信号声明
    localparam DATA_WIDTH = 8;         // 改为 8 位宽
    localparam M = 4;
    localparam N = 4;
    localparam K = 4;

    reg rst;
    reg clk;
    reg gen_done;
    // 用 reg 数组驱动 DUT 的 input logic signed [DATA_WIDTH-1:0] A[K]
    reg signed [DATA_WIDTH-1:0] A [0:K-1];
    reg signed [DATA_WIDTH-1:0] B [0:K-1];
    // C_out 宽度 = 2*DATA_WIDTH + 3 = 19 位（索引 18:0）
    wire signed [2*DATA_WIDTH+5:0] C_out;

    // 实例化 DUT
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

    // 时钟生成：100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 初始化与激励
    initial begin
        // 1) 初始复位与第一组数据
        rst = 1;
        gen_done = 0;
        // 第一组示例数据（8 位宽表示）
        A[0] = 8'd1;  A[1] = 8'd1;
        A[2] = 8'd1;  A[3] = 8'd1;
        B[0] = 8'sd1; B[1] = 8'sd1;
        B[2] = 8'sd2; B[3] = 8'sd2;

        // 保持复位 20 ns，然后释放
        #20 rst = 0;

        // 等待一个时钟后拉高 gen_done
        #10 gen_done = 1;

        // 2) 等待 12 个时钟周期（12 × 10 ns = 120 ns），在第 12 个时钟输入第二组数据
        repeat (12) @(posedge clk);
        $display(">> Applying second dataset at time %0t ns", $time);
        // 第二组示例数据（8 位宽表示）
        A[0] = 8'd1;   A[1] = 8'd0;
        A[2] = 8'd1;   A[3] = 8'd1;
        B[0] = 8'sd3;  B[1] = 8'sd1;
        B[2] = 8'sd2;  B[3] = 8'sd2;

        // 继续运行足够多的时钟周期以观察结果
        #((DATA_WIDTH+5)*10);

        // 可选：结束仿真
        //#10 $stop;
    end

    // 每个时钟上升沿打印信号状态
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
