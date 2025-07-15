interface DataBus #(
    parameter int DATA_WIDTH_map        = 8,
    parameter int DATA_WIDTH_kernel     = 8,
    parameter int DATA_WIDTH_con_bias   = 8,
    parameter int DATA_WIDTH_fc_weights = 8,
    parameter int DATA_WIDTH_fc_bias    = 8,
    parameter int P                     = 5,
    parameter int Q                     = 5,
    parameter int X                     = 3,
    parameter int Y                     = 3,
    parameter int Z                     = 3,
    parameter int STRIDE                = 1,
    parameter int R                     = ((P - X) / STRIDE) + 1,
    parameter int C                     = ((Q - Y) / STRIDE) + 1,
    parameter int POOL_SIZE             = 2,
    parameter int STRIDE_POOL           = 1,
    parameter int R_OUT                 = ((R - POOL_SIZE) / STRIDE_POOL) + 1,
    parameter int C_OUT                 = ((C - POOL_SIZE) / STRIDE_POOL) + 1,
    parameter int N                     = R * C,
    parameter int K                     = X * Y,
    parameter int M                     = Z,
    parameter int FLAT_SIZE             = Z * R_OUT * C_OUT,
    parameter int FC_OUT                = 10,
    parameter int SUM_WIDTH_1           = DATA_WIDTH_map + DATA_WIDTH_kernel + $clog2(K),
    parameter int SUM_WIDTH_2           = DATA_WIDTH_fc_weights + SUM_WIDTH_1 + $clog2(FLAT_SIZE)
);
    // 原模块顶层的所有端口封装
    logic signed [DATA_WIDTH_map-1:0]        input_map      [0:P-1][0:Q-1];
    logic signed [DATA_WIDTH_kernel-1:0]     input_kernel   [0:Z-1][0:X-1][0:Y-1];
    logic signed [DATA_WIDTH_con_bias-1:0]   con_bias       [0:N-1];
    logic signed [DATA_WIDTH_fc_weights-1:0] fc_weights     [0:FC_OUT-1][0:FLAT_SIZE-1];
    logic signed [DATA_WIDTH_fc_bias-1:0]    fc_bias        [0:0];
    // 如果需要，也可在 interface 中包含输出端口
    logic signed [SUM_WIDTH_2-1:0]           fc_out         [0:FC_OUT-1][0:0];
    modport DUT (
    input  input_map,
    input  input_kernel,
    input con_bias,
    input fc_weights,
    input fc_bias,
    output fc_out
  );
endinterface