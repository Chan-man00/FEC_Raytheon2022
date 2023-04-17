// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue Apr  4 11:21:10 2023
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
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.95215 mW" *) 
  (* C_FAMILY = "artix7" *) 
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
  (* C_INIT_FILE = "basic2MEM.mem" *) 
  (* C_INIT_FILE_NAME = "basic2MEM.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "0" *) 
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
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27952)
`pragma protect data_block
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
ZJWslsHExAs6aJPJJrOZpvWSrY1ZHA==
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
