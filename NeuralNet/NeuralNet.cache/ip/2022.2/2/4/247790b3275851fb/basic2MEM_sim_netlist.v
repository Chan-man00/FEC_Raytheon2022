// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Wed Apr 12 10:11:57 2023
// Host        : crisLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ basic2MEM_sim_netlist.v
// Design      : basic2MEM
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "basic2MEM,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27136)
`pragma protect data_block
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
afoRNQ==
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
