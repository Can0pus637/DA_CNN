`timescale 1ns/1ps

module tb_im2;
  // Parameters
  localparam int MAX_X1 = 5;
  localparam int MAX_X2 = 5;
  localparam int MAX_X3 = 32;
  localparam int MAX_X4 = 32;
  localparam int MAX_Y1 = 32;
  localparam int MAX_Y2 = 32;
  localparam int MAX_Map_DEEPTH    = 5046;
  localparam int MAX_Kernel_DEEPTH = 2400;
  localparam int CHUNK_K = 9;
  localparam int AW_MAP  = $clog2(MAX_Map_DEEPTH);
  localparam int AW_KERN = $clog2(MAX_Kernel_DEEPTH);

  // Clock and reset
  logic clk;
  logic rst;

  // Inputs
  logic [$clog2(MAX_X1):0] X1;
  logic [$clog2(MAX_X2):0] X2;
  logic [$clog2(MAX_X3):0] X3;
  logic [$clog2(MAX_Y1):0] Y1;
  logic [$clog2(MAX_Y2):0] Y2;
  logic [$clog2(MAX_Y2):0] patch_i;
  logic [$clog2(MAX_Y1):0] patch_j;
  logic [15:0] n;
  logic [15:0] k_grp;
  logic start;

  // Outputs
  logic valid;
  logic [AW_MAP-1:0]  flattenA_addr;
  logic [AW_KERN-1:0] flattenB_addr;
  logic done;

  // Instantiate DUT
  im2 #(
    .MAX_X1(MAX_X1),
    .MAX_X2(MAX_X2),
    .MAX_X3(MAX_X3),
    .MAX_X4(MAX_X4),
    .MAX_Y1(MAX_Y1),
    .MAX_Y2(MAX_Y2),
    .MAX_Map_DEEPTH(MAX_Map_DEEPTH),
    .MAX_Kernel_DEEPTH(MAX_Kernel_DEEPTH),
    .CHUNK_K(CHUNK_K)
  ) dut (
    .clk(clk),
    .rst(rst),
    .X1(X1),
    .X2(X2),
    .X3(X3),
    .Y1(Y1),
    .Y2(Y2),
    .patch_i(patch_i),
    .patch_j(patch_j),
    .n(n),
    .k_grp(k_grp),
    .start(start),
    .valid(valid),
    .flattenA_addr(flattenA_addr),
    .flattenB_addr(flattenB_addr),
    .done(done)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Test scenario
  initial begin
    // Initialize inputs
    rst = 1;
    X1 = 3;
    X2 = 3;
    X3 = 2;
    Y1 = 8;
    Y2 = 8;
    patch_i = 2;
    patch_j = 2;
    n = 1;
    k_grp = 0;
    start = 0;
    #20;
    rst = 0;
    #10;

    // Trigger address generation
    start = 1;
    #10;
    start = 0;

    // Wait for done
    wait(done);
    #20;
    $finish;
  end

  // Monitor outputs
  always @(posedge clk) begin
    if (valid) begin
      $display("Time %0t: A_addr = %0d, B_addr = %0d", $time, flattenA_addr, flattenB_addr);
    end
  end

endmodule
