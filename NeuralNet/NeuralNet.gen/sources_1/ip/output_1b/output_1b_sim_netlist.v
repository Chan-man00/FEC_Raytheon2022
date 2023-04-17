// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Apr 17 09:51:45 2023
// Host        : crisLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top output_1b -prefix
//               output_1b_ ouput_1a_sim_netlist.v
// Design      : ouput_1a
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ouput_1a,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module output_1b
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
  output_1b_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27328)
`pragma protect data_block
MNa4ZStSlNy0OSimzG++vrdQDoDfRDd9mv9IL3PY/ybRGD0YNDdrair3Fq9QLYlBEUJegjsYhs+b
DkfoeqVgH/KBwKmyF3xZ7gHHAtVFHrS4HSzL7FU38pkj7/gkizMB8BCbeEvXHMn7GBiSuiuyziCC
o+vXuVu0S71uwcjFMq9ZXMG3VT76Nr5zMoG2PSl/7zNKO0PafzjpB5aVCdrwd7Z39Tg2LXPA4pau
CVXJ9yBcRU4X/UCvCNAcofDr+YskO6oayJriJB/U4ikDQAfglp4Vx+K3wSs5wYV4SqOM1rvCCEs/
QpG8E1X2YUvjnT/2anHYiM5Bk2hp+FFGybPvfYaS6Et559v4VyARITPJml5udIBD+qjtaFORFuUs
crc5+fPTvog46RLJQZddd7ks4r6yZt6+tVvjvV2w3oxalOop3sVDwekwQOrdVH3T6NNXgZWhhHyk
ogBpIRGnCj9Y2LDy9vcORAxa+0zNXZEBbjtmm30i9lsK6y1wJocBR8mmw5fIF7RMP4fLmZIcP0a7
PQsPZOqFfxP//NUp3WxiW16lVaYjvkR+iyuZ//YsPsOJ2FvfM4GAxRe/9S7U8yAgFlLdeJztQ3mZ
W/xbUh0EZd2ZQ24hdKBcEJmEa2RBZLd7ZUHlsWUZZQWarI1WG33TjeWsvUy0j/mw4B+MvvzJyBAB
gmIRRgvdKtczuANd4KQXTNSH5PgBrAneZmvRmv/9x9neYFsyX778YFOPvrkdgH6RhD+lw81pggYJ
4n4NMUhXnJjSBIesn2FgZxqhem/MKWcvfzYF8jXEn/Jk0JT2V4X5fotNFBIHbtBwIEVipfW6/agd
18goyFmOoLZcj5ZynoWmD7BOCIOhiwiKQfpB3wFzbvhYUSFbweCTVmfmmpqET6a2WrZg8vVz3jh3
o7OuF9IzK2UsuYjSmxKPPikXWjBceg9kNLhILus9amQiffLp83TgJG7UbfA+n+2gFDfxDVb63doj
7g7Vh1/x31IUNqECMtSNBwmtyC1JkcGBL4OkKT4LmeT5L5RRICA8lqAoIs2xi/0wpb+uPctw5wkc
W6ahJ9l8k3nt/FPzbOOqQQRqNIqU1bm+V5HPlsH65vTx+gCFcpZOKTkGaCABb6GpjU/QAVEodrn4
9th0N9VpYx27jWMMyBM5HoBFOn0Qr0JNtrAsFKA19I4bH9jo0LQXZlo2TUA2cX6YDRdadh2s++I2
PNHRZFW7qsSbTsoqi7Ww+nOYyY2QPmmOwMux4Q+58o0YxdLzzkA38kwVTo9g9rzAZfJ+t2iV+J/r
RiMwc4eMW6UDvD8v75iNs12Oltr/olGn2s4IeicgXFqMbceBlgMjqyqSWCt3iHUfVXUMGH3FqxxP
V2uoqdJuPb1H6x5duSXKbcCMcYJE9SjNIKEVe8paUj9SJUh8OdiT0GbmShO+o9kWP3GsDPfHpaxj
rrqGNtPX1ZAsHorvXcl0ETmEOb5glZZNXIcY5ayY5abp4ra5NjscznN/GGp3lpzrG+tNFXvcQCBA
nQPeYXPIh3TcWD2+r12XjJ7sT2jlL/PLgDKcRTmmfDpV8pOs5VelZ4At8tpotjbtzKMvSTQMTn1W
Qy+GY4dGTh2OwAw3geV9yrn6kwGcDl1eRDPp46qYYFGKbt3SsAeKJLyXkXajJuXhTDU0mDoscHHA
wgwfqKPqmvL7uFUsM+Yvg2LFsUk+vsAUpOprCIAAqO1Nzntv+mvvNS2qXVJ/0376DhCFmWRI0s1c
6v+WEALz3uC1Ma1g9kkag4xP31OZ5ONYuVhgk7oB7rhwNibQPL/Sfpf8nndTCHfTkSp2/lOJFh6Y
FGMIRh9Ul7PVKC8hjrJTJy0u74zm484+wNkLu32vzWWuvmp31t4kk+igCM/L/9IzQYZnzozd8b3N
JVC29cY8rpix72VNr8G20VPU+uP5+kAFJKMmbFMQ2nXkSUiLma7D5BxySSAorAoqlNMRQx05J7qe
z2HT0Grbfd5Rj1O/BmLcjJBmWmEg2eOTqHRtBvz6JJHGRYhWiO35NiT8I6RfzoEPaAxjDa0h1K99
s30/B/cCdqrodGOMA/bNvSUM8ny+EmwEQBdmdw1e4BJHbvT4kUO44Vo/y4l0+ZWVJefoDfaOnJtr
Hg9KRbDqAjkwCRc6DBo8xmwqZeU7Ec1/Zqaj2MmBSuOLU8W3auyaLoieG7+s+dxYTmjAyg067343
7HDTBNeLseBhIi4JdByFpiGmgMMv4+SxQHMj2959PcwHlJ3pHk2+p02AA6B0DxAUB1b5rWNKKFc/
1MXhn20FrQ46YDblzms4ZpwEf+pcNhGVtReN3MF+qnp3R9R9KAnVsk1wJoIFH5xzee/ERZMPGJ1B
sr0G/eM9W4gX+uv4FCreUBmaZ1axu8B8WVYyhPktZlX7dO/fH0bt45t4Dj2VY56Zh+NI1LD/bMw2
t4Yz+BEojqABP8Rjsq2NUV1y655mHF+3M4N/fdBTAy6AeejGjggSy7wETFwa4oh3BG0oRFOa/km3
dy8aQJuCplydhgzv2tfpq8qipJhOc6U/1VRyALOnrsCM1V2xlgp4Ii6WS1Uv7Bgh9JLCrsxA/VJv
Hj64gPRBgcyvgY5wFQPBvKHAYK8Un/kAwzMzvfXyeExzD0LefIqqwddkYOq7texXp0DxUSYkA20x
S8UoPo2QM7TeWOq7OCLrZKha+r0unMwFTQb5pT9s/vjD2Wq3x1flzLIj+i05Ko36rPDvVmHZcRYT
FZqw9kjVq/2U7I3CUljkV7eFs3C7pXoVHg0nVSQN005/y6N9aXcSOcaSGds42EKANuw+RkVmWh8H
rTgolgYhJkk9xydvbXU9EkPkRGgfwNyMTX8m1M4gzUQ95MNrFn6JNAKgckZ2g/Wulfv6UGc5q1kp
m+nJ33KpLJm4vBwsWSdlGhwKdbnc8D34KgQ/UpDIG6pmS3mF1jwv9LiSsS+vxRrc4t1znqQAPZ3D
yZqevF+BMMRB8qjO7cCduGmrazJqWg/dFWB2zponQBVaM51oOJQWZa15q3jA47Um4gUc28xX1/l2
u6AIBKbC6P1X0VEe07mQfB5aP6mDGezYp85L+fVAHkPYXB+b08X8raMQqsmWoMyugq+QX5/Zo2KQ
N7bdJJnUbdvxEL+5UKx6dq7ELAe07HD3xiAtsvqv50yLM2OI3NZZKvE/IDBxZ+LdcVM6NWmPdyeY
8e3kFdef2DG6r9HoGmEBNhx6xkfrkKqg4Z29mufdldbpTv6bQpi10i9MpxEzF0yTraPb+M6hskB9
Uwk+8K5Pes3XZk8qKGSORyzypvyWFLSo6Fm9gvno/tx7S/TpgzMf1bL3tpCUs/VSlTd6asX4dawf
6vw2GU1Xf7j5eGVgaOwjCkpQ7Qpmrc3mYnZwLS1LRmx4BLguveynYLowdjhBdBylfiNkpA871BUj
xFX35CyyG0a0KMVXlnAsM6NDxsduiDAYeN6shBcqdAqsaiKHVAXI/FKnS9JMIg8dJJgrlqLf51Lq
ThBiUR0X8FZ7e0DlyYRZ84hxdwt9H1QwN71Z+W8ME4jsN4IaYOqggEvwO7N7gy1qnmNMtm6Wg77p
gPtoOdtaE2eSlQQwV0eK+lQRtFrayCeohs7oFWv3fl8UUcY85zSU21T89iyHhtu8G9JOs60k13g8
w7evZaHzJ1eBGpS3Uu/JWWzTmJM+eBXZmttTCp26g+O+lQRxoV9+6E0b9BnmhfjyoZEjE3CEklZv
nT/GjveLYFWOxYHg3SDvYo6noRgz/bWeV8YJQPzDIMv+QTzzw61bo1Jn5u5uk6NNduGSKFb3DRFq
1Roe2WQXWjhgxeQ5iY/kffbywmooegdgTlww5mUqdjEJIy9C0jKnn79021qhkymfkWF8agnmjzGy
mv34BFsu9D9WhoRqZGxlbyNHeTa+gEU9e2GOI3dzKRTlXyLwJtUQcIB2HjJjYHCwMFX83gA7qrCA
VXKA9Ealu3H4msdaYCyZJxGCEcDhGMf3WR+94Cr7Mkk/nMM1KLrxBxZA8tP62qM3ZKLgKuLplusL
edw8FBNqhTfAXoeqedzIv9d5sub3NgvU+GdBb8sMRaBjiFZP50Dv1GZThHg/0edKlE10t39hyUv1
rfWux46wvNG+r7whuFAcnaF8ITpUho8j2x8DiQu05QdlVH8Ngm9a/QseTyzXVFP7etOxiGrE/aTh
Y7naYl/AXCEim1w6cFfvnxDOas+0DHzQChaaW/6e8M0/ZhsLbVB/yZmM5HLGAddUb+0p4uBkkwsd
lSDe7Srq1Fw0Uw/P+y79IuouzXpNYvZgLadirIZNYM9qQfBN+Hcrio+dgsLv0D4RwTR3BebooDbm
AvsKwwUmQTtPOPG+JFBPbDPmc75WZUEOgpH7uY8geljCL3qOnpRfZoSygizIin89ealEWxYHWsWi
kXuusOmTHGAkIDNna2tMDL079iCICbd6/Wo9Bab/GZeHMHzJKoWN+F+PxkKhtaa1hIJMRrDdnWad
318tpMr+PMLVaj25rL+RL/D6fPXyRclXWuu9LlrdGuYxMr1+3RZi+xk/H/ZDUovIntJO1KAonTP2
gBr5PojlFAhwi6nOwT+XxUeSXd8aoKi2VOG63nNiYgSTK2Z1lGm1xt0TRLXiTsosWRBbMmdIdTAZ
0aJuAUP555nEjUaGwa/xJXhWHBQLN94ORF6DxT2gCGZvKy3p03+z29Ei18zXO7jIRKytvN46oJBR
8kL29bgoyZIB/3wMPyeL4cryfT/75KTaY7buULa7vwDDRDAfxD3ZuwBk8+SvwNvCROTdsjY5tZrf
uEYpzX5HcY73k5RSIMKUxF/31wVixwEW3s4BgTCwNnYg6jYGkj8jm7mNdJ1yX31L24Y9LKepkEke
EbM/5QizhvvpoojsIxFBW1tIHyw0LBi1vCf4zisE4tH1z1N1FUyALlkReyTI9RuVwuWOkkH7Lqdd
18muIlsXssMMm47XDeOduK/4yIVxzxmsicHMOONxqvpQKNHiVRoJCCpSTLoDhWiXaDGCMNB7lI/a
bpmHVd74o0HCEWtEnDU4vFveNH6CTxxZ7IMPQIkM3tuq8woQzfvBrdegqEHwGqOCfUL/LdvaqdM2
6AqqsvFGMHJfizBlCjWKIp61wnuGpgqbCrT1ryOPcBQDJSMLA01ABV3kdMPOthqLq6oZbbId2C0O
dX3LsSrmIJ9FdAruruGSIGcENCpgRsFmNvRtbdkYTRs0kCBL7bxsFT+bUPKoG3O2l0x/hnd21XDw
T6t0bJ95d+HjmmYySXBQHazDWo6mSv4/vrCdlShVVHxZp5H+MRTytJE11L9Fp2eQR6r2GKtn5EWR
3ob6kubnWPWfE983zeu6rxE75pPBFzAn001mkmCw7H2nTLO0k3irebHSVSWMk7g2ljiAjuOjxhQM
+WNEG1EuCjF82lRTM/5TfV11VZzsx2dFqLBluWHsunO3JtoS/OFxdGhZg/Xg2WD3pTeAHlB+OpUS
Umk4/CBssY+hC7n9gBqHit1fm6NgAqbMfTZNxZ7ZeUrNf3yk/tmhM5BwpZjo1CvzsPe7f8CmSHUx
ZQkE2EG805dZegWvcZh5OqCYlvRJhJMYTuIDARBLcb4jwiCmAIMzVxb+O1wP0NmoYghJcbsrywEr
vkKjBQf2XN5zKrta2VpeCYGgvDKC1krpPn+KCk0bKOdDLyXwHgjoyDsFfcgA2OyKpBw+vRptWIpn
AgUtpgwYDnJr2NIGI69T/47vMCL8hpK1HhBElm0vL0wLJNgh7a/lH1z1RknEM+Hp3ipDWWe+Ii4r
VGR5IwFnpWI7RDMtGX9B6EcZyGmiR/oK0pUhKvyoj3PKlVrtSKdf7XK4lG5CvxKJsMFen8m289VG
9NEweSV9OIVe6nJJx6awSSSUInWoq3lj5l+z8HNFWNIXMYDIwNK7zGpL3zX/ETWuCcWfqr1brLcY
ac9dFTU8bxKtUjBohzJ6sPA8u74A5yvtExb3xaRyj+a99tENNmEVhf1kTND8tMBT9ybcRoFyf8pD
nDqGo23P+MqRgpE33SknBTzoUnnQQt7zllJBadoOCuBv64dh0El6cf5y0UIYkxiSbXeiqqkGblKJ
JIacPc0tpmT+qHLodFLL3p+ryflTiuzcTi4NwdjrhYczk5TPW6BHU9JbyjtMTcGAuimpV1hDDihY
Vibrx/ToPW05a+P77vXuaYE1WLBTuyuwczmuRdXrJVdCltfo+ldXSoE8N6UG74lHzYrZrYJ5Q5hm
bxQ7ZL5VLDR+OrSfk+HhE4eLtmiDitFEaIyAEcJh+BZ+0w91xQRj+7pgDQxNiaR0aHgN0NHMBd1q
YQU4IdlrF4QUPTTlVvcEj4Kdt7t50E2BYME4CzMeZPoM4vS8dPJbesZDNPSMIAgWi6gnBzkve9UJ
fde5so2SEFnzI/N0759tZAv8zY03sjEToT8L4Fy/duq5suqsrMJbY0rpdjktE3vu+YvFiL3ncCBP
TFVhjO5gsw8ar8OiSRndIrZIMPvpqxZQfyeTfcKZ4oaXMO9e/4v7ew1Uu7W3G2OjiveLPDsZmxFA
8N2T3vzFhgFuGMlkH5XTzorQeieSIbaeghtoGl1IqfmLosoctbQIMSxFZ+9kcDwE2Km2nplJxwzV
XsMP06ONsoM6wHZ4DQTZYhjcIIEP9qxlJ20DV0JxbAsC+czeRvjmrMpE5VGcPXxuI03mmYJZEBFE
P57nVv8GiNeyIRjRE2/W+FEv44Ufdh9+XzC8zN7zR37flgNF1P6rzXIBYRfDfFZTDLMvg+iHyOZZ
S4w2fqdtXwZTwmpgzpCYXHz0iQACQhyDD4pjwjTPwrceM/+eIbfCQYF3EIk0XYypnt4BELxt3qzu
wJQ1/xWGKL7wWF/IqwcsVscCRl3oLb/wseiBsQ7ok9EZ4n6HapxFGtDFVc93tB4LF2okqgwWFFjd
0V/bpMLQRmlGM7B8hpjsXQ1qIaP2bbKqVVm+TNVTSnkn4x1eJ1BY5So1sgAn+jWoBs8kRZJF8Kk9
Kwal5WIErEr1XvJsEW26UGaaeYZQi0ErPd4LY6Dwkc6wgORAwmGOsRtxNMSd2VmoPtSYP4kL+9/2
vNphcGnr+Pt9Vaz6AqKsmdBfKaYKan8797NSU5oUWPR4TkWw1Wv/maHy7A7fua75pvLbUVP2VGIe
xMtY1hpRhaQ5v+xPhhT/oZymvBYEYcU2hBIpNKaoq0hVtBdvUOy2YyQaADF0EoT+Vnad5tpATewo
fPrAWeyA5V2J1dB3DmP1210q1NUaAi0FyEqYJoFV2O0nClPCa++0P6xV8CTJW/PSU+/wMk05f6xT
TocOeAaAX6/8JTsbhbkAYEyYi6YvdHuRek4t23JYVjFPxEsh4mlt/1bYbAzo3kK7gpm3lEzk8k3G
pNGFLNbISf1C33eNu1YIJSPmacc7kR6JjsAtZeaApuOw00Mv6NoUGMDpJSHFsZt3boaJ/klVgMWp
+8BdlqJisqUNduL6oDuW40SCG3oe7cIWvq+iKR7qMqVMhbYZO75GFxqdice+YistmojQIfygONrr
rYdKyHt0gLdV5Np6eh5NppSnLLCmUbEFKeeSWYdoZpGiLaafIk4PHqj72fZ9zdwkp7mGOSc3Ajt+
3uXoHHBlfPCE2oMewS97x+cLr9stCrzRM9HatVZb+yPfmLu5OJ3YvI8awZM0eF3Mbvmt2p66D6Az
c91ltf5KYCPBONRmDMEFFVVWA50F9PfauDnC/Ad3FupTIOjstr47bdbvZd8pJOUFUnxuZhoOvzck
SJkZHR4pywi82zk/kuV/B9lSg1Zzd1vkICTHlu+O7MvUuzcM2q8yDxAYsZxb86Lbcq0nipEVRJlB
C3m+E1w2wyhmYFdQno1+fMrMrPkggwojdVlQ4vasj3WlapfmncEKa9QABXBGE6ppgb+abjMlHMAT
yDFUUMMCprMeKkfPIPJfSLFBic5k5vUxJtDmp7vMVJF5ZjkboV6qefx1VBXbFMB2nSEvI1HmGHyd
IpCW9WH3VQ29ZWVlaHXC+R4z3p9vJODZka3WAIUfbLZ+/BBRV/EJs/SvjXkHWNEr/hbz3C5as99w
P/F8CZyfQL9dkKT+exEMDM6yvH/cVFo0Mxyv4CQkMPh9rN9Y2vokjulnkbM90i6ZVo5gIWsXveyj
TZg1wNe16L6lRX1P5VniyncDw7ImSG35cKpN7dH5rpFrq9fTv1vlAE/qWLlrK6Rh1ldQxxmLxQjY
ulh59vTofaTgLmTDOZu9OVqPPyA9FWTnCNANddJYv1Mq6lvFvPy2H9j6hY9gYAoeXJCKkaL0KxqD
4sF/Lj+gNusZyQ4VFj9UjR5C30TQuweudxD5IiRLtVYk9+oYfykdrdvU6EfJ7pITfJAfseib0jE9
yMxmdvkNARymTblnGvC8ua3r6X3CPfW76ir9UxKOCicIbvYBJgrdbiDmCdEz99beiAO7/KEDiq3z
R2zQc59gt9ZP3kNytWIpYfUhrYqBtpfA2J3TDUrY/K2xFD+Byf5wBJa29wwVEU1Dm1PwghkNRWVa
gTeSLb0ltePPD5Uie/J+AncG2xMPNN4khLLMHzP8wmawashGmh4/yUZSvMdLs4Cv25EUnllzCxsK
Ysu/5QkjWW3Bv7quwrSlX1Hsh2OFM6cRGpD8zLoUXgqo8mH+tfGvK0qY620Uyw/i7dmv2ZTbmTEk
yNGHM2bVW3o7DemJ+/grVoDmYXEDXAtuSmmSoYcpPV226an7OeZOIM46BReLrvWF/hLBjJGtlXzI
gkH2LM0cBo5ra2BvuoKwrGWPi7+ObzoIYANF8ntOdzfAtyRcPGNBh/WZGw8UESlz+huPGK2geAu1
oExjgep3GDXg02uvQuF5t2bGFCuyl1TENCFnDwhY06HRvoTTgwoG31EiYRsEqUQUx8cVCPjajW3x
4S757O4sCIZclybkY09Ce2uQVeTiQzJYciOu5eWFfOJJnHNOtHbVfTmGnNAkRe54Uxn2uPdI+6gr
jwG+tWlI3QcnMgfVFJpGPwCdh3wRYw6dNHuV/BTdNF8OYexlB+blQPK12DTeBkOHPZ+mSUf6prsQ
bZo8w/ir6onaCl7+0YAQEfBlj0eTgN4LXQpY3+1Cw8MfoOfezHXDc4G0iPcyN4pTI0fTycgf7/Qx
jMOuKlT5AW438bG6gZqmVo2ttdlwRAZnPgz1+DESp3ec3ddoocTXfwMGRhdQ8pVmXlXsk3NUEduT
zO9hb90GSaX0S4T/Wr8j5ZH201RtYWwSm72HljKm+mJqlXB+nqIH5+b3hMIGHpYoVqTcKBDeZs2P
lorL3XYSvl5FMItaJOpZxZgzUUdtTRI7y7Vlyjoy+c98+5T6kfa/SqTGcuLX9fFayShWmhVH1Ibf
znc1g9F8OhM5rUmlIsTuQkvWnskBGtOZWJeGoeyEnQz1zsKJkME/cpbhnmNl/KrpewIgQ8ZGPKP/
fbjpzANgHLuemJCX9Ax7+ixm765JIHy+i7SbmkujgPG6iEDowDnwd7DjBBS8Hdgn2tg8YyNti09m
hNeIaNKVPUOOfMIs6e6964Q4dy2ns/FiKqr4r72JAa2kqw/mnEgi+4xhfyxSYwhGE4+g1yL+CRU1
ioxweSWvWSXx6eJAImZbvJkfc8yM+3kUGlcIiTpgL/NSWsEwWvJ7cIZorXg7GqlzGoIpe2ZmaSs2
2ISpTu7yHxanyhl1bJCzoiFM6RwGfzi9hy4WQKCwavMK0sgRcQOV0vbTc98MMOobpjzB0bBtcVv2
f7GK/2liPNJT22OyrvZ/JutzCI8SnjOs9UHGeclLI7ZLu8+MZyiJIETr3cFqHVJjd8qDIOd3V59y
Oh/T9SAcS0nfA8XxSCMKhzFj05DDaxfNNZ6oIXowGVJ+rJ7aQCY7LINEm205SV6qJNH93YIPVOB7
QIlcXMlQBlRn7OWi05Ygf5ufS2xJv2M0f1KmBfIiKextV+lt2lP1/SwgfqycAL3ZILzUXhx/bxL8
5fSuRXgrQC66iuq4hg+WaQGQZ75HGHZTbQrbMk13mH7nDLFx4r81W+jbF6j6IbTe3z5A3vk1p1/q
qD3rByXUS3fmlz8dy9hBHsrln3Ryp89qtthMdYfwtYcJDodD5LFT/O1TztPcBmk3w9BzxOIz7CYv
fVGA+zPMQ6h46l3WuuVOzO+TQ9XsPLphreogjQR8DdI6qsd38njr19903njKzzoR+laWKMSOEZaH
RK/SHLfXUxGuNzjSCn0UbBmLr0Uo//RU2aIA1+JoHOXUyvGRMQqQrLMG9+YSIxMT0mNvdn2mx8gK
I7IiwaVF6fZajF86O2lFq6wd42uBTRavKHxNHBL0FWWzRlJlLYR1zd3YopGemtph3ZFeuVy85w/x
BwnjNx+kYTJ7aMAYN+41niL51ofvn01mhSF084uTcNF4RCWoiITYzDJnsrKnzqmzYPfw+tGIuiqm
7ksutMmWNhwnYlFeM1mxLhoJS0gYS8ryLZNACdq9hjYez5Evwweuke4rOs5bqxhgYTsJB9UND+Q3
F4F0j3vmjNZwJih0c3ct4pE7z23HJWxdUQnVhMuY/78T90clizy3AN2T6PjFPtSojAuXIkutCxTS
eLSXhcI9oBBY1BjYgyOIZH8/c7Xgg3EV7Dh9ELllKTlYZKQx9l4ttj5LM48tHPiTnoquK1GOhLmC
s8/xkYu2m76+ZJcJ/H7jI/EMezEs3rGn/hegwP49y97RZdKNMPFdc9aGd4/yyM72BMXEQNyURauZ
/svHrX2ItgeWcRQOSzcGJtc+VLpfrJBcD1A28T8fNeH2d3FPgUWVpoI4GWqAsuLBPztM2QooL/Z5
ojiqqtOe421ozUCcNXQ8dU96xQVzFVD7ngNxXpclnkWJa/Ed0Nhhs/l4F/gQijKD/t5H3MVNumD9
UJmb2lpxXEfEUjp/ZCmZxSI0+erGPjzpk9xPApTQobPtq8slInq9o28DU0W+CJRh5hn+SOGyzX8q
xRnDMc8yaumPrgIIZ3UuaWfdktBW/E9k6XGxJkd+f6oaH+vCaBX1RU+oERv6dSObweKnJAMWMHxM
GQxC/0GXb5/LeQQp+48YZ0HiLKoag34W/X3WX7intVMbUACJadEOAflcN44I2TRCDnRoKVEkpjRn
qUDEmD8T0dSG3iVF4Cc6JKmc+1sQ7KbdOvtHeaYKVwKHymI2hfqoCigrwyd+/fvKqqG3Zd7vSKyb
DKhewUBMV7kKK1EUF7g5fxN5rKwULl4QeLHzFccfQjWJlP+UppAgU7Yq3K4CyWVpncLpNhA6wrrV
31Pi/+eRX8vBMAvFDkGu+p/tJFB5Ki04N/DgfP1IRHTjVBR4KTCetDi3kQbK2Pt7UMZAdMTgIroL
5v9uTj2Uyl71Jchw5QvXpNIhK9V1GbVB7NIpFFU5UOOAHynDtMgmCpoCYprxm7Rxez8wjUs8fsjQ
DWSQS1+NPfNm20xcrV3684Nz2I2sQWcd5vvuMp0ABbe1eBPD7hbAoO7ewuXt/8Y9o1y1rZvGTMKt
ZNaopeM77xx93H26MJl7bENW7qIW7/ModnPI9JjqGSv6nlyvEKrZ6y6WqBUYxaj5NFT7W9FJNwsC
tNcW+ybt7u2xzwYULFCdbcaA8DtG+pEYnqlNyBVyp4OStbe4/bYoiQpAd6yn2NZyU1ThyOYnyAqi
jLaSiy/mzd6ALiM9nXeUmY5OzdB4r8saHcjHEKbWFBk+kKgIoheAgkJowyjefj8vTn4BOurhE0L5
VX/9nsnbsThnOCfat3twuFEeSo7HyWGMv+gfLyjhR4mDjKdzg9XyQpIwr+O4lablS3IThYEQiliy
cHGR72WV0kGjc50UrMb4VF+8rz0mAmv+6UPJZDqGYevEDV06V7R5gHOs4C66TqDz9PBbxocvuqmG
Zt0cHob0hPsVR7VKr9JKAKf7o0CTd3U5bTBp8yTPEPkG3q/CYVTF+jE6ba92ENGJrdiFCvFdpI7q
D4vaOWapBsaWzEtgn+IbBWp7ELUavLaPIRtYI3WGR2UliZgtlxCQZUQUgKLVXCoaZdIM2okdfBUK
sM2AXBCqDNokjavWOlRVRybmBWyznQ0VvlMdz5eyQz9BQyrqSVqyJfzzYXQIVAXKeIlh3SXSJT9X
Yd/Zwx0XRxMDEoL4TPwcV/SowwHumv2iYkSomwplI4fdesAp9sKq1vJDPdEUvUux+hHZWYB2sozc
Ovv1RTTsoim8cjgPXWYYOTVjMR8zbuuy7IqKThizVke9HdH65wehwV4TpiybB0bpWSt86+E+qdjg
V124oO6uELYXIh8U63HLblZxOumTnMsXBMXTwcjdgGHS+qZTMjOlRAHc5RqbOgFBJn1t8kkwbi3u
lh/4GG1NfaBo7e1z1VLlZfulBwVTRBuk4HU0tQ+9huCf7rDQSEWa12tTWq5djdTe7R6+Ej0mfFxA
Xiklhaqpp4DM7/GvYWurZ7j9VexbU8mFuZazGk4TlqCU6IkW0NtckPNLPXxbpqioOP4SsVfMGxXP
Qjf5Tk+w0GR8b6ffo6WjV3i80zK9awW05pCJX2sngNJ0xR2T0Dsbrbh4i6e4CsCrf3JmSCHlvfhJ
2wtB83k+R7jzllhhzyW7taCUJW5qyR4OLNnkNdQaPnXiJjRn7EML3Q6ocL4MTg1xeAyVYD+isRV/
sD6mTe2emPed+Do81kUKINTnnAQxpNMeFK924KtiVQ1pQJ/m94aFR6I9aF3M4cuBA4EQfEMJz/Bh
13FqSYFt4FqcTiFIOZo5o6bXZOAFZJe7pAcFyEyttjXdDZbnQSkvME0dtVc6DMqmvqB+OpBglbfE
hbhzKSKdUopyZX2XCqlZyVf8/Bnw10W58tW+vetfDb0HBuwgMIjSy2cRXyrRIWdwAPh+2aXVA3cH
t3LpG7sQBmpsUbnu5/up5/PrJcXS/OS2ri1RQCSc4xsqiSRWAsCfImpyQgFmNf4JmgvXixOgmeqK
3BSQSCyxCLEeRtvFl4yOuNEJ+lcpZrWE9XeW9QX18wgPMosgmk8TjlM7dIv1nELKhHZ/0a1TfAy0
n+G76BumIYdEPZPw35V4VXJRR1AA810ayK88khns2liRB0hzd/ANDP8luPYlAVGsfkAtHMbHTvA1
sfPgksvzF+8N3mB9ETXkPOUnyRY7jYjISHDyitoOnoMh7Z8Q1tzdAZ/w5WlJcl4lCk4cNGV61Rdd
RGVVkWtjTm7NvEo+UNm8imSFArWqgA4F9qn2MWpcu0EX/EcQX7Z6koIZFYycxSpzdpw8JglnwEFE
vbl1/OyH2m4LoStzAAOStOHG2Z1uVa/aHBmAodPv88bBejJ+fjTyQ/EW+SvuUmtEfV+YV4Wt2KWx
O3JKpUODtXlz8LxjI1Cm9321e9PyF7TewC8PlBK9R9cGqYmNgOfN3TG587NiWaeLAZbxAuOFm14t
9VBFJcnF5PW4qH9Cmnfjf3aGf7ckHi0IVWvm+3ztQFLGcon1qL0InoijMeCO97nIaCzyTjgKujks
5ZG4ReXP2C7lGUs1yAVMvP6tcrRQORf47XyreZ2H0AdOZZQqWCQEasltD8tQrTRkIF2DMAoYUP6q
2uUUzTpRhu9YxoZFn8qxvwjkGSwB5+38coRNIhZ8T5qIWlYK16S1QfmwBnDWypUvIFbDPRNhkAk3
TKIy8XdWbafo2S8YroF5GqSSSBMztJFlMQAVhxsRXLVqwASneX8oxxlAojSqLKFjhN4KqAdRbm9a
P80EgiEJZmBXkNGadsYUuYSiEXLZ4sAohKWuzO6TxAdqlbXh4CRpJ/JfCvR82ueUVbpj7vzP+xHG
7XtcjRNMfAQ/oQMZBug0kkAT1SlZa3lKu1CnEKJ2TuslImkfytsRkYEgPvkJmUnNTdCMGuTUvAMN
sGs9LFKNgpo1Fl74DlKysFBdU3kmAIYrIxkA6bYVFeMr7up5nBoL8Grvga8epCEOu0p7XMYyV/JH
nxFJEotTvDaoqvb5YQboAybSABSfxBhkJoQQOwvV3MWfKK36Zitywu9M6U/XLODQZ/HbtJOq8tod
RzllHCwjZeA+vZY4LeWEDdlmibo9U2Uxggo9VZT/fc3h/ypu0IFxZRIAtdDTgLoNc2HzOrAD2AJJ
HIGJjyn5kaGdmLjIEahj0XYRBKLtlocFzECr/PujSTuHbavsATVmP7iQo8p+XrPAcC4EjwFipESv
aQxbSqOGYtgIF8EKdJeVqEI8LCQ6TCli3b7bRVTxsODhmddbo2iwEbpQdKJ+iKwnsxx3QdWvfxXS
kmdaIAgR4x0OI4RO3/ZcHgXoRpXlkRUB/DE0JPU/mt8nsbTN1ZcOn+OBaqmGmziLgAAWHMRBKHUA
Qfu+cuuBYkkiUjjDLSpcT5Jb6P59bXg8VatKa9gfDCzG+bfImVdQTExzRcHio8p7Cd5QsTcL0a+H
1va+hRkBsgvOBEcUE4RMZ15zDzvPb+bLY6kNwAC8mCQ9kWPpKw6Dq8fEP6c/vZBngW2E7Yg3elfo
PvE8EAZo6MQPWQ6t5f9ZewNUy17qTX7Q5g01N27ZlDDM2adshK5aupSqGl55eCnkuik5+V5f9G5k
eqKjcPF1jVa6iuTbBMm8I6AMuefbXN1wJxgy/fmxNB0cG+b43nu76J2EZm2IQ5zUX7SmDjo05I78
xcdKIaKAC305B73al6WoNhGwJL370FkC+4QThl5dqKaHEvrxjmdJANqPyKZJFBJ2C177hG6w7N6T
Nw8VKnOD27D6GX8rAs0zDYiMIkUmQLHryUj8QLytxiEXFceFd0/FzUO/aeWb3k/s9Bfo5gcH4cxl
SbuNc0XsQv2NHK93NDQzRkQYT/+I9sF9leo+DWWO6Uu1b8SfsyNnflMM/ncazq3BcbRS+dqayMX6
CZ0rAd311n+R/n/LQltG8dssSfvF24RGXQx5+Z6/6dZeNovzN7HoItpozWkOmVevPyHyWbEvtsxB
XPToOJgE8pGk+K+agYZeb2BkJgjvnlUVdC26jNiRFZ3tpk/ZZDE6yiGz2uHXva3ZB1s3yiVWC0TB
Q0y62eFitZicfk8wrru/XIDA2JYiOeMDqXz5XlZkMrKo1NUkm2uykusxHdtCCs0BW/MUy0xIofa9
k7jN8zV6eXcVOrGeD9PXOXs2tp9LEsmPDcK+BbxuLqkhc/ilSJ3DrTnJ+kl69eWUlsBZZejgiD2A
LLZ37fd/d4cfvVD8l7PkY65gAMrO8P+55lR49FUgr18Emv//mQ8hCe7KbI/Yxlvej+nSOb368U32
1dAGoZEULmMMPWOB/3tmY0jviJEdD1bLj2mKt9c76sFyFreO2ic8sPs2fE0hFuGEwuuKo3dy4CcX
dL71h9LQq+v0HNr2kupQ9N+Hdb0Ptj1C5vUjHMPrA4r8tGz7VBmDTEZBrKZzH9uA+fiYKs7YCQzW
+5YXvmtmqCJVs3mG2yvSf9gmMIA6mTRe/qJ9wfb0vNNCCJ6oeSEc2rYd0yqQBxaqt2MaK04G9ROj
4y0YXpm5kD6mlWRllnMokUN8Xs8hL5heaSDFVmmGb4ErdWlz/jxVpNbvtl9u3su1SYixxGo5bHUy
vjwXTCE9vQR+0MBoJeocqU58lOC/LDjBb7hneB2MrwRSjIGNocb0QX3xr9qKkjoKCGewPxnELw9h
J13NjmLF6jUBsJdmd7EjKrGE1NWnzeTivDSpryB72ZuMpmtVbesMqbvepDnJ5qIvxYOT0JvFjNzP
hRfRWTvRT7nuKejw5+jFUh1gwvp6pgD6AKfqHTb4wsJLTeaYI4ybFEOClDmgu2NWDzIUOnoklU+P
gUvsgcr75Y8JJAw6RF5Or9JdWx/0mMX/ATT/6ydAx+Q/9eo04jSSfMXHHq6llPBIjK3yxvtYsUR6
qM8/UDN1oLAUCr4kyVu0cIm9lT9mab9Dfyi1jUDz/joI7NzianP9R1L33mBkzRQPVDTbgct4L3GU
usH1fescuxiX9KKsWYEfh9cLlmmua0q7S2oSmGdka7iVruCGS0jv1jO3yGBMlF+Z0o//E+/baf39
nKt3ChRXGqXCHVr0JIyPzTqosjPyLJqDV/k5HfOfgRZqSFotoDzAkbUPjD+y96NBy4BVNdCLb/SB
2n7XslSx21DLIofpALSVINHMwepd7xnHxNbvR0M6AmI/3qbVVOXdP1xtFcn5+onZOU3BTPcn3Ap0
CLaM7y/X8XEcJSRuufGg2/MArwsFprX/Z86k/QMH/C1j2Es7yK8fDnNIRFmmJeI7lg+18mbpn7X4
jxsl81Rgud1pgpTIJflPEzLpGHxDGtsKfRoGOUyxyYuf23iyzft/T5OvZnA5hbrmTzX6m3Fc5h/R
UdTrnN8hw6KZRltMKKzL0Uda0Q27rROB5xgKFXXZdBPzcOdD0uv3CwTIvzyOSgp0Ba+xFtdEoi0R
e8cBv4EP1H1mB9bnQGBuSJ6hpNvQyJGq9CR3HtAm6dThzM4bxW/J6jhSD78CHZ2/NSZbIgQmMLL9
D019ktwaC6wndSDPUeO6rrHjtpaETViYmLEFCMstoGC+RN2It7tTgyjYVDHxMkbVHElXIuGNAaM8
VjB4sFYZlwEp+gTIlMNjj724jV3Kkz/flcyXah33KsFxf99OJZLcbL08HoHodns8K4jGeriv0JQb
lo+O8m98R+Go+oEvgN8CScDUSF2nFXgW+mZMSd+DA39SdD3j/IZmYf5q736+fe67xP6VP99Iq8GK
FPR76eFaMzFCikBJKtUuQdXWvp7pRhLdPp/DxmwTCK0Y6x55CV3pdu8blR/TRXkd0yXBnvSHi58x
v5PFH/d9FD+WaCfC2JCIdlGm/ZM2VaTRASJc9patRGwyzeSLFg0drNQfR25HY9XJ+hUng2w2vaTs
J/uBBlvo7Jh805lt71hW9LV6l7vKthsq3dmvhWlXGBXt3pq6YBmZ9quPvPMo+U8RrnflPiSUbekG
9zqox0/2PhfLcd0vR1/kx1IpzJ0HW3uaMduuPt4VPwZPVGjLSokhZCwXyxHv482su4ZmyO3K/ycr
JhPY1H0fAcirnxj44nWgJ1mntK4xxHtOIVEYycA8/YKGYnYCqNb1TWXxjxPX0NUHAigtZBItqyL7
ADWHqcni8YGaq5SSzMWtsS0eyqqM3sju9wd1aq/wcJv3VZaoVhG/IIZwI9gkpwTcTzgu+l7/2XQS
6qKcfZZHn8TYvHJChmo/zy8gw+lUgPDVCwW6sXs/A9zxPHlXM3KJU+n6zOfqi5iB1DnAa+rSTgPY
/BP2ADfwTEj141G7bLMJ46maqDcL4kxHewLT+IcIIRdpJUt0XLPn4OZ8kvTbXy1McVpgdP3+Ff65
9OVEn5rj9nXZvhfate34IEIA/QJ/8jEVluSyAyucZCUHXU+A/+cqVX4OeRjtZ12F94TFo/zIGw8c
8p0jHhwDDReNKqbyr33yA0gURNw1cVWhh7Aky4mIDEPVdVGKIyoSDifR6dSr5XhaO9uOzQ96qjuh
KrCmIHQ8oVW2BOuk+zJNSXIubX8bdBHRlXtgzfVN6gdnMqW4F2NLmK1jr/6lzcq+f/HlySDv5V0b
/f+0ARVRJgZwXIgJkwBglzskkzf0uKTWTiD8iKRhb3fQMJr2nc2tKBYnt05b+F3+75BaebW0M3Zs
w4cGXqGu4Brr//++FP+GlCrNw4b6Mo9ZBWrqyFOnlOCd5LBAX63gbS91LDuNCY+lEeg1Nzvh7HpC
k4nvAZhFlF+9A1XuKHqVAnZU1hxdXncTUOJhTTpXmukftZb83s6rp7VQzHxuv68wacYdYOM+JKO0
EakQhNxTU4ut20CX0lMxHNWNgjm4unI9YDXWUO93awR/U/W5gi4880Xxvmd3Hkcv0d/z87A6DRbv
f2ng6dcocajUdea2OWOKPNqRSipxbw/nydBpdxio1kuuN3lo1nzBsq2khmLfjz8q7qCshd/d2olC
MySiIJC6oemKnyIsAaZLKOAIPY7j2XBiouFejf2zmgF8E7Pht8q8yqcMC2jl65Hfgur55l1nDKz+
i/Ssp0esPI72Dli21qhkJAGahNuO57zdM2TLxMiAB+UBMD6A9D8yNT2VHeRjBPInvUqkZhTPdKiS
GfvGpbRyyP44JGOCr4aRj4QR+WSB9+9F46j+B3nzaPUostc89cwIucCJek4l1KQQGF2kd/qkdlCO
OOpl+Hod7pmV3OR741He8bN2sfJwfVnSoRdmCT4rdPfqdkFdIdIgryzHqb3uFyGI1cA+qryulU30
19xPsant/ACFeae3u/xRD5lhMYQJe7IcrnRpB1EaO2lAKPwhcvOx68sOXDBI+oXOAwdlqpggp56T
qO5F9AOyqmCtfR+54jXeMPHIlsJkA0VcvdrlhSy9lIMJRuks/IHi07atU+gULj2ZavLBgeY0gtcj
pJcOQhi0agqq94s6c1CoDizDywrHGBP6lU1lDzHf5QdSAk6Z0OJ2Mc65SQkpyHmSxJy3PB3tDnMo
fD7+S882Mr7w4quEfDckDsh6M7CEoMQwT5qggSbY4hwWHWw8tr8HPh2j7PLlQqqB8VwTv8sJBkKn
pSy0fX8yvagID5Qrkng/Xx2jeu2NcXW/X2jKjvxJLf+7C6qFp9VXPdwCLFim5S7R9dVkwJvhVXNk
BwI2xqRCrQTFMmauT3+mHDkYa20vzjqBLXEikvQ4um+tbp4QB0y8WLjJP4bdAC+NSOHxk1rOBuz5
eNB83o9Mk4n998ybA+03TJRZe5GaK8pf3tIptx6SN5+T0eACL7vc1pgi+klpOcRkZejXwVi9v/c/
e64RX/1p0CKZ+XgMd3lJ3fqca7ivOszQJATeZxtQx9k1WeyEFAXrQXVcGLtLtmFdlxrLktdtoPzG
XSoT7+z8jhQSe07L8INVw56Wv2s4YFhAQKzo+3KVsG5UnKJPJNVMRuK9tbPECtYQ1uQcf7wpU6ms
bSZ4OJwxWCcOQLIk0Y6cnlFDVeBtMroAUkJt8WgM8nisRQ2D7r1Ud+h1ND7dwL8CEFnLxlRihgFH
cds8cxf4W3lyhAsEJPafRnbZLFjM/9ufYc8g2llvqAv4rje4z5cb/W///RbKvFTMknaR8KPVTkNw
P5k9f4NjlDyWdT5bc8SO+ptl1VfffGH9/6+xQvO/zMwED729eFqirKYTBCnHv51+BjR6khscKd0u
bpQgGoD4BEeCzGfC0OPQ95XKA6tocK1N8NA3SSSFPjhvERnVvfIhQZtZIS3gsV/1Mkz0uwmjXzfH
YR6IeehepnP2e3fl9ByH9TKCgDH/di6AidoojYQXKO0G3VUKXM/pYcLurGB8k0MVvoC/nZkOL0Y5
PSJmwHAX9vtLlMO9wDzjN0gsax8LkZASFF3skv1+H2msqokeLz2N7K2VQPfv481ODogHMHT0kqzP
AJHr1BeiMzalLnHD1oNAgTZlFiiuaV5oQLNcgbrEABsV+Y9LlSfOTblaOD/OnB0Eer5DO1PC/Kqw
lbpRqGW2VpQqsh7/xZtuYx20joBjzrpkhqcOEK0qtIDDbyjjTppVMTVUEHkNSUnEMjBNxm1y6zw2
mPEeX87gVPOb2A7aPcoNmWbuiBOfzxW0zjypvQpQSiHEBsdo90GfAbowRpY3pN+Dilg8Yz8tz8I3
TQ/TAV7YHcM46Hp/QUYQmZUh27b62STy+3qm6KClRtT2cWgwD9g69jnRgP8RJ6TrV2jQ94I6gwdK
NwrgN6IjTPzwiiy9n0dXnQu1hVMuHwkwzuKjfWNNYIqKbjEbqFsaPti2CLa92DLeFsJxPeN/WTpx
o910N+kH2ehQ4l/a6PByYp4UcPlwiPPv2rbmTSvR5mO8AkwVtnyt+VL4iZT/X1Y4biFgh/mOx4E+
PE5bRfA08eT78i6NarMzxopRad55ojOVFVjLYMc6AFXHm8gNmsvmPZxy/q57F6/T0FVgXx0LHBvz
UmdMuhEAICYOBH2joNjTdmFBjptuT1fLhilIPqvnwHabI9a86NGAwRrS4uGzluxoRdjt3XadCSvu
taqBRcUdXcCbxZX7n+mW7NFB4QaS5j321P44Ja7PpcKdZrNf7QSIOrZAw0dmqTwSpqLBpzOggIE3
y8X46LzhvYloTvkQCr0oxl0JP6iFa9wQsq+nhts3QTXBKRo2zSulfdR4qu+tBaMxcJYlLw0ERIfB
Q33PToG6xryfyMdZkjzXjKKx4A0eKkLeE2TpWI6Q8yMlQ1ARuUUlsfoAde3S2iDAy0wkPACRiO98
8PNENd14UFX30gAdcEnv8JVjKcTB43pQ1RTW9T1eJoizcG7m6xY2eBeu9Py5tKF4DaXysDM+cjax
CCUiQZePpPtCfjPZMnqOlJLjl/vtMZoJEBXX/H73Zex9QfHITYB9eqsIMMqk+/0bcI0xnS9SERGK
jTmeQyaDOpDYpAOTbIdUDNw3NtB1U2CshEb+RRf5VkkdQ8GxC/8cRDI/QX/9fuuauPr3ozGjmXiM
ErlZPaEr3jkmq27PMSDBEQvQmPLzfIeauwJYmHwWQau/fOxPkngXGq3FiCrPB2eB37OoBzyaB1Bw
sXZ5mTv56u+XIWgux8pMjHkAl9/gYb06NtTZ7zO5FLT5thPGEBI9kGCUk6k7AxNlaUxMLCLSnNYl
nhnYLJCn6Wx6uQDAZr2P2qVZYb5S2SMtd4TUBk8slXuw8aeGEWmrzvB+S1vZlPXJsPotnhiUacRZ
ozr/GlmvPUsufM5V6yV6UqcCxIH29SJ0yIPFpqOb0/vP70eS19yseYUMxUWujSvPFLRrPOpLnTS/
frp9ZWl9fCTiLvw6LAd9/ELaJxGtariph4aBU1RIncpFAsXarj+bHnoknwzY7tKFeT1OPYOebOlu
zDMMJkMCM9MFg2bgz2+dbt/xqBgy1kqEJJ8Zh8xiABxNt2YkCuAcGhAgm15GEZTg3ds322FUcZin
/xmQSEfAI/d1mHxi5E9m64npjFfGJVMrB28Z7XTrjqV7KEHH5z8bqAxCuE2k7Q8eWtjsAw6T10JB
968xe6DwhXCHtonr0OYZZDu3blKcTRytpqN7kWuikn9TrgOtO3HzGSg3H981aRW10hSGVyyFeGvm
JfqgOqNbV+9R05/192g0YBiXTAkLnPP55MXclXodA8ScxPc1e84SaAkeZPc8EXS5LzK1HDroZEwn
KjPaBim+ZJeiGK7ArxGrZja/NV2N/dLS8sjVsT6YkyOFLWMMb+p/ea0h4jUySS2q3vXcXYrKTSV5
R0vzLLklHrbLJMujZKrzKZBCw0kxpa+fWCybCc9vMVS1LUlFteN94X/v7T1RcF9lE+O+v6gOTiYn
fB5Q9R0tE6bUttdkfQiZ69/PKZsciD+J5vhBUIksGfEkmiJ+46ry63svg0PvsYlEc9YkocNTUYHm
he2NMpNwUvlh+8Jm+NLaio+gSyuNUE92ziTP0vkSuLU/5oPOuqcd6VvnKiaWTvm6XyDRQ/0LkAIX
LU0s/vezXX/ww21qu1fMIC+CiMUuJKiewjMQO83tvgUOWHu3j8bi02PDCmGYmiUTdMPvOEcfaXHV
TkLcsHUOKFfgoMJIkfhv4js5+WpQcP9MqXo0wfB66YwXb611+DD9cfEuTBEpjxe4koqfUW/7CCan
mocJ691O1xBHEFVH+BbAh3b/EB4O8T73gD+cgbJeajsk5o4vmx0TUZQIgARHTiWGIFaJ6TaWSDAE
PPtaUJeABRiPD6POW7w3xr2gY1d0oBhvXzMXx4jjpiZ0FM+VlvdGiRigh3y8XBW9g7uiRKuvjtdf
sspYcwWF/ugi/9eh+a5Dcd+CjHJ+bW05qiC+hzmBYikXjeMRoBC9mNOcakWQykayjLxFNWmL7WJI
4xazL/8QorrHniGuDvZPYD1P8S7TgBafI58zWiFBr0RgQFNmY67HzcGIcsgn7Ec/PRhbHgArCubu
ha78PfMu550+H8UaYsihRd60CVoE3fZarzAqqnBm8YbY/qqquevkPP/7RXuFKwPZNRfPW6kYSl3m
HQsrjfSB93kGA6VBkwcrICvaJ1ae1Cm+wm8HJHqebqi5V2hEXXncn6Dk0TOgqJHoL9owy+ozGDV/
lBw7yCGADoOQ+LogTAc00BmwQHTahBAgyIybP0CWwv/Rmixx1wJtpDYNCFb/2e7hMYtSQt8LPe7M
a2kNRxcfo83IpX+CdSg0nyvFSsU/Gl1Pb9YN5BGUzHLtUS3lFzWbVmJaGeyfEvCOaMNPacLGm1GX
51PliDyplDtE7xpjdSXyFa9yvsqEaoAevtV/j3xrfpkLBveD/ObmYJIspcovT7GhJ5mv91Wura0g
yo0HK2t/ieIPZOnP8f3ogt3hItbwN2kThzBd5eASQ2MQq+LbhGPO0P0Lov6x5Pm2cWIJ3yo8K0ro
1oN6fXN8uITa1VTzgr2VEGapt8WoiEEtizQGcVTApefmp2PoGNWgPZLK8ntVYABPl+9Im+BJBjQp
s5M+uYnEMaMjdXVXkdSr+BI1my607bcfzKHmi+bi97ChCZo1bI15bMRdE5KTbRSMc3NNuuXTfkwI
GeLJK/YdiKYZQhEdhiH476AyLQ4rI5JEPNfZlrM8tNA0ylv26gXsG5g1VCxLGbdk+6c87tYbXn4d
4VW1da7hWeWtMMT7NQOfSHlQQKygiPEPV2zJCJ9cViv7N+XNZ+4qhBZnOmolKzAq1fQW6vtBa8uM
v5Q+UZlspr+PpYax3hIR9dPnknGgKRtNlAsNZCZJKN3i9wPP/Ef5AYT3Bp7/y0oa2zHz8Y32VNKx
m7caNFxTjDUgmQ736igTPuGDNWpTMKVmoL++4f1OmDfEJPgIL9wb/zzYTe5KuzigWD3WeG2SCtGt
Ixy96LqMv6KeGy8G8o1d0HyOTiI76AaaPsmVW7NuMPMlVoeTw1k6le7yTHUvg5YDr426zUi9cMwa
6vWP7F7hBVeKmbreV0AO79g2JZK8WfeZAFoLMxibw+vp0UFPi6yxpbRFr0skMhr3Qmhkjn8TMNj/
nSh2msvqnH9fgwPfBu15eDScyKtxNF6g8gNBB6XUXtvjnJ2B+hwb7SHXOKFhtHHW0JReueH/ARuC
QFPytL5wqZtABts9uCmBeB42j0Nk/RZGBRS08sYDX8CsDg/bpZOb4w4O5MhzkbNnL8fSkwWPpXsl
EBVi44srLqYSfWzL3M0glt+pnRhGC2yNn4/DGus68TI1y6NHfuk4Hbs0pCoFjyT0s0bPkmDhyPLg
eiy+ruj7u1ITViYc2cSOEMsD02bmoqKDM2PSTnIyMY8IGuuWwrb65Xb5+HUIwj1rmvBr74T2vEcN
pJ+7Ebc5BpeehvRyPKLjVSSEKLx5wjZyxWIttluCoJhp1EAjOnyYc7TCS8E6dDDlo8y554lpF4XN
VhijOuaP0TkCGGjh7mj6hIK1FVEcPML26Ciji/4mSbkQPHNgvN32QjemFbOSBHgTYPgwv91goUGJ
MLaYSj1epl7wjfMmYtjgtg4HG406w+c2S9wGWy/ZHX/r9NcUwkSDaoMXjr1Jp69sAOSnYRtiB/PZ
JKMAaQHXQtU7kxrKLrmQ2UL26hnfh+mF/z945SGGvSHQHHYlicV0TEas92a4SEclCWFo2P9tQXWK
zrdiHDq3ShpQxsKs5lA0NrTgUq+UdZ34STOv4cNDUyhqNYwxjxXG7f1k4Vc4/oJsVqRMzvAuAF6K
05C0UlMarrRGPbtJh4d66ch5I5+yp0AmOBqTXmlR5oMklgMQaHgHUpjMg+9VkCKEap+jZ5+LP+Sk
SRriXfaHR5NK8c4YbsFsA1MwS7dmGNKae5t3inayGNDsLGzyuLJj4VuGWCSR48WiaNCwH9eiZMEW
iUvYayy4gbdrP08TQXCf2qCA0gTfBdQUosMiuAQt+gE+k7a7DRRIhJEj1CmO45gyo1Y/wMoNiYRz
m+XcJ34r7ovWwpi1CNWQB2TWPGC0sTY8YrAyXYxhikfj/h7E0TZqzlclHkwILU1zVZNoYLaMgcVG
vDFf0h6RxexbgBErro7cKwycvx1g/klxAtpF+3L15x13HQW+o5s2f2w6IZeapfMZGJQAJcGC17Aw
ymIb/W1WlSPbz1mO5wzSCYQECWniT/7aXzBL2BgxaPh/BLOZxN2I6Oi8KqCNqXRodhi/+t95vydx
ApwycQeiqYRdAfJHsXojurh7yDQWUVQW5G4nAoUF87Ype5bGpJrIHaahm8rg5a7mwx4Pvzymml1u
5SFqnNqE3sx6HtOU+m4z9kUvUZ3VtSuajyQA/syYKGK4UnJRT7XSH7uEMqxvESa9KlyJ5zp2aLVa
bKRXJ5vTT8zRcGDWbtrNTrtjf9SC/oF3SqaRH02JNxof0q3g8kVlgSmQqbE6kgmnOyQD7wXW/L7x
8oTk99LXDU6Md57oFDqI1+QGvQ89P8gCysfrc7KfS5a3anqTXeOm6VcbbOjQQ67ZvrbptUSab7Iv
fbcM+Fohts3L9jND8GKWGhewonmgofOvrmh7rWlyVKfmwU6VF5WxqjYb21M8nuPKNyYqzWyyBn18
hX9JphrB/BhDQDpNJ6yeWhJwptDBqege4zDBnYe2Y74LFznKaWN4yYQ6WvsIssV/fMxhlwetIaZs
+zxW21DuTrQDAv+YGvEsDEQMBe8m3gojGUh5Nm4gU99tPp4uV8vrGvik/cyrH+YM5Rbe4PyNXvrw
pO/zwimkljDHGPyh2Abo+N769W1YtLNwe9D+9z+vl6GsooU9qrwmsUuSFIJxyAquS2obzvNAdcmP
mv9W8lCFkJlDZl+Ak/Roc+NKJW/YdtWkwa8U1of6EekEHKTBcA149JIjdTxJV24MqOJWVBFYiARB
VQ3QowA/4AdKa6JPqfjcTtWF5F6JNBlGx08qWZk5H1S7j6T/FThTPKiCRa1sczBjw0WP1QQISZdd
kz1qTo8HskyZQuh2xVZaMlitMEcPUvy5tpqe2HkZNO7gE78r80rqCt6eErt8OWYJu89llmi6eWka
qTy50M3o7sezF51IJBpREpRa2r4YKL/XKsXL7fkUnSUPJ7kZEWJ99is235pa9RgTEybTdHNLvzXY
mfhavH03voeS3ZZg6g+jss2Yp3qkn4Lp4yhkbKYF7eLt2OCOe7l1kho1XSN+GNjdQ4AbkYrVtwZ1
AE/HDORY31bBcHdJWW7wD/7kKCT/EOkaCbwZYWdFcuyd2dP73vKFYiPE22Nel/33BvCuC/CiypGB
HC11WDIOyuOmmAUm1H894XMkNFuIqzWsfImUrRlD9M2UsxKfaBgKiM1J9u/5zmhd+jl2I5bJKB4f
hkMkGzDO7weV0WoT1axUAP+9+kFwIIPnM9FqiYCRi0ox0AHJ7oivl7ItT6iFPv3ck5a8vuirjMVc
GZtidPk9pE+rwfZHiIlx9ky8k+WKPjFKgMskzXi1Ge/l9m7xzWm7dx7LE8AWAz62rnstpKwKFJB4
rrqUyBXVr+oQU3UhDEu6w3JwZYekANvCBcyImUFiAURYdQzwPXiEwNwV5SjCQ8FRAmFQbmiKSBBn
0vnLvwpAl3bzIe4joBZCrXIezLBW7KhtxRAZ/rPkYZmwJZrz47ICeExLWIkf3I0Ez2NwNoJjlmxA
1VRMbvB5z2/N+NxkUXApnNtfWvvSVzi/qrqZJ5/Wi5Rl5iaDGnYqP0x9YTW1wIfqvY9aaGjjmVNF
+8x5gSg6Ivc/jajPsR6EoqWGFTN52FM8EqQ1vFRarYAOSUdlmS8+pBl6H6XF3zZHigXTngp6GwGj
Z15EYFxEJorm+wc5phKtiHBZOTkObQ8kmRG8HB+qVssxlUE78sgtMEW1lUGEIXes6wxO7jGex5JI
QdCITVVmp+8H2m88QM7v2yEQt8PEGJ0WbS4eYkxZD7zkRyB9SFSPyk1CDoxNdd0/R8Z5wz6ppE62
2f9ODiz3+emANoSPwueepZnzUpgoVC1rIQNHVvU1JaYe1SkmVlKJzhLI/ahHuvcOZ2B2hHyL6Ihc
x2V1/jTgX2RErle+XEsGzU6gwErWCgroOCdBn6tDrAJJKHR22nhy8zKxk1EXu1WGICflVJzP0WRj
KhWqIkM9gwealXoI1PZwg/FFHZlk7YesCkHUOZdi7a/333lxzFhOjeyLBampNmO2+0rL7r2cd3A4
FadYVvf49k1BF7mNeBg5JN+eco6MhfHTqxsmJZWUJfYbD2T0bCyYk8fTQd1DPOFSuPTMPSqVyRxO
L27JDzwaQmSyP76nYRAJl/wXnAgrweOQYwsZoNk80I9rXYsSNZOJS97iEj1iyUBGDNi0nhIBk+u2
O1Zz3hXT2xpkQ8titMP5x3OfioqWOVqyZxo8GMVq/mPjarX9hGQg+vSysEmBpmtc137abvv7FAnh
st3AzdV4FcWu4eHN83orOj9HePxEp+65rA0Y7IP2dSF3a//RJPaON5WPnkmcT9Jg9nkR3Quio0Mx
CMs65wsnQc2Hwxs6ujclgELoBaziXvmaSoP8amqFNZ1rYFZNGjFlER3OB+L+rz6GEsH4KKQ+37Dy
LjZvP86wCG4llUQTLLiv4xSRyMGYyAYxble203UU8R5h8+I+/ou7b/H7UmoUnrlH8VtaOwZF22Lt
xtEOI/ZysQK7ib8zWE3Z0s57uxLiHor1WJWGfSfF4k41TqSW7zMnmOWD6Smb8R6GFOna53kS9rJT
N8FRr6UiMVaBL/uT9jbQ33sqxF05QVyMGEA+/einKb2pstlpKpfduwhb/SF+SdLF6IF1JQAqMjSO
Mf1H0DZ5zMZnuJDHdHG5Q4IDkLeD2hUujWE8q+H2o7BhH0cwIwNWqdhYS9RjWehTPdxBRKm4W9Jk
HWl9nVRAole8SgZ+cXo5EOl2APC9wPb5p9o/Ikie50NdFJD8BmNTBMGN4QCLdRyH2oLflQ7YDhQ1
icO3RRDGnFXdKnvVOqcgY5WrkTLXUjH0Kc6QoDDRihGa1X0ng4iirt6h+i0DEMYLGVGpQvioBPcJ
B+7u4szs36foiOl5YerCc7o37JNu2l0Rl7X+k4pUk2K9YlABd2OTG9k9rvFVicGlo4UAJVQwD7Dk
dRjzzyxwbZCpXEsArIcDZsyNrsrZAjNxTkxuK14r+YaESEuMngkV2HPpsGyFarTiFW8XL/j1UHpK
r53HUceSmA+B3pscn/veSMJx6OREs0Mx/KxsY1tbeKPFXlQsgB9BlBXOe5NydVtu7VIoejCg5lE2
J7Lbrz0gVHsPS9CF3WCtKtiQo8OrtbGZCDGmT+ZJALFjHyJNg1K3hiZmZmb+xz5leFIeKaqB7Yfz
Ccqg4ZeTs2TdHiw3GM6VVmLV6W9UOq8X8XbgwROrIoSgoat5tXr2EJjVxtnUr2kcDnFPUu4kHzRC
XCAaBYz6VBsDBhEH778fc0D3vcsU0ph+CS7KJd2JQJD7Scx0AMMwr7bl0lHkUp8MW8BND6UUxJ77
Y+Lf9IxZ9sNljTNskB9VlpdnvmqOVYH+2x/8nU14Q5mTaadHphcxA81TkBdZmXjUzoM3Crm2Co5L
OYC2wicL8ZSQJIhgihIyHGkGAG5AeLImJrsCPXMg097eYPWcN5ofVD8DzjsUZNEuICHo/gm0GY8k
pyE/1++q1tAB+OAuP3qdkCg3RDA/kizSLRh6zntLjaR3KHWL5DcH1fLYBlb043GguROPpez8GK9u
jme0UOyd7DCOzB6JqYS7ykfPCcoWN2w+WC2YuCkj2N+F+gg6hM+NV3Rjyyg/zBXM6LlcC2FtXIIb
TTCwiIOAC01VH4i1I4FxT/QgEagyYRZ25/7p9aRUTRd91DWmhKfNpNp8JjnvinWxD77R0KfCzf9O
pHiC3rJCPS8I6K+NcO2rBDCLkmL1pp4xfVphsvLF8fHLS6ZK4qP2BsWfef+60puG6ebvw+zTT38N
snKaEmbHYNFZMwH14jXg78iz+NWt/5OfUz4inPcHEBYbzvxfqfMgljhYdTQuTmqSTvHkkAeZinpu
Ne+if3Y1qc7CC3KkdotGKIna517Tzq1ptsPAW25b8LN/38rij0KO8NfIruuNR4OmmH0W4eaNRuNV
vdHZlMMkNbNWFhJDYrj2F9ytohlLl7Hg+KfRwUS0ascMIyZTjwY8zDWDuprUqPC0aX5a1mtbqEoS
V2hFgeYNfwwUB1LpSx64KwDPugoVYXB3Nbk/CMCCPxiKWJqH9n8fNIYELgoZbGlj1GSGwztPl8dM
RYu2pIS0ba2UpQzEsZ993DmX5zSFZGjhpIYO4W9fnWXQO3PBhzJogdvqLQVbkqhLNm2JKZdl7KCY
mCSxrX7BclY3xg72n2rzRIC2/CpawTya/2k7BtktBMAaCx5yt/BZuvurhcKrc8rkYLGiivVza590
bnSMXP5CpxVM6uFhLbeoIkfGljNjNBiaXAXp+CE2xwNgLw/2YbiXvhOXyo9X7VVvyKWrEyxpC/1t
Z+ZsR5Qi1voCb1kkr2Ibr4Exm8/LSQF1ljLQVEnBb4qz4EsUrZQ3fG8LDq35P3Wt0sCKG55raIrp
gRu5H9kVu+Ygwy9inPNCrpt04ST/v2jpp1yNGk9WYnJ4WzmQ9EPlmxsTEG0cPaioSkv5NKwIJogv
67FdX1oxn65hi8YnABwVbVMPSObNDKKNlIwEzMJZAbV9b1voHB0xRGqtnaaZvDQTmdD0H1oddy/f
cRnfMCbyyLc79bb185R88cn93X4NzvP3tew8AmyU0jLOdkaDZeSWsulI0i9TIQncEeUCNrGDDUnW
6LlrU+0Q/+redgZ65VRlygt6A/ma4jXciBlHo/X7SrdiqUTCNNTDaAfed94Du+0/ZV9Fi3fZLlrD
3GLI29cwtndYhhMSmaFYDc7dkX0nZD95HenWh5QjYKqLdQboe9rfMNbW/oTGBy2lXAB5EKafIgvC
mO5Il3SZcIHDzUzOu4Zbj+eJaxfNQp/4nh/SRcoUbOUsUxT+xOfW+2tJdwcwNme3OEsm2lHz4LFX
+QC7ez/4mxWcss/wYggpBeud3qvsLu7EjC9T48jaqojxnYpi9rNNb7QZn6XZw+4VKqt95P4hNScz
J7HmENmwNzgMwF1FpEGqJE3vFgqYck9KEO0o4cS5vvW0oqJuTIVq0rAJykAgPAycIEMRIatlOOu0
qWsVGsbzBnpL4QFFGRJg/vXj11+rtqXGlV7gKUcE2NjjnOZyL5owbbCqvsG92Tw4hSpsJO3VtHj8
xlwUyPtDYoCZj1HCsW3qYEkYAov2M/nsre9VPgUllLndDdpydNaCL0+a6gewc6mLgO4LDb9/ucN/
mktCKSV+VzH7Tr7dj/9uLemCNcgk3o3l6lED7ytjRiSD8K/NAvdAI/n1r61/F410ARY5DTGC2cUZ
31HapgeoDiWOlUad0wQaqthCsgxBAQvuz6z6dfe27s9ULsVSJXdrSnjFcFAyQ9Qa4yulN2mECqbb
I1ltrJ1TnASysjT5ZQj49gnBddwCIpJvZhmGEqt9EAJ/rdA6N+KBCIlkhNO6jnG/w3LVrCYS/kxP
qf79TvpUf7hbzJ2W4VdvrgKhlzywWfBPjNjT+VGUM4CjA9aFfkz5Mu341Zs8XrxUmHmdb1gw2j6n
EHeUX9i5nkJlpYQBENlcGXLyUCzKMq1oie1eKCkHnTQsQX+iqNldG5dRA2Z91gvmnkM9o8w4dAxF
LMDZ9ns0l4/OQu2U4iJ2oei7ri6MTEq666mCADaidj5Lb8XRVXB8lQWv8u3HNXVvyCOT5utIlEgP
l9PpZv3EV/tbGHIQV4APO2LFYc+s+3/AYTG+usMIAaUjILH6N2thI1vc4uut+jXNSEvqGsDHkEwX
bO7fDEDO2w76lxLBAJ5pZgkAEq2YwzCrCyHEGznfrAnwZRSTf0YDSGJo3E767xJWhK8A0GTxRE3n
KZWBfd/Zlv+rBfzs5+FJNAHqtfkSFMQs1RPODr4kD+RfDvYjZ36GuP8PCpa593VfTrjryxbBU1pb
pkrAJ4lADLuUFBFEOLOAfu+oSVJ/9ZrC6PfzVmYMD07fDATXLYcZ/2fB8D8QxmHWf3U34XCv1R60
iSN6UCI/l47P7+tX0UvWWMNwZmEcjW/KTtTqYkhAzF7vxxQ1UBUMnq292hqkRstiVTftfbm3i5WM
i9g/7ETCEyONcz/H5AFJUO8SyGqOWHrAsbxFtkpI/zFo3EkyYQjUuTooQeDV4pk1Xb33ET6Usc0z
lXMjLa7GpD4YK81jgL17oHrDTrhYPxFgRBiASfs3tzZj/tnVQyHH11WH8D2Qvt+TUC6mFU6LDJ7L
+G21pgKnjoJzlclNNh9Wzy8Hjya+BYNGHTRe4I3Lz/FQRqQH5ceh1KKMPU5rkw8TwC7areVsuOTo
nEr222Ji1ouWi0B/EJOjLQmttgaJ7do73OMTKmo0ksVdGWaRti7CBaE4weM90pY7SFGn4en9UQT4
SDpOZrDnos4tlGDL7aKQUkUCW7c+NsMlyaxLRMiFuWsLjFPe4Q0QuUmuZ/XFlqccV4c5lOihEr1l
2bivCCi9dp6/HFxsmjLtIqwwsG+7Erm9BofTUBfW0ND2sPuYwrrol8EUra+XDEh5mS1mqnBpwC0Z
q95tofu9qFya7pl952Xhg/9KMluUk0esKRwTRoJvcFpVCicZBWbNXaV4+YAH/vWVoZOT1OElzd7/
Z+LxCTKNlR2gKnvlYIPxKpR+9wi5OAOJiycoVnWhCYXSCfBvtnLB8qPPKeWgP+Qn/gMROvVxb9dd
Vz4wFPOIDBZbKX04eQidpMJFu0sd+Ntq1RDdocwA7Lv0XGVFPEYn3uRDVve23hzKl7q7jPXtrh18
rWDuTeMgdtWwxrtUAktMG095GNUNEBlKG/SR9cc8nfL/VILu02hIqifZCoB2Oh48nqwyMMIPRw9o
9yU/ye5t5tGonUs870yaMEpHlLc5wWRXD/1+qQeqDaOTBq9ypnyzNwcqqTURvzP5LSdwV9uAcgHQ
CyReIISzCYySAJuhjHc9wqVGgmBz6UO6Y1WsvE9yVs8WEEU4iUQht9I1ZyuLxSfbiR451Ss36r74
AFUx/FxvWHWTcYIbsCVWMkX8Jb39GS0zCHTMOtOGKWpopKeYURt3wfJHRAC6j4FQKjqztwhT57Pd
7e6aKioWfjw8P7IXAC+vFTgTXCJHm/uqeojpXHK8dYj80+hqmsJWF9nIbFq7QQPN0bvqeWlSQ+iz
ATntRhiZSpDKJ86IQ8P+ZH4zVaC2NDK5JDhh+/0LRs2pu0H7ZiCxX/Y/xPIyXImh/SbSodOiZKPH
G+BIHJvv5nTfM94LQmwCRBtXFB5HGFx8hRafMxwXS1MjsEs7+itplq4FL7eAG5VwDDNbagzAbsUq
sKy4/8vY1yE7Lniqb0olL+ds7SnxOsXxT1B4apvAlE6h9prN5rsPptTC7T8kdAZGRd+BpVk/R39u
vNSzjzPW+yNOiWUnQq0qajE4v6DG5RBbF/KBh6+9YReqwhQrz5AR8whtQhAFLIwVnHgLOGsokPGL
ha2GSEzBL6zm9/sHIPjRDKWQptdkO3gi/b9PngFSKxX38B2sndtxjBIH4zZn7+8ouNDzztI5TOr3
3nXTkcIo7ElOleybNbXTfhFLzJwudGQAaEjUJTTt2QVMCgdKI8JGRQpS2/mcGvr7bdPGmNGC6HFz
Q+nDHf/4SXvEfQe2BNZt13KBsuSJqzyYHKDOfNywwtcGKA3B3XHjE/CGVFB9PVQlGgIQ3I0+6JOB
Rs1lIwBpW1aGhacHPtHCIU9GHumUoukHJ8ePOK1hSqU/gxu9RKW47gGhD47Xl/fDflXopJ2S+a+l
+NZLYjCs0znf1bIoP5GcNIpKfZnTQHeF7uIuH1ZVsutMPDaQnX0yyMypMcx3tOmKWOcR1oxoXAZb
5aCS0EvJ9ojMOraMSnvP3VQtmv7BBDHEr+r7lM7OqSc6xk7UeO/19QxEyaTO9XtO/p81HoTEjTQb
F5TiIJ2ZVS7DZ9NJ+79EnXqwg8Yx141IaVN3gs6JjZUq7/9EUNRP/QUO9eGNvopNUcDMAd5haRlC
+dEAzJ6HgkJIgv+4zFlACZZV8V+GyaeyWoDdVgIX1i7x8hKyo0uFK7Dx2fdmnZN7eLlVh8xLUEfl
Z+7Hv/xzlwBA0IsxrcD5n4SB5A03ZSC52Wox/zULwxFe59RCbKzWrd4cp+BQzJC4RlINGmy0kc0G
fnDK1PHZnBhdL6gqfRQ75tOaO2QZ5Iz/UhKMB2D9QCP5FScPnDG4keF2qe85NU6fisjLdQh8cJMX
OOqUmQLvtfiq6kHhTsUdmNHHdWuCqMWBv7i/VFVpgEHBe6XfqAfAqIRcUaAmlqQDYvWkb6JtG3H9
HcrQKITY+kuxbPzDRTsAmr1guPdmIGk1N2p9xRBn3YzQMN3y5ixSyZciO+KwyaJ8Vn/0OqXdO/+9
ly7rQBYqMiq2gh0JmjxdWeB643dT+MLSZaQ+vXoGlm9Itmgq9qM0CQglJXNhaHeCZMBnp0gS9tau
d+QNXUQgu3NRmRouEu+NX8DZNY8KTgkAgGbYdi8dURUJRw2IvtxNuTHE6HUc+MxfM3MrgPao89PK
6isrxL6mDtbBeMHsztKdbYfbhS/JA0OPlvxXKxdX/c5phZDB1zu0DnQpviHzbTFOt2cl24BRr6LW
lkEWHQOWL+bILZE6b2yaTKUpjo0sPaCU6Iar3XzZlBzxK/0KRWDBA2o18RCCAPhWgsMUE3sl4c/K
5TnLQ2mkFrWAtGUvVoXfrTeXTpt50f6eb5dMVw9qcGdxgWVm6L/6xXrKsWKspbz2eocD5EwDg4X5
GQsGJFULLE1jcjO12qniwLJSpJ2kkgNQtbgRTIQrZYp21zBV4F6pwJcP8J2AfAYyuRs12h8cpuzv
/6N5REMAa6eXZgrrgwRZNM8EdlsvKKMLh81GdU2vYvymIyeSDRNfKN6hSVW4RmErVEtNMKonKByp
isy7AA3GdcBZPTF4tWWe+EkuLI8c6EXVkEE4XGDX5G29OKENCzT1kdK7QzlSgnphFxXRuQ/hOaKT
QQIqEpE1HpJ8D3vLwejCAS3HraD2UwXg9Aw3XKie627lZGG107OHTS6erWWEs6oXbkJ8RC0ztnq6
tIoKDHNOrDGo3GJwTZBSvd13rzW4dFFMXaUj0YeiFQ4HayX9KQL2A7N5F0/Qw7gSnFaXURsMxWmW
m5RACmMU2RD2Y10o7JmVPEtwbogJoKmO1j/08rAe5dpDp1GKEE3PObCK91urV8V3cdzEvDjluQRH
Clp6WCAa74KjBWfjFiiAZezZfcMf24fSQcEZXBlB6PssyRmQeXp4eiG3VwwNLGiQr53UM6uV67WV
h4hPAdwnQxhk9R61uySWWgiMMHBDtaP3SlnujH5dyLCFNln2viwMYSlTuPTQOr+2cLWlSH04qbsR
DsOJw+ZRMYZowKt1uClDe9yWg5Dvaokr9jLEgzKTLMigbNvd2TGf3W5g416jQx/6S8Vw6XfJ6XRs
qCq4gN8PBA+TriOU0gRqiVhvJvMx9YK5gQRfxnqleP3clcsVKBYswxug6wdaZN7lD1C3d3LhjFP1
zh4IyBOvDwDKcW/FRA9jUybJvamwp+/a6b1lZ5QuHBDupgFKc52LmWhso2hImWZt1BCgR5ShtwI4
DEg6F/CNVZn1bD+/yY8fuUSArW7sWRDO/QJer17slrF1pszbQigh0y4qKfCKZC2SeUso9hoZBPjx
WeOJLJ54dsKMFq8qC5fC6H/vI+e39OTI6EvDxd4sSJtlDh6wmJYHWAk2JTJvNSAF5KiFwQnG9+Pq
HIcUMjHfTBwTKDNcKcHeaJG85PIMSHlAkgBarw3ZcUAQyitAtWx6hPAxdELzMysHv/a7th5ryk6c
7H9u/8ZoFt6Ome7MuIckULs6Vv1MqC/qiPrR3u3DhJ2ndTakqkw48SuHCKC7cK5epUIdbfpzPI7A
RUaf2T/R7JG7mgDQT6lnCdSEFJTP11JG+ii0woxbEGaE5eMVRLZRwltH9zBa+eLQrHRTuqaSWfVu
JZJdjOtYRWDgn6KLpxlAL6Mxmtm3s3S6UDECZQOJYV031x3PVUX//dYUmTmNj277XVIcOuBSIyGw
4wLKgHg4sK3+/8jvTk7G4UEKzrJFUcRPr53ix0Lko9wAFVPx64gybwtzyx+T6eb4UVKZo8bDAibG
yTXnlq6rRkaSYeMekGEspEOPiDQ3kH8T/l74HW1aTUi2VhrDetZ5GWJjU/FRUsj7SGCSjQo5Kmk4
fq5KufRywVHy++g9ru9klpSN6dPUutb0D7ZPmkbWyqAerUGWHtrYRjhatQMsG9rJ+MnPZtkl9wem
thOaFiSlZSA7N9888Tm8OZilFOnA6ebVvLmS18db8CtkFWUGMFiRkj0yIgGi/SXaOwX3joFQjeo1
8qBAjhGwJ1rcpTYROaOl2fQmILgfpbzcdelsWOOl4tBqevEVHaUu0ivEQhls5WYI+xZIuJayZWoR
EGVB/sBU7SbUpcMvJh7rhPbQs5Si5jwJGR2mZwPUfLoAHZQ88eG8ph7O1un+sjs/LtOBTPkt11wb
qh3Gsby0YHtwb/gz/pkmYHqBloR6k3lYtPglJtgK73drv3d61i0Hn283dkj1UN/zHf3uHrK7MpD9
7t1Ha68H0Wy407RyDzyh6vfMZWx9CUZd8FjkRIrkvJCpoduhVMB2fS2sPCQm9duyJbzhH9uUA689
6PIFL2rOA0R1r+4KjJ9hc8RpRNfD87Ft0sZ5SIAucAQfNtVRBez5/a1XUAkaoaxO4APDAROovenq
DyEDOeI94q9szd6SKKQwYqj+x7c6mXrt0V30aD+KF29UjWIacPItFz+a9OcON35vuMdgXFyzCP5c
prMPDr4KBlDCPzVw+cH7KdbriJqnQXBWtmSNVFSoILUz8gOH+Y7Kq5L7/1a1aNfBvLXBjowIKTFz
r/YN9awQZLcgr0N3E5Q+y1UdY7/oxK9miK1qpbg+tKanJFHf5cWEWhWhUybnxhxEZcxwlGe/8nGR
0B2DYu2KP70/vX2JCRPQNLs7ugaFDjIFo6vk7rhPXiwj0unJnmPv/hPW2USPqpEHTjBz2odGJq9i
bGYCnkNm6hHpxZNsvVz4LvXmAeTElo6tui9cOUAWRs0gg3ZLdxBAY+/DkVn8UDNVBFfJlwiQDdl8
HuC5SjBO9AaU/94i7Y8Fc8rBGHI5jCqpjWXZQDWSJljXqvxn7KPBV6pY2y+WN2HSdtxrlXAmXxFX
E0LzocEPebf2HrZN8AOqOUTKu0W+SxORKuowdMipv/yGHaLrwpDdejbP1SFGHaBJfdHaoymaRirB
b7xu6sbJy5FfU2tp1nBIC2QXSEGefVJ361EBc05LtpM3XTuc6n3I3HLiP7fq1X/+ADfZ+HE4Dk7F
yzAJV14uNx847RULURtAlhfX9x0MhHJCr+QlWJOeamJbbLlm7C/Xp7ws8g3XnLkr9eWpZNlnygoq
cd+RUhoFmja2XMBYlAVoUrRp3BbpLirKAJMG0+F7YQhQMLyQbU7iojCa71PBsUpINvJp0AX0f5Eo
QxcTbfAlPYeY0DWm6gHeAUfKog4G0ObFx/f91760Vwlg0hQOXjf1pAG9DREn5sFZpxNcWKngv1WA
FtwMwUV624QzJ+TD2tGnF3mKM4lhPbWppOLuKVUcLMuwyV+Ahq1Dvj584Z8qY2pgpmlRvWiqINsV
R5G9jw5BHsBLRDKvB4ZlpxE6sHXEKSEmexTil3ClY9P30SqOjuWN5+yNhOMkm3ijBRH4hEqQYDAn
jZ2LmRFYJlNVSfGzze8jASMw6NAuaFZ5rbkroV2DqqeFopp+GAm2UJmoP2T2TASgU5IYDyv59SvP
w6/MSnqTZso91QrQ8Kh+p5IzEMgoGXh/WnHSTdUAXsxGaHXI41DOLGctk85dKidv8ce2Va5tgwKH
HKLfonOtBuWM6fLiHDsOnHGHDygGGShTbXor58lB/VHVg36FXHG9Fp7nfpMqVLHVg1LW0YDYDL/Y
r86QTPEYUfBH3CXvbM9jcQk7Q3AjMTPVN5IcDb6vaR3yll2QNoUvSA2vI1T7jBeoAt2aNo/U5hNh
rf62LigRgyDHiG0mCygNNkC0AjyMqzeiI4SGvzjcmpeAV2BJrbNVHP52FW/PHxGdR2gsV99mJxDc
BzM/aE3SdgbXyY42/+sCuO8m1DN0tV0Q7Bthgc81AlG13TOHVw0ZNFPMWdcVCgx7nztarAsKL2Ko
oUazh+LP/NLhJnOSEdgrRK30uDAP1Pu+Ve3b1T1xGBjb3lFc9qpvRiDPEm7sM2kVkK0Dls+JNcGh
QvTH36kLuL9SfQNsQ9Vnzr32Bi8XmwEgwqXIxeo65rWuTyCQEkrsEm7Tflx8TuDdNL2kPa5U1ixP
UEjtxbZhlDTR/tdot/TUD7/n+EQAgB/ab5c2n9UqydERG3AxGMqUEqe/0g8Mp93iQkxmVisaP5Ir
UFxHFmI0K/RyMO0mf4kGiHkRZQT2FuAauaw2Xj2TGfaSP01FTCtxcUu3XzikmSlDVEQ/KlX7nWfR
wr9GF40V5ZN0QNNH+8xK892YN1bN1gYby5Zu6fxTIogwE25uDPF4x7ItVPu3ciOVTxqYYitCrbvg
UTO5cDNQvNGsxv0RaML8hLHZVzWVgUAJ7w==
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
