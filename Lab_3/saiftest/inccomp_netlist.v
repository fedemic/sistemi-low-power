
module inccomp ( C, ck, rst, INCA, INCB );
  output [7:0] C;
  input ck, rst, INCA, INCB;
  wire   N8, N9, N10, N11, N12, N13, N14, N15, N33, N34, N35, N36, N37, N38,
         N39, N40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n66, n67,
         n68, n69, n70, n71, n72, n73, lt_gt_38_B_0_, lt_gt_38_B_1_,
         lt_gt_38_B_2_, lt_gt_38_B_3_, lt_gt_38_B_4_, lt_gt_38_B_5_,
         lt_gt_38_B_6_, lt_gt_38_B_7_, lt_gt_38_A_0_, lt_gt_38_A_1_,
         lt_gt_38_A_2_, lt_gt_38_A_3_, lt_gt_38_A_4_, lt_gt_38_A_5_,
         lt_gt_38_A_6_, lt_gt_38_A_7_, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135;
  wire   [7:0] syncha;
  wire   [7:0] synchb;
  wire   [7:2] r68_carry;
  wire   [7:2] r67_carry;

  DFFR_X1 syncha_reg_0_ ( .D(lt_gt_38_B_0_), .CK(ck), .RN(n135), .Q(syncha[0]), 
        .QN(n64) );
  DFFR_X1 syncha_reg_1_ ( .D(lt_gt_38_B_1_), .CK(ck), .RN(n135), .Q(syncha[1]), 
        .QN(n63) );
  DFFR_X1 syncha_reg_2_ ( .D(lt_gt_38_B_2_), .CK(ck), .RN(n135), .Q(syncha[2]), 
        .QN(n62) );
  DFFR_X1 syncha_reg_3_ ( .D(lt_gt_38_B_3_), .CK(ck), .RN(n135), .Q(syncha[3]), 
        .QN(n61) );
  DFFR_X1 syncha_reg_4_ ( .D(lt_gt_38_B_4_), .CK(ck), .RN(n135), .Q(syncha[4]), 
        .QN(n60) );
  DFFR_X1 syncha_reg_5_ ( .D(lt_gt_38_B_5_), .CK(ck), .RN(n135), .Q(syncha[5]), 
        .QN(n59) );
  DFFR_X1 syncha_reg_6_ ( .D(lt_gt_38_B_6_), .CK(ck), .RN(n135), .Q(syncha[6]), 
        .QN(n58) );
  DFFR_X1 syncha_reg_7_ ( .D(lt_gt_38_B_7_), .CK(ck), .RN(n135), .Q(syncha[7]), 
        .QN(n57) );
  DFFR_X1 synchb_reg_0_ ( .D(lt_gt_38_A_0_), .CK(ck), .RN(n135), .Q(synchb[0]), 
        .QN(n56) );
  DFFR_X1 synchb_reg_1_ ( .D(lt_gt_38_A_1_), .CK(ck), .RN(n135), .Q(synchb[1]), 
        .QN(n55) );
  DFFR_X1 synchb_reg_2_ ( .D(lt_gt_38_A_2_), .CK(ck), .RN(n135), .Q(synchb[2]), 
        .QN(n54) );
  DFFR_X1 synchb_reg_3_ ( .D(lt_gt_38_A_3_), .CK(ck), .RN(n135), .Q(synchb[3]), 
        .QN(n53) );
  DFFR_X1 synchb_reg_4_ ( .D(lt_gt_38_A_4_), .CK(ck), .RN(n135), .Q(synchb[4]), 
        .QN(n52) );
  DFFR_X1 synchb_reg_5_ ( .D(lt_gt_38_A_5_), .CK(ck), .RN(n135), .Q(synchb[5]), 
        .QN(n51) );
  DFFR_X1 synchb_reg_6_ ( .D(lt_gt_38_A_6_), .CK(ck), .RN(n135), .Q(synchb[6]), 
        .QN(n50) );
  DFFR_X1 synchb_reg_7_ ( .D(lt_gt_38_A_7_), .CK(ck), .RN(n135), .Q(synchb[7]), 
        .QN(n49) );
  DFFR_X1 C_reg_7_ ( .D(n73), .CK(ck), .RN(n135), .Q(C[7]), .QN(n48) );
  DFFR_X1 C_reg_6_ ( .D(n72), .CK(ck), .RN(n135), .Q(C[6]), .QN(n47) );
  DFFR_X1 C_reg_5_ ( .D(n71), .CK(ck), .RN(n135), .Q(C[5]), .QN(n46) );
  DFFR_X1 C_reg_4_ ( .D(n70), .CK(ck), .RN(n135), .Q(C[4]), .QN(n45) );
  DFFR_X1 C_reg_3_ ( .D(n69), .CK(ck), .RN(n135), .Q(C[3]), .QN(n44) );
  DFFR_X1 C_reg_2_ ( .D(n68), .CK(ck), .RN(n135), .Q(C[2]), .QN(n43) );
  DFFR_X1 C_reg_1_ ( .D(n67), .CK(ck), .RN(n135), .Q(C[1]), .QN(n42) );
  DFFR_X1 C_reg_0_ ( .D(n66), .CK(ck), .RN(n135), .Q(C[0]), .QN(n41) );
  INV_X1 U66 ( .A(rst), .ZN(n135) );
  OAI222_X1 U67 ( .A1(n90), .A2(n91), .B1(n92), .B2(n93), .C1(n48), .C2(n94), 
        .ZN(n73) );
  OAI222_X1 U68 ( .A1(n95), .A2(n91), .B1(n96), .B2(n93), .C1(n47), .C2(n94), 
        .ZN(n72) );
  OAI222_X1 U69 ( .A1(n97), .A2(n91), .B1(n98), .B2(n93), .C1(n46), .C2(n94), 
        .ZN(n71) );
  OAI222_X1 U70 ( .A1(n99), .A2(n91), .B1(n100), .B2(n93), .C1(n45), .C2(n94), 
        .ZN(n70) );
  OAI222_X1 U71 ( .A1(n101), .A2(n91), .B1(n102), .B2(n93), .C1(n44), .C2(n94), 
        .ZN(n69) );
  OAI222_X1 U72 ( .A1(n103), .A2(n91), .B1(n104), .B2(n93), .C1(n43), .C2(n94), 
        .ZN(n68) );
  OAI222_X1 U73 ( .A1(n105), .A2(n91), .B1(n106), .B2(n93), .C1(n42), .C2(n94), 
        .ZN(n67) );
  OAI222_X1 U74 ( .A1(n107), .A2(n91), .B1(n108), .B2(n93), .C1(n41), .C2(n94), 
        .ZN(n66) );
  OAI211_X1 U75 ( .C1(lt_gt_38_B_7_), .C2(n92), .A(n109), .B(n94), .ZN(n93) );
  NAND2_X1 U76 ( .A1(n94), .A2(n110), .ZN(n91) );
  OAI21_X1 U77 ( .B1(lt_gt_38_B_7_), .B2(n92), .A(n109), .ZN(n110) );
  OAI221_X1 U78 ( .B1(lt_gt_38_B_6_), .B2(n96), .C1(lt_gt_38_A_7_), .C2(n90), 
        .A(n111), .ZN(n109) );
  OAI21_X1 U79 ( .B1(lt_gt_38_A_6_), .B2(n95), .A(n112), .ZN(n111) );
  OAI21_X1 U80 ( .B1(lt_gt_38_B_5_), .B2(n98), .A(n113), .ZN(n112) );
  OAI221_X1 U81 ( .B1(lt_gt_38_A_5_), .B2(n97), .C1(lt_gt_38_A_4_), .C2(n99), 
        .A(n114), .ZN(n113) );
  OAI221_X1 U82 ( .B1(lt_gt_38_B_4_), .B2(n100), .C1(lt_gt_38_B_3_), .C2(n102), 
        .A(n115), .ZN(n114) );
  OAI221_X1 U83 ( .B1(lt_gt_38_A_3_), .B2(n101), .C1(lt_gt_38_A_2_), .C2(n103), 
        .A(n116), .ZN(n115) );
  OAI221_X1 U84 ( .B1(n117), .B2(lt_gt_38_B_1_), .C1(lt_gt_38_B_2_), .C2(n104), 
        .A(n118), .ZN(n116) );
  OAI21_X1 U85 ( .B1(lt_gt_38_A_0_), .B2(n107), .A(lt_gt_38_A_1_), .ZN(n118)
         );
  NOR3_X1 U86 ( .A1(n107), .A2(lt_gt_38_A_0_), .A3(lt_gt_38_A_1_), .ZN(n117)
         );
  OR2_X1 U87 ( .A1(INCB), .A2(INCA), .ZN(n94) );
  INV_X1 U88 ( .A(n90), .ZN(lt_gt_38_B_7_) );
  MUX2_X1 U89 ( .A(n57), .B(n119), .S(INCA), .Z(n90) );
  INV_X1 U90 ( .A(N15), .ZN(n119) );
  INV_X1 U91 ( .A(n95), .ZN(lt_gt_38_B_6_) );
  MUX2_X1 U92 ( .A(n58), .B(n120), .S(INCA), .Z(n95) );
  INV_X1 U93 ( .A(N14), .ZN(n120) );
  INV_X1 U94 ( .A(n97), .ZN(lt_gt_38_B_5_) );
  MUX2_X1 U95 ( .A(n59), .B(n121), .S(INCA), .Z(n97) );
  INV_X1 U96 ( .A(N13), .ZN(n121) );
  INV_X1 U97 ( .A(n99), .ZN(lt_gt_38_B_4_) );
  MUX2_X1 U98 ( .A(n60), .B(n122), .S(INCA), .Z(n99) );
  INV_X1 U99 ( .A(N12), .ZN(n122) );
  INV_X1 U100 ( .A(n101), .ZN(lt_gt_38_B_3_) );
  MUX2_X1 U101 ( .A(n61), .B(n123), .S(INCA), .Z(n101) );
  INV_X1 U102 ( .A(N11), .ZN(n123) );
  INV_X1 U103 ( .A(n103), .ZN(lt_gt_38_B_2_) );
  MUX2_X1 U104 ( .A(n62), .B(n124), .S(INCA), .Z(n103) );
  INV_X1 U105 ( .A(N10), .ZN(n124) );
  INV_X1 U106 ( .A(n105), .ZN(lt_gt_38_B_1_) );
  MUX2_X1 U107 ( .A(n63), .B(n125), .S(INCA), .Z(n105) );
  INV_X1 U108 ( .A(N9), .ZN(n125) );
  INV_X1 U109 ( .A(n107), .ZN(lt_gt_38_B_0_) );
  MUX2_X1 U110 ( .A(n64), .B(n126), .S(INCA), .Z(n107) );
  INV_X1 U111 ( .A(N8), .ZN(n126) );
  INV_X1 U112 ( .A(n92), .ZN(lt_gt_38_A_7_) );
  MUX2_X1 U113 ( .A(n49), .B(n127), .S(INCB), .Z(n92) );
  INV_X1 U114 ( .A(N40), .ZN(n127) );
  INV_X1 U115 ( .A(n96), .ZN(lt_gt_38_A_6_) );
  MUX2_X1 U116 ( .A(n50), .B(n128), .S(INCB), .Z(n96) );
  INV_X1 U117 ( .A(N39), .ZN(n128) );
  INV_X1 U118 ( .A(n98), .ZN(lt_gt_38_A_5_) );
  MUX2_X1 U119 ( .A(n51), .B(n129), .S(INCB), .Z(n98) );
  INV_X1 U120 ( .A(N38), .ZN(n129) );
  INV_X1 U121 ( .A(n100), .ZN(lt_gt_38_A_4_) );
  MUX2_X1 U122 ( .A(n52), .B(n130), .S(INCB), .Z(n100) );
  INV_X1 U123 ( .A(N37), .ZN(n130) );
  INV_X1 U124 ( .A(n102), .ZN(lt_gt_38_A_3_) );
  MUX2_X1 U125 ( .A(n53), .B(n131), .S(INCB), .Z(n102) );
  INV_X1 U126 ( .A(N36), .ZN(n131) );
  INV_X1 U127 ( .A(n104), .ZN(lt_gt_38_A_2_) );
  MUX2_X1 U128 ( .A(n54), .B(n132), .S(INCB), .Z(n104) );
  INV_X1 U129 ( .A(N35), .ZN(n132) );
  INV_X1 U130 ( .A(n106), .ZN(lt_gt_38_A_1_) );
  MUX2_X1 U131 ( .A(n55), .B(n133), .S(INCB), .Z(n106) );
  INV_X1 U132 ( .A(N34), .ZN(n133) );
  INV_X1 U133 ( .A(n108), .ZN(lt_gt_38_A_0_) );
  MUX2_X1 U134 ( .A(n56), .B(n134), .S(INCB), .Z(n108) );
  INV_X1 U135 ( .A(N33), .ZN(n134) );
  XOR2_X1 r68_U2 ( .A(r68_carry[7]), .B(synchb[7]), .Z(N40) );
  INV_X1 r68_U1 ( .A(synchb[0]), .ZN(N33) );
  HA_X1 r68_U1_1_1 ( .A(synchb[1]), .B(synchb[0]), .CO(r68_carry[2]), .S(N34)
         );
  HA_X1 r68_U1_1_2 ( .A(synchb[2]), .B(r68_carry[2]), .CO(r68_carry[3]), .S(
        N35) );
  HA_X1 r68_U1_1_3 ( .A(synchb[3]), .B(r68_carry[3]), .CO(r68_carry[4]), .S(
        N36) );
  HA_X1 r68_U1_1_4 ( .A(synchb[4]), .B(r68_carry[4]), .CO(r68_carry[5]), .S(
        N37) );
  HA_X1 r68_U1_1_5 ( .A(synchb[5]), .B(r68_carry[5]), .CO(r68_carry[6]), .S(
        N38) );
  HA_X1 r68_U1_1_6 ( .A(synchb[6]), .B(r68_carry[6]), .CO(r68_carry[7]), .S(
        N39) );
  XOR2_X1 r67_U2 ( .A(r67_carry[7]), .B(syncha[7]), .Z(N15) );
  INV_X1 r67_U1 ( .A(syncha[0]), .ZN(N8) );
  HA_X1 r67_U1_1_1 ( .A(syncha[1]), .B(syncha[0]), .CO(r67_carry[2]), .S(N9)
         );
  HA_X1 r67_U1_1_2 ( .A(syncha[2]), .B(r67_carry[2]), .CO(r67_carry[3]), .S(
        N10) );
  HA_X1 r67_U1_1_3 ( .A(syncha[3]), .B(r67_carry[3]), .CO(r67_carry[4]), .S(
        N11) );
  HA_X1 r67_U1_1_4 ( .A(syncha[4]), .B(r67_carry[4]), .CO(r67_carry[5]), .S(
        N12) );
  HA_X1 r67_U1_1_5 ( .A(syncha[5]), .B(r67_carry[5]), .CO(r67_carry[6]), .S(
        N13) );
  HA_X1 r67_U1_1_6 ( .A(syncha[6]), .B(r67_carry[6]), .CO(r67_carry[7]), .S(
        N14) );
endmodule

