module Activation #(
  parameter int SUM_WIDTH = 16,
  parameter int Z         = 1,
  parameter int R         = 1,
  parameter int C         = 1
) (
  input  logic signed [SUM_WIDTH-1:0] Convolution_result [0:Z-1][0:R-1][0:C-1],
  output logic signed [SUM_WIDTH-1:0] Activation_result   [0:Z-1][0:R-1][0:C-1]
);

  // 将负数置零，其它值保持不变
  always_comb begin
    for (int z = 0; z < Z; z++) begin
      for (int i = 0; i < R; i++) begin
        for (int j = 0; j < C; j++) begin
          if (Convolution_result[z][i][j] < 0)
            Activation_result[z][i][j] = '0;
          else
            Activation_result[z][i][j] = Convolution_result[z][i][j];
        end
      end
    end
  end

endmodule