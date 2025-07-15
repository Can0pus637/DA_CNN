// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Jun  9 02:33:28 2025
// Host        : CANOPUS637 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_1 -prefix
//               blk_mem_gen_1_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [127:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [127:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [127:0]dina;
  wire [127:0]douta;
  wire ena;
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
  wire [127:0]NLW_U0_doutb_UNCONNECTED;
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
  (* C_COMMON_CLK = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     11.729504 mW" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
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
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "128" *) 
  (* C_XDEVICEFAMILY = "zynquplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[127:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 55488)
`pragma protect data_block
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
ABw8shevYyHPk6R8PT58ZSjOtku2H0NxRbyS
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
