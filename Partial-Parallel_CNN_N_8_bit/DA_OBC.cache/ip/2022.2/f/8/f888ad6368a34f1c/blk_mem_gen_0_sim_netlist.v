// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jun  3 02:14:52 2025
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [3:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [3:0]addra;
  wire [3:0]addrb;
  wire clka;
  wire [15:0]dina;
  wire [15:0]doutb;
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
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     0.687555 mW" *) 
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "READ_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
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
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 22512)
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
