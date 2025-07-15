`timescale 1ns / 1ps

module random_matrix #(
    parameter int DATA_WIDTH = 8,
    parameter int M          = 4,
    parameter int K          = 4,
    parameter int N          = 4,
    // 新增：高位要清零的位数
    parameter int ZERO_BITS  =  0 ,
   parameter int SUM_WIDTH  = 2*DATA_WIDTH + $clog2(K)
)(
    input  logic                     clk,
    input  logic                     rst,
    output logic signed [DATA_WIDTH-1:0] A [M][K],
    output logic signed [DATA_WIDTH-1:0] B [K][N],
    output logic                     gen_done
);

    // 用于生成 mask 的局部参数：保留下 DATA_WIDTH-ZERO_BITS 个低位
    localparam logic [DATA_WIDTH-1:0] MASK = 
        ( {DATA_WIDTH{1'b1}} >> ZERO_BITS );

    // 将 seed_reg 从 8 位扩展到 DATA_WIDTH 位
    logic [DATA_WIDTH-1:0] seed_reg;
    // 计数器宽度只要能容纳 DATA_WIDTH+3 即可
    logic [$clog2(DATA_WIDTH+4)+1:0] clk_counter;

    // DATA_WIDTH 位 LFSR，使用 16 位 LFSR taps (15,13,12,10)
    function automatic logic [DATA_WIDTH-1:0] lfsr_next(input logic [DATA_WIDTH-1:0] l);
        logic feedback;
        begin
            feedback   = l[DATA_WIDTH-1] ^ l[DATA_WIDTH-3]
                       ^ l[DATA_WIDTH-4] ^ l[DATA_WIDTH-6];
            lfsr_next  = { l[DATA_WIDTH-2:0], feedback };
        end
    endfunction

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            seed_reg    <= 'h1;
            clk_counter <= DATA_WIDTH ;
            gen_done    <= 0;
            // 清零矩阵
            for (int i = 0; i < M; i++)
                for (int j = 0; j < K; j++)
                    A[i][j] <= '0;
            for (int i = 0; i < K; i++)
                for (int j = 0; j < N; j++)
                    B[i][j] <= '0;
        end else begin
            if (clk_counter == DATA_WIDTH ) begin
                logic [DATA_WIDTH-1:0] seed_local;
                seed_local = seed_reg;

                // 生成 A 矩阵，并对高位做清零
                for (int i = 0; i < M; i++) begin
                    for (int j = 0; j < K; j++) begin
                        seed_local   = lfsr_next(seed_local);
                        // 对高位 ZERO_BITS 位清零，保留低位
                        A[i][j]      <= $signed(seed_local & MASK);
                    end
                end

                // 生成 B 矩阵，并对高位做清零
                for (int i = 0; i < K; i++) begin
                    for (int j = 0; j < N; j++) begin
                        seed_local   = lfsr_next(seed_local);
                        B[i][j]      <= $signed(seed_local & MASK);
                    end
                end

                gen_done    <= 1;
                seed_reg    <= seed_local;
                clk_counter <= 0;
            end else begin
                clk_counter <= clk_counter + 1;
            end
        end
    end

endmodule
