// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Apr 17 09:51:45 2023
// Host        : crisLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top output_1a -prefix
//               output_1a_ ouput_1a_sim_netlist.v
// Design      : ouput_1a
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ouput_1a,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module output_1a
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
  output_1a_blk_mem_gen_v8_4_5 U0
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
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
dgxXQejBha3adSZl/kJAgaSxeIwGlQGT+Q==
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
