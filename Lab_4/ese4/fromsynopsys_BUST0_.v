
module T0beh ( ck, rst, A, B, C );
  input [7:0] A;
  output [8:0] B;
  output [7:0] C;
  input ck, rst;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N16, N17, N18, N19, N20, N21,
         N22, n21, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58;
  wire   [7:0] AOLD;
  wire   [7:2] add_48_carry;
  wire   [7:2] add_27_carry;

  DFFR_X1 AOLD_reg_7_ ( .D(A[7]), .CK(ck), .RN(n58), .Q(AOLD[7]) );
  DFFR_X1 AOLD_reg_6_ ( .D(A[6]), .CK(ck), .RN(n58), .Q(AOLD[6]) );
  DFFR_X1 AOLD_reg_5_ ( .D(A[5]), .CK(ck), .RN(n58), .Q(AOLD[5]) );
  DFFR_X1 AOLD_reg_4_ ( .D(A[4]), .CK(ck), .RN(n58), .Q(AOLD[4]) );
  DFFR_X1 AOLD_reg_3_ ( .D(A[3]), .CK(ck), .RN(n58), .Q(AOLD[3]) );
  DFFR_X1 AOLD_reg_2_ ( .D(A[2]), .CK(ck), .RN(n58), .Q(AOLD[2]) );
  DFFR_X1 AOLD_reg_1_ ( .D(A[1]), .CK(ck), .RN(n58), .Q(AOLD[1]) );
  DFFR_X1 AOLD_reg_0_ ( .D(A[0]), .CK(ck), .RN(n58), .Q(AOLD[0]) );
  DFFR_X1 seq_reg ( .D(N10), .CK(ck), .RN(n58), .Q(B[8]), .QN(n21) );
  DFFR_X1 C_tmp_reg_0_ ( .D(n46), .CK(ck), .RN(n58), .Q(C[0]), .QN(n57) );
  DFFR_X1 C_tmp_reg_1_ ( .D(n45), .CK(ck), .RN(n58), .Q(C[1]) );
  DFFR_X1 C_tmp_reg_2_ ( .D(n44), .CK(ck), .RN(n58), .Q(C[2]) );
  DFFR_X1 C_tmp_reg_3_ ( .D(n43), .CK(ck), .RN(n58), .Q(C[3]) );
  DFFR_X1 C_tmp_reg_4_ ( .D(n42), .CK(ck), .RN(n58), .Q(C[4]) );
  DFFR_X1 C_tmp_reg_5_ ( .D(n41), .CK(ck), .RN(n58), .Q(C[5]) );
  DFFR_X1 C_tmp_reg_6_ ( .D(n40), .CK(ck), .RN(n58), .Q(C[6]) );
  DFFR_X1 C_tmp_reg_7_ ( .D(n39), .CK(ck), .RN(n58), .Q(C[7]) );
  DFFR_X1 buss_reg_0_ ( .D(n38), .CK(ck), .RN(n58), .Q(B[0]) );
  DFFR_X1 buss_reg_1_ ( .D(n37), .CK(ck), .RN(n58), .Q(B[1]) );
  DFFR_X1 buss_reg_2_ ( .D(n36), .CK(ck), .RN(n58), .Q(B[2]) );
  DFFR_X1 buss_reg_3_ ( .D(n35), .CK(ck), .RN(n58), .Q(B[3]) );
  DFFR_X1 buss_reg_4_ ( .D(n34), .CK(ck), .RN(n58), .Q(B[4]) );
  DFFR_X1 buss_reg_5_ ( .D(n33), .CK(ck), .RN(n58), .Q(B[5]) );
  DFFR_X1 buss_reg_6_ ( .D(n32), .CK(ck), .RN(n58), .Q(B[6]) );
  DFFR_X1 buss_reg_7_ ( .D(n31), .CK(ck), .RN(n58), .Q(B[7]) );
  INV_X2 U39 ( .A(rst), .ZN(n58) );
  MUX2_X1 U40 ( .A(n57), .B(B[0]), .S(n21), .Z(n46) );
  MUX2_X1 U41 ( .A(N16), .B(B[1]), .S(n21), .Z(n45) );
  MUX2_X1 U42 ( .A(N17), .B(B[2]), .S(n21), .Z(n44) );
  MUX2_X1 U43 ( .A(N18), .B(B[3]), .S(n21), .Z(n43) );
  MUX2_X1 U44 ( .A(N19), .B(B[4]), .S(n21), .Z(n42) );
  MUX2_X1 U45 ( .A(N20), .B(B[5]), .S(n21), .Z(n41) );
  MUX2_X1 U46 ( .A(N21), .B(B[6]), .S(n21), .Z(n40) );
  MUX2_X1 U47 ( .A(N22), .B(B[7]), .S(n21), .Z(n39) );
  MUX2_X1 U48 ( .A(A[0]), .B(B[0]), .S(N10), .Z(n38) );
  MUX2_X1 U49 ( .A(A[1]), .B(B[1]), .S(N10), .Z(n37) );
  MUX2_X1 U50 ( .A(A[2]), .B(B[2]), .S(N10), .Z(n36) );
  MUX2_X1 U51 ( .A(A[3]), .B(B[3]), .S(N10), .Z(n35) );
  MUX2_X1 U52 ( .A(A[4]), .B(B[4]), .S(N10), .Z(n34) );
  MUX2_X1 U53 ( .A(A[5]), .B(B[5]), .S(N10), .Z(n33) );
  MUX2_X1 U54 ( .A(A[6]), .B(B[6]), .S(N10), .Z(n32) );
  MUX2_X1 U55 ( .A(A[7]), .B(B[7]), .S(N10), .Z(n31) );
  AND2_X1 U56 ( .A1(n47), .A2(n48), .ZN(N10) );
  NOR4_X1 U57 ( .A1(n49), .A2(n50), .A3(n51), .A4(n52), .ZN(n48) );
  XOR2_X1 U58 ( .A(N9), .B(A[7]), .Z(n52) );
  XOR2_X1 U59 ( .A(N4), .B(A[2]), .Z(n51) );
  XOR2_X1 U60 ( .A(N3), .B(A[1]), .Z(n50) );
  XOR2_X1 U61 ( .A(N2), .B(A[0]), .Z(n49) );
  NOR4_X1 U62 ( .A1(n53), .A2(n54), .A3(n55), .A4(n56), .ZN(n47) );
  XOR2_X1 U63 ( .A(N8), .B(A[6]), .Z(n56) );
  XOR2_X1 U64 ( .A(N7), .B(A[5]), .Z(n55) );
  XOR2_X1 U65 ( .A(N6), .B(A[4]), .Z(n54) );
  XOR2_X1 U66 ( .A(N5), .B(A[3]), .Z(n53) );
  XOR2_X1 add_48_U1 ( .A(add_48_carry[7]), .B(C[7]), .Z(N22) );
  HA_X1 add_48_U1_1_1 ( .A(C[1]), .B(C[0]), .CO(add_48_carry[2]), .S(N16) );
  HA_X1 add_48_U1_1_2 ( .A(C[2]), .B(add_48_carry[2]), .CO(add_48_carry[3]), 
        .S(N17) );
  HA_X1 add_48_U1_1_3 ( .A(C[3]), .B(add_48_carry[3]), .CO(add_48_carry[4]), 
        .S(N18) );
  HA_X1 add_48_U1_1_4 ( .A(C[4]), .B(add_48_carry[4]), .CO(add_48_carry[5]), 
        .S(N19) );
  HA_X1 add_48_U1_1_5 ( .A(C[5]), .B(add_48_carry[5]), .CO(add_48_carry[6]), 
        .S(N20) );
  HA_X1 add_48_U1_1_6 ( .A(C[6]), .B(add_48_carry[6]), .CO(add_48_carry[7]), 
        .S(N21) );
  XOR2_X1 add_27_U2 ( .A(add_27_carry[7]), .B(AOLD[7]), .Z(N9) );
  INV_X1 add_27_U1 ( .A(AOLD[0]), .ZN(N2) );
  HA_X1 add_27_U1_1_1 ( .A(AOLD[1]), .B(AOLD[0]), .CO(add_27_carry[2]), .S(N3)
         );
  HA_X1 add_27_U1_1_2 ( .A(AOLD[2]), .B(add_27_carry[2]), .CO(add_27_carry[3]), 
        .S(N4) );
  HA_X1 add_27_U1_1_3 ( .A(AOLD[3]), .B(add_27_carry[3]), .CO(add_27_carry[4]), 
        .S(N5) );
  HA_X1 add_27_U1_1_4 ( .A(AOLD[4]), .B(add_27_carry[4]), .CO(add_27_carry[5]), 
        .S(N6) );
  HA_X1 add_27_U1_1_5 ( .A(AOLD[5]), .B(add_27_carry[5]), .CO(add_27_carry[6]), 
        .S(N7) );
  HA_X1 add_27_U1_1_6 ( .A(AOLD[6]), .B(add_27_carry[6]), .CO(add_27_carry[7]), 
        .S(N8) );
endmodule

