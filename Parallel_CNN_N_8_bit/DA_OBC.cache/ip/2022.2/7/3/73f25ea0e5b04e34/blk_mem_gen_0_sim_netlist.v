// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Jun  9 02:26:18 2025
// Host        : CANOPUS637 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [127:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [127:0]doutb;

  wire [3:0]addra;
  wire [3:0]addrb;
  wire clka;
  wire [127:0]dina;
  wire [127:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [127:0]NLW_U0_douta_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [127:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.654222 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "128" *) 
  (* C_READ_WIDTH_B = "128" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "128" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[127:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[127:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 56832)
`pragma protect data_block
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
BVLW
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
