// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Jun  9 02:32:53 2025
// Host        : CANOPUS637 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
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
  blk_mem_gen_0_blk_mem_gen_v8_4_5 U0
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
Kz74r1dA0hGUJlOhoTorlHxo28JOCrtaLlph
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
