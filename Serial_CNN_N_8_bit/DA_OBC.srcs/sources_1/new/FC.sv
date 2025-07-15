module FC #(
  // 输入数据位宽
  parameter int DATA_WIDTH_fc_input   = 16,
  // 权重位宽
  parameter int DATA_WIDTH_fc_weights = 8,
  // 偏置位宽
  parameter int DATA_WIDTH_fc_bias    = 8,
  // 池化输出尺寸
  parameter int Z       = 1,
  parameter int R_OUT   = 2,
  parameter int C_OUT   = 2,
  // 输出神经元个数
  parameter int FC_OUT  = 10,
  // Array_Input 模块的 drop 参数
  parameter int DROP    = 0,
  // 派生参数
  parameter int FLAT_SIZE        = Z * R_OUT * C_OUT,
  parameter int DATA_WIDTH_fc_out  = DATA_WIDTH_fc_weights+DATA_WIDTH_fc_input+ $clog2(FLAT_SIZE)-DROP
)(
  input  logic                          clk,
  input  logic                          rst,
  input  logic                          gen_done,
  // 三维 Pooling_result[Z][R_OUT][C_OUT]
  input  logic signed [DATA_WIDTH_fc_input-1:0]Pooling_result [0:Z-1][0:R_OUT-1][0:C_OUT-1],
  // 权重矩阵 FC_OUT × FLAT_SIZE
  input  logic signed [DATA_WIDTH_fc_weights-1:0]fc_weights     [0:FC_OUT-1][0:FLAT_SIZE-1],
  // 偏置向量 FC_OUT
  input  logic signed [DATA_WIDTH_fc_bias-1:0]fc_bias        [0:0],
  // 最终输出向量 FC_OUT
  output logic signed [DATA_WIDTH_fc_out-1:0]fc_out         [0:FC_OUT-1][0:0]
);

  // ------------------------------------------------------------------
  // 1) flatten: 把 [z][i][j] 三维张量展平成一维向量 B_vec[idx]
     int idx ;
  logic signed [DATA_WIDTH_fc_input-1:0] B_vec [0:FLAT_SIZE-1][0:0];
  always_comb begin
 idx = 0;
    for (int z = 0; z < Z;    z++) begin
      for (int i = 0; i < R_OUT; i++) begin
        for (int j = 0; j < C_OUT; j++) begin
          B_vec[idx][0] = Pooling_result[z][i][j];
          idx++;
        end
      end
    end
  end

  // ------------------------------------------------------------------
  // 2) 一次性全连接：矩阵 (FC_OUT×FLAT_SIZE) × 向量 (FLAT_SIZE×1) + bias → (FC_OUT×1)
  Array_Input #(
    .DATA_WIDTH_A    (DATA_WIDTH_fc_weights),
    .DATA_WIDTH_B    (DATA_WIDTH_fc_input),
    .M               (FC_OUT),     // 输出行数
    .N               (1),          // 输出列数（因为是向量乘法）
    .K               (FLAT_SIZE),  // 内积维度
    .DROP            (DROP),
    .DATA_WIDTH_bias (DATA_WIDTH_fc_bias)
  ) u_FC_Mult (
    .clk       (clk),
    .rst       (rst),
    .gen_done  (gen_done),
    .bias      (fc_bias),   // [0:FC_OUT-1]
    .A         (fc_weights),// [0:FC_OUT-1][0:FLAT_SIZE-1]
    .B         (B_vec),     // [0:FLAT_SIZE-1] 当作 [0:K-1][0]
    .final_out (fc_out)     // [0:FC_OUT-1]
  );

endmodule
