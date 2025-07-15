// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Jun 24 17:48:50 2025
// Host        : CANOPUS637 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_memB1_sim_netlist.v
// Design      : blk_memB1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcvu29p-fsga2577-2L-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_memB1,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [15:0]dina;
  wire [15:0]douta;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
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
  (* C_COMMON_CLK = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.189618 mW" *) 
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
  (* C_INIT_FILE = "blk_memB1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
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
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "virtexuplus58g" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21840)
`pragma protect data_block
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
KCU+PNW4Hobm
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
