// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jul  1 16:58:40 2025
// Host        : CANOPUS637 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_memA_sim_netlist.v
// Design      : blk_memA
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu29p-fsga2577-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_memA,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [63:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [63:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [63:0]dina;
  wire [63:0]douta;
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
  wire [63:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.250172 mW" *) 
  (* C_FAMILY = "virtexuplus58g" *) 
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
  (* C_INIT_FILE = "blk_memA.mem" *) 
  (* C_INIT_FILE_NAME = "blk_memA.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "64" *) 
  (* C_READ_WIDTH_B = "64" *) 
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
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "READ_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "64" *) 
  (* C_WRITE_WIDTH_B = "64" *) 
  (* C_XDEVICEFAMILY = "virtexuplus58g" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[63:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 31728)
`pragma protect data_block
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
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
