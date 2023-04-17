// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr 12 10:11:57 2023
// Host        : crisLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/18019/Documents/UofU/SPRING2023/capstoneProject/MemoryVHDL/NeuralNet/NeuralNet.gen/sources_1/ip/basic2MEM/basic2MEM_sim_netlist.v
// Design      : basic2MEM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "basic2MEM,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module basic2MEM
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
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
  (* C_INIT_FILE = "basic2MEM.mem" *) 
  (* C_INIT_FILE_NAME = "basic2MEM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "650" *) 
  (* C_READ_DEPTH_B = "650" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "650" *) 
  (* C_WRITE_DEPTH_B = "650" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  basic2MEM_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27072)
`pragma protect data_block
6UlImAqVgfrDxzvrx3oPDqs+N4RY9GUKHNH6mpM0ml22m/e1oGt6JJFXZe/QuhOt7eCEHGomBU4q
EQrtaJ3TxegBuR9qVGF9Ky3/lLc8TWgAoLQ1gbR7Um0fpLL/jTlzxifWIXYTRzQgiBmzM0C0SrIH
RZ4TMTbsnQjJZUxrpp4DerAmcljhu+1+Nj2ycQrLdFRW0gXS7kI5AmjKOntE9GA32ZO+cw2kavJC
ooRpFQeQ0dBS8uL/wVbjlmvt7AByqY6vT9yt37clu7a0nuKKu8a7LL+UHYxtlMvk3QduDvLjGH8o
VtLtJtwbUY8sdBfmKFRfRqcNKZo0tJC71Z/IBRCI4xt90YxQ3G47/CSNt4gJOzLlawzwq4ljpPaF
pPH2rrjSEsYvk/N5x6eyOLUvTCi0l48gR91AAKA01kioB0yIRCjFnoGNxwPbeBDzk757qsJuB9Is
A47s18XD/3F2lwEroQtzYkhmv2LO4+kIvx0J+3KSQBu4iDTJATdkpkbp9WOMcsIRVXO2i5XxK9X5
IZihY1Ol+AqP5Hiq4F8GbO8JpBRFAdUMoaRk9mLOrGNCScp+oMw8qtXsm6RZx6FX7bOWvQrre620
ojouig20n0FVs+kQ9wFyTFMdndmF3EuZn/V3EDZZor3dnlsJtN+8MPzAOMxCNhSGjqWuJ7kaj6GL
CHYqlLCHHh/h2B1W9O2ZnGdHgOU13iE3Pyh+UoptPAw3tmVx7mHXUShne7TLhjhk3PKhcNL9zUI5
p6GE1a6wtxgn1sGC4MThUcVvYg9pJ8wuT6n1P9g3scr60/U0JPQYI2d9rj1WCQReUrDz4/Da9HCx
XFcq8bFfcIVFZIKR7HSVpOQd5fROh/e2LW9o0U1hHBWKEYftAikAFo7Zj4Y1WaTFzIxQEJ00L8hb
VG1FkVycTMcJ0e1s65XyqVXUfJ+42wQCZsIhiBAl9ohP7OxdhVAZQxQkbiCXwA92vTYwy18v0hyo
zyfzxHj4c4ZrqFKqYPPDd5jpaQY6T6d3AF9iCltwW6JbtEYqUvkg0o4A7b7Z9gleLLhl04fAye/b
5kojVN7RMcdU5rx+Up9sSysmOW7UtdbgYiJNGj3zfBET2ILA1MD7Rhj7Ti3G3mHpiHx2w4B+RLEw
zHA1Aj+8/6qudNhSIIBQQ/zbjChLeDXJi+uPcCLkImRs/+LAlRTiK0pIAWT4cGjm2m1leys32rht
t4Th/Fne8b3x5qNj9kWvJObhG0MR6Yz+wzt2u0MkhrdAi2FVI3dat2CS87AEKB7jnQD6RDvlAa5N
aG3AMyXuw41iwnP7+ivpQVl663liGj6U317HiDvmtaPFBAR/cDA5i0RAN00O6ck47/styM5zoO56
IZ6x59vFezWYVYrEy7At3oKVh1pnXueJqDVwONxcvaRbSO2W1wuC5u9bi1IsvTrX/76lk9EXWLMD
sPHFSvDv+OaXwI/SwS99Zm/338MXQYf+1AxO9w+0KgXLUX+TvFWd51CxWgOBxOag8D2D5TT8FGIC
zZ5WusZrTiPonV/EwZ6MlsE28UGSskdoxOoRH9WZ+4cTjFNof4Rg88unwuLEBC4oMNSXWWX+TqKr
mYVbyXsPL3vywuExT4k+m4D/+Ooy3ptP5urz64vH/9FxaUUexe0j845kDIBPijNUImMhnFZ++cMQ
kH609l09BYTIkUZASJ+jtN0SQsSCxaBFuAMD4ymOliuxcb7/++ZY2r/A3GKis8AUYyeCl8kn15BG
3BPnouvybDMXys2gvK/ODZM2pb7gyH8frFm7kUF02kuhiBZ9rUywP288Ao1XdPLBk0E+bgJOep5y
y7/ua23PHqP/BdGUgkz1ekZLeaJQJ1BLZDf1P//Ret/mGmuVpLTAJGnNQ2ni0omHBnriVZJwwNiQ
Hg+JQyILvu2JWdEoQZVZjIHhKhpNyE+EaQyxt7CQA5iOy2SLY3qAJRlOgXM4hneR7iERvTnv/cEV
FlcmbZ10NJP9kBscThEFwIMjblt6+QmKX1a4zx3L7UTOo1Tu//xTrsRrfRN7WJSVEXMhi2vWcAt7
+oLysNd8eBqvojYEGVHki6vrQ/VJoEJhsJq1iXh/Ccp9aCLfoB+lhn4F/wFuz4bj0SQFATW/T1hL
C87LOfOaF3N/spdWBUCQ+5sOiB4sX+lehaFAGjl6Vl7zBPMMq3uP/FBtahg6BhDlssiYxqd+tEqe
/krU2/7vy4WFWu3ENvZlmpZy+TVCV2yYKbuxla0sQ35cQzUNHyVg6+SeO8iLqnfINsUEljSsvD7W
onMA0F4c+Ts1VaxSI+XHOObpdefcUeasacdXMOqscniXn3SD6pSOIgwmUT5mE8N5aQ+pgUHC+Typ
Y8u0SUxZpT4xc/Q8AXkiam1fRQN+RSPPI++I+1xGfHgJDiy24EYFOQkzom4RFTVogP3U3KdTRR/W
fePJlA3Mpo2HM+Ox5LuKP+OPLTGS4IYBYuC5g+vwz/QFmQAObb6bRKk/8ruOdR7A8Edit3qbFC/d
SHPh3d3dFZYINe65oR+xu9I47sFqXlwfDpxRVglKJYSPV2MKLGG2m9tvvir2LhUF7W1039p7VI+R
FWjGWy3JXuyBr7gQoyEX5frKLmllQH/WfyE1EloOGwFSC763PP2KOsPg+W+uW4DTKCgntop0fXoC
qfLICjBoZxgEe5Nv7lYcjX0JQTdTBIXIgF4+YJaknv1WkRGbrCvmaP8wSXTPN5lVoaELW0emjJKY
gVByU03ayJMHCi28X56/2YJLaeVriG7dnH/wh740RqtQucwnRpbymgTOnVMBwtM8xJgoS3MEAVyd
PGOjc/jjq6JxaRaTB1ciLrUWs8KSQbAAdbZh7ni7l5G3mHZe5Hi3tGtFDt1C9U07lNKCgIgwiFlb
NHIUuMgHxW10xAiH7xICgvF7kIFXZ/43mnw+LEDYHpKffTSvmGAQ811x4VM2XMwR8LPLlBqW99Wf
LPXzXy3JIXjs1HqZKY7IPDo/UBrQvGocZii0RJ7Mrdics8UsTA+QLbuDUQg0m42aJ0heqGnITKyD
C/EeYwWdfjgvnVVjJo5cGT6tjrqe69KhyvnoK7oLYjARMQKn149LC5AVS1f4R6Ij7oQo5JTyz2PV
RjW23cpqcHfBYMDUhtXmcwEc+IRln/W1RzjxVy+PK+PB2g+I+C+/n8rRKt9zMOJPbsn+BUJxDeYs
2vLp6nZrTvAwS/Q13AaomdrTsJVCXPTS4HYydUrnirem8E3bcnYfkz3Lrv8NrsHl4DxuJvcsqxCt
t8gevtiFhtbIVLiPImaTaYpWBDeA0kqkYYwIVRYfn6EYivLYLmIeKqs7LOSlE50xNR4YpJ7lGgZq
K1xeHPyG5GGvTE5I9luTuAOKBu5u9GOFZ0XAwPjL0YmkPFtzhE8QmtBPD2+HqfAZx1xjeGJWMrYx
Pz3ECFhxTJNdabN4g2QbLXoIoRuRJWHRq2lTr/XHVG/G5a7X3YoteSel0uhRK4rpU/bL5qgCjWR6
iqBPkoro+lXlkHGgrkYNixcZnCMVZ+3PpQDFL4jEJaJ3Yg3idtWS7PKtxRE1/fDeD3DG4FSUqP2S
elxtH98KGkSWpdpgEdXpX0QJNCvAM5mrdL7Cr+Fjr+yHOVb6WYKM4xnsoHuyRlfa2+l+8uG9+vCY
B1tlyK9+5H+RDCDz0YlnBlf04tcB9gdQc69FD8bgDo4FUFXQeXOaoo5nxuKsBt1ewQajidXwQPK4
m3rVutavkLkaIK/3vmEYi4t/tFrL2xzEUYozYo/C53EkJ4Z1avhGIIV6b8SZ3UAEErHzFzzcCBa3
05GLJ+y2LD8YmTwfUD0oLAY4KEVRz6UGbiYrr1P7Owg4VmJ5l3zM3rPFculA0U77hllsP9BtLe93
WOAuwcalZCB+NRpES/cWc3PnGLLxGt8hIyHZa+x9cQ52I4JrskrW7c6d2mPaRsA56lDGGVcFhe7Z
p7ccdfmorZqUOBXMFBNKlytYzhl90yzfZKnLim33MEqPauwCQOPXb2CAHkwLqIXUP2sYPExo5nfy
uh+CLOI55XYuk0HXbmL2omo+9T3qpniSfIjWQGy1VEalU5avGorWnz1LEosaGEQBqz2DBwS1obY5
zzmosowItea1luWDD2Q79ie7CiwXfeLs/BZsyVHc1d4U+CWXlsb0yDccZ4+p+T6RLx5oxyPtRqPv
kf+g1dWNiJYrv0OOmb0qn9yqgnm5ajceopIi6THk/7wsAdWQUzimWQUeO3zCpikvIFQDgAQItUTf
9Kh0iy1XV9uclVM2+QZtl43S403u97JIYrayCnOIvxVfuNghO1bJgjjXtgUx0PKUGpMcER3HuFVQ
dSnegCAOR579ZpSzo/X22OP500/w1gcZv9vhXd51Po6IprGtQX290cygtElYhxJDjqTZL0XNj764
SYsDT67AeHeEueAykgndKZR1AEr8du7Lw3hUUPjbTaElKZkSabPgX/V6+gGCUyIYBGKszObYpa/K
kdVG9cr+FiOOpfMn9D/5xea3nZzZXgakl72CVuMK2wBD9sanf6DVwmgl0erztVww0/Z+lcnGIW4A
8Wx81BhchNK6tEUbpuuJBp/glsxf9tja3v4TMKL+PJ6qpLarMR7IVAOVwEQJC0oC/d8qLG0xRRZF
eFMWjD5ppAwikNf4j/FNbMHLMhtx3kHH/7vs6ej6eCYf21Y+WTjKrgzsIECMKDljWwPbPEbru236
uzEp4JFhJb0mPuYQU7qVWCYDtTa8Y1WiyO1Ye7xHqkwsn8b+qCE9GdrC6ReQX1AH/RHzlAEGJEHT
K+dYjJGccZimNDlqTwgbpAzuQbIxAcLt+ZGRR5i3mEMrIDqrjhJS1u0lS+T8+B24Vjap7f0b+V/D
aLf9kuHexi4nl/RMdY6HW+2zEzijhYrBhbCgF45fVoHDe9Ze4OqGXwibkLbMlcSPg3ZOaaTTtxnh
e73uMszJcUZ/IZ3eMgIWQYG+Af2Rhrq4pTf0DE3EkMhC3nTD8RcGqrWpOxMgtOKPQ1xjnG7oKoAR
iKOIocmfo24eaolbLA7OK49tCi3PulB2MlGQQ5lwC04DkgYgJCOMSXvQW4dpTPwZYTcEEVrlGZ0m
qIu2ikXxaZJoMnmtB15ap0Cg4U+dU4KpXe96Sl1AISxGM7VXGXeICi2RKWGyTZSWFHRT/lLSnTF+
cPVUcNGsGkuuBSvdz6xJ+UZyqnPD7iXXXBO22QWI4Dn7LQ8nU0BRBPx34C1fcNuqiOEl5e0UlGLy
/SnvQAjmjOoeiNKPl5qpHSuycnHgItoDGMkxAf9/fujbReYDXStl+HWcT2qXg03bpv5Xike/XuKM
Wy8vKJUcX8ya/XY2MJc0a+X5QsQX5gHycXBUfnmDgU5echg3NYo2Ac+uoDYltN+i2RiQ4vjDs4ro
nuntY+YA4H+aypqLagdzL7M3DSjoELsgiYhImabzDyvd1Dagp3aQJtE/TnydtfsP3UrZH5/sCdfH
Crx09Wye1Cayi/W0HSCUOuApOVqA0pRASq+nuUhCUFVgrJDKK5Qe0CwWPwovUlQ/i1s/G39tKV12
8gydEQsdD/Uhz5QvScVMp5Xggh5aIY9jdlERbRWR3UtKutPHPyMBi6XwkGCPWTJCNUKLqY7bioq9
7SHZixTVI+JnZ+qiT0WJGXyoq3+CW2SX+3VclKTPpZaUtcIclRLaWYgMrOXq21+Qk/cGe22Jv2g1
1p3G/0VUOFqpFqivfyLT47lA+jmN57dgRAzJ+x3ohXSK+7RjL8jabjp640hnaf9KgOarZ9ey4qXb
B6mZ+lb09S6o/qAEYRTRDU23oWmeduwqkVV2huAIic+TSwnYuFKy27iwsE2uXETiYoh/zqWSpsSb
ZPpbRI6imJtMbiioDVi2ItJ7R/nYqqw6finEPaxwdyDDjHDQ5Wotw6YqxpBJ8iiIJw980rQHM7k0
sx4RjdDOKsmtXOvbH0C3sfzIhHC3b+snmTkTq44bfy5XW+gm1vsROx4WJcC0U72B0fhO2oX7OM+R
Hfnvy2f7DG/Vx9A+3/9AjXYnnNaHscIvsZLeFvgNq5/kla92ojp4xZXsgcSkueEjFUOEeKsAYZIq
hPoeYs0jDTTA0xzz2YYt3n+0eomwFjenPIBnwGbOKOtG1hEQM3eAMO0u8dVChPEzYgwk9f1bWuy6
NGN+5kqliobvmczO2fi/UO27ihQSVGnpmDqqemu5oZo8arHHQq/Poc3VdFAJjRB6nRQNWU/CT2VK
gE8HH4K6C+2qYrtYh7XzjZa6VSVIIY4jlrOYvP3tbIEcSYINX1VCtZpKuhSDtNIFAG9Vs1Yz7gr1
G5Pa02vQ/WG0wEr1QM8JD76VHrChhf60WWYDkHtA7kyfU0Nwl9q7XK0esNznEGe+Uz9uT6EKbRh/
gzNJG6NIVRJ4PJa9A6QL+dwTYEchJRW9HQF9zpwrB+9yheu0EiPpFKpUkWXBAoc6O6xDUrzhUVTP
9aj2eQYgcjhzvyLj6odCi8gYud53ibp5iUyt6MfosqmckVoR5ZZ/tST23z63fzs+gW5C152HECrS
y8rbyaP07zaDnf/Itl6v+nxquz/ELtng0ZfsmpGd+ggB46mX2GOtA6kFb4m/vQR7AWeWMO4vmRix
+Slb2h9wGgEQsyrMXOKZO6K/kxLMqhrmQfcvQw8oMMGeRcC/x0PgeKSckC5xDdlvjuYgKI9tJs+x
iNbYuqAy3vyTWWPKem15Vmx/NKCvXyR88B0Snyr2WZuBvyGk9Y07UX0QOiV5smuhRVSqAnRPWIpn
U31VoVCWSnaLpWFUBrnCmZYHKPjA8cwjafite9VECoc6er7af/7eY18D8o3M8GZC6SCkq8as4HlO
Su+xF4wMOp46UZmd0ehNuFch60AupqFvXtcKDWUkAlOsl+ftBGly8uqn8t24FFac8Ta0e8dM+22P
0xB6pqtlv0mV82sN5qHNoMfswYAnWauG1Kcp8JVr8kKMRGscwc31MVRtZWFUBTCTojovro4Q/j2z
0ePY2unFkZt51zLaaPlWvmrEoVyVFr9OZzLo8WGIIRwxhelIWq3+ARvMNy7n23RohQfhd94pck3i
cy08jdYDVf+/TXEzHgsWCaisoKyRbI/3f9y+aSpygDfGFIVXAk/68D5FBnLluNEK7cIp/ZTjNkhg
AoRnAKy/wwldC2nBa/vHNT/VZaJNPoLTVyoSGdTglr8pi4pUUOd8mBlQ0N1JHepsZiZaOPDnmxP4
+tXU7SAw78lEJNHcTPwryzEX+71SuaOAoxMOQr8dKyjiMCIsWk+Apcu9JkLQqH9YEPoWH1XhVV/f
jeOtjOnkilGhy6DiSBiF47rWVNK9+sA8bYtNXQu6IVZastQ64f5kWdPd3EX0J7mBdc1HqqERKnzn
b11lm9PJu/4w1F9jnYwNQ7Ondq8lSnLFy8JtxjsVIJD9v3R0ePb3lQmRJ3NKaUSsMbWc8d8Sn2wy
blTqRTby7iyXUfxr/Ar9DMz2jjJeOucu1h1PzhOxIBJtB6JxOceMf3RAXIYVg8ajFvhk9CDCH6Lu
qoG5cGFJCvHJBkekywPTJaMDxhL83HTpOztl9RA5u8B6OJCC0UOD6DbEh2HkHNs8CH+j5pV8JqSl
Cgr6heyBBSIQy3XUOq7tHD8XA0lnTz/tb65eCOvMmPQ98V1rcVKmHjgtP29mkVhCfjKnICaW7if1
aQz78TBuwoMl7uEE+fqWRgZfyN7c30v22lXMIJAq8fBl/R/+zeOVhPXetkwjCZ27HCJ+UiYZPzJQ
aXPkoyL8lS/Gf/fVfjN4LXK5NzEZgbDN30IPDRB/INya/DBASpaDXYSZaUgxJTENFQvdmNo6zgh/
hQIfYB3dpryVxbMCviK9BmpV4HJKyOYtCZQlDsroe19vV1gL4rWcrQNIXFpQRORGmxq4KyzmR5qY
DgwHbtxZlH+QCIYvIieFKyTYdyyB13p169fNDmijG/eVw+FNVoXOp6K+FmheGZDUObho6o8VFhJH
u6RGKsH5gCoFCh/korU04FTP2tCUcvPuY0McN0MsKSpELXC0uWgfNS7j0FMpPXrSo3xeQYN1032h
9/7ZIad2U2vtvh/dGHpBjIcti4FonfrWCsFxQkEQPc/F805Szfsas476xyuco1r7/sHPYpVAzIXN
Qo5Js08DsRUPJ94/pPMN5MvlTK3ctHngJBFEddcqfNfbi4WP4KgICOjHKVO6ULZYrNCpRdg2GzMS
pljpKec4uCDuD/1bGPQhPsXxvGZSXpcpSGKvaBnjuAZS80y2saWccw/6S7rufu+x5JMPTwHUwHBx
yqQcyXXsVh8VUd9VxAJXoUgtBhfXjMcnr2cT09ZFV8niD+o3xXPisEmdz3Dht/jIX1RKcHZ0nvM5
0gxDE0JtUjBuExmbmNkH2xHWtbs34PvTcjI1e1V4TYZltMDTHyUBApwkTZ+M4UrEogWpp+2AhuG4
EcZoc0cANXDaQbNKJR9qPh7XDzg8tkR4vdLxWrhojCkOyPJmZ4cVCElco3Ux7LKb/mnl/ErBQjIn
8JNS9NYPuu1OLGBBsjTOLym2H1m64RXNXcINTYl3OQaIhd29QFY2ELO9jnFv46wtETuZVXs5HUP3
3KZpfVsUSoOEOyUrbs4Vt59aIrqXCHWWikVt5pt4vO4mTTRfLFfVuR9SUlZCB7B9y4SZVb9eOHjV
eQQVOLtrN3McB3asGm3xZt4J5EOaYUp4J7qWMgdyTP96qi4YgFMcU3MstzDHQlUIyDEQoTgvBvfl
2vL7cDAjPEIjdnK80sOEw3U0rgQtijAKXjhTE4DXRZpHeNVGTwveRR+gdvAsn4OkAqo3vdrWg8gO
gp8LB6RqMvXoOwCyN4qW126gl8Sp11kOQ1w40BCXmMX0nKHrkWT9GwlJuihB5+fM0Un25BIOOkuU
nOcM7ZXtgrWZxrwBlQgHtlFT55LJQu4Y8+RVTQABLeNIhZC9Kx1PGd/A8oSRmuNMYxbFHFg4FkPp
sUeM/D/UJAGzie0RJ9GBCyM+53UZDz8rFJUvSVnyPjL5fycw5x3sVq4UFvxhFm3ZjVw4OdKhCxcb
XbUUJAYkldSqHJ0uQOP5WMiMFcgXoXG6ZtL3G48xDWtfPsIqfpyuNG8/ScDhEBPcCjzz64347H6V
We2RoFFo3GGoDe0WyANg87at85N6VE8qezkvaW8PSOqkhXLsEmuN20Xi22pQmu8p2A8XBU2k/Nf8
LsILiDeKlQKS3h1k8GRTgF7J+tV6gfROVNaQOSgyEJso7en6F2JnFOXUAW1bARavo63dBhSvNe3g
xjsvQQDaCE6Du+6yHMJNFcc4pKc1vPlmWmmZH0OA7Re1j28U2Wt72bdiWWqg7528Tif/WPIy4hbH
WA8ICeEhbzGEfcpRE4txp+sisONwysND6GmTRmvbs+H/EDpgV+PGzjHBQX20E6mkA/+b6GsTul72
OY9TpHTnUXMobs03vzh4TSYgSrDTDFCWeG65LRnOJAKJkJYgMNllaSqI4aPAtSlKS/Ojwrkz84pb
Exbe7jTDPPgKO78TP3VBx2+mWkdG4TTIGEfQGFn9WqcSnewHTOMlMJKZ5qj0f+T1Dmp6Zp/2zSIi
KT76Y+Y5o3VxbMIeBvA7PF4q6Rpr4Wj2p1tjrV+EuTpTSnJkS5OEpdbohYJ/IOzpAfAMBizh3y9g
Rt51Tyj13XFBCGsFCwPKz9eMFymWi0xrVpDVly/gtBxwnPEORh6czlfgbpvU3NsPFgoN8sjpka3s
eDBAcWugay+zbTFI3U/lPeABcI3VBijJL/UzJUabuSlaMLN2/wXUINYz6xQduyJGCBKOm4wC48na
O6WhkmBdU2yLrGnzFDEdMVI6h5QRxx37maiXc0rIoZ+biqxQiOdKOX9v3YEU83q0C+ROu9pzeLJy
zKnE7iSTRHuMpZ+0j/CTbA0hPqFFo0eFB09p4nNKUKp36Q8OSBRRxYplDI6GxP+lNW/os2bGaPyZ
a1JN9kI2kFj4hf+1SMtW4y3PZoHn+pLDPjET5J+Ll6scj8Hl2RSch3RYacqhLkLw2vuP8ZloAnOO
3K7qxPMLShZjI6U4PHfJz7Jf7X7+YgkyTjwIrKbGqy9feXuTVa4WUl51oHUT2dIJ/s4fG0lP3A3x
wsU3RXvVzgfL2ezrOwUwB+9XY9Y0xt7NhJhfzKDUyd98MJZQ3j2+SDoQU27Yuj+TM3pnIHAGqbpJ
EIQXwD9KQwM5lW9RkVZv5GVoD2xjB6c6Df7zkrVCqiGZuXOwxpyaGD73dbdhgAVvFo66SoBe2sl4
U0qs2WznpuEaWM4u9pMpYBNCzQ+raMIY0nD08W5L+8F/8CJ9zcTwk1OOywe2jnQXGBBVWfnSaFzT
6ck6kazucAniSi29fgD7Ou2ySU1Bj56rwN2SM6pH5NI2J+6QbjffVQZfM+FhsecORNNfYxnKx2Rm
MIBa3gjlBYbsFbtvvQy76ZUnQLgk4o9U35XW4wnPnk7QYu/uG0mP1ICVdDE5R/QQDIy7OnD69Rj2
msQc3dLDqcYCwXkkNyebWFi2D8B7tW5SPO+0Zo+7U7hlwHM54V04731YGYpxBIuyeI4kiYPkKLAi
Wl8H5NSAe0lHhqhb5p+VyhvID09z1+7aGShaLjoGHqwbv3RD8uEonWOf1XUjg5FDM/Z0sxvShlqr
3s4fW+UYMWZJCLivN/6IX7CSqwLyxlD9aK5tTtmzWzWQ/A/IjR+FDTCOoasNkY+PmiTk6n0DuEUn
9Fj0B5DlSIPwiqztzot+gncIcLUdo0nh+PaokMoRQoUK0fYYrayZXhoUXkM6yR3O5hoOprqsuZPm
/4RES1fgnijzC3Cfe6bJtHpDH9CaKFyghmD0huPz04X4K+xJrY3vMXcfnNqEQN4VePq/Bl/qv0WI
MHCneP/MrMEQ2izljqIt27ceHQSeHV+nST/svAFxUhNE+Q7jxn0d8h2c1o6N5pk//lqYwqY+S6mC
1guCcMQr4HusyWQ32mZ03M4KR7ji/NTq5ZO4e8f53VeUHoKgJdIK1cw41P4IRY7tO5w/qPc8vEk7
ROVSdyyc+88+aOX4YsDajXXwb1mgzHm3GGlz5+9HvPbSFIoN5qd5xWzjGY/ktB6x0dsgrmmE5njW
wx9nIWK/PtH7acIw1tCzCe6H8w6TWNmYW6GK6fa0AdQTGzXhAZoEwMytA5dZX6isget0yIqDxwr4
5/TVnCbfEA5CT6aL8lYNht/uNG2Qib60rWOAz9Q4qCcsWnAZny5VAFut3iys3v5vedk0XvZ7jdxm
Er8/PTkriRnhRNDzKk4hLs8iMLxNv/XnedDcvgUcF8uQp3UxuR+lR35ga6IcaeYecQhiNoNLEFg1
+Klf4z9apy8GVHQX28N6VboeuRVo4rUVXIfOY4H06jq93tfio4mH9sqKgXWZ0A6bnmfZzwtIoGt/
YFuiOiC+LoPfF20EXvfm7OEwtFgdh4nTj9GFyWjurDGgizBeGHAxR0VptXSCrAGxy5oNHiFmuqY5
FUAOmhJv6Bts9p1Nb5e3R8ERbg8hoj5Ehex1KPTHnAYB3Rl8YpfDJWsTpjJEbqRcd8pVl9+DBQht
S8u9RBn79+zsePq6jNwgOymVXAMLodoRwE7csymLdzdPbJKWkYcQvdH2KJF5NkEZfuIjrqxl1ZTA
7VIE/kOTcYhA3PPid3FoB0YBFgKBM4p+HBSsMPe3zNWm04/0WglKtK/qLeI0O20VLTnAhLQIhvGG
yWl2QdMMx80FZ6mmstX8IdUkW/umzbATiXL2eBltm0a9Yq2GQMiypZMo3/KfVGgMjUYePmXLEkd5
w8aSoggZuZb4QevFPa9KiT2Yu53+Me/JjFvbe4c2Hn+BNVj/rohDKU1KuJ9wJL0OvhaIlB2kaRTm
6/LVySn5LKFN6gyQZBUm7JEVOyeTpOJY/0vWJuhocp1R/ej0+crC+VE9zTc771KplqD9T9JBjLFp
3GXCua0HOa1cdn8E74/At6+3G5bar396RTd1joeFv+HqGTTST3o7Mz50yFb1Ty/6mDZ/w1gJJedf
UUehVLPNBlxkehAM6DvZ2VCUHPy1vAXxS3qsZSsFMFVAPSGRemrY9WQpjeN3/RLEDJQGwbgdCFkK
LSdXp4g/mscWQuVQhOhcJIk1dfeQWk8fyl/EfLejPOXElbCkadmw9UBvrU/NAADBA2KJZic0iUPs
iETJ0o8VtplWdyv2hFtwQ/AmPrE6K3vvmUb/9dVm2/Xjes16jSeHTII0GXSgk8SWmYkilfMc4LGw
KVoeCXQmNgQYXHk0tP+ugZGjTwvy4h4Sog3CnvloLlJaWnYmQXsojBHEYrJksWuIUrmYbrA7ALzj
j7fHHEb+FTPSPgWT64r0lJWrsQb5DIscfjlD4KOC+br/lTre2N/GXa1NpiwjRW8vlzhTwCvIJ8Ey
+o3JtfnZJH0uYNijWpDnEIEHFpSjaIsm0xT3GCi3HiyVR1KBoM+eL/+Jww5cqT6vjv+Fg4amW5o9
Ea6qGsX4K4fggwcIjPX4hdX+AGdBvcF75/zlnaJVXU0/wFC0IdG/nvZY9gQs6+r6q8HvwMrvN673
3o4sBT/2vDYwlQgwzVQEF2GBI1IomGVTRYOo8fy20e3aFt+HXgQ421yPArH6/CuTy7Tagyok+xBo
mciSd+BsceAv9i3qejbm58wjUqnd6GoqDZiHVkeOPoBwZfY+HCzG1W9jWJfNAg2oPoR/rDo14QNm
VQq40uwU601P2GY142nP+OFQhpw746/xFXXc5i6YuGW/qvksizyfzvLeXCXnnlD64hs2nrjkktBk
lIdGTR8ORSTQ8HnqT2oJeQR7NO193ZhdyBPgjYz8BTlk0f1tmR6wIgcKMSZRKE1VBgsQZAUJm8YF
y14WYm/9aENZ51uR+54eHEcNcA0oX52Y79Qs1ia6A5EWalL1OvVdL0S+jKHF5FZiiY8nxp7s5z+Q
DWaKgqMQn3/GTLwlAgLodrk1fbLPdOLu8rTCo9W0DwHD8kGZ4IV9z20EwOZHrdTcddInQH/JLyzu
ZKcEwMOm9kvVxB9G1XlTrl2tKRrW62mXWERbtsecODgZX6bfxrkUhF0cPNeKOx0kr6R4UczpsY1g
JBRn+5ap+V/6ufv+u0nOCiq8LQben+I4kQGTpVPInkE2BoGrvg3lT5Xw0NrtG09iO0vRL8I/6sdB
VKQ9dLYGa2JbvaiGeeUK35nuVjnlB6QWyyvEz9xlXX9fOOUIMdA9KdMUrvxIzvsz83+mLk7EGsJg
50xJVceikrlRGe84xcOMVye6XhL0DCXrHb3ecTyrZCnrgP4KueFgiUL4N374dkDvHX9+uHkw2Bnj
EL8nIfkGUkiA0Qn70/q3jtg1w1sMFhPN0mredg8snuZW7GHSiVvn2Q9MWsp6k9ncvxEEKha1hd/g
DjbyaviaSaYCS1AJqv9cYKgJ3XoW+Orc82V1t2VA8dLZLB3++2P++ms5lgMwHjWoyV73ntiDJa4i
sRYz0AmlW2eUu4IkGCpxCmu2un2OtMIO4XXGJ78k7aKM/g0x/NNfAczjU585QVTv20sQa0Z4Y8Vt
peoQwqIq0PuczXiB/TgeF4ePH3XUGe1u+3xbSSadmC29K0T1wwltZWpF+/cpHxSysvtblaCzvVRV
XYdPCxNTOsbmk3MGEIaXuVPLp4BEFi+N2GwCIxzKVxC94FcYCgW5oB+DEj5PpmcMYQM5KQ5v+TXL
9j7qCCBTLj9l4cG1Nsk2Pb9877hXAWxHi+LFZGww6vK6VFAxWCdj1vzWi9z6yAB3/rQTlRMzm2Z+
2cVgMZruG+oBdH/1xsylaJg+2EdWAo2t7Th6POtj5Re+suyybMggsDd0+Ri258UjIhBjI8Qkqv+a
qLUmByiD7C4YpBtLhUOdJDUNx0Sf0qMO/DASISE3NRw73W6epPUDPu/rRJeuTirJ9TOdz856rgzd
Okp+UxeQQhc6MFgMOrr7KVm8d9VPJWgrVLccQcfe7o+yMSXAqGzvVK9TWfvpfubxtFu2m9FHgxvV
Ny0uYzSmSx7uB2CGOjqKZFIMwg9pZtAkKNlZpF1dRevsEGN+oswWmTcvVJYKu9S4bToDN5rCYwmy
C9bEDIMUmH0ywq03H2dBCUZM1kKVN6seYLlIk9dzaWFeTUWxZj16c4Si4kij5D0woaQqGBMdA6a+
jHNuZNoFS1ly4b6kKqP00zYqNwcYe5HKx3EX2kLMFgpWBnwlkyhanXA44P1hauM0cWEPN3okORia
CChGXmK60gVXTb7W+/iv9xqjbnnQtu1fKn8JjnmvupeE0LGLljFy4hMWQIgE0If34MZsntfINMdX
3uV5VuRxkra8LgkcPl8M8XilLlMa21yNXEX8SIBiklQKeWvL3PY01HXIUaY3vBHA6yyjtXoE6geh
u8lagF69vVrWW3rQ7HlaFPySzuiE/0e6WfYdxuLObvzEo2mt7mTR7+f8Kecdv8jBqJsDIap1q1a+
gf1dhMVTu4cfzegxaYgs90XmMwh60vuVVLrBA1L77hIHZxX4BxY3eGnqRkNfOaWeULXeNkxMQLSn
GUixw5jrzasy3SqKgcGIs2VhznWsha9ajzFmCinDgF7erKxdiHfJpk3VBqXoEFQySoPNm5rLwtAK
FARpitarygYihqalJ/OdYmGN190LhVFjMlBC7rvRkJNyFeQl9LzXm9bl1XScpZD2kN304fyXNMXh
fB2dHgFSjFSLiM3Z7UJZ5mN3mGH2QskLarlMxKi1a5wGmsdKVSjCBOHcl4hnqrtuZTiEkY6kxmVJ
kjUDP80FvcmJ0ydqQiXIDlIU2u5S0OjrnoyCtigGwiYDOaH1BBnjcJJEmP+FJywa/3Vo1mE+F/zp
MzSL+XtNtgv46ndFRLfnctcvBUHHl3chqavWnBx9zNIAe829l7RQydabe/LxqEQUdPy9IfpFzAat
X0WaEdupws9Y78+/KSyXYz8Kl5qjUcaxe2yRR9A5saxucy5Sune5nTYxtkqYniRU4xvQVzG9pJ7/
XMiRB8ECw8NAhNHwS+6yiuDIEVE5uVx1CagbZ63mfgrZo+zheGRpK5StVQPZwuOa+Z7lpjLkMGlr
hC5D+YvVsTl3/bqlQEU/sPfHV6MrsdL7fJCuqTw1fY6oL76fkegw+oarYG8kSWemQ8HtxT4qEN6U
SNAZMd/GVwTWbD2auI5g9OMxfaXmJEetytIfAQlE6cqmkEXqSsem3j74oQMQPLMVBpewdhr6zCKI
/QvgOL2++gcxFvqS2xcvj8tZ9XUACoUahSki4jkBc3sUoAp2naJxWFAsk3FSW8AS4JX/yfqoViRH
8/G2PT3Gyursv4uxdwJPMlwYudG8Y0lf9kSfRdtWZlTdFWCo+LGv9T+93WtoAt+CmkPJLJR1EL4I
Vg1tdg5IAcd5Tx0fRGC+vCU4JHqHta1bzuw81usHl7YEY0P1RF2ow5LqULca0EAdGL2m7118wJan
vFWfet/YlB1cKs1ZpveQrvRJcSs4j43nNvQg6wvbYAg6jHaD9fQuTBCq8Hwfde+VIIuJi5T0lfK+
BWde8SKxuC0a+jHR5GSHJCUTRPQCgNBltk89IyadNf07IAc79KbL4OGI8hvmUiJog1ZgmN5OvLB6
fGRgRS1BN5mz7H8Xu0DlRu5Vkh+BoCHKx20PL1xLtkSCH9mMYuZtZoDjrs11RPaUqShjytJOJsVi
IhSk4rmjyGJbfnu4gYAXlSRWYvSOaDvJCKkremkAY1WMSvPrgBUC+Xf30bTOh4rgWlXYKQ8lB81J
sJxnnsfUxtRt7rS8hc6wKqDKg4YFvBNAoD6WWkQY2x2Tvea8XPTJ+kDouc7OzvPd+tt61doftHSj
aqgN4mpO6OKPteeR6JQMUV9+sXK48yvbvhsZG8jES0uZRLUMJISUkMBv5AdNCV0DUMgvA1tqngJG
lMtW7IHHqjAZLvPjUDp+W729p5pfqUkm6ps8dZmaoBFVIs3nBlJrpQl05DeYmI3EhlMavsMbJROi
NK5bwyucl6f6SmnKukVEgtW7aWjhHBcJyyFkZtRkvrc/jthry2BOQ8wYIUM9aUImCCIVdgpADqOa
sT5W0L7C71gpKt8q7wLPXBA6h6txgp7BPn//NqA2WWRE2iVsE8DkkpP+HnTPZAH/uEy2qHbDPryM
iJFjHNYnwKFGL7zHjZczO3A39Qov81GSUQD1GxYuyQabWJx+aGuSMM2iOiuPn/dgfHi8MomER/8s
i4uzaReI/TiGDtwAnNRR2JVjLIFt451keiAY3yqVGuFVlnRB2tiom4CqA60HemlVgO8IZM+JyVxY
gUWNl2MLP4MJcQZnmmvoIEhoVnjwxq1vIpeynrZnuWEkhNDWZAkqmbHz1CMOg3TQAJqZUSmUTzM3
cnY7F1sgApug6oRgTI4pInAEM+obsRm7ZI/WeL2Aju2ilbbEdsMK+AYgbi7lSEFeJxqHl0QNFF3z
Eop9mx4M5MHZZWD6X2FaryHAIsdy/1P81JjluBeLxH7NnXQOeYJZdQJdVN+LlXFvjjPYYXIz96Ra
oWaqIS3jPMWRf25J6Ae+eO9e9MQRgOjWq914w9RN5M8H6i5kNFNoNsKFCvQyiIcHvcV3vR5Ik/af
/xU9Bv8US9o2UlBh1at/Ap7AZS7EbrnqgrK56vHPtk6HV8izKEeQ9imDwDSDQPPjRI327FhWuDzg
Nd6yBbVJCS6k68hadbNTsuh3G2N2PzsJGH4gFPCU0JRWfvuL+UKD1rkSGZNGynZXGWdLBPNIMQd9
TkzIPfz515T3dPcISxnVyvHBua11EbaBXt/1xBEoAg8toVcD0mYUwy9MERCEVMz3mn3RpLVKkIJh
SE62Rd1NREclZEytgaz9gjB/thmjbgvvwYYinfPN43Gwe0ukqsmNATOKYdGdXhpHxKU3dh4y4v6A
lUU5MV+00mntXD/bGbRF9GUtlEN7RRVE14GEddofYzUD2DTuA5hlBsASxZEab2PzLIg01gTqEh5f
8UueAdkbcG28Thf/qcIK1J0tH1mAD7ic2U2JSotZNqTbQU/Ir91sSeKMiutT1Ip6P7QAgrBrmuJG
VUwwixwUgrIcpDqPDhgh4wOlaJa6mLw512OCxSigYUfpwkjuZmEgtxdM2Q1MeQ4T2CS8IpLHYWVm
STw2Hh2TekS8hZUkXlWCAZgRSVj5WQNCsBmcmkbcR8iqk24NGnE6VQLOQl90uZQfySbPwI0oLlup
rGnTBDoI0W6qATWmEXDINOxTMvVkDGHxcs35cCss4QwFh098PFug4c3mpLw44mzeQMyPPb3XohuK
SGUs/mROnfx/IuFAQ3BkOqSyfEFPz7IGx4iqDWngRAuxuSRqKpRg+pzLZF71SPQod+iy5pEAX8zV
eLYVilxUVMsk6SbkyTJvScSsVnwy0HhvWHGpAOURzdvghSnHlfzwlTJ68pC+4aTo2w64enYwup01
dbKeeb8HsR7KkmRe7X/QW4Zm5unXJs5C+UrE6QSOUxyen8s7kmQg2s0aeg1mv7UmT04XXY8ACOWo
IH1Aq/7VA9iXwSE9BznRrSgpZbU3LLEc53M+HbEtDa5GahjqRsOyUKUo7FJeUWM2Xc5jnUFcH4ic
mMFntUItzyREh/GAmZX9nl1xwVS3AK0FB4WrUpoy1ZnxEBupzr+6Qsg2RvKzBPnlDSmoU1hp57LN
/uECjgsPgR8a2eEVwkKFRfePguvFcfVIJooHQ/ImNDCsl9hk0oSXHwznAtXqeA2e05u+vobAoA9k
UPtunCtTuUh8mJSfg9qBJL2Dtzhc2s7nMLI2nxR34p9KOeoERlhfhcYXOd6exFV8py/82bHorCRl
egH7Bz2p+oGbMPExAcGYbQLoH3Ihbk5Am4q/oC2pBaXXP9dE6LpAvhn2ona/MZxUQm9e7Pqfzd6k
CHOuI8BXkk7+tTf2aUfieglCU2Ng3okBSrd43p9JOuI2PI7N6mLvsEqsv1oOeN+zVzCW8hqKGowp
fFQo5TDi2DjW2r+44Yib3/aroy+sFigbksEreuNzbSiuYpuyQ1sWj78fVUPp25gTEuITc59yjdCf
acpQGK31cvb+I1NNMHkw/8dsP1JXgKXavRO5Xe++jdoAyAkoOid3VktF83+Z4XaEQUh1eHB4BqYX
i1uyEUDwQQ7Qh/WUBcYbwZwx28xiJGFXhT4z2Siv2Be5X6q3NIJQJi674Nh1q+Xz09tIDTQgtqN6
ge93Mdvmu/XJYIE8OgecirqVmSIYpzuZiFbpB5L+M+kVtCWjZzOKU4jr8qvhejRL9h1rzKlZu3Hb
s0pQIp/dI79FA6iMXItoNauRSzQbMuvdPS6zPbclprvQOPDS8RePRyqC5ZulCY9jg2DGwv1F4ese
KZH5F1JshCeOG9d+Sz+Sd8M7IdHsHl4fwuUilmTqEQxig8mrIxlQ9CgeCerzf7mRNsdYuCqa0xtg
AHGUi45OPxYHx6ljUgfNW3B8Hitd+9eAXCpBNz0pzcU2c10Ch2YORiIERWt8j4rhNG6Gv609UPKt
ii5b34xX+S+c/wjoV/dzWgDPzZpmP4+/9NPDxin134ylIIgsBLVOAv/yHYmUp0Jz1Xn3jkVNcI4S
ovDSf4MFBDmpQvmEsTEbGkLvLSyozBDg8kSDaoreDimVVc9d+aIXCs+qMnZuTgtpspb3f73uiM1P
6sEUalxJP2khdf0X1n98BEcz/IU4SVlt6i9P+tae/HZBAIQmlFw6sxSfPrRrS/cuprEcxpHrr9Dx
vlw6r4Icc36BBf/v501wihZqGLc4jsyGUyWRR50xLEvqciNwV69LiOxiAEQPT4AYr9NXlX4fCNSY
4RhwsI+Lq5xRJZf4Quqxpoc4zmzKX34jlHlRCzRW/zYZ7KYKn5D71l1grbjpwXN3mi7NT9yqo8L6
5I61UHwmhlnYKpP6n68EIdGTxIS2MR7v3hadUyi8YtoJCW34tearKjQE8832mmPi7rqRdqzagNeV
i2uHRG4iw7GtoIoldnZITf+pTfmoy1hlkHEHvszBqd5YJTUeXQ/ysXDVeYns8W3lqR48ds1aqDkg
j3+xnnsaHxM8WdDXSUGdUh2JioMjplRuixWZo7jqdIdWwWuhoLdI2X2ZhThll1eXRl65nL7sMfb/
kd3q5xZDPFn2AB4yy0wuAbzmKFhBIhIXN4hWcs35UQX5qK5rkNhNjmmFABUkDgE7FkPZwGrpLssm
0x7uzNY/nHdCAvjY+In+RUmJmo0Vi1LWJ/uoY9f64IYFHlZN5Mduvz81Rf5YEXJIcqcWandfVAgK
ER4CxwVqJKebeW675OD3MKa8i0oQllxpG5EoaW3xrsLGE86ObYBpkSqkHNGMW3xazoABjXT93zy9
Pg7Tw+K8/mc5WLNTzmfcruMdNL2ELFNuTEJ3+4bM6Qukdhxidl3v2QDr0TsubIm+IeFeQBzCnsHy
8Mq0a2GNNjdcVuCAI24HMRw9guQ+CaVbCXOy9NVA1Jw8h3y+4jWNvtgEjybS94acPyqEY6+TlgDN
woVlVtSUDxjbzjxmFbj4Ty7ddjrOkdZYXevKFQnbGOaQGkxbHlKgwhK6W8j1yhVCE38HjmEHgfoi
02bOpG6GynkM2yjPI2Jk9yUhdYYVc4ZmixmqeLmLjKh69wU4WvhyLKeGVaMCS5NQLfVKYpFWCs4L
m8AIIEum5QOI1W+O09iIm/cb+no0Ut1QvDS/t/ENUiPMjehnGrandv8gPtEMmCMdveHsZwFcyBQl
HEuiR0rHWiMGVCybW1rIJbswRAoRVERxcanyr7wA+7DZm7ICPvRDestjw7oSMzSTng52CSu0caAW
xHTiBV+1NmbvVmkc4rlHDk09Uloq3ruEtkbDWuLHYVJhWTOEtn7V4asJEKFkScj7vBe+ORNLEs6a
5fqKJN28w4nly/exxLcIKtB8pXF/X5JLcaorp/4fDq/CRv28b1NdQPqFdbDo4Lzm8Qiz12+qfQM2
62IRl3NZDntCaOosm0io22Kz6RJYDd4/+dERvrTaGJyOmD05ZSmTLS4HBQew4eNalBeIDZN1glYs
t1Ql7AqQDselZ1R8hcQeB1l4GHcLcm6ifuxMv8V0tus/BJnhoYUdr7vSl5d/IL5ASCNq1yTgrCHw
IN6oCCCMbOIDBnOD+clwl7PHd0nkhEh/JbTdy40TL/9lq+WnmRLVhR00I3JIiel6NO448carZgA0
BfcsbLjURtsDfdCRlYAfJ2tejoiKP6hqO/BF31GvqWRYx+/jw7vPeJ7u9pHG6BDDLyN6aQvE0KX9
VdRN1WZOlinJpB9KfVytL+AA0npSPbehsLWVn62ZtDHoA86tDNy6ukdDes4/1Dqe/8ZQHkB9q6tG
4fh5+v0tvyo7oMy0EZHJuKZF0eFh1lRgZdWvvDpEpeTHpzPmekPebG7iGRvZ7QeAwtcN1pbwQlNq
WnKqjxm6ZXtgkA2rkuOpFpvjii3ar0goyTIn4oq8Mq4UwLKEn8Ve72m7xMJzJmuFIURZtf59X8v/
jeKIMuS+QLaT/oSotGL39FVfYBhZIpISZXcLoRSwRA4NgrC2vq+BejTah/MTBhOTuGqgRZfD7xw9
Aphd1SuPnu+yAcVXRIJa7aJZ0ga1m1IqjkimvxQKJD1FnRIC90J3tJ19oh8pgl0jPTUT39t7YES1
T19JWSluiM0JLbpNpg9OheBVpfSRjriET+XFy85yQdQOMbdQYdF72AAKtsiRreffNah75hdLrEcA
6PJSulZTMpx+MXeOzX02S17vCjC+S7n7acLDadFQMyD4DGXUDoTr46e/sCZKcTw4o4Ko+FX0pNLF
UvLhG72KuQgO0S/SJPktcqvWNwVreEPJ+/SpgQPoCvnT/2rNWTeKVT0Aq8mRsZYskZ1URnrXzhSN
IVvCn5v+dFIF+5Zgg9D2nBnBORwZmvZPvrnT6OjPxRYbv+hgk/MpVZ+YwjCDgxPZiGBqGBqog1Ty
jIhr5GLrRRsWaqWxsJAClA1jncFy7E6RtDapDcPqvZDa0LIYbJT9Yhj0sNie//ZZwVD6MZiUtkUd
gYLwu+4FXIKDnBHFj0EfQSLTy8oTnT1yJTd+bnTcUMUpU0uQJxqm5BBRiaax5otJjwUwja1l5uOb
ubLawDKxIHQL/yZKMg4nKRZbBBBYlODWYiz7m7P20EcN6/kP/OnRI3I2rHHCiFxoTWKNwEo4YvJZ
mjMz9hJ1EdMNQMgZLS2NkuNQdl6O75zBlbBrZzKhH5PT3lqE6xM0cjR05tw9aVa3DJx8JroD7252
J6mrD4h3I44ttj9gndRpSeKy1Mm3bbDSq+Ba1L7HEkhP8vv6KfkwmCMfyEK+ATXHtYjWLWrwR7nI
1VeuMAlKil98B75xdo/jFkmPvreDnNCJbxB04pKYTPHSKZzKvc+voGdOLfKv/QFOo4FdckoNe7Cw
iFduVPww3dpwdGqPGyTHORMw6C2dRKK2hk15bDgOUyO4nf171Hm/wA4O/Zdk6VsTuFk+348/ac1O
8oeQ4COCS5jPoHC8eVGh7axT/MA1Bha5UUKBdDhIVVqsIPVHEKNw2lds0hSaLHmwUCEiBtru8gqO
blMzj7C1XNL8tna4p3nK+dTftjBYGYYME09WyfX5nLZXX8p1WwjXl1SlaN1m/C3T/rWscM5IWGOc
B+x2YGTC7QYG25wGpDp+3kGaZpYkrrTZc0cajP8d9iEygaI2Vtlp2OtEggD6ILrLQAUeJ59M6vB4
AExmEr7KtGXvf+EB4IX6VjB83qnHvOJK0QsbEqjbtSeLchG1ywlPdXVxicWcJBVCenwFpayjrgnV
AaTPruJ5p+ZZEd+8CNzIczeVxOw1kbQ4/Wq9eYWkI1bALy83DKj5HumsTkUTnQ6U3srDKFy7dImH
O6ZmJm19Gt1C9VxQ9cgDGsdUd68G5H5kMhEo3jgBrd8iUhUk190nd0JxOSnUlSni5+1F6mkzLViA
oHQhRi1eE1DJ4VQxM0s1LcZPgTsfMDyY8DBZRXW/SIGUbRbPd9vjtY+/GymBe3YOEabIYhutpTX1
9CEZEtQetLL+dilLpx8bNvBxDbKnzQ4hu4N8k1Vct+KtGsBoL9+/2ZIWOh/cFJwmiCOro6Xe/jA1
QpndKg1XB5Yf7V4xBB9N2M84WDkN/FOvXoqJVJ3kj4ZZ86jnvELPnJS7BPhyXTXNiUILiDbgPdYK
WsdAwhDmnXUcYHIEOb/VJk37I0ER9OzfShiYE89RwJBbjKVPqoKxwIGvAJOVaVwWM04p/Gc8FmjR
4WV/huPyfq6E02DTz3zFR6znLDxwbibbgcs54U9MNLaeNoOycVsYWxjMPPqmKUfIhULDmR6gpj4P
ftzET/kkWo0j1RmhkJv94DRiRzosrPttS9KFrd3k76VNTkJ5wa970jLK2hRT4W+ZZhm/oIVTub1H
S9qDCjUEe7KpUS60pSzSvcOUp9P/ftitqiFgmNXTKtsUVtQMoYc22VWpf77PlVaw0loSwBWTSIAV
R8phURSF8haWB44En1zcoB4b8am/+cDRlCGxOyTYY/46zrqmAKVRYKBffuoIz/suuURVibyRv5xD
NmQPP9wABXOcO+LClB0qWD6FzMdMxvFwRpxi7ep5m7zAtvAp2WyHcefwu9pm1cWecTI8RnIbafjh
kuz3E6cu/Wta/xpBFGiQbB5+4V3gPe+shD0bkuFCXlBF/ElFxZNRDsO/2KxU5tUK9zkVLmYWSNHE
Z2HnnQ0FXJc6wMz8kbIlBZMrYMdDkDW8A6HgP3hhTEC0nfnX/ahdB6plnfIlBQP1niwkuYMvRF7P
wrsO3yya2epRYdT5U6MTSZYq1VfO6eZJeG0c+Z56EoDQOfiv9xVB2rLJbAITbpSjgnUJMeCqIqYx
Aj49NS+1XaowDhSiz47RB5jLQyGWdvA3qf139u9b4/IBVSUxXObG8HbNulseNb/8F7Ad+X5IYcIx
NMEJI2JmTtNGPQ10vkiuBUKWhX5qcT/fJ8mwhUHGTPFNtVnPDGHfXGSM+hySJ1f58rhP8dOYF3wq
wRvlT6uSJdupwA15zXYkRemgSWohUuwqkcVPHbrS1JaWe7f2Cura4ueI/JMuI4wCgCWiUMDqPvru
4QpEax++Zts4j/gFmPh2BfQVt6VGiLv+rpo8iyxCYEo3BbzsKVdPQ8C4YwiJxLqYNxsoNnKq56FP
tXoXRIIGfKnLBtv7SDBAfhOJXWRya0yfSL8DtgVHeSzTlS37ywLAzkCVCcDDwAazbv3eM4BkHEVU
OVXcFEL+yusbpk+l9G0Xv995O53srAYiBWzoDp63CUIW/K8jU0eB8a6ccRox/IOv2/iky+6Ko8l2
f7h/47enq3j04/ScRFi2+eSuOofaRo7drvLMyU3myGHGSovxF94BvDryZHx9bQlXE4U9LqmbGsgU
tDw3UKVNwVmzBX72/uz3r6CXFvPaC6E1DoI6FPWIGlZMZYiO6qAsy/DCubNBkGiLb3JuMd7aY8tG
Dz355dGjgHPKGIiHHJntZMy5dc4y88Ovy4BCUB2oXZyLOCRtcgQrlvip8ouJrwICNkWn/HLkZgxr
cSwU8Vco4ozkCcHwuoofh/rS3VhCr7IaBxBzUdJTb3owY7MUd3Kf/826w24xx992lZgoD1qfhhlE
NXnMk7PceUWMM2lJtRpD6V3DO5xhXEBB7epWRsPSPZGVFhkP07vykB1XAAZIdR0Vr76Ry6XT7jiO
Vet6JDg+XZsJuTbBIjgdoEC4LUQCN7MSjR0dOmPev7A3FppsHwjZuqHn9+x9wTB2Vz9lNl5zB3aq
w4fdmwfHDDbFZL0hvqmjxl2dzNm7VQbVMdAzoUis3K9HAfr9X09/DUYYi1rcjqECxsmK4z0HXwwq
+W6+lxmV3/OnB1RBjfoZ3x0PK6VlUehljZGY+5KXMpbWjTcUHgstL42Znj1GY6b1LQwoR210sDax
iQDl5WgihpVfTvOcq9vtbtlYiU47F48ugEPgtqGNe4iNfLcgZ4nsjyo5J1yAOBD9QYvLM7SktGoF
BNb3Gy5jDCTfSslO23QsmmUjURHQr0sgH1gfwPqsyDtLbUsdVJzxuFB3eKRRLpmeaXsQEY++o2Xc
EYPgHXOp0oKOFzyrxWzyckSWNbMt24agsD1J7ltKwHWlPVJZU16/8xqboA2JX9IJAh6sPPPz2j7/
KuNUM+9caE0ya6gmabcIt1as4Iw/5kGE6qoYnIDd4jwPmNP4Te9/vgoAfAGEwfad5u2+Q5Ljg2jJ
/1IYjLb504F6xZw63St+Bf0v+TsxHREi1U0hBTLw0E0mGjXDr5+KGFdN7SdCz0Afbka23UmA4RPW
KPXuKdd5mjaOl1Nqh3l5cxzl4sosOrHUvVKAL7ObKqXqaGw8414KsDpaq0FwoAx8yo72jgovsb3I
jspQqhXlHqt4SGVu+1bz25IhdwDAVrwOOo2B5XgvPs3cVX+GDkk4Ec7wH505MvdQ+f7+xSZ3ls4d
JvwL0O3f3tb1Vl4C6rTdTGSDHikD/7OXpZ30in230aqDLHaAHRtXS1dLRzehTmRNXU2jluqRe7hl
89t/D8tiT6uMiKmrrwOnAhQHO5bityC0qHK0BXEdYuuIaJOxIDFMPhCpXh477yYTlCrWGkcI49L3
Aat09JxLapYvtBcgcKyi+VSB67SDOX0Pm6WCEv4DPWNuA/u6K7T40qSQ/4184airUM+AAvHfT+z1
kd6H/uwvrPJmPviPUHrssLphTz/QDWhKjUyPF+bmst82tZcYgGGcsHKwt7ijMScQEllb+4kBhznQ
fE3ASjlWlCU+x/J9ZorNz563mwiA/93xwjQAmvVuoamD5/oL0G7TFNXsaUqj4aOGXxchyGBCYAkV
TJ1GSKaLoxO0nzCH29QtVAVC8tBZwacTdnkzQAp3sbpAs6e92TNbypepLkAT/rtr+O3ujrEcB/5D
0DEfWN605uXP+nbZYqXqUb7B96QOckAYVFsRbXWYzD0tKWudGcCpuMYYxCqEzKFisuErzkPFCeuK
3jYOB2AwR3X/rXq4LY+62DwF1K9b52V9w2m8cZa/IfyqmX89Nnxz88kCKxD0amXaQLzXJSR/jK/D
SAz9SUrQrQPxjPdRk/qTlWixBqMvaIg7vI+dFsBdId/JSSgfBZCcrB3wH0/MhvMz2l2zHbwoCweW
ZPeCBE0xniios9CUyzV+pFufjuyB5/fSXOzUxeUF8Ojo0XABypjgLTzP/EWzYjBVX9zgaPC3yf7j
6dbo/rxL/HXMliFeBqC2Udr2EFIvE76v83eApXNrzmyccpnVx4KN79dECNonil40XDsBNi04zadi
brfBcm+UtE3AFgkC8mA5fRhrPI25L/NdLA5q9zEjgX11Y5SPtB+Aw7Jeas0f3Q5Ul+1I1nk2i0fg
bzmJIqa2RRPEQRAbewsraKbF3eKyYP7R4yVSnIgLg7aBk1bLXGtLIWV0dyN5eNLkKAyV23lyZ5bs
eouypqqRs638cgAHgzVzLnJe/kFC2wBnyycgBRgfD9nrd0qLepuP/jzQ+bio6eV9hBQRrgZB/G6v
xh1yr9AMHUzFcLGoSkQD8vrAcOBoOhHKW0D0/0TpPmX1C6Xh0c7VBPaR9z6LIz/NO/tMxOQCxNx1
PkV6a7atoODaTkoe5/zqaaoIi+o1YaFv32pPfFfHV79pTqJXkeodyfDKuYhKGzinJ/sWenhf3KIk
9NlGjGqowdJLt/+I14VoHevloEmrJyLamkuZZjcKQ2QtMSjzqRcK5r3R+EKliCqfa2m99ktyulX/
1r9mmD7l4xqrMnqgqmpAsUzkjGwnKDUaMRTW7/dZT91rxUQroabK7gMM13oeVMR3gzE06E6VuvOE
mxP8aJ4E8O74f4bMHhaINjx0b5ZIgyapyztcuKvoZaBYJ1XrDi5KU9ErenlmMOsZjXfCdMa4Nhqe
OBrXh5Njls60EfFul4k+s2aqzJV3D4LzXBntIytYgXAEkjw0ShgeBz7RTSoaABeMUnzLTGOCaOg1
Ov5p/42vvK/HU3YqqQ5xqEuGzWcMEQgZlOm32vOhb+awLfIS7P7RsRMH6oTUT+ojxeYNME2civQo
pTu1UydmUZLQQ1Oxya5N31xcYtf2b/hst7m99RcKa/WBRlQrOvFuwwmzjHLdrtXyLYDGv7/W1ZUU
q0ta0hzbKo/fMHWCS0Bw1SlPKu2wx/HHFJf+RTW0VyBCMPIAvBPSirikOst8R5fMqggR/ddGe48x
0jPzV+P4Tl+s5dMCFDo+5jI5H31BWE2Dw35UhbwAq5rAlobwlYaqLqGrl8qixhR3fFWiwod6ty1X
eJtSt5mk8tVo9G0FnedA335JW1k/uIR+i+FHdxiDpoqvRxFpF3UVXhkfxQuRRuJgTsYqo5n6tsJ1
oBiauAam66QPXz2uVc1qLzrLV0nKcr4+m59BDx82aAZiYsp2pcrvNZI/b5CzIbxkhE1rA4iWpDr0
sUEagL8QEHEGvmgwv8KEHd0rwlX2cgDlC2fOPYZbWbu96lUMAZs3IQkpuPojAmsv7eWw7X0IXFgC
aYMNo34GzzlvTWxW/h32DhtGbGdOX6LJhXn1m5fEh7tk+YqrHuK9MQrAPdi2gFmKj60LDJRPrCBO
iEunmCNr2pkgnm5mccR/+ZtHbilo5i9+yY/cHWhtU9GMioy8V1qq61bZTi2y649071a3CmcEy2v3
p949126m9tklEukqXheETw2/zcxHMNkvTJSROhq2t1R0EMVrpMHYAULjrYMt67MKaMTF3K16o6JJ
8XuTLlcdUanqfOd1X1CTuZV1VpYpaR0c8bCeJOX9yk1I1I5tmps+RlGeW6NwKaoShjM8usjita97
3zd1QqOsDpf31bQdvMZLdf5hlxHHpxU9/oUoupQbhOZRqpvCqXN0tV2b7H3radra0VNtRB53+cBf
x/fdrbIMJbEANpvUPM/rDKZH/YacJp06CqSnY+7uU0nveX+4ACBgHQmhLWlqS1f1ozCd1R51uDIv
gbDjPr2ArYo1oexuAeXOFSbMPWg8NJgZAlvQStoaZ4s0aCXAyYqCyBBD5NaIYeVH4O2pKLvz1xzl
2BFEgrxf7cH0wroa247/WbS8FBrrnD9sG+ebPfJu0vVqUaBduh05ni5Hsnvc3Cl1MLfb/fyitVJe
GNbD8xFAfzVjwIuqd6jtO72LswYdIeRG5qO99uwOWzSC4XdEEqX7B+Zz+cUHYH+X1qsV5EygwHUG
iuBGxekOVkF1lZAOgby0nCdzJukYFCYtVQMLlbNq5dTs6A8PLhzCySuQLBOVYb2eqchMDsKU5GpW
M2wkVLTBKc+H6iCxKjuyjR6VVEzTMCdVK4zVdSZeNCFsttL2WvmMzd+G/ZZR/r7xidIpIwjuYgpY
BeRV7iBen28XULKl7SaK4Izf/B3j6jIgZcTsWyNSkjhuTTeTXaZe1tqm5wraxtMZxdVQaY4ncr3a
stwAHh2uUSV6gPl0CGUoGNQhd0tJnessNoBuAD/pwvPT/GZ099+ik2HQsCC3ou95ioVrg66ek38n
2gt86+wz7ZMVePtuLHwdsyi9dPywoVwVuDjLg1mPwrjXjFrkfG5EmbWFi4Lchn2xlPPfXmI+IZWF
i1Bnnpl6inknd+dNrz2nMgwUwQ5vsbXTQw2+nvQ/HCdDoKQXOTBwAv1tEDhG1Xrq6lw3LDZJvpiL
1kaUQQmnhd+5gCKYPJW82TnzM96VApsw3SQt08sFBtBijsmS9ExeuN5H36vjYTHpozAxAn3xSXXI
jOmvb4hm97QMKPtmoJbIvqPHQp8y+DWIZzwvKjJLUe35NovRzuyWh0OYoec2ZPf9zt/l8idg2n9l
pKD49kFH/PsNYO/Ru60+Vpcphd2EV0Q5hqT6SE1WyhG15eCxj1TihKovePb7EfvSaKg4ofoKt3+P
569YCbO0YRl34AaskKVpPGekcxXMs6TH8JijDbNgKcjlkMP0BRoEwKbbTf6/SJERD83q0xhnE2p2
5qzqnpwbJSbfb0QB5/69u5QEWL3JzplVlCbsounoA/aE0mVo8u5/p5Bqe9XXIper40DQRPrjJ8xO
ZeBBuGXVH5qspRaCq7mD2z3xBFHsG9XeYWeDfKQwAfT/gZB8J2oDKnhAmjqHgeHObt5ntrgHE8AY
naVl8uj8PISdlwWwwGbiHRLfaVtwxiw1M/UT3cV1lJK3rVHK+kewDlIQxQ0VZWfN1kqTLzxYoseV
rMnXhkiOKiiG187LT0GICfoJlcrVVre87ihJH/8fB5nADfl3KBtcM8WRZ8mm9VEe9ir0m0tXNhmJ
3qCEeRextEFEecTW6difjBCLGGiYAqTL4vthjrU+HqhCIdd/SMbiHY+z/e1RjBLYsmM4/GbKi4TR
d9BDjQf1ojt3S/GR/OMnGBpDgzaVnrjHdPKcO4XhvL1s1bQNj7coJ54eybr/Qj9K9p+Y35QkFqbk
Xcq8od6ZqSaVQgXU7ZikaO48+crt1La8mK/OHVYl/QIo3dWEuOY9ia29duMwF22/qpbzYj77zDRs
ZXnUslznKaKzG5QF/g0rdyJvBYUUkSEJ9RsFpPpK8xjFlMQeg+FGT87YyQfKax8ddH9WxXslxJE/
1wUhp3UJJfnuUXBYi2/VaOQOPLGtAS5bTpQK/d3LG+xjSZeXxaJbhV5czLmWxJIdcdi8trcb8P6G
2ftur7I2Y1zXXIGU8tCLQnLfCNDcbG/xPWXLFacpMBbtQEtIlRt9OFjbUzlU68xTnGnw/f++bSwq
2Nqh6tzhvOo8l6IE+AT6O3qS/v4bF6QZmKPNTNarEeN8019P+Go1lRMX+AnHbReEKlr/lyYpaO/3
KNiu6xN+TB36T7Ta9dsxflyk92EZSChJwEZrXbL+pvp230nWIA9iOnrLqhjvDFJ/mJmDi2F2fzk8
5DczSUkALsiDgJZuOizjq/v0l2RR9V7GgvjVAUE1QozYzf6ue7kkw6ZU+Y3vqq8b3zscGowfXKdX
dgZTl09WLecHiG9uf97I52UUprm+X2YDkXxGd9XYsYc4bdMQ3mmZ83qPUfZXd0TtQsTyYul+zuSb
V3qyfqJwoExemnq9fQxvMi62Yjd62ub2UO+z9NRegWGfAeffYm5CyigWMhOO2FaPGwMOnpAQDyiv
H4lli5btqvnRi8/0i+ZXJaE1CSWER7RxWqPSXjo03Lrxg6jwgYk2jqleN9KZN4CoHusNlUcpdf4g
3cqbUt4Jn/QolbD/125YUbTJkMPkRXJ8d97d1TKAjiQjIQHHoY5+Cow2ZtYHF1FE8CFf3Asq01IV
bxbbouSJkz4GqYPrzNbFXqMscSU3m81z9nsJLrye1QqFMBQ8R5stfLUuKbJAK88KkCil8oPQkR5N
HMA3XcaY3YyNK8zs0yHLfDyrkh2s0vKFgcmA7ybnadVsT9ngCQ6YoKrnYSErlxQ+2XMkP+YOTWUq
QT1O9sZJ1EY4WwSqeYrOfX8KI6Gqa/+EnrZpHA+9uDRT2WqPrz/GEI096PO4vbZXZawoszCRgJAj
l9EamBi0gDMi08li3BwOzkYjeG2npUaPMZzah2QcnCMBdyIDm7RW7UQVmRdS+SRGFq7X3UVAEzSb
7u9BB+VIW5k/hdhOa5/heSpSonHp8mSBFt5BAXYkcv0JhfxjAW/1fnYmY1iZxzYQ2jzq4baOu7ig
GiEhWqRX6ljzVj49bcQgmqjr0Uiq1p1kzd3qnKFgxL13hR3wfnvUcl4JoPdIp1SzDqxfyhBaT8kt
Kro9QgUCU8DGvi17ckXPIC3TLV29e7jy4sLb5Spy0n1cX7wAIEW+Fqqc/q0e7RPgrTcpRmmxfiB4
DBrZi0YPnHrtp1xAR8KFmG0mRR+qlcIsonAWgR6R0b3cTxoZvgXAkmakohSg3LjqT0ePhNOaqYSG
aNDpTm1coWeS/6R3Su5u5ZREhchmq09dmkJM4ooiIdPaOtpNopplhfgXOQRg4ExGg/4rrDSHgpqD
ubDuh3DR25AzCFW7ia0EZvBMBGUMEpr6DFNHlqvHqzSdS3FQ34Q9DCUyvq/OAoNIqIoa78r+kwey
M9p+22/q1jKyL+a+LoQdbaEsY8uI7L2ydDWFbWiQPi89vR055Bs5Y6eQQoclaWTs5a94IHgV7gEH
5qyu5lVqut9h9VzPbqjf+cTsSMH4AhHq0ZiT+d6eBBmJXvf/jmiRueX2J8X7jnOiI1xZqJkF6rCT
I7CVqhIaoZ6BRhQhDH/83Hrx8ae4w+Y9ITTs4gkm68gjaDGJeN+ecyfOsSEGQHq6f2TcXmvh1zvA
0739hWiRqfbYielhD5cuXXrXxl2yKUqcoYZiT4c541YsC13U7pVAgcxQ3EZmRx2Qis2vj33hYfkb
/v9FKUGzOQAsUY3i8DasLFMRQDz38Oa0rEhS5ohhYkvnwqyK1ydBje083olhExhUaUbIn57tDlGR
QMbvg8xaJvbB1nRIlXYWyqv5Ara6SPe7wRPlB7VEo2NSReFd6X0PO0QVwcOBvUou7RP84rWvgsp9
HAfv7qTqeEZSzQxwQRvvJV7ZgzGYkjtDTuD3BtjBOVgVTSSASoDl4Hh+t8qOBGsA32UupEsdXhSq
tfrHrFGDjeohOOwql6sFab91QWJsVj2iDgBMnT95v5NjiMcQ1WM6sR0hNgN9azkEGZqw1zaZhno0
KlWPrJa+F+LE1M+4n6D2CvGH6mc854hdtXGCwl4KXleUnaRcx70c57WvJqaHvNW5YgA4Gp0B16vt
Uw7JBNPRU3bHAZeB8cmZBI8mPVaVWmLDjgybuNAihSnWe15NANYtgFCF+uSoqIKr2NM9RBuAmh5W
2ZZrRjiTp1Fbt6ViCYWkNd5NBTId664eB62ihJfQ/IAfvzDPEthCa9FdjkReu0YJS6MluJ5kPlMr
3O0xQKb1u87xWvtWs+M6zlrBGymjpeBUJY84m6eJQWI0/T+aKtoGO+9QidnY1gQdaSW3jH4EBL/F
UwMklYAl8sHYFH33894ZF1XxRSv5ls6vdoaObqWxxLdn4+m7AkQMfn1nae2tFwfDR234uSxamP55
9KTF4Og5fxA4yIDVM49wErnXdTx4PS9BHgGQBxSztNKFa4hpj6MA6jWTXaB9JZvLPwtyGEuajvSO
7FJMd7S67NOxVJ/tPbo1tiYppFg9YjWjK+dKl5BadkgZl5uvP+2TgkwH/QeGBcyxB9PSevVaWvaX
06UqqN/Dks+lRnh3EjUY7nqt/K3h3hbzIbe0A5sadX3XxwKJsWZl13Qcvtjz9gQPolCGyXaUEvSS
mFl7mXpC/QUGwbTWdKh7KHcEDIe7osKixbuwsIdSSh3mlcr+bEV3Q45EF5m+hzz6l7D7bD3f4oiP
yRFFweBe5O098C5zGN0eQ+9AgkYOmKqIM3/lpaOjRG6fMcgOMS1LTkdIpPeEDOwzli01lXz6vtcD
TQevl9MJ7wdWjSzVIJ30rYJ9ohTcrdXmBd4d2tuZShqsa6QvZrzoSTeWkE2V/JaaJ7meEqZ1dlL8
ID+ReiiNEBZRAPdW66rt4AOWGGEfh+3sF02mMMJh3G7Yht2huKtG+d6jThqhI3i5ej/zfuPifjHA
CytLQbofaiP5brUCNepkXqyAfTfnQqfMlsfnpzfvaqleTQ232R+KvsTNcnTh2UxgFfRofSkMFJa9
S++iFeGdH8B5AADtTnZWpQ97RMYcZAkRsQYttBOyznshGYBPZPxfc8OPAulOvi0cjNiiqoLSDoVe
ZC/IudQDX/XU1loI/skbU0B7kopETWDjeDWmpKK4yeUWgdmCpdhVMd7wyjWNxGA7U9pmywc41wwG
vAEEwK94F+U48aubFjhgqTo+b2iZA27aFQnWipfuTa/IiQtCFEN1oky0ns0+L0Iu4H81LoUEbAMn
dSx+TNV7CfVSkjB2+0kLhRCx0YrFr07ArvNXgGNni5iwmmSYkvxQRRyeVfbyimUbebDZL46Jq4HR
8FGA9b1qNM6DfyWzpesHQJCeb+AD21mWdZ4ZU7W7NpaOs8lHKFc/1CIliGEVGD3jrM5fD6YELMoR
7W+HP45pVRw52PhIfhZjaWK2Q/4fdeomdY+GLxcWdqKhq0UJcnA02jL+MSob4PXHyT074q8W/7te
h4YJIicbIs1LGjjdNtCpJ6cCHrLpoM457mX5UX9Q2vtr0Z5SetzdrdK+jMyY1L9Djh5KSKjcilzD
XtjdHGk31ZoEGT/UkFOoREyu3d2bF3av0FnXg86+Hs6kwVPaG+wjt4rwdNlPOe2rg1OotYhatn+p
pfax2noH1SN1P+Xjc9Uq6TWOMdGOGp1WdNVOBtlpm/kv/VNZoufyWv7kaJ9ylx4CLEbpX/8oKDnL
q+Q/B2Y0Kn+G4Ib9V/XH6RrAViPEQ46qyWOKq/ZwCITgiwvXmduuXazP0EG5doIXXia6zH4r0rop
oPjIAgJe+mQyyhMH8B2AREr0P+4H0XnsMKAkgiR9nnjFf/GpKRBk12J365Sl60RLGJ7BadX7sBiP
+of6JJ4a2bpwFiUpxN7c7ldcsGL+IGgNiDFHvt4KQ0VQb5fkx9Fjc95JZtpHm5fsABenvMRnwxnt
Uy0MGwdwMNov8vcJAKpjk7ouohY0QFHlJun4oCxG/ylRo3TLtkH/EO+SS7Jn11t8b9+6ibJFfEJj
o0yYJBtjCdugnchjUoONL1gIpMOiBOQgbCLM0isXPveVPLsus8XnytpLtiE5SZ1lYypoTYjX6Na7
67fyAT0U4LuHRSizabJGB9LOxUidfCXe5ByyrwmtfizcYYg28rK81WOCHoteT1emdwsvQaT8t5kk
1kyXlTbRmVV4bL+3RElwzFZxM7RsQVVNlZblCWTz2YPYenVI/JH+3p4H57+HNuqbEPQ07jYrHf2B
/7U+HdkU7hA4++w+KUGsYWPgguNJyNZy7c6VDbK0FDMYWsLgw5+l92Pmf/hLGnVRlWzAkl2kTCnC
gL8/oq3RzIyKpJv7LlSAEAQ8xAoP0y7E1IPa66wwQmagorVQBorq6I8PVVxWYZ/azh5xW/55YJdf
XIBfhESld6CqlArsLOPJa+AOjbvZbzWuz845yZX/SSiifdLawQzBw/dOWHBWzigHbOPFWIsVQxY2
bh81UUB22tiWld2eyQwvcJURWI3unSu3UwcnBQsaRhhsa6BnRJv0YwzATzi0eCDfIuWResUZaKl9
K4p8jIZEurGvzdiLJmhIk0THdpe32y68CoPbBbvFniGkzLOLZs+2YFnMDWl1cuq6VyzaEok3pLza
5FjJ+Iib5MozWAq4DtmELeEf1cx333h+cgz6prr4fmgrtzrhXb4ih2vzMD/TakZacZSv+rshqJ1Q
n5rXWrLM9QqVIYOHnBskdO89aQTIIcr6ELJJCg7Uuc/fgeMQOFlnuAh3XiRF81LUaVjakNUjyKry
XBqEZ3DfV9Pkooev5UV77nww1gWB+xb/WJ+uN9zAJf+JcD/NwZmVTM5t17jaXO6Dv39ziqXfmHBm
37J4gfBhK+u80ybq745QbYIRkysD5ukXj/sHY4owiLNdn4d7kWLVrDLt6a/7rzdlIA48Zi8sYV6B
LFX/k2+KfE5OFFk/VqAGHzbIuq6s558qC1Lo+6rRGBjGhX9E4EQ/eAKlNXRFbh+95gPQOQ8CHG1U
SeQJjDgQ721Gt7D4w3HMiz46pPBC8sm/mRTcb3aqeZ6fLEkfRqimY3nMf3ThSYw7COCqZAxfFzMI
yyvt6TkbU5TfUcdPvAmQEgUhg4SSONvd1dSpLUKNVAWqOdFoDunRwdzrIwJ7KKuW9pf/7Py7zWxe
Nd6QklEkJt/nQPDCMUCMvt8S3x4mol24jBWaNgOSdx8rbsxH3FsBgFf/gAmk3xJwS6KkPR0W/hoF
I3UHRwWgrBtrNNvtg1JpUj2v46cOilXbVQkjvOK7bXwXVNejmZBcNwnKtDZmpcLNA2CbNLpTav/X
Y0FAru0FcSxGyMUiRUijHznytXPb6kE08BzOmlduAYk76vZmbc6OMrrXpLFiKgb7SHWtVuevyBa5
3GmNAd1kgAcDQXv0w/QJ4qBs7L+c+4xV5KegP9XPFba3l8Uoipq9/g4zjB9I6SkXwoHr39N4Qm6C
KFnnUuXzlPLrZpquj24Kp3TO2vskOTd4Sgw+athwXs5ecxvs/yxLTYpu2g27D7QLVIOwvUhePoeA
XET54zlOBRJHLco0hFWT4SxIhSBuxccmIRcPecN0bCPOPaTAHYl2WUjQb/quumW5piYOMjc1ogPm
16+sNSJ/KGaxKbGOtS8FPrBKXVN1+hLg9sxnal7AnQij4vEBMEFuJORUaTJ1xOKyEGXTYwK3MghU
nbCryyvT58mTSrCJmgTPaDsSImkIucvWsmDbmdOHs1nsxguqPocFw+y+qXvIdNU2Wx7Ja6mSnWeB
Nat8/nmKtk7r8sNB69l77HL31FukHfV9cDuarymW0jfHJdlt+FL7drlD7b2xy3XheW+gk4ymyunt
37e3misTr5CRdSDpd02P5wkOdfykG2B2Y5U1aUPNa1/LY4VwHr4BKBf8XZaHObJ0WU4tWc5DOeHI
mcF3wYEBtE62t5+lfUso9TyMwvV7hDL3FCpZVVrHW4xwQtzU3kM4Z4C+0o+KgasJhHY9IDjwd10J
1pHgaFlg/QNkJoCq1C7FNYrCnCmvlkTyP4qYR1YepmY4akkifdx2MmLgBkLvOFojDmtENPsPYsXM
Nz4SxwvU8q6kOBoS+IIkfkYps0eWE0PeAcFWU9KjGKQS7bcxiQ7DJIhGi8RgkyYtLx06Fy2/7QBy
DocoE/V8hwMouYVbxkKnbFbxkhFUotVVDlqeC+KAR3oK7lhzc+XJLy2ys5ei795s2xaJGEGdEvcO
WwK6FV67BaqBSqYboZGJhCiE0fBCtPHTZ330QU3oeKekrROZVm4/sPw5frmiPD3leB64Bh9ZAl0x
s2smeTfKYT1j2+JKGbPRerFBgz3J6MrKhTp9AbQIP+1UYvdKVUEA48Gb9P2/SeWetuVjo4isx/Ai
GS9UTPM62sw3L4tl0LIaM6b/4flGEIrmy+zAzVEpHAwLeSbWYMSVaazkY6FFIOfxLfJH4B2d907G
RAXWx5OSP/HPyILNEDBLQnwLaELX4/NTnzDu7OvjdbTxS8/1ZQE5UyQn1KeGevrKQWF2iJvH02Uv
PQAnQlkoP4V4Uu15fKRFvnGNUyZPm4HuAv5kCNvryym5twaZ+Jc6bMQyvAu9UYBkPNdnGWXlddcx
MgwnD2VoBqR1qMIpKPDSvlUCfzULB9jjWiItcj4idcNVz++4/3oOyxAmPL+en8Xyp7NgUKkDYHsP
rjtYHlLyjxiDrgqCXRc5vGs9lMoq8uW/NeLB+PD2lg3y+LqPxhNaD4SfYKWZsxZLZkwnwOyJ/z/n
gS54V3gYbujt0lqzufz3KoN+UYg5prBNDOQ+ab+48x774p5Xl0kYlJmKMxP0FIHApiIS/vA+UzNG
PkyFlMFR+D68ndlTcjUqAusztiVdKgFVS4KIdClU30wbBlpL77OpFx+R+e671MRp4nsj+CojhAis
Kuw+Z42a2rCgJuPrLpPIE+uu5KDogRG7UTf0osqlJbbjdzrhBB3UC20WLoU0D91kFtlvBpbdTYBU
8DU/VluvuKEeQVl7lzAT/kGsXYaEUkBAjZFs/rblxknvoR5sBQl5a+sBQwJXO23a5AY9zzOaa0yP
EI3lKpPkSpK8EIZihg0dO4a9+1GMQEeZvRtSj41xXgXJJcdfYU+5OarIikb6r5WfYd32jcxIwzDg
4CTe+DzbwKJ/kXLBbIE3mVKx3AIMcokl8J6sJ3A0Tbff+xHoUY5K9va20iB3p2MUaHKMmUXZe6Q3
krQ/rBdAL9lPot58JMNFhY4p21hKJgzFWTOCdVKIjdorFAttKaKLbjB3sh4751hJcXiXV4EqD7yN
Iid8tXFpZAZqhToRM5mGnQSU6Btg7Ld6FL4c3MBbTxvKPzvW/kDZRfjbLetJ9dGKq4rHf+IkU10p
T9NEjYGKoFZXNTzgmwsAi56yxSPG/LAMhLY3GcAQrY9LegLGjEcFWx5bu4vo/J+p6QTwUuQSCwYY
pNlS+9bFcJ/UG2gHYTXhV1tVntgSMPnDOCbo1K863V9ssNwl6cJc++69KrPB1pITzMJkoeFjlRfz
NP9nDCDn22PZ05fxIgwTExeJlNkHJFKVFoUuTm7tinIcKpGpQ13DJB5C0Hky6gFOfNa29EPA
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
