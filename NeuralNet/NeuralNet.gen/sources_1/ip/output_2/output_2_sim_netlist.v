// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Apr 17 09:51:45 2023
// Host        : crisLaptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top output_2 -prefix
//               output_2_ ouput_1a_sim_netlist.v
// Design      : ouput_1a
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ouput_1a,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module output_2
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
  output_2_blk_mem_gen_v8_4_5 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27312)
`pragma protect data_block
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
lKU7vzmAo+EV
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
