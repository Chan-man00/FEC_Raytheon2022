// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Apr 17 09:51:45 2023
// Host        : crisLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ouput_1a_sim_netlist.v
// Design      : ouput_1a
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ouput_1a,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
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
  (* C_INIT_FILE = "ouput_1a.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27680)
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
