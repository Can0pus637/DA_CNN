module Pooling #(
  parameter int SUM_WIDTH     = 16,
  parameter int Z             = 1,
  parameter int R             = 3,
  parameter int C             = 3,
  parameter int POOL_SIZE     = 2,
  parameter int STRIDE_POOL   = 2,
  // 输出尺寸
  parameter int R_OUT = ((R - POOL_SIZE) / STRIDE_POOL) + 1,
  parameter int C_OUT = ((C - POOL_SIZE) / STRIDE_POOL) + 1
) (
  input  logic signed [SUM_WIDTH-1:0] Activation_result [0:Z-1][0:R-1][0:C-1],
  output logic signed [SUM_WIDTH-1:0] Pooling_result    [0:Z-1][0:R_OUT-1][0:C_OUT-1]
);

  // 最大池化实现
  always_comb begin
    for (int z = 0; z < Z; z++) begin
      for (int i_out = 0; i_out < R_OUT; i_out++) begin
        for (int j_out = 0; j_out < C_OUT; j_out++) begin
          // 初始化为窗口首元素
          logic signed [SUM_WIDTH-1:0] max_val;
          max_val = Activation_result[z][i_out*STRIDE_POOL][j_out*STRIDE_POOL];
          // 在 POOL_SIZE 范围内遍历，取最大值
          for (int u = 0; u < POOL_SIZE; u++) begin
            for (int v = 0; v < POOL_SIZE; v++) begin
              logic signed [SUM_WIDTH-1:0] cur;
              cur = Activation_result[z][i_out*STRIDE_POOL + u][j_out*STRIDE_POOL + v];
              if (cur > max_val)
                max_val = cur;
            end
          end
          Pooling_result[z][i_out][j_out] = max_val;
        end
      end
    end
  end

endmodule
