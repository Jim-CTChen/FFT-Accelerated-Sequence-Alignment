/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Thu Sep 15 00:37:00 2022
/////////////////////////////////////////////////////////////


module FFT_8_DATA_WIDTH14_DW01_add_0 ( A, B, SUM );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  wire   n1;
  wire   [13:2] carry;

  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .S(SUM[13]) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM[12]) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM[11]) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM[10]) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM[8]) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  XOR2_X0P7M_A9TL U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2_X1B_A9TL U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
endmodule


module FFT_8_DATA_WIDTH14_DW01_add_1 ( A, B, SUM );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  wire   n1;
  wire   [13:2] carry;

  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .S(SUM[13]) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM[12]) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM[11]) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM[10]) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM[8]) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  XOR2_X0P7M_A9TL U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  AND2_X1B_A9TL U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
endmodule


module FFT_8_DATA_WIDTH14_DW01_sub_0 ( A, B, DIFF );
  input [13:0] A;
  input [13:0] B;
  output [13:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [13:2] carry;

  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n2), .CI(carry[13]), .S(DIFF[13]) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n3), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n4), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n5), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n6), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n7), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n9), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  ADDF_X1M_A9TL U2_5 ( .A(A[5]), .B(n10), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  ADDF_X1M_A9TL U2_4 ( .A(A[4]), .B(n11), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  ADDF_X1M_A9TL U2_3 ( .A(A[3]), .B(n12), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  ADDF_X1M_A9TL U2_2 ( .A(A[2]), .B(n13), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  ADDF_X1M_A9TL U2_1 ( .A(A[1]), .B(n14), .CI(n1), .CO(carry[2]), .S(DIFF[1])
         );
  OR2_X1B_A9TL U1 ( .A(A[0]), .B(n15), .Y(n1) );
  INV_X1M_A9TL U2 ( .A(B[11]), .Y(n4) );
  INV_X1M_A9TL U3 ( .A(B[12]), .Y(n3) );
  INV_X1M_A9TL U4 ( .A(B[1]), .Y(n14) );
  INV_X1M_A9TL U5 ( .A(B[2]), .Y(n13) );
  INV_X1M_A9TL U6 ( .A(B[3]), .Y(n12) );
  INV_X1M_A9TL U7 ( .A(B[4]), .Y(n11) );
  INV_X1M_A9TL U8 ( .A(B[5]), .Y(n10) );
  INV_X1M_A9TL U9 ( .A(B[6]), .Y(n9) );
  INV_X1M_A9TL U10 ( .A(B[7]), .Y(n8) );
  INV_X1M_A9TL U11 ( .A(B[8]), .Y(n7) );
  INV_X1M_A9TL U12 ( .A(B[9]), .Y(n6) );
  INV_X1M_A9TL U13 ( .A(B[10]), .Y(n5) );
  INV_X1M_A9TL U14 ( .A(B[0]), .Y(n15) );
  INV_X1M_A9TL U15 ( .A(B[13]), .Y(n2) );
  XNOR2_X0P7M_A9TL U16 ( .A(n15), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FFT_8_DATA_WIDTH14_DW01_sub_1 ( A, B, DIFF );
  input [13:0] A;
  input [13:0] B;
  output [13:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [13:2] carry;

  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n2), .CI(carry[13]), .S(DIFF[13]) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n3), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n4), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n5), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n6), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n7), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n9), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  ADDF_X1M_A9TL U2_5 ( .A(A[5]), .B(n10), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  ADDF_X1M_A9TL U2_4 ( .A(A[4]), .B(n11), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  ADDF_X1M_A9TL U2_3 ( .A(A[3]), .B(n12), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  ADDF_X1M_A9TL U2_2 ( .A(A[2]), .B(n13), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  ADDF_X1M_A9TL U2_1 ( .A(A[1]), .B(n14), .CI(n1), .CO(carry[2]), .S(DIFF[1])
         );
  OR2_X1B_A9TL U1 ( .A(A[0]), .B(n15), .Y(n1) );
  INV_X1M_A9TL U2 ( .A(B[11]), .Y(n4) );
  INV_X1M_A9TL U3 ( .A(B[12]), .Y(n3) );
  INV_X1M_A9TL U4 ( .A(B[1]), .Y(n14) );
  INV_X1M_A9TL U5 ( .A(B[2]), .Y(n13) );
  INV_X1M_A9TL U6 ( .A(B[3]), .Y(n12) );
  INV_X1M_A9TL U7 ( .A(B[4]), .Y(n11) );
  INV_X1M_A9TL U8 ( .A(B[5]), .Y(n10) );
  INV_X1M_A9TL U9 ( .A(B[6]), .Y(n9) );
  INV_X1M_A9TL U10 ( .A(B[7]), .Y(n8) );
  INV_X1M_A9TL U11 ( .A(B[8]), .Y(n7) );
  INV_X1M_A9TL U12 ( .A(B[9]), .Y(n6) );
  INV_X1M_A9TL U13 ( .A(B[10]), .Y(n5) );
  INV_X1M_A9TL U14 ( .A(B[0]), .Y(n15) );
  INV_X1M_A9TL U15 ( .A(B[13]), .Y(n2) );
  XNOR2_X0P7M_A9TL U16 ( .A(n15), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FFT_8_DATA_WIDTH14_DW_mult_tc_3 ( a, b_6_, b_1_, b_0_, product_19_, 
        product_18_, product_17_, product_16_, product_15_, product_14_, 
        product_13_, product_12_, product_11_, product_10_, product_9_, 
        product_8_, product_7_, product_6_, product_5_, product_4_, product_3_, 
        product_2_, product_1_, product_0_ );
  input [13:0] a;
  input b_6_, b_1_, b_0_;
  output product_19_, product_18_, product_17_, product_16_, product_15_,
         product_14_, product_13_, product_12_, product_11_, product_10_,
         product_9_, product_8_, product_7_, product_6_, product_5_,
         product_4_, product_3_, product_2_, product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n27, n28, n29, n30, n31, n32,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n89, n91, n92,
         n93, n94, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331;

  ADDF_X1M_A9TL U3 ( .A(n22), .B(n23), .CI(n3), .CO(n2), .S(product_18_) );
  ADDF_X1M_A9TL U4 ( .A(n24), .B(n28), .CI(n4), .CO(n3), .S(product_17_) );
  ADDF_X1M_A9TL U5 ( .A(n31), .B(n29), .CI(n5), .CO(n4), .S(product_16_) );
  ADDF_X1M_A9TL U6 ( .A(n32), .B(n36), .CI(n6), .CO(n5), .S(product_15_) );
  ADDF_X1M_A9TL U7 ( .A(n41), .B(n37), .CI(n7), .CO(n6), .S(product_14_) );
  ADDF_X1M_A9TL U8 ( .A(n46), .B(n42), .CI(n8), .CO(n7), .S(product_13_) );
  ADDF_X1M_A9TL U9 ( .A(n51), .B(n47), .CI(n9), .CO(n8), .S(product_12_) );
  ADDF_X1M_A9TL U10 ( .A(n56), .B(n52), .CI(n10), .CO(n9), .S(product_11_) );
  ADDF_X1M_A9TL U11 ( .A(n61), .B(n57), .CI(n11), .CO(n10), .S(product_10_) );
  ADDF_X1M_A9TL U12 ( .A(n66), .B(n62), .CI(n12), .CO(n11), .S(product_9_) );
  ADDF_X1M_A9TL U13 ( .A(n71), .B(n67), .CI(n13), .CO(n12), .S(product_8_) );
  ADDF_X1M_A9TL U14 ( .A(n76), .B(n72), .CI(n14), .CO(n13), .S(product_7_) );
  ADDF_X1M_A9TL U15 ( .A(n78), .B(n77), .CI(n15), .CO(n14), .S(product_6_) );
  ADDF_X1M_A9TL U16 ( .A(n81), .B(n79), .CI(n16), .CO(n15), .S(product_5_) );
  ADDF_X1M_A9TL U17 ( .A(n84), .B(n83), .CI(n17), .CO(n16), .S(product_4_) );
  ADDF_X1M_A9TL U19 ( .A(n131), .B(n144), .CI(n19), .CO(n18), .S(product_2_)
         );
  ADDH_X1M_A9TL U20 ( .A(n89), .B(n145), .CO(n19), .S(product_1_) );
  ADDF_X1M_A9TL U22 ( .A(n25), .B(n91), .CI(n104), .CO(n21), .S(n22) );
  ADDF_X1M_A9TL U23 ( .A(n92), .B(n282), .CI(n27), .CO(n23), .S(n24) );
  CMPR42_X1M_A9TL U25 ( .A(n283), .B(n105), .C(n93), .D(n30), .ICI(n118), .CO(
        n28), .ICO(n27), .SUM(n29) );
  CMPR42_X1M_A9TL U26 ( .A(n106), .B(n94), .C(n34), .D(n35), .ICI(n38), .CO(
        n31), .ICO(n30), .SUM(n32) );
  CMPR42_X1M_A9TL U28 ( .A(n107), .B(n132), .C(n43), .D(n39), .ICI(n40), .CO(
        n36), .ICO(n35), .SUM(n37) );
  CMPR42_X1M_A9TL U31 ( .A(n108), .B(n96), .C(n48), .D(n45), .ICI(n44), .CO(
        n41), .ICO(n40), .SUM(n42) );
  ADDH_X1M_A9TL U32 ( .A(n133), .B(n120), .CO(n43), .S(n44) );
  CMPR42_X1M_A9TL U33 ( .A(n109), .B(n97), .C(n53), .D(n50), .ICI(n49), .CO(
        n46), .ICO(n45), .SUM(n47) );
  ADDH_X1M_A9TL U34 ( .A(n134), .B(n121), .CO(n48), .S(n49) );
  CMPR42_X1M_A9TL U35 ( .A(n110), .B(n98), .C(n58), .D(n55), .ICI(n54), .CO(
        n51), .ICO(n50), .SUM(n52) );
  ADDH_X1M_A9TL U36 ( .A(n135), .B(n122), .CO(n53), .S(n54) );
  CMPR42_X1M_A9TL U37 ( .A(n111), .B(n99), .C(n63), .D(n60), .ICI(n59), .CO(
        n56), .ICO(n55), .SUM(n57) );
  ADDH_X1M_A9TL U38 ( .A(n136), .B(n123), .CO(n58), .S(n59) );
  CMPR42_X1M_A9TL U39 ( .A(n112), .B(n100), .C(n68), .D(n65), .ICI(n64), .CO(
        n61), .ICO(n60), .SUM(n62) );
  ADDH_X1M_A9TL U40 ( .A(n137), .B(n124), .CO(n63), .S(n64) );
  CMPR42_X1M_A9TL U41 ( .A(n113), .B(n101), .C(n73), .D(n69), .ICI(n70), .CO(
        n66), .ICO(n65), .SUM(n67) );
  ADDH_X1M_A9TL U42 ( .A(n138), .B(n125), .CO(n68), .S(n69) );
  CMPR42_X1M_A9TL U43 ( .A(n126), .B(n86), .C(n114), .D(n74), .ICI(n75), .CO(
        n71), .ICO(n70), .SUM(n72) );
  ADDH_X1M_A9TL U44 ( .A(n139), .B(n102), .CO(n73), .S(n74) );
  CMPR42_X1M_A9TL U45 ( .A(n103), .B(n140), .C(n127), .D(n80), .ICI(n115), 
        .CO(n76), .ICO(n75), .SUM(n77) );
  ADDH_X1M_A9TL U47 ( .A(n141), .B(n128), .CO(n80), .S(n81) );
  ADDF_X1M_A9TL U48 ( .A(n117), .B(n142), .CI(n129), .CO(n82), .S(n83) );
  ADDH_X1M_A9TL U49 ( .A(n143), .B(n130), .CO(n84), .S(n85) );
  BUFH_X1M_A9TL U204 ( .A(n285), .Y(n281) );
  INV_X1M_A9TL U205 ( .A(b_6_), .Y(n286) );
  INV_X1M_A9TL U206 ( .A(b_0_), .Y(n285) );
  NOR2_X1A_A9TL U207 ( .A(n285), .B(n297), .Y(n107) );
  NAND2_X1A_A9TL U208 ( .A(b_0_), .B(n284), .Y(n132) );
  NOR2_X1A_A9TL U209 ( .A(n285), .B(n298), .Y(n106) );
  NOR2_X1A_A9TL U210 ( .A(n286), .B(n310), .Y(n94) );
  INV_X1M_A9TL U211 ( .A(n329), .Y(n284) );
  NOR2_X1A_A9TL U212 ( .A(n285), .B(n290), .Y(n114) );
  NOR2_X1A_A9TL U213 ( .A(n286), .B(n314), .Y(n86) );
  NOR2_X1A_A9TL U214 ( .A(n285), .B(n289), .Y(n115) );
  NOR2_X1A_A9TL U215 ( .A(n322), .B(n285), .Y(n140) );
  NOR2_X1A_A9TL U216 ( .A(n320), .B(n285), .Y(n142) );
  NOR2_X1A_A9TL U217 ( .A(n285), .B(n288), .Y(n116) );
  INV_X1M_A9TL U218 ( .A(a[0]), .Y(n287) );
  NOR2_X1A_A9TL U219 ( .A(n319), .B(n285), .Y(n143) );
  NOR2_X1A_A9TL U220 ( .A(n318), .B(n285), .Y(n144) );
  NOR2_X1A_A9TL U221 ( .A(a[0]), .B(n281), .Y(n89) );
  NOR2_X1A_A9TL U222 ( .A(n317), .B(n281), .Y(n145) );
  NOR2_X1A_A9TL U223 ( .A(n286), .B(n311), .Y(n316) );
  NOR2_X1A_A9TL U224 ( .A(n285), .B(n293), .Y(n111) );
  NOR2_X1A_A9TL U225 ( .A(n286), .B(n305), .Y(n99) );
  NOR2_X1A_A9TL U226 ( .A(n285), .B(n294), .Y(n110) );
  NOR2_X1A_A9TL U227 ( .A(n286), .B(n307), .Y(n98) );
  NOR2_X1A_A9TL U228 ( .A(n285), .B(n295), .Y(n109) );
  NOR2_X1A_A9TL U229 ( .A(n286), .B(n308), .Y(n97) );
  NOR2_X1A_A9TL U230 ( .A(n285), .B(n296), .Y(n108) );
  NOR2_X1A_A9TL U231 ( .A(n286), .B(n309), .Y(n96) );
  NOR2_X1A_A9TL U232 ( .A(n286), .B(n312), .Y(n93) );
  NOR2_X1A_A9TL U233 ( .A(n323), .B(n285), .Y(n139) );
  NOR2_X1A_A9TL U234 ( .A(n286), .B(n330), .Y(n102) );
  NOR2_X1A_A9TL U235 ( .A(n285), .B(n299), .Y(n105) );
  INV_X1M_A9TL U236 ( .A(n34), .Y(n283) );
  NOR2_X1A_A9TL U237 ( .A(n285), .B(n291), .Y(n113) );
  NOR2_X1A_A9TL U238 ( .A(n286), .B(n331), .Y(n101) );
  NOR2_X1A_A9TL U239 ( .A(n285), .B(n292), .Y(n112) );
  NOR2_X1A_A9TL U240 ( .A(n286), .B(n306), .Y(n100) );
  NOR2_X1A_A9TL U241 ( .A(n321), .B(n285), .Y(n141) );
  NOR2_X1A_A9TL U242 ( .A(n325), .B(n285), .Y(n137) );
  NOR2_X1A_A9TL U243 ( .A(n326), .B(n285), .Y(n136) );
  NOR2_X1A_A9TL U244 ( .A(n327), .B(n285), .Y(n135) );
  NOR2_X1A_A9TL U245 ( .A(n328), .B(n285), .Y(n134) );
  NOR2_X1A_A9TL U246 ( .A(n324), .B(n285), .Y(n138) );
  NOR2_X1A_A9TL U247 ( .A(n329), .B(n285), .Y(n133) );
  INV_X1M_A9TL U248 ( .A(a[1]), .Y(n288) );
  INV_X1M_A9TL U249 ( .A(a[4]), .Y(n291) );
  INV_X1M_A9TL U250 ( .A(a[2]), .Y(n289) );
  INV_X1M_A9TL U251 ( .A(a[5]), .Y(n292) );
  INV_X1M_A9TL U252 ( .A(a[3]), .Y(n290) );
  INV_X1M_A9TL U253 ( .A(a[6]), .Y(n293) );
  INV_X1M_A9TL U254 ( .A(a[7]), .Y(n294) );
  INV_X1M_A9TL U255 ( .A(a[8]), .Y(n295) );
  INV_X1M_A9TL U256 ( .A(a[9]), .Y(n296) );
  NOR2_X1A_A9TL U257 ( .A(n286), .B(n303), .Y(n301) );
  NAND2_X1A_A9TL U258 ( .A(b_0_), .B(a[13]), .Y(n104) );
  NOR2_X1A_A9TL U259 ( .A(n286), .B(n304), .Y(n91) );
  INV_X1M_A9TL U260 ( .A(n25), .Y(n282) );
  NOR2_X1A_A9TL U261 ( .A(n286), .B(n313), .Y(n92) );
  INV_X1M_A9TL U262 ( .A(a[10]), .Y(n297) );
  INV_X1M_A9TL U263 ( .A(a[11]), .Y(n298) );
  INV_X1M_A9TL U264 ( .A(a[12]), .Y(n299) );
  NOR2_X1A_A9TL U265 ( .A(n285), .B(n300), .Y(n25) );
  INV_X1M_A9TL U266 ( .A(a[13]), .Y(n300) );
  NAND2_X0P5A_A9TH U267 ( .A(b_1_), .B(a[13]), .Y(n118) );
  AND2_X0P5B_A9TH U268 ( .A(n85), .B(n18), .Y(n17) );
  XOR2_X0P5M_A9TH U269 ( .A(n85), .B(n18), .Y(product_3_) );
  NOR2_X0P5A_A9TH U270 ( .A(n285), .B(n288), .Y(n130) );
  AND2_X0P5B_A9TH U271 ( .A(n116), .B(n82), .Y(n78) );
  XOR2_X0P5M_A9TH U272 ( .A(n116), .B(n82), .Y(n79) );
  NOR2_X0P5A_A9TH U273 ( .A(n285), .B(n289), .Y(n129) );
  NOR2_X0P5A_A9TH U274 ( .A(n285), .B(n290), .Y(n128) );
  NOR2_X0P5A_A9TH U275 ( .A(n285), .B(n291), .Y(n127) );
  NOR2_X0P5A_A9TH U276 ( .A(n281), .B(n292), .Y(n126) );
  NOR2_X0P5A_A9TH U277 ( .A(n281), .B(n293), .Y(n125) );
  NOR2_X0P5A_A9TH U278 ( .A(n281), .B(n294), .Y(n124) );
  NOR2_X0P5A_A9TH U279 ( .A(n281), .B(n295), .Y(n123) );
  NOR2_X0P5A_A9TH U280 ( .A(n281), .B(n296), .Y(n122) );
  NOR2_X0P5A_A9TH U281 ( .A(n281), .B(n297), .Y(n121) );
  NAND2_X0P5A_A9TH U282 ( .A(b_1_), .B(a[12]), .Y(n315) );
  AND2_X0P5B_A9TH U283 ( .A(b_1_), .B(a[11]), .Y(n120) );
  NAND2_X0P5A_A9TH U284 ( .A(b_1_), .B(a[13]), .Y(n34) );
  XOR2_X0P5M_A9TH U285 ( .A(n301), .B(n302), .Y(product_19_) );
  XNOR2_X0P5M_A9TH U286 ( .A(n21), .B(n2), .Y(n302) );
  XOR2_X0P5M_A9TH U287 ( .A(a[13]), .B(n286), .Y(n303) );
  NOR2_X0P5A_A9TH U288 ( .A(n287), .B(n281), .Y(product_0_) );
  XOR2_X0P5M_A9TH U289 ( .A(a[4]), .B(n286), .Y(n305) );
  XOR2_X0P5M_A9TH U290 ( .A(a[5]), .B(n286), .Y(n307) );
  XOR2_X0P5M_A9TH U291 ( .A(a[6]), .B(n286), .Y(n308) );
  XOR2_X0P5M_A9TH U292 ( .A(a[9]), .B(n286), .Y(n310) );
  XOR2_X0P5M_A9TH U293 ( .A(a[10]), .B(n286), .Y(n312) );
  XOR2_X0P5M_A9TH U294 ( .A(a[11]), .B(n286), .Y(n313) );
  XOR2_X0P5M_A9TH U295 ( .A(a[12]), .B(n286), .Y(n304) );
  OR2_X0P5B_A9TH U296 ( .A(n286), .B(a[0]), .Y(n314) );
  XOR2_X0P5M_A9TH U297 ( .A(n315), .B(n316), .Y(n39) );
  NAND2B_X0P5M_A9TH U298 ( .AN(n316), .B(n315), .Y(n38) );
  XOR2_X0P5M_A9TH U299 ( .A(a[7]), .B(n286), .Y(n309) );
  XOR2_X0P5M_A9TH U300 ( .A(a[8]), .B(n286), .Y(n311) );
  XOR2_X0P5M_A9TH U301 ( .A(a[1]), .B(n281), .Y(n317) );
  XOR2_X0P5M_A9TH U302 ( .A(a[2]), .B(n281), .Y(n318) );
  XOR2_X0P5M_A9TH U303 ( .A(a[3]), .B(n281), .Y(n319) );
  XOR2_X0P5M_A9TH U304 ( .A(a[4]), .B(n281), .Y(n320) );
  XOR2_X0P5M_A9TH U305 ( .A(a[5]), .B(n281), .Y(n321) );
  XOR2_X0P5M_A9TH U306 ( .A(a[6]), .B(n281), .Y(n322) );
  XOR2_X0P5M_A9TH U307 ( .A(a[7]), .B(n281), .Y(n323) );
  XOR2_X0P5M_A9TH U308 ( .A(a[8]), .B(n281), .Y(n324) );
  XOR2_X0P5M_A9TH U309 ( .A(a[9]), .B(n281), .Y(n325) );
  XOR2_X0P5M_A9TH U310 ( .A(a[10]), .B(n281), .Y(n326) );
  XOR2_X0P5M_A9TH U311 ( .A(a[11]), .B(n281), .Y(n327) );
  XOR2_X0P5M_A9TH U312 ( .A(a[12]), .B(n281), .Y(n328) );
  XNOR2_X0P5M_A9TH U313 ( .A(a[13]), .B(b_1_), .Y(n329) );
  NOR2_X0P5A_A9TH U314 ( .A(n281), .B(n287), .Y(n131) );
  NOR2_X0P5A_A9TH U315 ( .A(n281), .B(n287), .Y(n117) );
  NOR2_X0P5A_A9TH U316 ( .A(n286), .B(n287), .Y(n103) );
  XOR2_X0P5M_A9TH U317 ( .A(a[1]), .B(n286), .Y(n330) );
  XOR2_X0P5M_A9TH U318 ( .A(a[2]), .B(n286), .Y(n331) );
  XOR2_X0P5M_A9TH U319 ( .A(a[3]), .B(n286), .Y(n306) );
endmodule


module FFT_8_DATA_WIDTH14_DW_mult_tc_2 ( a, b, product_19_, product_18_, 
        product_17_, product_16_, product_15_, product_14_, product_13_, 
        product_12_, product_11_, product_10_, product_9_, product_8_, 
        product_7_, product_6_, product_5_, product_4_, product_3_, product_2_, 
        product_1_, product_0_ );
  input [13:0] a;
  input [7:0] b;
  output product_19_, product_18_, product_17_, product_16_, product_15_,
         product_14_, product_13_, product_12_, product_11_, product_10_,
         product_9_, product_8_, product_7_, product_6_, product_5_,
         product_4_, product_3_, product_2_, product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n27, n28, n29, n30, n31, n32,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n91, n92, n93, n94, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357;

  ADDF_X1M_A9TL U3 ( .A(n22), .B(n23), .CI(n3), .CO(n2), .S(product_18_) );
  ADDF_X1M_A9TL U4 ( .A(n24), .B(n28), .CI(n4), .CO(n3), .S(product_17_) );
  ADDF_X1M_A9TL U5 ( .A(n31), .B(n29), .CI(n5), .CO(n4), .S(product_16_) );
  ADDF_X1M_A9TL U6 ( .A(n32), .B(n36), .CI(n6), .CO(n5), .S(product_15_) );
  ADDF_X1M_A9TL U7 ( .A(n41), .B(n37), .CI(n7), .CO(n6), .S(product_14_) );
  ADDF_X1M_A9TL U8 ( .A(n46), .B(n42), .CI(n8), .CO(n7), .S(product_13_) );
  ADDF_X1M_A9TL U9 ( .A(n51), .B(n47), .CI(n9), .CO(n8), .S(product_12_) );
  ADDF_X1M_A9TL U10 ( .A(n56), .B(n52), .CI(n10), .CO(n9), .S(product_11_) );
  ADDF_X1M_A9TL U11 ( .A(n61), .B(n57), .CI(n11), .CO(n10), .S(product_10_) );
  ADDF_X1M_A9TL U12 ( .A(n66), .B(n62), .CI(n12), .CO(n11), .S(product_9_) );
  ADDF_X1M_A9TL U13 ( .A(n71), .B(n67), .CI(n13), .CO(n12), .S(product_8_) );
  ADDF_X1M_A9TL U14 ( .A(n76), .B(n72), .CI(n14), .CO(n13), .S(product_7_) );
  ADDF_X1M_A9TL U15 ( .A(n78), .B(n77), .CI(n15), .CO(n14), .S(product_6_) );
  ADDF_X1M_A9TL U16 ( .A(n81), .B(n79), .CI(n16), .CO(n15), .S(product_5_) );
  ADDF_X1M_A9TL U17 ( .A(n84), .B(n83), .CI(n17), .CO(n16), .S(product_4_) );
  ADDF_X1M_A9TL U18 ( .A(n88), .B(n85), .CI(n18), .CO(n17), .S(product_3_) );
  ADDF_X1M_A9TL U19 ( .A(n131), .B(n144), .CI(n19), .CO(n18), .S(product_2_)
         );
  ADDH_X1M_A9TL U20 ( .A(n89), .B(n145), .CO(n19), .S(product_1_) );
  ADDF_X1M_A9TL U22 ( .A(n25), .B(n91), .CI(n104), .CO(n21), .S(n22) );
  ADDF_X1M_A9TL U23 ( .A(n92), .B(n285), .CI(n27), .CO(n23), .S(n24) );
  CMPR42_X1M_A9TL U25 ( .A(n287), .B(n105), .C(n93), .D(n30), .ICI(n118), .CO(
        n28), .ICO(n27), .SUM(n29) );
  CMPR42_X1M_A9TL U26 ( .A(n106), .B(n94), .C(n34), .D(n35), .ICI(n38), .CO(
        n31), .ICO(n30), .SUM(n32) );
  CMPR42_X1M_A9TL U28 ( .A(n107), .B(n132), .C(n43), .D(n39), .ICI(n40), .CO(
        n36), .ICO(n35), .SUM(n37) );
  CMPR42_X1M_A9TL U31 ( .A(n108), .B(n96), .C(n48), .D(n45), .ICI(n44), .CO(
        n41), .ICO(n40), .SUM(n42) );
  ADDH_X1M_A9TL U32 ( .A(n133), .B(n283), .CO(n43), .S(n44) );
  CMPR42_X1M_A9TL U33 ( .A(n109), .B(n97), .C(n53), .D(n50), .ICI(n49), .CO(
        n46), .ICO(n45), .SUM(n47) );
  ADDH_X1M_A9TL U34 ( .A(n134), .B(n121), .CO(n48), .S(n49) );
  CMPR42_X1M_A9TL U35 ( .A(n110), .B(n98), .C(n58), .D(n55), .ICI(n54), .CO(
        n51), .ICO(n50), .SUM(n52) );
  ADDH_X1M_A9TL U36 ( .A(n135), .B(n122), .CO(n53), .S(n54) );
  CMPR42_X1M_A9TL U37 ( .A(n111), .B(n99), .C(n63), .D(n60), .ICI(n59), .CO(
        n56), .ICO(n55), .SUM(n57) );
  ADDH_X1M_A9TL U38 ( .A(n136), .B(n123), .CO(n58), .S(n59) );
  CMPR42_X1M_A9TL U39 ( .A(n112), .B(n100), .C(n68), .D(n65), .ICI(n64), .CO(
        n61), .ICO(n60), .SUM(n62) );
  ADDH_X1M_A9TL U40 ( .A(n137), .B(n124), .CO(n63), .S(n64) );
  CMPR42_X1M_A9TL U41 ( .A(n113), .B(n101), .C(n73), .D(n69), .ICI(n70), .CO(
        n66), .ICO(n65), .SUM(n67) );
  ADDH_X1M_A9TL U42 ( .A(n138), .B(n125), .CO(n68), .S(n69) );
  CMPR42_X1M_A9TL U43 ( .A(n126), .B(n86), .C(n114), .D(n74), .ICI(n75), .CO(
        n71), .ICO(n70), .SUM(n72) );
  ADDH_X1M_A9TL U44 ( .A(n139), .B(n102), .CO(n73), .S(n74) );
  CMPR42_X1M_A9TL U45 ( .A(n103), .B(n140), .C(n127), .D(n80), .ICI(n115), 
        .CO(n76), .ICO(n75), .SUM(n77) );
  ADDF_X1M_A9TL U46 ( .A(n116), .B(n87), .CI(n82), .CO(n78), .S(n79) );
  ADDH_X1M_A9TL U47 ( .A(n141), .B(n128), .CO(n80), .S(n81) );
  ADDF_X1M_A9TL U48 ( .A(n117), .B(n142), .CI(n129), .CO(n82), .S(n83) );
  ADDH_X1M_A9TL U49 ( .A(n143), .B(n130), .CO(n84), .S(n85) );
  NAND2_X1A_A9TL U204 ( .A(b[1]), .B(n284), .Y(n305) );
  INV_X1M_A9TL U205 ( .A(b[1]), .Y(n286) );
  NAND2_X1A_A9TL U206 ( .A(n307), .B(n315), .Y(n34) );
  NAND2_X1A_A9TL U207 ( .A(n307), .B(n315), .Y(n118) );
  INV_X1M_A9TL U208 ( .A(b[2]), .Y(n289) );
  INV_X1M_A9TL U209 ( .A(n307), .Y(n288) );
  XNOR2_X1M_A9TL U210 ( .A(b[4]), .B(b[3]), .Y(n281) );
  XNOR2_X1M_A9TL U211 ( .A(b[6]), .B(b[5]), .Y(n282) );
  XOR2_X0P7M_A9TL U212 ( .A(b[2]), .B(b[1]), .Y(n307) );
  NAND2_X0P5B_A9TH U213 ( .A(n307), .B(n290), .Y(n306) );
  AND2_X0P7M_A9TH U214 ( .A(n307), .B(n314), .Y(n283) );
  NAND2_X1A_A9TL U215 ( .A(n282), .B(n357), .Y(n295) );
  INV_X1M_A9TL U216 ( .A(n34), .Y(n287) );
  NOR2_X1A_A9TL U217 ( .A(n288), .B(n332), .Y(n129) );
  NOR2_X1A_A9TL U218 ( .A(n288), .B(n335), .Y(n126) );
  NOR2_X1A_A9TL U219 ( .A(n289), .B(n306), .Y(n88) );
  INV_X1M_A9TL U220 ( .A(n25), .Y(n285) );
  NAND2_X1A_A9TL U221 ( .A(n281), .B(n353), .Y(n309) );
  INV_X1M_A9TL U222 ( .A(b[0]), .Y(n284) );
  NOR2_X1A_A9TL U223 ( .A(n288), .B(n334), .Y(n127) );
  NOR2_X1A_A9TL U224 ( .A(n288), .B(n331), .Y(n130) );
  NOR2_X1A_A9TL U225 ( .A(n288), .B(n333), .Y(n128) );
  NOR2_X1A_A9TL U226 ( .A(n288), .B(n336), .Y(n125) );
  NAND2_X0P5B_A9TH U227 ( .A(n307), .B(n313), .Y(n311) );
  NOR2_X1A_A9TL U228 ( .A(n288), .B(n337), .Y(n124) );
  NOR2_X1A_A9TL U229 ( .A(n288), .B(n338), .Y(n123) );
  NOR2_X1A_A9TL U230 ( .A(n288), .B(n339), .Y(n122) );
  NOR2_X1A_A9TL U231 ( .A(n288), .B(n340), .Y(n121) );
  INV_X1M_A9TL U232 ( .A(a[0]), .Y(n290) );
  XOR2_X0P5M_A9TH U233 ( .A(n291), .B(n292), .Y(product_19_) );
  XNOR2_X0P5M_A9TH U234 ( .A(n21), .B(n2), .Y(n292) );
  OAI22_X0P5M_A9TH U235 ( .A0(n282), .A1(n293), .B0(n294), .B1(n295), .Y(n291)
         );
  XOR2_X0P5M_A9TH U236 ( .A(a[13]), .B(n286), .Y(n293) );
  NOR2_X0P5A_A9TH U237 ( .A(n290), .B(n284), .Y(product_0_) );
  OAI22_X0P5M_A9TH U238 ( .A0(n282), .A1(n296), .B0(n297), .B1(n295), .Y(n99)
         );
  OAI22_X0P5M_A9TH U239 ( .A0(n282), .A1(n298), .B0(n296), .B1(n295), .Y(n98)
         );
  XOR2_X0P5M_A9TH U240 ( .A(a[4]), .B(n286), .Y(n296) );
  OAI22_X0P5M_A9TH U241 ( .A0(n282), .A1(n299), .B0(n298), .B1(n295), .Y(n97)
         );
  XOR2_X0P5M_A9TH U242 ( .A(a[5]), .B(n286), .Y(n298) );
  OAI22_X0P5M_A9TH U243 ( .A0(n282), .A1(n300), .B0(n299), .B1(n295), .Y(n96)
         );
  XOR2_X0P5M_A9TH U244 ( .A(a[6]), .B(n286), .Y(n299) );
  OAI22_X0P5M_A9TH U245 ( .A0(n282), .A1(n301), .B0(n302), .B1(n295), .Y(n94)
         );
  OAI22_X0P5M_A9TH U246 ( .A0(n282), .A1(n303), .B0(n301), .B1(n295), .Y(n93)
         );
  XOR2_X0P5M_A9TH U247 ( .A(a[9]), .B(n286), .Y(n301) );
  OAI22_X0P5M_A9TH U248 ( .A0(n282), .A1(n304), .B0(n303), .B1(n295), .Y(n92)
         );
  XOR2_X0P5M_A9TH U249 ( .A(a[10]), .B(n286), .Y(n303) );
  OAI22_X0P5M_A9TH U250 ( .A0(n282), .A1(n294), .B0(n304), .B1(n295), .Y(n91)
         );
  XOR2_X0P5M_A9TH U251 ( .A(a[11]), .B(n286), .Y(n304) );
  XOR2_X0P5M_A9TH U252 ( .A(a[12]), .B(n286), .Y(n294) );
  OAI21_X0P5M_A9TH U253 ( .A0(a[0]), .A1(n286), .B0(n305), .Y(n89) );
  OAI22_X0P5M_A9TH U254 ( .A0(n289), .A1(n308), .B0(n289), .B1(n309), .Y(n87)
         );
  OR2_X0P5B_A9TH U255 ( .A(n281), .B(a[0]), .Y(n308) );
  OAI22_X0P5M_A9TH U256 ( .A0(n286), .A1(n310), .B0(n286), .B1(n295), .Y(n86)
         );
  OR2_X0P5B_A9TH U257 ( .A(n282), .B(a[0]), .Y(n310) );
  XOR2_X0P5M_A9TH U258 ( .A(n311), .B(n312), .Y(n39) );
  NAND2B_X0P5M_A9TH U259 ( .AN(n312), .B(n311), .Y(n38) );
  OAI22_X0P5M_A9TH U260 ( .A0(n282), .A1(n302), .B0(n300), .B1(n295), .Y(n312)
         );
  XOR2_X0P5M_A9TH U261 ( .A(a[7]), .B(n286), .Y(n300) );
  XOR2_X0P5M_A9TH U262 ( .A(a[8]), .B(n286), .Y(n302) );
  XOR2_X0P5M_A9TH U263 ( .A(a[12]), .B(b[3]), .Y(n313) );
  OAI22_X0P5M_A9TH U264 ( .A0(n281), .A1(n316), .B0(n317), .B1(n309), .Y(n25)
         );
  OAI22_X0P5M_A9TH U265 ( .A0(n318), .A1(n284), .B0(a[0]), .B1(n305), .Y(n145)
         );
  OAI22_X0P5M_A9TH U266 ( .A0(n319), .A1(n284), .B0(n318), .B1(n305), .Y(n144)
         );
  XOR2_X0P5M_A9TH U267 ( .A(a[1]), .B(n286), .Y(n318) );
  OAI22_X0P5M_A9TH U268 ( .A0(n320), .A1(n284), .B0(n319), .B1(n305), .Y(n143)
         );
  XOR2_X0P5M_A9TH U269 ( .A(a[2]), .B(n286), .Y(n319) );
  OAI22_X0P5M_A9TH U270 ( .A0(n321), .A1(n284), .B0(n320), .B1(n305), .Y(n142)
         );
  XOR2_X0P5M_A9TH U271 ( .A(a[3]), .B(n286), .Y(n320) );
  OAI22_X0P5M_A9TH U272 ( .A0(n322), .A1(n284), .B0(n321), .B1(n305), .Y(n141)
         );
  XOR2_X0P5M_A9TH U273 ( .A(a[4]), .B(n286), .Y(n321) );
  OAI22_X0P5M_A9TH U274 ( .A0(n323), .A1(n284), .B0(n322), .B1(n305), .Y(n140)
         );
  XOR2_X0P5M_A9TH U275 ( .A(a[5]), .B(n286), .Y(n322) );
  OAI22_X0P5M_A9TH U276 ( .A0(n324), .A1(n284), .B0(n323), .B1(n305), .Y(n139)
         );
  XOR2_X0P5M_A9TH U277 ( .A(a[6]), .B(n286), .Y(n323) );
  OAI22_X0P5M_A9TH U278 ( .A0(n325), .A1(n284), .B0(n324), .B1(n305), .Y(n138)
         );
  XOR2_X0P5M_A9TH U279 ( .A(a[7]), .B(n286), .Y(n324) );
  OAI22_X0P5M_A9TH U280 ( .A0(n326), .A1(n284), .B0(n325), .B1(n305), .Y(n137)
         );
  XOR2_X0P5M_A9TH U281 ( .A(a[8]), .B(n286), .Y(n325) );
  OAI22_X0P5M_A9TH U282 ( .A0(n327), .A1(n284), .B0(n326), .B1(n305), .Y(n136)
         );
  XOR2_X0P5M_A9TH U283 ( .A(a[9]), .B(n286), .Y(n326) );
  OAI22_X0P5M_A9TH U284 ( .A0(n328), .A1(n284), .B0(n327), .B1(n305), .Y(n135)
         );
  XOR2_X0P5M_A9TH U285 ( .A(a[10]), .B(n286), .Y(n327) );
  OAI22_X0P5M_A9TH U286 ( .A0(n329), .A1(n284), .B0(n328), .B1(n305), .Y(n134)
         );
  XOR2_X0P5M_A9TH U287 ( .A(a[11]), .B(n286), .Y(n328) );
  OAI22_X0P5M_A9TH U288 ( .A0(n330), .A1(n284), .B0(n329), .B1(n305), .Y(n133)
         );
  XOR2_X0P5M_A9TH U289 ( .A(a[12]), .B(n286), .Y(n329) );
  AO21_X0P5M_A9TH U290 ( .A0(n284), .A1(n305), .B0(n330), .Y(n132) );
  XNOR2_X0P5M_A9TH U291 ( .A(a[13]), .B(b[1]), .Y(n330) );
  NOR2_X0P5A_A9TH U292 ( .A(n288), .B(n290), .Y(n131) );
  XOR2_X0P5M_A9TH U293 ( .A(a[1]), .B(n289), .Y(n331) );
  XOR2_X0P5M_A9TH U294 ( .A(a[2]), .B(n289), .Y(n332) );
  XOR2_X0P5M_A9TH U295 ( .A(a[3]), .B(n289), .Y(n333) );
  XOR2_X0P5M_A9TH U296 ( .A(a[4]), .B(n289), .Y(n334) );
  XOR2_X0P5M_A9TH U297 ( .A(a[5]), .B(n289), .Y(n335) );
  XOR2_X0P5M_A9TH U298 ( .A(a[6]), .B(n289), .Y(n336) );
  XOR2_X0P5M_A9TH U299 ( .A(a[7]), .B(n289), .Y(n337) );
  XOR2_X0P5M_A9TH U300 ( .A(a[8]), .B(n289), .Y(n338) );
  XOR2_X0P5M_A9TH U301 ( .A(a[9]), .B(n289), .Y(n339) );
  XNOR2_X0P5M_A9TH U302 ( .A(a[11]), .B(n289), .Y(n314) );
  XOR2_X0P5M_A9TH U303 ( .A(a[10]), .B(n289), .Y(n340) );
  XOR2_X0P5M_A9TH U304 ( .A(a[13]), .B(b[3]), .Y(n315) );
  NOR2_X0P5A_A9TH U305 ( .A(n281), .B(n290), .Y(n117) );
  OAI22_X0P5M_A9TH U306 ( .A0(n281), .A1(n341), .B0(n342), .B1(n309), .Y(n116)
         );
  XOR2_X0P5M_A9TH U307 ( .A(n290), .B(b[5]), .Y(n342) );
  OAI22_X0P5M_A9TH U308 ( .A0(n281), .A1(n343), .B0(n341), .B1(n309), .Y(n115)
         );
  XOR2_X0P5M_A9TH U309 ( .A(a[1]), .B(n289), .Y(n341) );
  OAI22_X0P5M_A9TH U310 ( .A0(n281), .A1(n344), .B0(n343), .B1(n309), .Y(n114)
         );
  XOR2_X0P5M_A9TH U311 ( .A(a[2]), .B(n289), .Y(n343) );
  OAI22_X0P5M_A9TH U312 ( .A0(n281), .A1(n345), .B0(n344), .B1(n309), .Y(n113)
         );
  XOR2_X0P5M_A9TH U313 ( .A(a[3]), .B(n289), .Y(n344) );
  OAI22_X0P5M_A9TH U314 ( .A0(n281), .A1(n346), .B0(n345), .B1(n309), .Y(n112)
         );
  XOR2_X0P5M_A9TH U315 ( .A(a[4]), .B(n289), .Y(n345) );
  OAI22_X0P5M_A9TH U316 ( .A0(n281), .A1(n347), .B0(n346), .B1(n309), .Y(n111)
         );
  XOR2_X0P5M_A9TH U317 ( .A(a[5]), .B(n289), .Y(n346) );
  OAI22_X0P5M_A9TH U318 ( .A0(n281), .A1(n348), .B0(n347), .B1(n309), .Y(n110)
         );
  XOR2_X0P5M_A9TH U319 ( .A(a[6]), .B(n289), .Y(n347) );
  OAI22_X0P5M_A9TH U320 ( .A0(n281), .A1(n349), .B0(n348), .B1(n309), .Y(n109)
         );
  XOR2_X0P5M_A9TH U321 ( .A(a[7]), .B(n289), .Y(n348) );
  OAI22_X0P5M_A9TH U322 ( .A0(n281), .A1(n350), .B0(n349), .B1(n309), .Y(n108)
         );
  XOR2_X0P5M_A9TH U323 ( .A(a[8]), .B(n289), .Y(n349) );
  OAI22_X0P5M_A9TH U324 ( .A0(n281), .A1(n351), .B0(n350), .B1(n309), .Y(n107)
         );
  XOR2_X0P5M_A9TH U325 ( .A(a[9]), .B(n289), .Y(n350) );
  OAI22_X0P5M_A9TH U326 ( .A0(n281), .A1(n352), .B0(n351), .B1(n309), .Y(n106)
         );
  XOR2_X0P5M_A9TH U327 ( .A(a[10]), .B(n289), .Y(n351) );
  OAI22_X0P5M_A9TH U328 ( .A0(n281), .A1(n317), .B0(n352), .B1(n309), .Y(n105)
         );
  XOR2_X0P5M_A9TH U329 ( .A(a[11]), .B(n289), .Y(n352) );
  XOR2_X0P5M_A9TH U330 ( .A(a[12]), .B(n289), .Y(n317) );
  AO21_X0P5M_A9TH U331 ( .A0(n309), .A1(n281), .B0(n316), .Y(n104) );
  XNOR2_X0P5M_A9TH U332 ( .A(a[13]), .B(b[5]), .Y(n316) );
  XOR2_X0P5M_A9TH U333 ( .A(b[5]), .B(b[4]), .Y(n353) );
  NOR2_X0P5A_A9TH U334 ( .A(n282), .B(n290), .Y(n103) );
  OAI22_X0P5M_A9TH U335 ( .A0(n282), .A1(n354), .B0(n355), .B1(n295), .Y(n102)
         );
  XOR2_X0P5M_A9TH U336 ( .A(n290), .B(b[7]), .Y(n355) );
  OAI22_X0P5M_A9TH U337 ( .A0(n282), .A1(n356), .B0(n354), .B1(n295), .Y(n101)
         );
  XOR2_X0P5M_A9TH U338 ( .A(a[1]), .B(n286), .Y(n354) );
  OAI22_X0P5M_A9TH U339 ( .A0(n282), .A1(n297), .B0(n356), .B1(n295), .Y(n100)
         );
  XOR2_X0P5M_A9TH U340 ( .A(b[7]), .B(b[6]), .Y(n357) );
  XOR2_X0P5M_A9TH U341 ( .A(a[2]), .B(n286), .Y(n356) );
  XOR2_X0P5M_A9TH U342 ( .A(a[3]), .B(n286), .Y(n297) );
endmodule


module FFT_8_DATA_WIDTH14_DW01_add_2 ( A, B, SUM_19_, SUM_18_, SUM_17_, 
        SUM_16_, SUM_15_, SUM_14_, SUM_13_, SUM_12_, SUM_11_, SUM_10_, SUM_9_, 
        SUM_8_, SUM_7_, SUM_6_ );
  input [19:0] A;
  input [19:0] B;
  output SUM_19_, SUM_18_, SUM_17_, SUM_16_, SUM_15_, SUM_14_, SUM_13_,
         SUM_12_, SUM_11_, SUM_10_, SUM_9_, SUM_8_, SUM_7_, SUM_6_;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [19:6] carry;

  ADDF_X1M_A9TL U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .S(SUM_19_) );
  ADDF_X1M_A9TL U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), 
        .S(SUM_18_) );
  ADDF_X1M_A9TL U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), 
        .S(SUM_17_) );
  ADDF_X1M_A9TL U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), 
        .S(SUM_16_) );
  ADDF_X1M_A9TL U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), 
        .S(SUM_15_) );
  ADDF_X1M_A9TL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), 
        .S(SUM_14_) );
  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), 
        .S(SUM_13_) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM_12_) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM_11_) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM_10_) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM_9_) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM_8_) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM_7_) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM_6_) );
  AO1B2_X0P5M_A9TH U1 ( .B0(n1), .B1(A[5]), .A0N(n2), .Y(carry[6]) );
  OAI21_X0P5M_A9TH U2 ( .A0(A[5]), .A1(n1), .B0(B[5]), .Y(n2) );
  AO1B2_X0P5M_A9TH U3 ( .B0(n3), .B1(A[4]), .A0N(n4), .Y(n1) );
  OAI21_X0P5M_A9TH U4 ( .A0(A[4]), .A1(n3), .B0(B[4]), .Y(n4) );
  AO1B2_X0P5M_A9TH U5 ( .B0(n5), .B1(A[3]), .A0N(n6), .Y(n3) );
  OAI21_X0P5M_A9TH U6 ( .A0(A[3]), .A1(n5), .B0(B[3]), .Y(n6) );
  AO1B2_X0P5M_A9TH U7 ( .B0(n7), .B1(A[2]), .A0N(n8), .Y(n5) );
  OAI21_X0P5M_A9TH U8 ( .A0(A[2]), .A1(n7), .B0(B[2]), .Y(n8) );
  AO1B2_X0P5M_A9TH U9 ( .B0(A[1]), .B1(B[1]), .A0N(n9), .Y(n7) );
  OAI211_X0P5M_A9TH U10 ( .A0(A[1]), .A1(B[1]), .B0(A[0]), .C0(B[0]), .Y(n9)
         );
endmodule


module FFT_8_DATA_WIDTH14_DW_mult_tc_1 ( a, b, product_19_, product_18_, 
        product_17_, product_16_, product_15_, product_14_, product_13_, 
        product_12_, product_11_, product_10_, product_9_, product_8_, 
        product_7_, product_6_, product_5_, product_4_, product_3_, product_2_, 
        product_1_, product_0_ );
  input [13:0] a;
  input [7:0] b;
  output product_19_, product_18_, product_17_, product_16_, product_15_,
         product_14_, product_13_, product_12_, product_11_, product_10_,
         product_9_, product_8_, product_7_, product_6_, product_5_,
         product_4_, product_3_, product_2_, product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n27, n28, n29, n30, n31, n32,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n91, n92, n93, n94, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351,
         n352, n353, n354, n355, n356, n357;

  ADDF_X1M_A9TL U3 ( .A(n22), .B(n23), .CI(n3), .CO(n2), .S(product_18_) );
  ADDF_X1M_A9TL U4 ( .A(n24), .B(n28), .CI(n4), .CO(n3), .S(product_17_) );
  ADDF_X1M_A9TL U5 ( .A(n31), .B(n29), .CI(n5), .CO(n4), .S(product_16_) );
  ADDF_X1M_A9TL U6 ( .A(n32), .B(n36), .CI(n6), .CO(n5), .S(product_15_) );
  ADDF_X1M_A9TL U7 ( .A(n41), .B(n37), .CI(n7), .CO(n6), .S(product_14_) );
  ADDF_X1M_A9TL U8 ( .A(n46), .B(n42), .CI(n8), .CO(n7), .S(product_13_) );
  ADDF_X1M_A9TL U9 ( .A(n51), .B(n47), .CI(n9), .CO(n8), .S(product_12_) );
  ADDF_X1M_A9TL U10 ( .A(n56), .B(n52), .CI(n10), .CO(n9), .S(product_11_) );
  ADDF_X1M_A9TL U11 ( .A(n61), .B(n57), .CI(n11), .CO(n10), .S(product_10_) );
  ADDF_X1M_A9TL U12 ( .A(n66), .B(n62), .CI(n12), .CO(n11), .S(product_9_) );
  ADDF_X1M_A9TL U13 ( .A(n71), .B(n67), .CI(n13), .CO(n12), .S(product_8_) );
  ADDF_X1M_A9TL U14 ( .A(n76), .B(n72), .CI(n14), .CO(n13), .S(product_7_) );
  ADDF_X1M_A9TL U15 ( .A(n78), .B(n77), .CI(n15), .CO(n14), .S(product_6_) );
  ADDF_X1M_A9TL U16 ( .A(n81), .B(n79), .CI(n16), .CO(n15), .S(product_5_) );
  ADDF_X1M_A9TL U17 ( .A(n84), .B(n83), .CI(n17), .CO(n16), .S(product_4_) );
  ADDF_X1M_A9TL U18 ( .A(n88), .B(n85), .CI(n18), .CO(n17), .S(product_3_) );
  ADDF_X1M_A9TL U19 ( .A(n131), .B(n144), .CI(n19), .CO(n18), .S(product_2_)
         );
  ADDH_X1M_A9TL U20 ( .A(n89), .B(n145), .CO(n19), .S(product_1_) );
  ADDF_X1M_A9TL U22 ( .A(n25), .B(n91), .CI(n104), .CO(n21), .S(n22) );
  ADDF_X1M_A9TL U23 ( .A(n92), .B(n285), .CI(n27), .CO(n23), .S(n24) );
  CMPR42_X1M_A9TL U25 ( .A(n287), .B(n105), .C(n93), .D(n30), .ICI(n118), .CO(
        n28), .ICO(n27), .SUM(n29) );
  CMPR42_X1M_A9TL U26 ( .A(n106), .B(n94), .C(n34), .D(n35), .ICI(n38), .CO(
        n31), .ICO(n30), .SUM(n32) );
  CMPR42_X1M_A9TL U28 ( .A(n107), .B(n132), .C(n43), .D(n39), .ICI(n40), .CO(
        n36), .ICO(n35), .SUM(n37) );
  CMPR42_X1M_A9TL U31 ( .A(n108), .B(n96), .C(n48), .D(n45), .ICI(n44), .CO(
        n41), .ICO(n40), .SUM(n42) );
  ADDH_X1M_A9TL U32 ( .A(n133), .B(n283), .CO(n43), .S(n44) );
  CMPR42_X1M_A9TL U33 ( .A(n109), .B(n97), .C(n53), .D(n50), .ICI(n49), .CO(
        n46), .ICO(n45), .SUM(n47) );
  ADDH_X1M_A9TL U34 ( .A(n134), .B(n121), .CO(n48), .S(n49) );
  CMPR42_X1M_A9TL U35 ( .A(n110), .B(n98), .C(n58), .D(n55), .ICI(n54), .CO(
        n51), .ICO(n50), .SUM(n52) );
  ADDH_X1M_A9TL U36 ( .A(n135), .B(n122), .CO(n53), .S(n54) );
  CMPR42_X1M_A9TL U37 ( .A(n111), .B(n99), .C(n63), .D(n60), .ICI(n59), .CO(
        n56), .ICO(n55), .SUM(n57) );
  ADDH_X1M_A9TL U38 ( .A(n136), .B(n123), .CO(n58), .S(n59) );
  CMPR42_X1M_A9TL U39 ( .A(n112), .B(n100), .C(n68), .D(n65), .ICI(n64), .CO(
        n61), .ICO(n60), .SUM(n62) );
  ADDH_X1M_A9TL U40 ( .A(n137), .B(n124), .CO(n63), .S(n64) );
  CMPR42_X1M_A9TL U41 ( .A(n113), .B(n101), .C(n73), .D(n69), .ICI(n70), .CO(
        n66), .ICO(n65), .SUM(n67) );
  ADDH_X1M_A9TL U42 ( .A(n138), .B(n125), .CO(n68), .S(n69) );
  CMPR42_X1M_A9TL U43 ( .A(n126), .B(n86), .C(n114), .D(n74), .ICI(n75), .CO(
        n71), .ICO(n70), .SUM(n72) );
  ADDH_X1M_A9TL U44 ( .A(n139), .B(n102), .CO(n73), .S(n74) );
  CMPR42_X1M_A9TL U45 ( .A(n103), .B(n140), .C(n127), .D(n80), .ICI(n115), 
        .CO(n76), .ICO(n75), .SUM(n77) );
  ADDF_X1M_A9TL U46 ( .A(n116), .B(n87), .CI(n82), .CO(n78), .S(n79) );
  ADDH_X1M_A9TL U47 ( .A(n141), .B(n128), .CO(n80), .S(n81) );
  ADDF_X1M_A9TL U48 ( .A(n117), .B(n142), .CI(n129), .CO(n82), .S(n83) );
  ADDH_X1M_A9TL U49 ( .A(n143), .B(n130), .CO(n84), .S(n85) );
  NAND2_X1A_A9TL U204 ( .A(b[1]), .B(n284), .Y(n305) );
  INV_X1M_A9TL U205 ( .A(b[1]), .Y(n286) );
  NAND2_X1A_A9TL U206 ( .A(n307), .B(n315), .Y(n34) );
  NAND2_X1A_A9TL U207 ( .A(n307), .B(n315), .Y(n118) );
  INV_X1M_A9TL U208 ( .A(b[2]), .Y(n289) );
  INV_X1M_A9TL U209 ( .A(n307), .Y(n288) );
  XNOR2_X1M_A9TL U210 ( .A(b[4]), .B(b[3]), .Y(n281) );
  XNOR2_X1M_A9TL U211 ( .A(b[6]), .B(b[5]), .Y(n282) );
  XOR2_X0P7M_A9TL U212 ( .A(b[2]), .B(b[1]), .Y(n307) );
  NAND2_X0P5B_A9TH U213 ( .A(n307), .B(n290), .Y(n306) );
  AND2_X0P7M_A9TH U214 ( .A(n307), .B(n314), .Y(n283) );
  NAND2_X1A_A9TL U215 ( .A(n282), .B(n357), .Y(n295) );
  INV_X1M_A9TL U216 ( .A(n34), .Y(n287) );
  NOR2_X1A_A9TL U217 ( .A(n289), .B(n306), .Y(n88) );
  NOR2_X1A_A9TL U218 ( .A(n288), .B(n335), .Y(n126) );
  NOR2_X1A_A9TL U219 ( .A(n288), .B(n332), .Y(n129) );
  INV_X1M_A9TL U220 ( .A(n25), .Y(n285) );
  NAND2_X1A_A9TL U221 ( .A(n281), .B(n353), .Y(n309) );
  INV_X1M_A9TL U222 ( .A(b[0]), .Y(n284) );
  NOR2_X1A_A9TL U223 ( .A(n288), .B(n334), .Y(n127) );
  NOR2_X1A_A9TL U224 ( .A(n288), .B(n331), .Y(n130) );
  NOR2_X1A_A9TL U225 ( .A(n288), .B(n333), .Y(n128) );
  NOR2_X1A_A9TL U226 ( .A(n288), .B(n336), .Y(n125) );
  NAND2_X0P5B_A9TH U227 ( .A(n307), .B(n313), .Y(n311) );
  NOR2_X1A_A9TL U228 ( .A(n288), .B(n337), .Y(n124) );
  NOR2_X1A_A9TL U229 ( .A(n288), .B(n338), .Y(n123) );
  NOR2_X1A_A9TL U230 ( .A(n288), .B(n339), .Y(n122) );
  NOR2_X1A_A9TL U231 ( .A(n288), .B(n340), .Y(n121) );
  INV_X1M_A9TL U232 ( .A(a[0]), .Y(n290) );
  XOR2_X0P5M_A9TH U233 ( .A(n291), .B(n292), .Y(product_19_) );
  XNOR2_X0P5M_A9TH U234 ( .A(n21), .B(n2), .Y(n292) );
  OAI22_X0P5M_A9TH U235 ( .A0(n282), .A1(n293), .B0(n294), .B1(n295), .Y(n291)
         );
  XOR2_X0P5M_A9TH U236 ( .A(a[13]), .B(n286), .Y(n293) );
  NOR2_X0P5A_A9TH U237 ( .A(n290), .B(n284), .Y(product_0_) );
  OAI22_X0P5M_A9TH U238 ( .A0(n282), .A1(n296), .B0(n297), .B1(n295), .Y(n99)
         );
  OAI22_X0P5M_A9TH U239 ( .A0(n282), .A1(n298), .B0(n296), .B1(n295), .Y(n98)
         );
  XOR2_X0P5M_A9TH U240 ( .A(a[4]), .B(n286), .Y(n296) );
  OAI22_X0P5M_A9TH U241 ( .A0(n282), .A1(n299), .B0(n298), .B1(n295), .Y(n97)
         );
  XOR2_X0P5M_A9TH U242 ( .A(a[5]), .B(n286), .Y(n298) );
  OAI22_X0P5M_A9TH U243 ( .A0(n282), .A1(n300), .B0(n299), .B1(n295), .Y(n96)
         );
  XOR2_X0P5M_A9TH U244 ( .A(a[6]), .B(n286), .Y(n299) );
  OAI22_X0P5M_A9TH U245 ( .A0(n282), .A1(n301), .B0(n302), .B1(n295), .Y(n94)
         );
  OAI22_X0P5M_A9TH U246 ( .A0(n282), .A1(n303), .B0(n301), .B1(n295), .Y(n93)
         );
  XOR2_X0P5M_A9TH U247 ( .A(a[9]), .B(n286), .Y(n301) );
  OAI22_X0P5M_A9TH U248 ( .A0(n282), .A1(n304), .B0(n303), .B1(n295), .Y(n92)
         );
  XOR2_X0P5M_A9TH U249 ( .A(a[10]), .B(n286), .Y(n303) );
  OAI22_X0P5M_A9TH U250 ( .A0(n282), .A1(n294), .B0(n304), .B1(n295), .Y(n91)
         );
  XOR2_X0P5M_A9TH U251 ( .A(a[11]), .B(n286), .Y(n304) );
  XOR2_X0P5M_A9TH U252 ( .A(a[12]), .B(n286), .Y(n294) );
  OAI21_X0P5M_A9TH U253 ( .A0(a[0]), .A1(n286), .B0(n305), .Y(n89) );
  OAI22_X0P5M_A9TH U254 ( .A0(n289), .A1(n308), .B0(n289), .B1(n309), .Y(n87)
         );
  OR2_X0P5B_A9TH U255 ( .A(n281), .B(a[0]), .Y(n308) );
  OAI22_X0P5M_A9TH U256 ( .A0(n286), .A1(n310), .B0(n286), .B1(n295), .Y(n86)
         );
  OR2_X0P5B_A9TH U257 ( .A(n282), .B(a[0]), .Y(n310) );
  XOR2_X0P5M_A9TH U258 ( .A(n311), .B(n312), .Y(n39) );
  NAND2B_X0P5M_A9TH U259 ( .AN(n312), .B(n311), .Y(n38) );
  OAI22_X0P5M_A9TH U260 ( .A0(n282), .A1(n302), .B0(n300), .B1(n295), .Y(n312)
         );
  XOR2_X0P5M_A9TH U261 ( .A(a[7]), .B(n286), .Y(n300) );
  XOR2_X0P5M_A9TH U262 ( .A(a[8]), .B(n286), .Y(n302) );
  XOR2_X0P5M_A9TH U263 ( .A(a[12]), .B(b[3]), .Y(n313) );
  OAI22_X0P5M_A9TH U264 ( .A0(n281), .A1(n316), .B0(n317), .B1(n309), .Y(n25)
         );
  OAI22_X0P5M_A9TH U265 ( .A0(n318), .A1(n284), .B0(a[0]), .B1(n305), .Y(n145)
         );
  OAI22_X0P5M_A9TH U266 ( .A0(n319), .A1(n284), .B0(n318), .B1(n305), .Y(n144)
         );
  XOR2_X0P5M_A9TH U267 ( .A(a[1]), .B(n286), .Y(n318) );
  OAI22_X0P5M_A9TH U268 ( .A0(n320), .A1(n284), .B0(n319), .B1(n305), .Y(n143)
         );
  XOR2_X0P5M_A9TH U269 ( .A(a[2]), .B(n286), .Y(n319) );
  OAI22_X0P5M_A9TH U270 ( .A0(n321), .A1(n284), .B0(n320), .B1(n305), .Y(n142)
         );
  XOR2_X0P5M_A9TH U271 ( .A(a[3]), .B(n286), .Y(n320) );
  OAI22_X0P5M_A9TH U272 ( .A0(n322), .A1(n284), .B0(n321), .B1(n305), .Y(n141)
         );
  XOR2_X0P5M_A9TH U273 ( .A(a[4]), .B(n286), .Y(n321) );
  OAI22_X0P5M_A9TH U274 ( .A0(n323), .A1(n284), .B0(n322), .B1(n305), .Y(n140)
         );
  XOR2_X0P5M_A9TH U275 ( .A(a[5]), .B(n286), .Y(n322) );
  OAI22_X0P5M_A9TH U276 ( .A0(n324), .A1(n284), .B0(n323), .B1(n305), .Y(n139)
         );
  XOR2_X0P5M_A9TH U277 ( .A(a[6]), .B(n286), .Y(n323) );
  OAI22_X0P5M_A9TH U278 ( .A0(n325), .A1(n284), .B0(n324), .B1(n305), .Y(n138)
         );
  XOR2_X0P5M_A9TH U279 ( .A(a[7]), .B(n286), .Y(n324) );
  OAI22_X0P5M_A9TH U280 ( .A0(n326), .A1(n284), .B0(n325), .B1(n305), .Y(n137)
         );
  XOR2_X0P5M_A9TH U281 ( .A(a[8]), .B(n286), .Y(n325) );
  OAI22_X0P5M_A9TH U282 ( .A0(n327), .A1(n284), .B0(n326), .B1(n305), .Y(n136)
         );
  XOR2_X0P5M_A9TH U283 ( .A(a[9]), .B(n286), .Y(n326) );
  OAI22_X0P5M_A9TH U284 ( .A0(n328), .A1(n284), .B0(n327), .B1(n305), .Y(n135)
         );
  XOR2_X0P5M_A9TH U285 ( .A(a[10]), .B(n286), .Y(n327) );
  OAI22_X0P5M_A9TH U286 ( .A0(n329), .A1(n284), .B0(n328), .B1(n305), .Y(n134)
         );
  XOR2_X0P5M_A9TH U287 ( .A(a[11]), .B(n286), .Y(n328) );
  OAI22_X0P5M_A9TH U288 ( .A0(n330), .A1(n284), .B0(n329), .B1(n305), .Y(n133)
         );
  XOR2_X0P5M_A9TH U289 ( .A(a[12]), .B(n286), .Y(n329) );
  AO21_X0P5M_A9TH U290 ( .A0(n284), .A1(n305), .B0(n330), .Y(n132) );
  XNOR2_X0P5M_A9TH U291 ( .A(a[13]), .B(b[1]), .Y(n330) );
  NOR2_X0P5A_A9TH U292 ( .A(n288), .B(n290), .Y(n131) );
  XOR2_X0P5M_A9TH U293 ( .A(a[1]), .B(n289), .Y(n331) );
  XOR2_X0P5M_A9TH U294 ( .A(a[2]), .B(n289), .Y(n332) );
  XOR2_X0P5M_A9TH U295 ( .A(a[3]), .B(n289), .Y(n333) );
  XOR2_X0P5M_A9TH U296 ( .A(a[4]), .B(n289), .Y(n334) );
  XOR2_X0P5M_A9TH U297 ( .A(a[5]), .B(n289), .Y(n335) );
  XOR2_X0P5M_A9TH U298 ( .A(a[6]), .B(n289), .Y(n336) );
  XOR2_X0P5M_A9TH U299 ( .A(a[7]), .B(n289), .Y(n337) );
  XOR2_X0P5M_A9TH U300 ( .A(a[8]), .B(n289), .Y(n338) );
  XOR2_X0P5M_A9TH U301 ( .A(a[9]), .B(n289), .Y(n339) );
  XNOR2_X0P5M_A9TH U302 ( .A(a[11]), .B(n289), .Y(n314) );
  XOR2_X0P5M_A9TH U303 ( .A(a[10]), .B(n289), .Y(n340) );
  XOR2_X0P5M_A9TH U304 ( .A(a[13]), .B(b[3]), .Y(n315) );
  NOR2_X0P5A_A9TH U305 ( .A(n281), .B(n290), .Y(n117) );
  OAI22_X0P5M_A9TH U306 ( .A0(n281), .A1(n341), .B0(n342), .B1(n309), .Y(n116)
         );
  XOR2_X0P5M_A9TH U307 ( .A(n290), .B(b[5]), .Y(n342) );
  OAI22_X0P5M_A9TH U308 ( .A0(n281), .A1(n343), .B0(n341), .B1(n309), .Y(n115)
         );
  XOR2_X0P5M_A9TH U309 ( .A(a[1]), .B(n289), .Y(n341) );
  OAI22_X0P5M_A9TH U310 ( .A0(n281), .A1(n344), .B0(n343), .B1(n309), .Y(n114)
         );
  XOR2_X0P5M_A9TH U311 ( .A(a[2]), .B(n289), .Y(n343) );
  OAI22_X0P5M_A9TH U312 ( .A0(n281), .A1(n345), .B0(n344), .B1(n309), .Y(n113)
         );
  XOR2_X0P5M_A9TH U313 ( .A(a[3]), .B(n289), .Y(n344) );
  OAI22_X0P5M_A9TH U314 ( .A0(n281), .A1(n346), .B0(n345), .B1(n309), .Y(n112)
         );
  XOR2_X0P5M_A9TH U315 ( .A(a[4]), .B(n289), .Y(n345) );
  OAI22_X0P5M_A9TH U316 ( .A0(n281), .A1(n347), .B0(n346), .B1(n309), .Y(n111)
         );
  XOR2_X0P5M_A9TH U317 ( .A(a[5]), .B(n289), .Y(n346) );
  OAI22_X0P5M_A9TH U318 ( .A0(n281), .A1(n348), .B0(n347), .B1(n309), .Y(n110)
         );
  XOR2_X0P5M_A9TH U319 ( .A(a[6]), .B(n289), .Y(n347) );
  OAI22_X0P5M_A9TH U320 ( .A0(n281), .A1(n349), .B0(n348), .B1(n309), .Y(n109)
         );
  XOR2_X0P5M_A9TH U321 ( .A(a[7]), .B(n289), .Y(n348) );
  OAI22_X0P5M_A9TH U322 ( .A0(n281), .A1(n350), .B0(n349), .B1(n309), .Y(n108)
         );
  XOR2_X0P5M_A9TH U323 ( .A(a[8]), .B(n289), .Y(n349) );
  OAI22_X0P5M_A9TH U324 ( .A0(n281), .A1(n351), .B0(n350), .B1(n309), .Y(n107)
         );
  XOR2_X0P5M_A9TH U325 ( .A(a[9]), .B(n289), .Y(n350) );
  OAI22_X0P5M_A9TH U326 ( .A0(n281), .A1(n352), .B0(n351), .B1(n309), .Y(n106)
         );
  XOR2_X0P5M_A9TH U327 ( .A(a[10]), .B(n289), .Y(n351) );
  OAI22_X0P5M_A9TH U328 ( .A0(n281), .A1(n317), .B0(n352), .B1(n309), .Y(n105)
         );
  XOR2_X0P5M_A9TH U329 ( .A(a[11]), .B(n289), .Y(n352) );
  XOR2_X0P5M_A9TH U330 ( .A(a[12]), .B(n289), .Y(n317) );
  AO21_X0P5M_A9TH U331 ( .A0(n309), .A1(n281), .B0(n316), .Y(n104) );
  XNOR2_X0P5M_A9TH U332 ( .A(a[13]), .B(b[5]), .Y(n316) );
  XOR2_X0P5M_A9TH U333 ( .A(b[5]), .B(b[4]), .Y(n353) );
  NOR2_X0P5A_A9TH U334 ( .A(n282), .B(n290), .Y(n103) );
  OAI22_X0P5M_A9TH U335 ( .A0(n282), .A1(n354), .B0(n355), .B1(n295), .Y(n102)
         );
  XOR2_X0P5M_A9TH U336 ( .A(n290), .B(b[7]), .Y(n355) );
  OAI22_X0P5M_A9TH U337 ( .A0(n282), .A1(n356), .B0(n354), .B1(n295), .Y(n101)
         );
  XOR2_X0P5M_A9TH U338 ( .A(a[1]), .B(n286), .Y(n354) );
  OAI22_X0P5M_A9TH U339 ( .A0(n282), .A1(n297), .B0(n356), .B1(n295), .Y(n100)
         );
  XOR2_X0P5M_A9TH U340 ( .A(b[7]), .B(b[6]), .Y(n357) );
  XOR2_X0P5M_A9TH U341 ( .A(a[2]), .B(n286), .Y(n356) );
  XOR2_X0P5M_A9TH U342 ( .A(a[3]), .B(n286), .Y(n297) );
endmodule


module FFT_8_DATA_WIDTH14_DW_mult_tc_0 ( a, b_6_, b_1_, b_0_, product_19_, 
        product_18_, product_17_, product_16_, product_15_, product_14_, 
        product_13_, product_12_, product_11_, product_10_, product_9_, 
        product_8_, product_7_, product_6_, product_5_, product_4_, product_3_, 
        product_2_, product_1_, product_0_ );
  input [13:0] a;
  input b_6_, b_1_, b_0_;
  output product_19_, product_18_, product_17_, product_16_, product_15_,
         product_14_, product_13_, product_12_, product_11_, product_10_,
         product_9_, product_8_, product_7_, product_6_, product_5_,
         product_4_, product_3_, product_2_, product_1_, product_0_;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n21, n22, n23, n24, n25, n27, n28, n29, n30, n31, n32,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n89, n91, n92,
         n93, n94, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331;

  ADDF_X1M_A9TL U3 ( .A(n22), .B(n23), .CI(n3), .CO(n2), .S(product_18_) );
  ADDF_X1M_A9TL U4 ( .A(n24), .B(n28), .CI(n4), .CO(n3), .S(product_17_) );
  ADDF_X1M_A9TL U5 ( .A(n31), .B(n29), .CI(n5), .CO(n4), .S(product_16_) );
  ADDF_X1M_A9TL U6 ( .A(n32), .B(n36), .CI(n6), .CO(n5), .S(product_15_) );
  ADDF_X1M_A9TL U7 ( .A(n41), .B(n37), .CI(n7), .CO(n6), .S(product_14_) );
  ADDF_X1M_A9TL U8 ( .A(n46), .B(n42), .CI(n8), .CO(n7), .S(product_13_) );
  ADDF_X1M_A9TL U9 ( .A(n51), .B(n47), .CI(n9), .CO(n8), .S(product_12_) );
  ADDF_X1M_A9TL U10 ( .A(n56), .B(n52), .CI(n10), .CO(n9), .S(product_11_) );
  ADDF_X1M_A9TL U11 ( .A(n61), .B(n57), .CI(n11), .CO(n10), .S(product_10_) );
  ADDF_X1M_A9TL U12 ( .A(n66), .B(n62), .CI(n12), .CO(n11), .S(product_9_) );
  ADDF_X1M_A9TL U13 ( .A(n71), .B(n67), .CI(n13), .CO(n12), .S(product_8_) );
  ADDF_X1M_A9TL U14 ( .A(n76), .B(n72), .CI(n14), .CO(n13), .S(product_7_) );
  ADDF_X1M_A9TL U15 ( .A(n78), .B(n77), .CI(n15), .CO(n14), .S(product_6_) );
  ADDF_X1M_A9TL U16 ( .A(n81), .B(n79), .CI(n16), .CO(n15), .S(product_5_) );
  ADDF_X1M_A9TL U17 ( .A(n84), .B(n83), .CI(n17), .CO(n16), .S(product_4_) );
  ADDF_X1M_A9TL U19 ( .A(n131), .B(n144), .CI(n19), .CO(n18), .S(product_2_)
         );
  ADDH_X1M_A9TL U20 ( .A(n89), .B(n145), .CO(n19), .S(product_1_) );
  ADDF_X1M_A9TL U22 ( .A(n25), .B(n91), .CI(n104), .CO(n21), .S(n22) );
  ADDF_X1M_A9TL U23 ( .A(n92), .B(n282), .CI(n27), .CO(n23), .S(n24) );
  CMPR42_X1M_A9TL U25 ( .A(n283), .B(n105), .C(n93), .D(n30), .ICI(n118), .CO(
        n28), .ICO(n27), .SUM(n29) );
  CMPR42_X1M_A9TL U26 ( .A(n106), .B(n94), .C(n34), .D(n35), .ICI(n38), .CO(
        n31), .ICO(n30), .SUM(n32) );
  CMPR42_X1M_A9TL U28 ( .A(n107), .B(n132), .C(n43), .D(n39), .ICI(n40), .CO(
        n36), .ICO(n35), .SUM(n37) );
  CMPR42_X1M_A9TL U31 ( .A(n108), .B(n96), .C(n48), .D(n45), .ICI(n44), .CO(
        n41), .ICO(n40), .SUM(n42) );
  ADDH_X1M_A9TL U32 ( .A(n133), .B(n120), .CO(n43), .S(n44) );
  CMPR42_X1M_A9TL U33 ( .A(n109), .B(n97), .C(n53), .D(n50), .ICI(n49), .CO(
        n46), .ICO(n45), .SUM(n47) );
  ADDH_X1M_A9TL U34 ( .A(n134), .B(n121), .CO(n48), .S(n49) );
  CMPR42_X1M_A9TL U35 ( .A(n110), .B(n98), .C(n58), .D(n55), .ICI(n54), .CO(
        n51), .ICO(n50), .SUM(n52) );
  ADDH_X1M_A9TL U36 ( .A(n135), .B(n122), .CO(n53), .S(n54) );
  CMPR42_X1M_A9TL U37 ( .A(n111), .B(n99), .C(n63), .D(n60), .ICI(n59), .CO(
        n56), .ICO(n55), .SUM(n57) );
  ADDH_X1M_A9TL U38 ( .A(n136), .B(n123), .CO(n58), .S(n59) );
  CMPR42_X1M_A9TL U39 ( .A(n112), .B(n100), .C(n68), .D(n65), .ICI(n64), .CO(
        n61), .ICO(n60), .SUM(n62) );
  ADDH_X1M_A9TL U40 ( .A(n137), .B(n124), .CO(n63), .S(n64) );
  CMPR42_X1M_A9TL U41 ( .A(n113), .B(n101), .C(n73), .D(n69), .ICI(n70), .CO(
        n66), .ICO(n65), .SUM(n67) );
  ADDH_X1M_A9TL U42 ( .A(n138), .B(n125), .CO(n68), .S(n69) );
  CMPR42_X1M_A9TL U43 ( .A(n126), .B(n86), .C(n114), .D(n74), .ICI(n75), .CO(
        n71), .ICO(n70), .SUM(n72) );
  ADDH_X1M_A9TL U44 ( .A(n139), .B(n102), .CO(n73), .S(n74) );
  CMPR42_X1M_A9TL U45 ( .A(n103), .B(n140), .C(n127), .D(n80), .ICI(n115), 
        .CO(n76), .ICO(n75), .SUM(n77) );
  ADDH_X1M_A9TL U47 ( .A(n141), .B(n128), .CO(n80), .S(n81) );
  ADDF_X1M_A9TL U48 ( .A(n117), .B(n142), .CI(n129), .CO(n82), .S(n83) );
  ADDH_X1M_A9TL U49 ( .A(n143), .B(n130), .CO(n84), .S(n85) );
  BUFH_X1M_A9TL U204 ( .A(n285), .Y(n281) );
  INV_X1M_A9TL U205 ( .A(b_6_), .Y(n286) );
  INV_X1M_A9TL U206 ( .A(b_0_), .Y(n285) );
  INV_X1M_A9TL U207 ( .A(n329), .Y(n284) );
  NOR2_X1A_A9TL U208 ( .A(n281), .B(n297), .Y(n107) );
  NAND2_X1A_A9TL U209 ( .A(b_0_), .B(n284), .Y(n132) );
  NOR2_X1A_A9TL U210 ( .A(n281), .B(n298), .Y(n106) );
  NOR2_X1A_A9TL U211 ( .A(n286), .B(n310), .Y(n94) );
  NOR2_X1A_A9TL U212 ( .A(n281), .B(n290), .Y(n114) );
  NOR2_X1A_A9TL U213 ( .A(n286), .B(n314), .Y(n86) );
  NOR2_X1A_A9TL U214 ( .A(n281), .B(n289), .Y(n115) );
  NOR2_X1A_A9TL U215 ( .A(n322), .B(n281), .Y(n140) );
  NOR2_X1A_A9TL U216 ( .A(n320), .B(n281), .Y(n142) );
  NOR2_X1A_A9TL U217 ( .A(n281), .B(n287), .Y(n116) );
  NOR2_X1A_A9TL U218 ( .A(a[0]), .B(n281), .Y(n89) );
  NOR2_X1A_A9TL U219 ( .A(n317), .B(n281), .Y(n145) );
  INV_X1M_A9TL U220 ( .A(a[0]), .Y(n288) );
  NOR2_X1A_A9TL U221 ( .A(n319), .B(n281), .Y(n143) );
  NOR2_X1A_A9TL U222 ( .A(n318), .B(n281), .Y(n144) );
  NOR2_X1A_A9TL U223 ( .A(n286), .B(n311), .Y(n316) );
  NOR2_X1A_A9TL U224 ( .A(n325), .B(n281), .Y(n137) );
  NOR2_X1A_A9TL U225 ( .A(n326), .B(n281), .Y(n136) );
  NOR2_X1A_A9TL U226 ( .A(n327), .B(n281), .Y(n135) );
  NOR2_X1A_A9TL U227 ( .A(n328), .B(n281), .Y(n134) );
  NOR2_X1A_A9TL U228 ( .A(n286), .B(n303), .Y(n301) );
  NOR2_X1A_A9TL U229 ( .A(n281), .B(n293), .Y(n111) );
  NOR2_X1A_A9TL U230 ( .A(n286), .B(n305), .Y(n99) );
  NOR2_X1A_A9TL U231 ( .A(n281), .B(n294), .Y(n110) );
  NOR2_X1A_A9TL U232 ( .A(n286), .B(n307), .Y(n98) );
  NOR2_X1A_A9TL U233 ( .A(n281), .B(n295), .Y(n109) );
  NOR2_X1A_A9TL U234 ( .A(n286), .B(n308), .Y(n97) );
  NOR2_X1A_A9TL U235 ( .A(n281), .B(n296), .Y(n108) );
  NOR2_X1A_A9TL U236 ( .A(n286), .B(n309), .Y(n96) );
  NOR2_X1A_A9TL U237 ( .A(n323), .B(n281), .Y(n139) );
  NOR2_X1A_A9TL U238 ( .A(n286), .B(n330), .Y(n102) );
  NOR2_X1A_A9TL U239 ( .A(n281), .B(n299), .Y(n105) );
  INV_X1M_A9TL U240 ( .A(n34), .Y(n283) );
  NOR2_X1A_A9TL U241 ( .A(n281), .B(n291), .Y(n113) );
  NOR2_X1A_A9TL U242 ( .A(n286), .B(n331), .Y(n101) );
  NOR2_X1A_A9TL U243 ( .A(n281), .B(n292), .Y(n112) );
  NOR2_X1A_A9TL U244 ( .A(n286), .B(n306), .Y(n100) );
  NOR2_X1A_A9TL U245 ( .A(n321), .B(n281), .Y(n141) );
  NOR2_X1A_A9TL U246 ( .A(n324), .B(n281), .Y(n138) );
  NOR2_X1A_A9TL U247 ( .A(n329), .B(n281), .Y(n133) );
  INV_X1M_A9TL U248 ( .A(a[1]), .Y(n287) );
  INV_X1M_A9TL U249 ( .A(a[4]), .Y(n291) );
  INV_X1M_A9TL U250 ( .A(a[2]), .Y(n289) );
  INV_X1M_A9TL U251 ( .A(a[5]), .Y(n292) );
  INV_X1M_A9TL U252 ( .A(a[3]), .Y(n290) );
  INV_X1M_A9TL U253 ( .A(a[6]), .Y(n293) );
  INV_X1M_A9TL U254 ( .A(a[7]), .Y(n294) );
  INV_X1M_A9TL U255 ( .A(a[8]), .Y(n295) );
  INV_X1M_A9TL U256 ( .A(a[9]), .Y(n296) );
  NOR2_X1A_A9TL U257 ( .A(n286), .B(n312), .Y(n93) );
  NAND2_X1A_A9TL U258 ( .A(b_0_), .B(a[13]), .Y(n104) );
  NOR2_X1A_A9TL U259 ( .A(n286), .B(n304), .Y(n91) );
  INV_X1M_A9TL U260 ( .A(n25), .Y(n282) );
  NOR2_X1A_A9TL U261 ( .A(n286), .B(n313), .Y(n92) );
  INV_X1M_A9TL U262 ( .A(a[10]), .Y(n297) );
  INV_X1M_A9TL U263 ( .A(a[11]), .Y(n298) );
  INV_X1M_A9TL U264 ( .A(a[12]), .Y(n299) );
  NOR2_X1A_A9TL U265 ( .A(n281), .B(n300), .Y(n25) );
  INV_X1M_A9TL U266 ( .A(a[13]), .Y(n300) );
  NAND2_X0P5A_A9TH U267 ( .A(b_1_), .B(a[13]), .Y(n118) );
  NAND2_X0P5A_A9TH U268 ( .A(b_1_), .B(a[13]), .Y(n34) );
  NAND2_X0P5A_A9TH U269 ( .A(b_1_), .B(a[12]), .Y(n315) );
  AND2_X0P5B_A9TH U270 ( .A(b_1_), .B(a[11]), .Y(n120) );
  NOR2_X0P5A_A9TH U271 ( .A(n281), .B(n297), .Y(n121) );
  NOR2_X0P5A_A9TH U272 ( .A(n281), .B(n296), .Y(n122) );
  NOR2_X0P5A_A9TH U273 ( .A(n281), .B(n295), .Y(n123) );
  NOR2_X0P5A_A9TH U274 ( .A(n281), .B(n294), .Y(n124) );
  NOR2_X0P5A_A9TH U275 ( .A(n285), .B(n293), .Y(n125) );
  NOR2_X0P5A_A9TH U276 ( .A(n285), .B(n292), .Y(n126) );
  AND2_X0P5B_A9TH U277 ( .A(n85), .B(n18), .Y(n17) );
  XOR2_X0P5M_A9TH U278 ( .A(n85), .B(n18), .Y(product_3_) );
  NOR2_X0P5A_A9TH U279 ( .A(n285), .B(n287), .Y(n130) );
  NOR2_X0P5A_A9TH U280 ( .A(n285), .B(n290), .Y(n128) );
  NOR2_X0P5A_A9TH U281 ( .A(n285), .B(n291), .Y(n127) );
  AND2_X0P5B_A9TH U282 ( .A(n116), .B(n82), .Y(n78) );
  XOR2_X0P5M_A9TH U283 ( .A(n116), .B(n82), .Y(n79) );
  NOR2_X0P5A_A9TH U284 ( .A(n285), .B(n289), .Y(n129) );
  XOR2_X0P5M_A9TH U285 ( .A(n301), .B(n302), .Y(product_19_) );
  XNOR2_X0P5M_A9TH U286 ( .A(n21), .B(n2), .Y(n302) );
  XOR2_X0P5M_A9TH U287 ( .A(a[13]), .B(n286), .Y(n303) );
  NOR2_X0P5A_A9TH U288 ( .A(n288), .B(n285), .Y(product_0_) );
  XOR2_X0P5M_A9TH U289 ( .A(a[4]), .B(n286), .Y(n305) );
  XOR2_X0P5M_A9TH U290 ( .A(a[5]), .B(n286), .Y(n307) );
  XOR2_X0P5M_A9TH U291 ( .A(a[6]), .B(n286), .Y(n308) );
  XOR2_X0P5M_A9TH U292 ( .A(a[9]), .B(n286), .Y(n310) );
  XOR2_X0P5M_A9TH U293 ( .A(a[10]), .B(n286), .Y(n312) );
  XOR2_X0P5M_A9TH U294 ( .A(a[11]), .B(n286), .Y(n313) );
  XOR2_X0P5M_A9TH U295 ( .A(a[12]), .B(n286), .Y(n304) );
  OR2_X0P5B_A9TH U296 ( .A(n286), .B(a[0]), .Y(n314) );
  XOR2_X0P5M_A9TH U297 ( .A(n315), .B(n316), .Y(n39) );
  NAND2B_X0P5M_A9TH U298 ( .AN(n316), .B(n315), .Y(n38) );
  XOR2_X0P5M_A9TH U299 ( .A(a[7]), .B(n286), .Y(n309) );
  XOR2_X0P5M_A9TH U300 ( .A(a[8]), .B(n286), .Y(n311) );
  XOR2_X0P5M_A9TH U301 ( .A(a[1]), .B(n281), .Y(n317) );
  XOR2_X0P5M_A9TH U302 ( .A(a[2]), .B(n285), .Y(n318) );
  XOR2_X0P5M_A9TH U303 ( .A(a[3]), .B(n285), .Y(n319) );
  XOR2_X0P5M_A9TH U304 ( .A(a[4]), .B(n285), .Y(n320) );
  XOR2_X0P5M_A9TH U305 ( .A(a[5]), .B(n285), .Y(n321) );
  XOR2_X0P5M_A9TH U306 ( .A(a[6]), .B(n285), .Y(n322) );
  XOR2_X0P5M_A9TH U307 ( .A(a[7]), .B(n285), .Y(n323) );
  XOR2_X0P5M_A9TH U308 ( .A(a[8]), .B(n285), .Y(n324) );
  XOR2_X0P5M_A9TH U309 ( .A(a[9]), .B(n285), .Y(n325) );
  XOR2_X0P5M_A9TH U310 ( .A(a[10]), .B(n285), .Y(n326) );
  XOR2_X0P5M_A9TH U311 ( .A(a[11]), .B(n285), .Y(n327) );
  XOR2_X0P5M_A9TH U312 ( .A(a[12]), .B(n285), .Y(n328) );
  XNOR2_X0P5M_A9TH U313 ( .A(a[13]), .B(b_1_), .Y(n329) );
  NOR2_X0P5A_A9TH U314 ( .A(n285), .B(n288), .Y(n131) );
  NOR2_X0P5A_A9TH U315 ( .A(n285), .B(n288), .Y(n117) );
  NOR2_X0P5A_A9TH U316 ( .A(n286), .B(n288), .Y(n103) );
  XOR2_X0P5M_A9TH U317 ( .A(a[1]), .B(n286), .Y(n330) );
  XOR2_X0P5M_A9TH U318 ( .A(a[2]), .B(n286), .Y(n331) );
  XOR2_X0P5M_A9TH U319 ( .A(a[3]), .B(n286), .Y(n306) );
endmodule


module FFT_8_DATA_WIDTH14_DW01_sub_2 ( A, B, DIFF_19_, DIFF_18_, DIFF_17_, 
        DIFF_16_, DIFF_15_, DIFF_14_, DIFF_13_, DIFF_12_, DIFF_11_, DIFF_10_, 
        DIFF_9_, DIFF_8_, DIFF_7_, DIFF_6_ );
  input [19:0] A;
  input [19:0] B;
  output DIFF_19_, DIFF_18_, DIFF_17_, DIFF_16_, DIFF_15_, DIFF_14_, DIFF_13_,
         DIFF_12_, DIFF_11_, DIFF_10_, DIFF_9_, DIFF_8_, DIFF_7_, DIFF_6_;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [19:6] carry;

  ADDF_X1M_A9TL U2_19 ( .A(A[19]), .B(n4), .CI(carry[19]), .S(DIFF_19_) );
  ADDF_X1M_A9TL U2_18 ( .A(A[18]), .B(n5), .CI(carry[18]), .CO(carry[19]), .S(
        DIFF_18_) );
  ADDF_X1M_A9TL U2_17 ( .A(A[17]), .B(n6), .CI(carry[17]), .CO(carry[18]), .S(
        DIFF_17_) );
  ADDF_X1M_A9TL U2_16 ( .A(A[16]), .B(n7), .CI(carry[16]), .CO(carry[17]), .S(
        DIFF_16_) );
  ADDF_X1M_A9TL U2_15 ( .A(A[15]), .B(n8), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF_15_) );
  ADDF_X1M_A9TL U2_14 ( .A(A[14]), .B(n9), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF_14_) );
  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n10), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF_13_) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n11), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF_12_) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n12), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF_11_) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n13), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF_10_) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n14), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF_9_) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n15), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF_8_) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n16), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF_7_) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n17), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF_6_) );
  INV_X1M_A9TL U1 ( .A(B[7]), .Y(n16) );
  INV_X1M_A9TL U2 ( .A(B[15]), .Y(n8) );
  INV_X1M_A9TL U3 ( .A(B[6]), .Y(n17) );
  INV_X1M_A9TL U4 ( .A(B[8]), .Y(n15) );
  INV_X1M_A9TL U5 ( .A(B[9]), .Y(n14) );
  INV_X1M_A9TL U6 ( .A(B[10]), .Y(n13) );
  INV_X1M_A9TL U7 ( .A(B[11]), .Y(n12) );
  INV_X1M_A9TL U8 ( .A(B[12]), .Y(n11) );
  INV_X1M_A9TL U9 ( .A(B[13]), .Y(n10) );
  INV_X1M_A9TL U10 ( .A(B[14]), .Y(n9) );
  INV_X1M_A9TL U11 ( .A(B[16]), .Y(n7) );
  INV_X1M_A9TL U12 ( .A(B[17]), .Y(n6) );
  INV_X1M_A9TL U13 ( .A(B[18]), .Y(n5) );
  INV_X1M_A9TL U14 ( .A(A[3]), .Y(n2) );
  INV_X1M_A9TL U15 ( .A(A[5]), .Y(n1) );
  INV_X1M_A9TL U16 ( .A(A[1]), .Y(n3) );
  INV_X1M_A9TL U17 ( .A(B[19]), .Y(n4) );
  OAI22_X0P5M_A9TH U18 ( .A0(n18), .A1(n1), .B0(B[5]), .B1(n19), .Y(carry[6])
         );
  AND2_X0P5B_A9TH U19 ( .A(n18), .B(n1), .Y(n19) );
  AOI22BB_X0P5M_A9TH U20 ( .A0(n20), .A1(A[4]), .B0N(B[4]), .B1N(n21), .Y(n18)
         );
  NOR2_X0P5A_A9TH U21 ( .A(A[4]), .B(n20), .Y(n21) );
  OAI22_X0P5M_A9TH U22 ( .A0(n22), .A1(n2), .B0(B[3]), .B1(n23), .Y(n20) );
  AND2_X0P5B_A9TH U23 ( .A(n22), .B(n2), .Y(n23) );
  AOI22BB_X0P5M_A9TH U24 ( .A0(n24), .A1(A[2]), .B0N(B[2]), .B1N(n25), .Y(n22)
         );
  NOR2_X0P5A_A9TH U25 ( .A(A[2]), .B(n24), .Y(n25) );
  AO21A1AI2_X0P5M_A9TH U26 ( .A0(n26), .A1(n3), .B0(B[1]), .C0(n27), .Y(n24)
         );
  NAND2B_X0P5M_A9TH U27 ( .AN(n26), .B(A[1]), .Y(n27) );
  NOR2B_X0P5M_A9TH U28 ( .AN(B[0]), .B(A[0]), .Y(n26) );
endmodule


module FFT_8_DATA_WIDTH14 ( clk, rst_n, valid_in, data_in_real, data_in_imag, 
        valid_out, data_out_real, data_out_imag );
  input [13:0] data_in_real;
  input [13:0] data_in_imag;
  output [13:0] data_out_real;
  output [13:0] data_out_imag;
  input clk, rst_n, valid_in;
  output valid_out;
  wire   N13, N27, N28, N33, N37, N38, N41, N47, N134, N135, N136, N137, N138,
         N139, N140, N141, N142, N143, N144, N145, N146, N147, N148, N149,
         N150, N151, N152, N153, N154, N155, N156, N157, N158, N159, N160,
         N161, N162, N163, N164, N165, N166, N167, N168, N169, N170, N171,
         N172, N173, N174, N175, N176, N177, N178, N179, N180, N181, N182,
         N183, N184, N185, N186, N187, N188, N189, N190, N191, N192, N193,
         N194, N195, N196, N197, N198, N199, N200, N201, N202, N203, N204,
         N205, N206, N207, N208, N209, N210, N211, N212, N213, N214, N215,
         N216, N217, n20, n21, n22, n23, n24, n25, n26, n270, n280, n29, n30,
         n31, n32, n330, n34, n35, n36, n370, n380, n39, n40, n410, n42, n43,
         n44, n45, n46, n470, n48, n49, n50, n51, n52, n54, n55, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n1340, n1350, n1360, n1370, n1380, n1390, n1400, n1410, n1420, n1430,
         n1440, n1450, n1460, n1470, n1480, n1490, n1500, n1510, n1520, n1530,
         n1540, n1550, n1560, n1570, n1580, n1590, n1600, n1610, n1620, n1630,
         n1640, n1650, n1660, n1670, n1680, n1690, n1700, n1710, n1720, n1730,
         n1740, net10059, N990, N980, N970, N960, N950, N940, N1330, N1320,
         N1310, N1300, N1290, N1280, N1270, N1260, N1250, N1240, N1230, N1220,
         N1210, N1200, N1190, N1180, N1170, N1160, N1150, N1140, N1130, N1120,
         N1110, N1100, N1090, N1080, N1070, N1060, N1050, N1040, N1030, N1020,
         N1010, N1000, N930, N920, N910, N900, N890, N880, N870, N860, N850,
         N840, N830, N820, N810, N800, N790, N780, N770, N760, N750, N740,
         N730, N720, N710, N700, N690, N680, N670, N660, N650, N640, N630,
         N620, N610, N600, N590, N580, N570, N56, N550, N540, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n1311, n14, n15, n16, n17, n18,
         n19, n53, n560, n1750, n1760;
  wire   [1:0] state_r;
  wire   [1:0] counter_w;
  wire   [13:0] data_in_real_r;
  wire   [13:0] data_in_imag_r;
  wire   [55:0] FIFO_real_r;
  wire   [55:0] FIFO_imag_r;
  wire   [13:0] data_out_real_w;
  wire   [13:0] data_out_imag_w;

  DFFRPQ_X2M_A9TL data_in_imag_r_reg_13_ ( .D(data_in_imag[13]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[13]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_12_ ( .D(data_in_imag[12]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[12]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_11_ ( .D(data_in_imag[11]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[11]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_10_ ( .D(data_in_imag[10]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[10]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_9_ ( .D(data_in_imag[9]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[9]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_8_ ( .D(data_in_imag[8]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[8]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_7_ ( .D(data_in_imag[7]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[7]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_6_ ( .D(data_in_imag[6]), .CK(clk), .R(
        n16), .Q(data_in_imag_r[6]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_5_ ( .D(data_in_imag[5]), .CK(clk), .R(
        n15), .Q(data_in_imag_r[5]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_4_ ( .D(data_in_imag[4]), .CK(clk), .R(
        n15), .Q(data_in_imag_r[4]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_3_ ( .D(data_in_imag[3]), .CK(clk), .R(
        n15), .Q(data_in_imag_r[3]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_2_ ( .D(data_in_imag[2]), .CK(clk), .R(
        n15), .Q(data_in_imag_r[2]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_1_ ( .D(data_in_imag[1]), .CK(clk), .R(
        n15), .Q(data_in_imag_r[1]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_0_ ( .D(data_in_imag[0]), .CK(clk), .R(
        n15), .Q(data_in_imag_r[0]) );
  DFFRPQ_X2M_A9TL state_r_reg_1_ ( .D(N28), .CK(clk), .R(n15), .Q(state_r[1])
         );
  DFFRPQ_X2M_A9TL state_r_reg_0_ ( .D(N27), .CK(clk), .R(n15), .Q(state_r[0])
         );
  DFFRPQ_X2M_A9TL valid_out_r_reg ( .D(n1740), .CK(clk), .R(n15), .Q(valid_out) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__1_ ( .D(n1730), .CK(clk), .R(n15), .Q(
        FIFO_imag_r[43]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__1_ ( .D(n1720), .CK(clk), .R(n15), .Q(
        FIFO_imag_r[29]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__1_ ( .D(n1710), .CK(clk), .R(n15), .Q(
        FIFO_imag_r[15]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__1_ ( .D(n1700), .CK(clk), .R(n15), .Q(
        FIFO_imag_r[1]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__0_ ( .D(n1690), .CK(clk), .R(n15), .Q(
        FIFO_imag_r[42]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__0_ ( .D(n1680), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[28]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__0_ ( .D(n1670), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[14]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__0_ ( .D(n1660), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__2_ ( .D(n1650), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[44]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__2_ ( .D(n1640), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[30]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__2_ ( .D(n1630), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[16]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__2_ ( .D(n1620), .CK(clk), .R(n17), .Q(
        FIFO_imag_r[2]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__3_ ( .D(n1610), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[45]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__3_ ( .D(n1600), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[31]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__3_ ( .D(n1590), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[17]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__3_ ( .D(n1580), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[3]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__4_ ( .D(n1570), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[46]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__4_ ( .D(n1560), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[32]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__4_ ( .D(n1550), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[18]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__4_ ( .D(n1540), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[4]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__5_ ( .D(n1530), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[47]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__5_ ( .D(n1520), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[33]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__5_ ( .D(n1510), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[19]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__5_ ( .D(n1500), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[5]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__6_ ( .D(n1490), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[48]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__6_ ( .D(n1480), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[34]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__6_ ( .D(n1470), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[20]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__6_ ( .D(n1460), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[6]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__7_ ( .D(n1450), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[49]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__7_ ( .D(n1440), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[35]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__7_ ( .D(n1430), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[21]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__7_ ( .D(n1420), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[7]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__8_ ( .D(n1410), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[50]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__8_ ( .D(n1400), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[36]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__8_ ( .D(n1390), .CK(clk), .R(n14), .Q(
        FIFO_imag_r[22]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__8_ ( .D(n1380), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[8]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__9_ ( .D(n1370), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[51]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__9_ ( .D(n1360), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[37]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__9_ ( .D(n1350), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[23]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__9_ ( .D(n1340), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[9]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__10_ ( .D(n133), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[52]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__10_ ( .D(n132), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[38]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__10_ ( .D(n131), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[24]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__10_ ( .D(n130), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[10]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__11_ ( .D(n129), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[53]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__11_ ( .D(n128), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[39]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__11_ ( .D(n127), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[25]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__11_ ( .D(n126), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[11]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__12_ ( .D(n125), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[54]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__12_ ( .D(n124), .CK(clk), .R(n1311), .Q(
        FIFO_imag_r[40]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__12_ ( .D(n123), .CK(clk), .R(n12), .Q(
        FIFO_imag_r[26]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__12_ ( .D(n122), .CK(clk), .R(n12), .Q(
        FIFO_imag_r[12]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__13_ ( .D(n121), .CK(clk), .R(n12), .Q(
        FIFO_imag_r[55]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__13_ ( .D(n120), .CK(clk), .R(n12), .Q(
        FIFO_imag_r[41]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2__13_ ( .D(n119), .CK(clk), .R(n12), .Q(
        FIFO_imag_r[27]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3__13_ ( .D(n118), .CK(clk), .R(n12), .Q(
        FIFO_imag_r[13]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_9_ ( .D(data_out_imag_w[9]), .CK(clk), 
        .R(n12), .Q(data_out_imag[9]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_8_ ( .D(data_out_imag_w[8]), .CK(clk), 
        .R(n12), .Q(data_out_imag[8]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_7_ ( .D(data_out_imag_w[7]), .CK(clk), 
        .R(n12), .Q(data_out_imag[7]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_6_ ( .D(data_out_imag_w[6]), .CK(clk), 
        .R(n12), .Q(data_out_imag[6]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_5_ ( .D(data_out_imag_w[5]), .CK(clk), 
        .R(n12), .Q(data_out_imag[5]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_4_ ( .D(data_out_imag_w[4]), .CK(clk), 
        .R(n12), .Q(data_out_imag[4]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_3_ ( .D(data_out_imag_w[3]), .CK(clk), 
        .R(n12), .Q(data_out_imag[3]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_2_ ( .D(data_out_imag_w[2]), .CK(clk), 
        .R(n12), .Q(data_out_imag[2]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_1_ ( .D(data_out_imag_w[1]), .CK(clk), 
        .R(n12), .Q(data_out_imag[1]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_13_ ( .D(data_out_imag_w[13]), .CK(clk), 
        .R(n15), .Q(data_out_imag[13]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_12_ ( .D(data_out_imag_w[12]), .CK(clk), 
        .R(n17), .Q(data_out_imag[12]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_11_ ( .D(data_out_imag_w[11]), .CK(clk), 
        .R(n15), .Q(data_out_imag[11]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_10_ ( .D(data_out_imag_w[10]), .CK(clk), 
        .R(n12), .Q(data_out_imag[10]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_0_ ( .D(data_out_imag_w[0]), .CK(clk), 
        .R(n17), .Q(data_out_imag[0]) );
  DFFRPQ_X2M_A9TL counter_r_reg_1_ ( .D(counter_w[1]), .CK(clk), .R(n16), .Q(
        N13) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_13_ ( .D(data_in_real[13]), .CK(clk), .R(
        n17), .Q(data_in_real_r[13]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_12_ ( .D(data_in_real[12]), .CK(clk), .R(
        n16), .Q(data_in_real_r[12]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_11_ ( .D(data_in_real[11]), .CK(clk), .R(
        n15), .Q(data_in_real_r[11]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_10_ ( .D(data_in_real[10]), .CK(clk), .R(
        n12), .Q(data_in_real_r[10]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_9_ ( .D(data_in_real[9]), .CK(clk), .R(
        n17), .Q(data_in_real_r[9]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_8_ ( .D(data_in_real[8]), .CK(clk), .R(
        n17), .Q(data_in_real_r[8]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_7_ ( .D(data_in_real[7]), .CK(clk), .R(
        n17), .Q(data_in_real_r[7]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_6_ ( .D(data_in_real[6]), .CK(clk), .R(
        n17), .Q(data_in_real_r[6]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_5_ ( .D(data_in_real[5]), .CK(clk), .R(
        n12), .Q(data_in_real_r[5]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_4_ ( .D(data_in_real[4]), .CK(clk), .R(
        n1311), .Q(data_in_real_r[4]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_3_ ( .D(data_in_real[3]), .CK(clk), .R(
        n15), .Q(data_in_real_r[3]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_2_ ( .D(data_in_real[2]), .CK(clk), .R(
        n12), .Q(data_in_real_r[2]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_1_ ( .D(data_in_real[1]), .CK(clk), .R(
        n14), .Q(data_in_real_r[1]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_0_ ( .D(data_in_real[0]), .CK(clk), .R(
        n16), .Q(data_in_real_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__0_ ( .D(n117), .CK(clk), .R(n12), .Q(
        FIFO_real_r[42]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__0_ ( .D(n116), .CK(clk), .R(n15), .Q(
        FIFO_real_r[28]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__0_ ( .D(n115), .CK(clk), .R(n1311), .Q(
        FIFO_real_r[14]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__0_ ( .D(n114), .CK(clk), .R(n15), .Q(
        FIFO_real_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__1_ ( .D(n113), .CK(clk), .R(n12), .Q(
        FIFO_real_r[43]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__1_ ( .D(n112), .CK(clk), .R(n15), .Q(
        FIFO_real_r[29]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__1_ ( .D(n111), .CK(clk), .R(n16), .Q(
        FIFO_real_r[15]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__1_ ( .D(n110), .CK(clk), .R(n1311), .Q(
        FIFO_real_r[1]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__2_ ( .D(n109), .CK(clk), .R(n14), .Q(
        FIFO_real_r[44]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__2_ ( .D(n108), .CK(clk), .R(n16), .Q(
        FIFO_real_r[30]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__2_ ( .D(n107), .CK(clk), .R(n16), .Q(
        FIFO_real_r[16]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__2_ ( .D(n106), .CK(clk), .R(n16), .Q(
        FIFO_real_r[2]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__3_ ( .D(n105), .CK(clk), .R(n17), .Q(
        FIFO_real_r[45]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__3_ ( .D(n104), .CK(clk), .R(n16), .Q(
        FIFO_real_r[31]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__3_ ( .D(n103), .CK(clk), .R(n16), .Q(
        FIFO_real_r[17]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__3_ ( .D(n102), .CK(clk), .R(n16), .Q(
        FIFO_real_r[3]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__4_ ( .D(n101), .CK(clk), .R(n16), .Q(
        FIFO_real_r[46]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__4_ ( .D(n100), .CK(clk), .R(n14), .Q(
        FIFO_real_r[32]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__4_ ( .D(n99), .CK(clk), .R(n17), .Q(
        FIFO_real_r[18]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__4_ ( .D(n98), .CK(clk), .R(n16), .Q(
        FIFO_real_r[4]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__5_ ( .D(n97), .CK(clk), .R(n17), .Q(
        FIFO_real_r[47]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__5_ ( .D(n96), .CK(clk), .R(n16), .Q(
        FIFO_real_r[33]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__5_ ( .D(n95), .CK(clk), .R(n12), .Q(
        FIFO_real_r[19]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__5_ ( .D(n94), .CK(clk), .R(n15), .Q(
        FIFO_real_r[5]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__6_ ( .D(n93), .CK(clk), .R(n17), .Q(
        FIFO_real_r[48]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__6_ ( .D(n92), .CK(clk), .R(n17), .Q(
        FIFO_real_r[34]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__6_ ( .D(n91), .CK(clk), .R(n12), .Q(
        FIFO_real_r[20]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__6_ ( .D(n90), .CK(clk), .R(n15), .Q(
        FIFO_real_r[6]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__7_ ( .D(n89), .CK(clk), .R(n16), .Q(
        FIFO_real_r[49]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__7_ ( .D(n88), .CK(clk), .R(n17), .Q(
        FIFO_real_r[35]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__7_ ( .D(n87), .CK(clk), .R(n17), .Q(
        FIFO_real_r[21]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__7_ ( .D(n86), .CK(clk), .R(n16), .Q(
        FIFO_real_r[7]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__8_ ( .D(n85), .CK(clk), .R(n12), .Q(
        FIFO_real_r[50]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__8_ ( .D(n84), .CK(clk), .R(n17), .Q(
        FIFO_real_r[36]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__8_ ( .D(n83), .CK(clk), .R(n17), .Q(
        FIFO_real_r[22]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__8_ ( .D(n82), .CK(clk), .R(n15), .Q(
        FIFO_real_r[8]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__9_ ( .D(n81), .CK(clk), .R(n17), .Q(
        FIFO_real_r[51]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__9_ ( .D(n80), .CK(clk), .R(n17), .Q(
        FIFO_real_r[37]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__9_ ( .D(n79), .CK(clk), .R(n1311), .Q(
        FIFO_real_r[23]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__9_ ( .D(n78), .CK(clk), .R(n17), .Q(
        FIFO_real_r[9]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__10_ ( .D(n77), .CK(clk), .R(n17), .Q(
        FIFO_real_r[52]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__10_ ( .D(n76), .CK(clk), .R(n16), .Q(
        FIFO_real_r[38]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__10_ ( .D(n75), .CK(clk), .R(n14), .Q(
        FIFO_real_r[24]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__10_ ( .D(n74), .CK(clk), .R(n16), .Q(
        FIFO_real_r[10]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__11_ ( .D(n73), .CK(clk), .R(n17), .Q(
        FIFO_real_r[53]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__11_ ( .D(n72), .CK(clk), .R(n16), .Q(
        FIFO_real_r[39]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__11_ ( .D(n71), .CK(clk), .R(n17), .Q(
        FIFO_real_r[25]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__11_ ( .D(n70), .CK(clk), .R(n12), .Q(
        FIFO_real_r[11]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__12_ ( .D(n69), .CK(clk), .R(n12), .Q(
        FIFO_real_r[54]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__12_ ( .D(n68), .CK(clk), .R(n15), .Q(
        FIFO_real_r[40]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__12_ ( .D(n67), .CK(clk), .R(n15), .Q(
        FIFO_real_r[26]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__12_ ( .D(n66), .CK(clk), .R(n12), .Q(
        FIFO_real_r[12]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__13_ ( .D(n65), .CK(clk), .R(n1311), .Q(
        FIFO_real_r[55]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__13_ ( .D(n64), .CK(clk), .R(n15), .Q(
        FIFO_real_r[41]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2__13_ ( .D(n63), .CK(clk), .R(n16), .Q(
        FIFO_real_r[27]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3__13_ ( .D(n62), .CK(clk), .R(n16), .Q(
        FIFO_real_r[13]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_0_ ( .D(data_out_real_w[0]), .CK(clk), 
        .R(n14), .Q(data_out_real[0]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_1_ ( .D(data_out_real_w[1]), .CK(clk), 
        .R(n17), .Q(data_out_real[1]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_2_ ( .D(data_out_real_w[2]), .CK(clk), 
        .R(n16), .Q(data_out_real[2]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_3_ ( .D(data_out_real_w[3]), .CK(clk), 
        .R(n15), .Q(data_out_real[3]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_4_ ( .D(data_out_real_w[4]), .CK(clk), 
        .R(n12), .Q(data_out_real[4]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_5_ ( .D(data_out_real_w[5]), .CK(clk), 
        .R(n16), .Q(data_out_real[5]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_6_ ( .D(data_out_real_w[6]), .CK(clk), 
        .R(n14), .Q(data_out_real[6]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_7_ ( .D(data_out_real_w[7]), .CK(clk), 
        .R(n12), .Q(data_out_real[7]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_8_ ( .D(data_out_real_w[8]), .CK(clk), 
        .R(n1311), .Q(data_out_real[8]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_9_ ( .D(data_out_real_w[9]), .CK(clk), 
        .R(n15), .Q(data_out_real[9]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_10_ ( .D(data_out_real_w[10]), .CK(clk), 
        .R(n12), .Q(data_out_real[10]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_11_ ( .D(data_out_real_w[11]), .CK(clk), 
        .R(n15), .Q(data_out_real[11]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_12_ ( .D(data_out_real_w[12]), .CK(clk), 
        .R(n12), .Q(data_out_real[12]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_13_ ( .D(data_out_real_w[13]), .CK(clk), 
        .R(n16), .Q(data_out_real[13]) );
  FFT_8_DATA_WIDTH14_DW01_add_0 add_485 ( .A(FIFO_imag_r[13:0]), .B(
        data_in_imag_r), .SUM({N217, N216, N215, N214, N213, N212, N211, N210, 
        N209, N208, N207, N206, N205, N204}) );
  FFT_8_DATA_WIDTH14_DW01_add_1 add_484 ( .A(FIFO_real_r[13:0]), .B(
        data_in_real_r), .SUM({N203, N202, N201, N200, N199, N198, N197, N196, 
        N195, N194, N193, N192, N191, N190}) );
  FFT_8_DATA_WIDTH14_DW01_sub_0 sub_482_2 ( .A(FIFO_imag_r[13:0]), .B(
        data_in_imag_r), .DIFF({N189, N188, N187, N186, N185, N184, N183, N182, 
        N181, N180, N179, N178, N177, N176}) );
  FFT_8_DATA_WIDTH14_DW01_sub_1 sub_482 ( .A(FIFO_real_r[13:0]), .B(
        data_in_real_r), .DIFF({N175, N174, N173, N172, N171, N170, N169, N168, 
        N167, N166, N165, N164, N163, N162}) );
  FFT_8_DATA_WIDTH14_DW_mult_tc_3 r336 ( .a(FIFO_real_r[13:0]), .b_6_(N41), 
        .b_1_(N47), .b_0_(N47), .product_19_(N1130), .product_18_(N1120), 
        .product_17_(N1110), .product_16_(N1100), .product_15_(N1090), 
        .product_14_(N1080), .product_13_(N1070), .product_12_(N1060), 
        .product_11_(N1050), .product_10_(N1040), .product_9_(N1030), 
        .product_8_(N1020), .product_7_(N1010), .product_6_(N1000), 
        .product_5_(N990), .product_4_(N980), .product_3_(N970), .product_2_(
        N960), .product_1_(N950), .product_0_(N940) );
  FFT_8_DATA_WIDTH14_DW_mult_tc_2 r337 ( .a(FIFO_imag_r[13:0]), .b({N38, N33, 
        N37, N38, N37, N37, N38, N47}), .product_19_(N1330), .product_18_(
        N1320), .product_17_(N1310), .product_16_(N1300), .product_15_(N1290), 
        .product_14_(N1280), .product_13_(N1270), .product_12_(N1260), 
        .product_11_(N1250), .product_10_(N1240), .product_9_(N1230), 
        .product_8_(N1220), .product_7_(N1210), .product_6_(N1200), 
        .product_5_(N1190), .product_4_(N1180), .product_3_(N1170), 
        .product_2_(N1160), .product_1_(N1150), .product_0_(N1140) );
  FFT_8_DATA_WIDTH14_DW01_add_2 r339 ( .A({N1130, N1120, N1110, N1100, N1090, 
        N1080, N1070, N1060, N1050, N1040, N1030, N1020, N1010, N1000, N990, 
        N980, N970, N960, N950, N940}), .B({N1330, N1320, N1310, N1300, N1290, 
        N1280, N1270, N1260, N1250, N1240, N1230, N1220, N1210, N1200, N1190, 
        N1180, N1170, N1160, N1150, N1140}), .SUM_19_(N161), .SUM_18_(N160), 
        .SUM_17_(N159), .SUM_16_(N158), .SUM_15_(N157), .SUM_14_(N156), 
        .SUM_13_(N155), .SUM_12_(N154), .SUM_11_(N153), .SUM_10_(N152), 
        .SUM_9_(N151), .SUM_8_(N150), .SUM_7_(N149), .SUM_6_(N148) );
  FFT_8_DATA_WIDTH14_DW_mult_tc_1 r334 ( .a(FIFO_real_r[13:0]), .b({N38, N33, 
        N37, N38, N37, N37, N38, N47}), .product_19_(N730), .product_18_(N720), 
        .product_17_(N710), .product_16_(N700), .product_15_(N690), 
        .product_14_(N680), .product_13_(N670), .product_12_(N660), 
        .product_11_(N650), .product_10_(N640), .product_9_(N630), 
        .product_8_(N620), .product_7_(N610), .product_6_(N600), .product_5_(
        N590), .product_4_(N580), .product_3_(N570), .product_2_(N56), 
        .product_1_(N550), .product_0_(N540) );
  FFT_8_DATA_WIDTH14_DW_mult_tc_0 r335 ( .a(FIFO_imag_r[13:0]), .b_6_(N41), 
        .b_1_(N47), .b_0_(N47), .product_19_(N930), .product_18_(N920), 
        .product_17_(N910), .product_16_(N900), .product_15_(N890), 
        .product_14_(N880), .product_13_(N870), .product_12_(N860), 
        .product_11_(N850), .product_10_(N840), .product_9_(N830), 
        .product_8_(N820), .product_7_(N810), .product_6_(N800), .product_5_(
        N790), .product_4_(N780), .product_3_(N770), .product_2_(N760), 
        .product_1_(N750), .product_0_(N740) );
  FFT_8_DATA_WIDTH14_DW01_sub_2 r338 ( .A({N730, N720, N710, N700, N690, N680, 
        N670, N660, N650, N640, N630, N620, N610, N600, N590, N580, N570, N56, 
        N550, N540}), .B({N930, N920, N910, N900, N890, N880, N870, N860, N850, 
        N840, N830, N820, N810, N800, N790, N780, N770, N760, N750, N740}), 
        .DIFF_19_(N147), .DIFF_18_(N146), .DIFF_17_(N145), .DIFF_16_(N144), 
        .DIFF_15_(N143), .DIFF_14_(N142), .DIFF_13_(N141), .DIFF_12_(N140), 
        .DIFF_11_(N139), .DIFF_10_(N138), .DIFF_9_(N137), .DIFF_8_(N136), 
        .DIFF_7_(N135), .DIFF_6_(N134) );
  DFFRPQ_X2M_A9TL counter_r_reg_0_ ( .D(counter_w[0]), .CK(clk), .R(n15), .Q(
        N47) );
  TIELO_X1M_A9TL U3 ( .Y(net10059) );
  BUF_X1M_A9TH U4 ( .A(n11), .Y(n9) );
  BUF_X1M_A9TH U5 ( .A(n11), .Y(n8) );
  BUF_X1M_A9TH U6 ( .A(n11), .Y(n10) );
  INV_X1B_A9TL U7 ( .A(n6), .Y(n11) );
  NOR2_X1A_A9TL U8 ( .A(n18), .B(n19), .Y(N38) );
  NOR2_X1A_A9TL U9 ( .A(N13), .B(n19), .Y(N37) );
  BUFH_X1M_A9TL U10 ( .A(n7), .Y(n5) );
  BUFH_X1M_A9TL U11 ( .A(n7), .Y(n6) );
  BUFH_X1M_A9TL U12 ( .A(n17), .Y(n15) );
  BUFH_X1M_A9TL U13 ( .A(n17), .Y(n12) );
  BUFH_X1M_A9TL U14 ( .A(n14), .Y(n1311) );
  BUFH_X1M_A9TL U15 ( .A(n17), .Y(n14) );
  BUFH_X1M_A9TL U16 ( .A(n17), .Y(n16) );
  BUFH_X1M_A9TL U17 ( .A(n20), .Y(n7) );
  INV_X1M_A9TL U18 ( .A(rst_n), .Y(n17) );
  BUFH_X1M_A9TL U19 ( .A(n22), .Y(n4) );
  NOR2_X1A_A9TL U20 ( .A(n52), .B(n1), .Y(n20) );
  NOR2_X1A_A9TL U21 ( .A(n2), .B(n5), .Y(n22) );
  BUFH_X1M_A9TL U22 ( .A(n23), .Y(n3) );
  INV_X1M_A9TL U23 ( .A(n2), .Y(n1) );
  INV_X1M_A9TL U24 ( .A(N47), .Y(n19) );
  AO22_X1M_A9TL U25 ( .A0(N146), .A1(n52), .B0(N202), .B1(n60), .Y(
        data_out_real_w[12]) );
  AO22_X1M_A9TL U26 ( .A0(N145), .A1(n52), .B0(N201), .B1(n60), .Y(
        data_out_real_w[11]) );
  AO22_X1M_A9TL U27 ( .A0(N144), .A1(n52), .B0(N200), .B1(n60), .Y(
        data_out_real_w[10]) );
  AO22_X1M_A9TL U28 ( .A0(N143), .A1(n52), .B0(N199), .B1(n1), .Y(
        data_out_real_w[9]) );
  AO22_X1M_A9TL U29 ( .A0(N142), .A1(n52), .B0(N198), .B1(n60), .Y(
        data_out_real_w[8]) );
  AO22_X1M_A9TL U30 ( .A0(N141), .A1(n52), .B0(N197), .B1(n60), .Y(
        data_out_real_w[7]) );
  AO22_X1M_A9TL U31 ( .A0(N140), .A1(n52), .B0(N196), .B1(n60), .Y(
        data_out_real_w[6]) );
  AO22_X1M_A9TL U32 ( .A0(N139), .A1(n52), .B0(N195), .B1(n60), .Y(
        data_out_real_w[5]) );
  AO22_X1M_A9TL U33 ( .A0(N138), .A1(n52), .B0(N194), .B1(n60), .Y(
        data_out_real_w[4]) );
  AO22_X1M_A9TL U34 ( .A0(N137), .A1(n52), .B0(N193), .B1(n60), .Y(
        data_out_real_w[3]) );
  AO22_X1M_A9TL U35 ( .A0(N136), .A1(n52), .B0(N192), .B1(n60), .Y(
        data_out_real_w[2]) );
  AO22_X1M_A9TL U36 ( .A0(N135), .A1(n52), .B0(N191), .B1(n60), .Y(
        data_out_real_w[1]) );
  AO22_X1M_A9TL U37 ( .A0(N158), .A1(n52), .B0(N214), .B1(n1), .Y(
        data_out_imag_w[10]) );
  AO22_X1M_A9TL U38 ( .A0(N159), .A1(n52), .B0(N215), .B1(n1), .Y(
        data_out_imag_w[11]) );
  AO22_X1M_A9TL U39 ( .A0(N160), .A1(n52), .B0(N216), .B1(n1), .Y(
        data_out_imag_w[12]) );
  AO22_X1M_A9TL U40 ( .A0(N150), .A1(n52), .B0(N206), .B1(n1), .Y(
        data_out_imag_w[2]) );
  AO22_X1M_A9TL U41 ( .A0(N151), .A1(n52), .B0(N207), .B1(n1), .Y(
        data_out_imag_w[3]) );
  AO22_X1M_A9TL U42 ( .A0(N152), .A1(n52), .B0(N208), .B1(n1), .Y(
        data_out_imag_w[4]) );
  AO22_X1M_A9TL U43 ( .A0(N153), .A1(n52), .B0(N209), .B1(n1), .Y(
        data_out_imag_w[5]) );
  AO22_X1M_A9TL U44 ( .A0(N154), .A1(n52), .B0(N210), .B1(n1), .Y(
        data_out_imag_w[6]) );
  AO22_X1M_A9TL U45 ( .A0(N155), .A1(n52), .B0(N211), .B1(n1), .Y(
        data_out_imag_w[7]) );
  AO22_X1M_A9TL U46 ( .A0(N156), .A1(n52), .B0(N212), .B1(n1), .Y(
        data_out_imag_w[8]) );
  AO22_X1M_A9TL U47 ( .A0(N157), .A1(n52), .B0(N213), .B1(n1), .Y(
        data_out_imag_w[9]) );
  AO22_X1M_A9TL U48 ( .A0(N149), .A1(n52), .B0(N205), .B1(n1), .Y(
        data_out_imag_w[1]) );
  OAI222_X1M_A9TL U49 ( .A0(n53), .A1(n1750), .B0(n51), .B1(n59), .C0(valid_in), .C1(n2), .Y(N28) );
  NOR2_X1A_A9TL U50 ( .A(n51), .B(n7), .Y(n23) );
  NAND2_X1A_A9TL U51 ( .A(n54), .B(n51), .Y(n52) );
  INV_X1M_A9TL U52 ( .A(n59), .Y(n53) );
  INV_X1M_A9TL U53 ( .A(n60), .Y(n2) );
  AO22_X1M_A9TL U54 ( .A0(N147), .A1(n52), .B0(N203), .B1(n60), .Y(
        data_out_real_w[13]) );
  INV_X1M_A9TL U55 ( .A(N13), .Y(n18) );
  AO22_X1M_A9TL U56 ( .A0(N161), .A1(n52), .B0(N217), .B1(n1), .Y(
        data_out_imag_w[13]) );
  AO22_X1M_A9TL U57 ( .A0(N134), .A1(n52), .B0(N190), .B1(n60), .Y(
        data_out_real_w[0]) );
  AO22_X1M_A9TL U58 ( .A0(N148), .A1(n52), .B0(N204), .B1(n1), .Y(
        data_out_imag_w[0]) );
  AO1B2_X1M_A9TL U59 ( .B0(n6), .B1(FIFO_real_r[52]), .A0N(n26), .Y(n77) );
  AOI22_X1M_A9TL U60 ( .A0(N172), .A1(n4), .B0(data_in_real_r[10]), .B1(n3), 
        .Y(n26) );
  AO1B2_X1M_A9TL U61 ( .B0(n5), .B1(FIFO_imag_r[52]), .A0N(n40), .Y(n133) );
  AOI22_X1M_A9TL U62 ( .A0(N186), .A1(n22), .B0(data_in_imag_r[10]), .B1(n3), 
        .Y(n40) );
  AO1B2_X1M_A9TL U63 ( .B0(n5), .B1(FIFO_real_r[55]), .A0N(n21), .Y(n65) );
  AOI22_X1M_A9TL U64 ( .A0(N175), .A1(n4), .B0(data_in_real_r[13]), .B1(n3), 
        .Y(n21) );
  AO1B2_X1M_A9TL U65 ( .B0(n6), .B1(FIFO_imag_r[55]), .A0N(n370), .Y(n121) );
  AOI22_X1M_A9TL U66 ( .A0(N189), .A1(n22), .B0(data_in_imag_r[13]), .B1(n3), 
        .Y(n370) );
  AO1B2_X1M_A9TL U67 ( .B0(n5), .B1(FIFO_real_r[54]), .A0N(n24), .Y(n69) );
  AOI22_X1M_A9TL U68 ( .A0(N174), .A1(n4), .B0(data_in_real_r[12]), .B1(n3), 
        .Y(n24) );
  AO1B2_X1M_A9TL U69 ( .B0(n5), .B1(FIFO_real_r[53]), .A0N(n25), .Y(n73) );
  AOI22_X1M_A9TL U70 ( .A0(N173), .A1(n4), .B0(data_in_real_r[11]), .B1(n3), 
        .Y(n25) );
  AO1B2_X1M_A9TL U71 ( .B0(n5), .B1(FIFO_imag_r[54]), .A0N(n380), .Y(n125) );
  AOI22_X1M_A9TL U72 ( .A0(N188), .A1(n4), .B0(data_in_imag_r[12]), .B1(n23), 
        .Y(n380) );
  AO1B2_X1M_A9TL U73 ( .B0(n5), .B1(FIFO_imag_r[53]), .A0N(n39), .Y(n129) );
  AOI22_X1M_A9TL U74 ( .A0(N187), .A1(n4), .B0(data_in_imag_r[11]), .B1(n23), 
        .Y(n39) );
  AO1B2_X1M_A9TL U75 ( .B0(n6), .B1(FIFO_real_r[51]), .A0N(n270), .Y(n81) );
  AOI22_X1M_A9TL U76 ( .A0(N171), .A1(n4), .B0(data_in_real_r[9]), .B1(n3), 
        .Y(n270) );
  AO1B2_X1M_A9TL U77 ( .B0(n6), .B1(FIFO_real_r[50]), .A0N(n280), .Y(n85) );
  AOI22_X1M_A9TL U78 ( .A0(N170), .A1(n4), .B0(data_in_real_r[8]), .B1(n3), 
        .Y(n280) );
  AO1B2_X1M_A9TL U79 ( .B0(n5), .B1(FIFO_real_r[49]), .A0N(n29), .Y(n89) );
  AOI22_X1M_A9TL U80 ( .A0(N169), .A1(n4), .B0(data_in_real_r[7]), .B1(n3), 
        .Y(n29) );
  AO1B2_X1M_A9TL U81 ( .B0(n6), .B1(FIFO_imag_r[51]), .A0N(n410), .Y(n1370) );
  AOI22_X1M_A9TL U82 ( .A0(N185), .A1(n22), .B0(data_in_imag_r[9]), .B1(n23), 
        .Y(n410) );
  AO1B2_X1M_A9TL U83 ( .B0(n6), .B1(FIFO_imag_r[50]), .A0N(n42), .Y(n1410) );
  AOI22_X1M_A9TL U84 ( .A0(N184), .A1(n22), .B0(data_in_imag_r[8]), .B1(n23), 
        .Y(n42) );
  AO1B2_X1M_A9TL U85 ( .B0(n5), .B1(FIFO_imag_r[49]), .A0N(n43), .Y(n1450) );
  AOI22_X1M_A9TL U86 ( .A0(N183), .A1(n22), .B0(data_in_imag_r[7]), .B1(n23), 
        .Y(n43) );
  NAND2_X1A_A9TL U87 ( .A(state_r[0]), .B(n1750), .Y(n51) );
  NOR2_X1A_A9TL U88 ( .A(n57), .B(n58), .Y(counter_w[1]) );
  XNOR2_X0P7M_A9TL U89 ( .A(N13), .B(N47), .Y(n58) );
  INV_X1M_A9TL U90 ( .A(state_r[1]), .Y(n1750) );
  NOR2_X1A_A9TL U91 ( .A(state_r[1]), .B(state_r[0]), .Y(n57) );
  NAND2_X1A_A9TL U92 ( .A(state_r[0]), .B(state_r[1]), .Y(n54) );
  NAND2_X1A_A9TL U93 ( .A(N47), .B(N13), .Y(n59) );
  OAI21_X1M_A9TL U94 ( .A0(n53), .A1(n1760), .B0(n61), .Y(N27) );
  AOI32_X1M_A9TL U95 ( .A0(n1760), .A1(n1750), .A2(valid_in), .B0(n53), .B1(n1), .Y(n61) );
  INV_X1M_A9TL U96 ( .A(state_r[0]), .Y(n1760) );
  NAND3_X1A_A9TL U97 ( .A(n2), .B(n55), .C(n54), .Y(n1740) );
  NAND2_X1A_A9TL U98 ( .A(valid_out), .B(n560), .Y(n55) );
  INV_X1M_A9TL U99 ( .A(n51), .Y(n560) );
  AO22_X1M_A9TL U100 ( .A0(n10), .A1(FIFO_real_r[14]), .B0(FIFO_real_r[0]), 
        .B1(n7), .Y(n114) );
  AO22_X1M_A9TL U101 ( .A0(n9), .A1(FIFO_imag_r[14]), .B0(FIFO_imag_r[0]), 
        .B1(n7), .Y(n1660) );
  AO22_X1M_A9TL U102 ( .A0(n11), .A1(FIFO_real_r[27]), .B0(FIFO_real_r[13]), 
        .B1(n7), .Y(n62) );
  AO22_X1M_A9TL U103 ( .A0(n8), .A1(FIFO_imag_r[27]), .B0(FIFO_imag_r[13]), 
        .B1(n6), .Y(n118) );
  AO22_X1M_A9TL U104 ( .A0(n11), .A1(FIFO_real_r[25]), .B0(FIFO_real_r[11]), 
        .B1(n7), .Y(n70) );
  AO22_X1M_A9TL U105 ( .A0(n10), .A1(FIFO_imag_r[25]), .B0(FIFO_imag_r[11]), 
        .B1(n6), .Y(n126) );
  AO22_X1M_A9TL U106 ( .A0(n11), .A1(FIFO_real_r[26]), .B0(FIFO_real_r[12]), 
        .B1(n7), .Y(n66) );
  AO22_X1M_A9TL U107 ( .A0(n8), .A1(FIFO_imag_r[26]), .B0(FIFO_imag_r[12]), 
        .B1(n7), .Y(n122) );
  AO22_X1M_A9TL U108 ( .A0(n8), .A1(FIFO_real_r[24]), .B0(FIFO_real_r[10]), 
        .B1(n7), .Y(n74) );
  AO22_X1M_A9TL U109 ( .A0(n11), .A1(FIFO_real_r[23]), .B0(FIFO_real_r[9]), 
        .B1(n6), .Y(n78) );
  AO22_X1M_A9TL U110 ( .A0(n11), .A1(FIFO_real_r[22]), .B0(FIFO_real_r[8]), 
        .B1(n7), .Y(n82) );
  AO22_X1M_A9TL U111 ( .A0(n9), .A1(FIFO_real_r[21]), .B0(FIFO_real_r[7]), 
        .B1(n6), .Y(n86) );
  AO22_X1M_A9TL U112 ( .A0(n10), .A1(FIFO_real_r[20]), .B0(FIFO_real_r[6]), 
        .B1(n6), .Y(n90) );
  AO22_X1M_A9TL U113 ( .A0(n11), .A1(FIFO_real_r[19]), .B0(FIFO_real_r[5]), 
        .B1(n7), .Y(n94) );
  AO22_X1M_A9TL U114 ( .A0(n9), .A1(FIFO_real_r[18]), .B0(FIFO_real_r[4]), 
        .B1(n7), .Y(n98) );
  AO22_X1M_A9TL U115 ( .A0(n10), .A1(FIFO_real_r[17]), .B0(FIFO_real_r[3]), 
        .B1(n6), .Y(n102) );
  AO22_X1M_A9TL U116 ( .A0(n10), .A1(FIFO_real_r[16]), .B0(FIFO_real_r[2]), 
        .B1(n7), .Y(n106) );
  AO22_X1M_A9TL U117 ( .A0(n9), .A1(FIFO_real_r[15]), .B0(FIFO_real_r[1]), 
        .B1(n6), .Y(n110) );
  AO22_X1M_A9TL U118 ( .A0(n9), .A1(FIFO_imag_r[24]), .B0(FIFO_imag_r[10]), 
        .B1(n5), .Y(n130) );
  AO22_X1M_A9TL U119 ( .A0(n9), .A1(FIFO_imag_r[23]), .B0(FIFO_imag_r[9]), 
        .B1(n7), .Y(n1340) );
  AO22_X1M_A9TL U120 ( .A0(n11), .A1(FIFO_imag_r[22]), .B0(FIFO_imag_r[8]), 
        .B1(n6), .Y(n1380) );
  AO22_X1M_A9TL U121 ( .A0(n8), .A1(FIFO_imag_r[21]), .B0(FIFO_imag_r[7]), 
        .B1(n6), .Y(n1420) );
  AO22_X1M_A9TL U122 ( .A0(n11), .A1(FIFO_imag_r[20]), .B0(FIFO_imag_r[6]), 
        .B1(n7), .Y(n1460) );
  AO22_X1M_A9TL U123 ( .A0(n9), .A1(FIFO_imag_r[19]), .B0(FIFO_imag_r[5]), 
        .B1(n7), .Y(n1500) );
  AO22_X1M_A9TL U124 ( .A0(n8), .A1(FIFO_imag_r[18]), .B0(FIFO_imag_r[4]), 
        .B1(n6), .Y(n1540) );
  AO22_X1M_A9TL U125 ( .A0(n11), .A1(FIFO_imag_r[17]), .B0(FIFO_imag_r[3]), 
        .B1(n5), .Y(n1580) );
  AO22_X1M_A9TL U126 ( .A0(n11), .A1(FIFO_imag_r[16]), .B0(FIFO_imag_r[2]), 
        .B1(n6), .Y(n1620) );
  AO22_X1M_A9TL U127 ( .A0(n11), .A1(FIFO_imag_r[15]), .B0(FIFO_imag_r[1]), 
        .B1(n7), .Y(n1700) );
  AO1B2_X1M_A9TL U128 ( .B0(n5), .B1(FIFO_real_r[42]), .A0N(n36), .Y(n117) );
  AOI22_X1M_A9TL U129 ( .A0(N162), .A1(n4), .B0(data_in_real_r[0]), .B1(n3), 
        .Y(n36) );
  AO1B2_X1M_A9TL U130 ( .B0(n5), .B1(FIFO_imag_r[42]), .A0N(n49), .Y(n1690) );
  AOI22_X1M_A9TL U131 ( .A0(N176), .A1(n22), .B0(data_in_imag_r[0]), .B1(n23), 
        .Y(n49) );
  AO1B2_X1M_A9TL U132 ( .B0(n6), .B1(FIFO_real_r[48]), .A0N(n30), .Y(n93) );
  AOI22_X1M_A9TL U133 ( .A0(N168), .A1(n4), .B0(data_in_real_r[6]), .B1(n3), 
        .Y(n30) );
  AO1B2_X1M_A9TL U134 ( .B0(n5), .B1(FIFO_real_r[47]), .A0N(n31), .Y(n97) );
  AOI22_X1M_A9TL U135 ( .A0(N167), .A1(n4), .B0(data_in_real_r[5]), .B1(n3), 
        .Y(n31) );
  AO1B2_X1M_A9TL U136 ( .B0(n5), .B1(FIFO_real_r[46]), .A0N(n32), .Y(n101) );
  AOI22_X1M_A9TL U137 ( .A0(N166), .A1(n4), .B0(data_in_real_r[4]), .B1(n3), 
        .Y(n32) );
  AO1B2_X1M_A9TL U138 ( .B0(n6), .B1(FIFO_real_r[45]), .A0N(n330), .Y(n105) );
  AOI22_X1M_A9TL U139 ( .A0(N165), .A1(n4), .B0(data_in_real_r[3]), .B1(n3), 
        .Y(n330) );
  AO1B2_X1M_A9TL U140 ( .B0(n6), .B1(FIFO_real_r[44]), .A0N(n34), .Y(n109) );
  AOI22_X1M_A9TL U141 ( .A0(N164), .A1(n4), .B0(data_in_real_r[2]), .B1(n3), 
        .Y(n34) );
  AO1B2_X1M_A9TL U142 ( .B0(n5), .B1(FIFO_real_r[43]), .A0N(n35), .Y(n113) );
  AOI22_X1M_A9TL U143 ( .A0(N163), .A1(n4), .B0(data_in_real_r[1]), .B1(n3), 
        .Y(n35) );
  AO1B2_X1M_A9TL U144 ( .B0(n5), .B1(FIFO_imag_r[48]), .A0N(n44), .Y(n1490) );
  AOI22_X1M_A9TL U145 ( .A0(N182), .A1(n22), .B0(data_in_imag_r[6]), .B1(n23), 
        .Y(n44) );
  AO1B2_X1M_A9TL U146 ( .B0(n5), .B1(FIFO_imag_r[47]), .A0N(n45), .Y(n1530) );
  AOI22_X1M_A9TL U147 ( .A0(N181), .A1(n22), .B0(data_in_imag_r[5]), .B1(n23), 
        .Y(n45) );
  AO1B2_X1M_A9TL U148 ( .B0(n5), .B1(FIFO_imag_r[46]), .A0N(n46), .Y(n1570) );
  AOI22_X1M_A9TL U149 ( .A0(N180), .A1(n22), .B0(data_in_imag_r[4]), .B1(n23), 
        .Y(n46) );
  AO1B2_X1M_A9TL U150 ( .B0(n5), .B1(FIFO_imag_r[45]), .A0N(n470), .Y(n1610)
         );
  AOI22_X1M_A9TL U151 ( .A0(N179), .A1(n22), .B0(data_in_imag_r[3]), .B1(n23), 
        .Y(n470) );
  AO1B2_X1M_A9TL U152 ( .B0(n7), .B1(FIFO_imag_r[44]), .A0N(n48), .Y(n1650) );
  AOI22_X1M_A9TL U153 ( .A0(N178), .A1(n22), .B0(data_in_imag_r[2]), .B1(n23), 
        .Y(n48) );
  AO1B2_X1M_A9TL U154 ( .B0(n7), .B1(FIFO_imag_r[43]), .A0N(n50), .Y(n1730) );
  AOI22_X1M_A9TL U155 ( .A0(N177), .A1(n22), .B0(data_in_imag_r[1]), .B1(n23), 
        .Y(n50) );
  NOR2_X1A_A9TL U156 ( .A(N47), .B(n57), .Y(counter_w[0]) );
  NOR2_X1A_A9TL U157 ( .A(n1750), .B(state_r[0]), .Y(n60) );
  AO22_X1M_A9TL U158 ( .A0(n11), .A1(FIFO_real_r[41]), .B0(n5), .B1(
        FIFO_real_r[27]), .Y(n63) );
  AO22_X1M_A9TL U159 ( .A0(n11), .A1(FIFO_real_r[40]), .B0(n5), .B1(
        FIFO_real_r[26]), .Y(n67) );
  AO22_X1M_A9TL U160 ( .A0(n11), .A1(FIFO_real_r[39]), .B0(n5), .B1(
        FIFO_real_r[25]), .Y(n71) );
  AO22_X1M_A9TL U161 ( .A0(n9), .A1(FIFO_real_r[38]), .B0(n20), .B1(
        FIFO_real_r[24]), .Y(n75) );
  AO22_X1M_A9TL U162 ( .A0(n10), .A1(FIFO_real_r[37]), .B0(n6), .B1(
        FIFO_real_r[23]), .Y(n79) );
  AO22_X1M_A9TL U163 ( .A0(n10), .A1(FIFO_real_r[36]), .B0(n6), .B1(
        FIFO_real_r[22]), .Y(n83) );
  AO22_X1M_A9TL U164 ( .A0(n8), .A1(FIFO_real_r[35]), .B0(n6), .B1(
        FIFO_real_r[21]), .Y(n87) );
  AO22_X1M_A9TL U165 ( .A0(n10), .A1(FIFO_real_r[34]), .B0(n5), .B1(
        FIFO_real_r[20]), .Y(n91) );
  AO22_X1M_A9TL U166 ( .A0(n9), .A1(FIFO_real_r[33]), .B0(n5), .B1(
        FIFO_real_r[19]), .Y(n95) );
  AO22_X1M_A9TL U167 ( .A0(n9), .A1(FIFO_real_r[32]), .B0(n6), .B1(
        FIFO_real_r[18]), .Y(n99) );
  AO22_X1M_A9TL U168 ( .A0(n10), .A1(FIFO_real_r[31]), .B0(n6), .B1(
        FIFO_real_r[17]), .Y(n103) );
  AO22_X1M_A9TL U169 ( .A0(n8), .A1(FIFO_real_r[30]), .B0(n6), .B1(
        FIFO_real_r[16]), .Y(n107) );
  AO22_X1M_A9TL U170 ( .A0(n10), .A1(FIFO_real_r[29]), .B0(n6), .B1(
        FIFO_real_r[15]), .Y(n111) );
  AO22_X1M_A9TL U171 ( .A0(n9), .A1(FIFO_real_r[28]), .B0(n6), .B1(
        FIFO_real_r[14]), .Y(n115) );
  AO22_X1M_A9TL U172 ( .A0(n11), .A1(FIFO_imag_r[41]), .B0(n7), .B1(
        FIFO_imag_r[27]), .Y(n119) );
  AO22_X1M_A9TL U173 ( .A0(n8), .A1(FIFO_imag_r[40]), .B0(n7), .B1(
        FIFO_imag_r[26]), .Y(n123) );
  AO22_X1M_A9TL U174 ( .A0(n8), .A1(FIFO_imag_r[39]), .B0(n7), .B1(
        FIFO_imag_r[25]), .Y(n127) );
  AO22_X1M_A9TL U175 ( .A0(n9), .A1(FIFO_imag_r[38]), .B0(n20), .B1(
        FIFO_imag_r[24]), .Y(n131) );
  AO22_X1M_A9TL U176 ( .A0(n11), .A1(FIFO_imag_r[37]), .B0(n20), .B1(
        FIFO_imag_r[23]), .Y(n1350) );
  AO22_X1M_A9TL U177 ( .A0(n9), .A1(FIFO_imag_r[36]), .B0(n6), .B1(
        FIFO_imag_r[22]), .Y(n1390) );
  AO22_X1M_A9TL U178 ( .A0(n10), .A1(FIFO_imag_r[35]), .B0(n6), .B1(
        FIFO_imag_r[21]), .Y(n1430) );
  AO22_X1M_A9TL U179 ( .A0(n8), .A1(FIFO_imag_r[34]), .B0(n6), .B1(
        FIFO_imag_r[20]), .Y(n1470) );
  AO22_X1M_A9TL U180 ( .A0(n11), .A1(FIFO_imag_r[33]), .B0(n6), .B1(
        FIFO_imag_r[19]), .Y(n1510) );
  AO22_X1M_A9TL U181 ( .A0(n10), .A1(FIFO_imag_r[32]), .B0(n20), .B1(
        FIFO_imag_r[18]), .Y(n1550) );
  AO22_X1M_A9TL U182 ( .A0(n10), .A1(FIFO_imag_r[31]), .B0(n5), .B1(
        FIFO_imag_r[17]), .Y(n1590) );
  AO22_X1M_A9TL U183 ( .A0(n11), .A1(FIFO_imag_r[30]), .B0(n5), .B1(
        FIFO_imag_r[16]), .Y(n1630) );
  AO22_X1M_A9TL U184 ( .A0(n11), .A1(FIFO_imag_r[28]), .B0(n5), .B1(
        FIFO_imag_r[14]), .Y(n1670) );
  AO22_X1M_A9TL U185 ( .A0(n9), .A1(FIFO_imag_r[29]), .B0(n5), .B1(
        FIFO_imag_r[15]), .Y(n1710) );
  AO22_X1M_A9TL U186 ( .A0(n11), .A1(FIFO_real_r[55]), .B0(n5), .B1(
        FIFO_real_r[41]), .Y(n64) );
  AO22_X1M_A9TL U187 ( .A0(n11), .A1(FIFO_real_r[54]), .B0(n5), .B1(
        FIFO_real_r[40]), .Y(n68) );
  AO22_X1M_A9TL U188 ( .A0(n11), .A1(FIFO_real_r[53]), .B0(n20), .B1(
        FIFO_real_r[39]), .Y(n72) );
  AO22_X1M_A9TL U189 ( .A0(n8), .A1(FIFO_real_r[52]), .B0(n20), .B1(
        FIFO_real_r[38]), .Y(n76) );
  AO22_X1M_A9TL U190 ( .A0(n8), .A1(FIFO_real_r[51]), .B0(n20), .B1(
        FIFO_real_r[37]), .Y(n80) );
  AO22_X1M_A9TL U191 ( .A0(n8), .A1(FIFO_real_r[50]), .B0(n20), .B1(
        FIFO_real_r[36]), .Y(n84) );
  AO22_X1M_A9TL U192 ( .A0(n10), .A1(FIFO_real_r[49]), .B0(n20), .B1(
        FIFO_real_r[35]), .Y(n88) );
  AO22_X1M_A9TL U193 ( .A0(n11), .A1(FIFO_real_r[48]), .B0(n20), .B1(
        FIFO_real_r[34]), .Y(n92) );
  AO22_X1M_A9TL U194 ( .A0(n9), .A1(FIFO_real_r[47]), .B0(n20), .B1(
        FIFO_real_r[33]), .Y(n96) );
  AO22_X1M_A9TL U195 ( .A0(n11), .A1(FIFO_real_r[46]), .B0(n20), .B1(
        FIFO_real_r[32]), .Y(n100) );
  AO22_X1M_A9TL U196 ( .A0(n9), .A1(FIFO_real_r[45]), .B0(n6), .B1(
        FIFO_real_r[31]), .Y(n104) );
  AO22_X1M_A9TL U197 ( .A0(n8), .A1(FIFO_real_r[44]), .B0(n6), .B1(
        FIFO_real_r[30]), .Y(n108) );
  AO22_X1M_A9TL U198 ( .A0(n10), .A1(FIFO_real_r[43]), .B0(n6), .B1(
        FIFO_real_r[29]), .Y(n112) );
  AO22_X1M_A9TL U199 ( .A0(n8), .A1(FIFO_real_r[42]), .B0(n6), .B1(
        FIFO_real_r[28]), .Y(n116) );
  AO22_X1M_A9TL U200 ( .A0(n8), .A1(FIFO_imag_r[55]), .B0(n20), .B1(
        FIFO_imag_r[41]), .Y(n120) );
  AO22_X1M_A9TL U201 ( .A0(n9), .A1(FIFO_imag_r[54]), .B0(n6), .B1(
        FIFO_imag_r[40]), .Y(n124) );
  AO22_X1M_A9TL U202 ( .A0(n10), .A1(FIFO_imag_r[53]), .B0(n20), .B1(
        FIFO_imag_r[39]), .Y(n128) );
  AO22_X1M_A9TL U203 ( .A0(n11), .A1(FIFO_imag_r[52]), .B0(n20), .B1(
        FIFO_imag_r[38]), .Y(n132) );
  AO22_X1M_A9TL U204 ( .A0(n11), .A1(FIFO_imag_r[51]), .B0(n20), .B1(
        FIFO_imag_r[37]), .Y(n1360) );
  AO22_X1M_A9TL U205 ( .A0(n11), .A1(FIFO_imag_r[50]), .B0(n20), .B1(
        FIFO_imag_r[36]), .Y(n1400) );
  AO22_X1M_A9TL U206 ( .A0(n11), .A1(FIFO_imag_r[49]), .B0(n7), .B1(
        FIFO_imag_r[35]), .Y(n1440) );
  AO22_X1M_A9TL U207 ( .A0(n11), .A1(FIFO_imag_r[48]), .B0(n7), .B1(
        FIFO_imag_r[34]), .Y(n1480) );
  AO22_X1M_A9TL U208 ( .A0(n8), .A1(FIFO_imag_r[47]), .B0(n7), .B1(
        FIFO_imag_r[33]), .Y(n1520) );
  AO22_X1M_A9TL U209 ( .A0(n11), .A1(FIFO_imag_r[46]), .B0(n7), .B1(
        FIFO_imag_r[32]), .Y(n1560) );
  AO22_X1M_A9TL U210 ( .A0(n11), .A1(FIFO_imag_r[45]), .B0(n7), .B1(
        FIFO_imag_r[31]), .Y(n1600) );
  AO22_X1M_A9TL U211 ( .A0(n11), .A1(FIFO_imag_r[44]), .B0(n5), .B1(
        FIFO_imag_r[30]), .Y(n1640) );
  AO22_X1M_A9TL U212 ( .A0(n10), .A1(FIFO_imag_r[42]), .B0(n7), .B1(
        FIFO_imag_r[28]), .Y(n1680) );
  AO22_X1M_A9TL U213 ( .A0(n11), .A1(FIFO_imag_r[43]), .B0(n7), .B1(
        FIFO_imag_r[29]), .Y(n1720) );
  NAND2_X0P5A_A9TH U214 ( .A(n18), .B(n19), .Y(N41) );
  NAND2B_X0P5M_A9TH U215 ( .AN(N38), .B(N41), .Y(N33) );
endmodule


module FFT_4_DATA_WIDTH15_DW01_add_0 ( A, B, SUM );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  wire   n1;
  wire   [14:2] carry;

  ADDF_X1M_A9TL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .S(SUM[14]) );
  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), 
        .S(SUM[13]) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM[12]) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM[11]) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM[10]) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM[8]) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  AND2_X1B_A9TL U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2_X0P7M_A9TL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FFT_4_DATA_WIDTH15_DW01_add_1 ( A, B, SUM );
  input [14:0] A;
  input [14:0] B;
  output [14:0] SUM;
  wire   n1;
  wire   [14:2] carry;

  ADDF_X1M_A9TL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .S(SUM[14]) );
  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), 
        .S(SUM[13]) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM[12]) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM[11]) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM[10]) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM[8]) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  AND2_X1B_A9TL U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2_X0P7M_A9TL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FFT_4_DATA_WIDTH15_DW01_sub_0 ( A, B, DIFF );
  input [14:0] A;
  input [14:0] B;
  output [14:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;
  wire   [14:2] carry;

  ADDF_X1M_A9TL U2_14 ( .A(A[14]), .B(n2), .CI(carry[14]), .S(DIFF[14]) );
  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n3), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n4), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n5), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n6), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n7), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n10), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  ADDF_X1M_A9TL U2_5 ( .A(A[5]), .B(n11), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  ADDF_X1M_A9TL U2_4 ( .A(A[4]), .B(n12), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  ADDF_X1M_A9TL U2_3 ( .A(A[3]), .B(n13), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  ADDF_X1M_A9TL U2_2 ( .A(A[2]), .B(n14), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  ADDF_X1M_A9TL U2_1 ( .A(A[1]), .B(n15), .CI(n1), .CO(carry[2]), .S(DIFF[1])
         );
  OR2_X1B_A9TL U1 ( .A(A[0]), .B(n16), .Y(n1) );
  INV_X1M_A9TL U2 ( .A(B[1]), .Y(n15) );
  INV_X1M_A9TL U3 ( .A(B[2]), .Y(n14) );
  INV_X1M_A9TL U4 ( .A(B[3]), .Y(n13) );
  INV_X1M_A9TL U5 ( .A(B[4]), .Y(n12) );
  INV_X1M_A9TL U6 ( .A(B[5]), .Y(n11) );
  INV_X1M_A9TL U7 ( .A(B[6]), .Y(n10) );
  INV_X1M_A9TL U8 ( .A(B[7]), .Y(n9) );
  INV_X1M_A9TL U9 ( .A(B[8]), .Y(n8) );
  INV_X1M_A9TL U10 ( .A(B[9]), .Y(n7) );
  INV_X1M_A9TL U11 ( .A(B[10]), .Y(n6) );
  INV_X1M_A9TL U12 ( .A(B[11]), .Y(n5) );
  INV_X1M_A9TL U13 ( .A(B[12]), .Y(n4) );
  INV_X1M_A9TL U14 ( .A(B[13]), .Y(n3) );
  INV_X1M_A9TL U15 ( .A(B[0]), .Y(n16) );
  INV_X1M_A9TL U16 ( .A(B[14]), .Y(n2) );
  XNOR2_X0P7M_A9TL U17 ( .A(n16), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FFT_4_DATA_WIDTH15_DW01_sub_1 ( A, B, DIFF );
  input [14:0] A;
  input [14:0] B;
  output [14:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;
  wire   [14:2] carry;

  ADDF_X1M_A9TL U2_14 ( .A(A[14]), .B(n2), .CI(carry[14]), .S(DIFF[14]) );
  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n3), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n4), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n5), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n6), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n7), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n8), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n9), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n10), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  ADDF_X1M_A9TL U2_5 ( .A(A[5]), .B(n11), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  ADDF_X1M_A9TL U2_4 ( .A(A[4]), .B(n12), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  ADDF_X1M_A9TL U2_3 ( .A(A[3]), .B(n13), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  ADDF_X1M_A9TL U2_2 ( .A(A[2]), .B(n14), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  ADDF_X1M_A9TL U2_1 ( .A(A[1]), .B(n15), .CI(n1), .CO(carry[2]), .S(DIFF[1])
         );
  OR2_X1B_A9TL U1 ( .A(A[0]), .B(n16), .Y(n1) );
  INV_X1M_A9TL U2 ( .A(B[14]), .Y(n2) );
  INV_X1M_A9TL U3 ( .A(B[1]), .Y(n15) );
  INV_X1M_A9TL U4 ( .A(B[2]), .Y(n14) );
  INV_X1M_A9TL U5 ( .A(B[3]), .Y(n13) );
  INV_X1M_A9TL U6 ( .A(B[4]), .Y(n12) );
  INV_X1M_A9TL U7 ( .A(B[5]), .Y(n11) );
  INV_X1M_A9TL U8 ( .A(B[6]), .Y(n10) );
  INV_X1M_A9TL U9 ( .A(B[7]), .Y(n9) );
  INV_X1M_A9TL U10 ( .A(B[8]), .Y(n8) );
  INV_X1M_A9TL U11 ( .A(B[9]), .Y(n7) );
  INV_X1M_A9TL U12 ( .A(B[10]), .Y(n6) );
  INV_X1M_A9TL U13 ( .A(B[11]), .Y(n5) );
  INV_X1M_A9TL U14 ( .A(B[12]), .Y(n4) );
  INV_X1M_A9TL U15 ( .A(B[13]), .Y(n3) );
  INV_X1M_A9TL U16 ( .A(B[0]), .Y(n16) );
  XNOR2_X0P7M_A9TL U17 ( .A(n16), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FFT_4_DATA_WIDTH15 ( clk, rst_n, valid_in, data_in_real, data_in_imag, 
        valid_out, data_out_real, data_out_imag );
  input [14:0] data_in_real;
  input [14:0] data_in_imag;
  output [14:0] data_out_real;
  output [14:0] data_out_imag;
  input clk, rst_n, valid_in;
  output valid_out;
  wire   n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, counter_r, N26, N27,
         counter_w, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60, N61, N62,
         N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76,
         N77, N78, N79, N80, N111, N112, N113, N114, N115, N116, N117, N118,
         N119, N120, N121, N122, N123, N124, N125, N126, N127, N128, N129,
         N130, N131, N132, N133, N134, N135, N136, N137, N138, N139, N140,
         N141, N142, N143, N144, N145, N146, N147, N148, N149, N150, N151,
         N152, N153, N154, N155, N156, N157, N158, N159, N160, N161, N162,
         N163, N164, N165, N166, N167, N168, N169, N170, n34, n35, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n510,
         n520, n530, n540, n550, n560, n570, n580, n590, n600, n610, n620,
         n630, n640, n650, n660, n670, n680, n690, n700, n710, n730, n740,
         n750, n760, n770, n780, n790, n800, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n106, n107, n108, n109, n110, n1110, n1120,
         n1130, n1140, n1150, n1160, n1170, n1180, n1190, n1200, n1210, n1220,
         n1230, n1240, n1250, n1260, n1270, n1280, n1290, n1300, n1310, n1320,
         n1330, n1340, n1350, n1360, n1370, n1380, n1390, n1400, n1410, n1420,
         n1430, n1440, n1450, n1460, n1470, n1480, n1490, n1500, n1510, n1520,
         n1530, n1540, n1550, n1560, n1570, n1580, n1590, n1600, n1610, n1620,
         n1630, n1640, n1650, n1660, n1670, n1, n32, n33, n36, n720, n105,
         n1680, n1690, n1700, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195;
  wire   [1:0] state_r;
  wire   [28:0] FIFO_real_r;
  wire   [14:0] FIFO_imag_r;
  wire   [14:0] data_in_real_r;
  wire   [14:0] data_in_imag_r;
  wire   [14:0] data_out_real_w;
  wire   [14:0] data_out_imag_w;
  wire   [14:2] r341_carry;

  DFFRPQ_X2M_A9TL counter_r_reg ( .D(counter_w), .CK(clk), .R(n171), .Q(
        counter_r) );
  DFFRPQ_X2M_A9TL state_r_reg_0_ ( .D(N26), .CK(clk), .R(n173), .Q(state_r[0])
         );
  DFFRPQ_X2M_A9TL state_r_reg_1_ ( .D(N27), .CK(clk), .R(n172), .Q(state_r[1])
         );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_14_ ( .D(data_in_real[14]), .CK(clk), .R(
        n172), .Q(data_in_real_r[14]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_13_ ( .D(data_in_real[13]), .CK(clk), .R(
        n172), .Q(data_in_real_r[13]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_12_ ( .D(data_in_real[12]), .CK(clk), .R(
        n173), .Q(data_in_real_r[12]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_11_ ( .D(data_in_real[11]), .CK(clk), .R(
        n171), .Q(data_in_real_r[11]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_10_ ( .D(data_in_real[10]), .CK(clk), .R(
        n172), .Q(data_in_real_r[10]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_9_ ( .D(data_in_real[9]), .CK(clk), .R(
        n175), .Q(data_in_real_r[9]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_8_ ( .D(data_in_real[8]), .CK(clk), .R(
        n175), .Q(data_in_real_r[8]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_7_ ( .D(data_in_real[7]), .CK(clk), .R(
        n175), .Q(data_in_real_r[7]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_6_ ( .D(data_in_real[6]), .CK(clk), .R(
        n172), .Q(data_in_real_r[6]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_5_ ( .D(data_in_real[5]), .CK(clk), .R(
        n173), .Q(data_in_real_r[5]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_4_ ( .D(data_in_real[4]), .CK(clk), .R(
        n171), .Q(data_in_real_r[4]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_3_ ( .D(data_in_real[3]), .CK(clk), .R(
        n172), .Q(data_in_real_r[3]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_2_ ( .D(data_in_real[2]), .CK(clk), .R(
        n173), .Q(data_in_real_r[2]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_1_ ( .D(data_in_real[1]), .CK(clk), .R(
        n171), .Q(data_in_real_r[1]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_0_ ( .D(data_in_real[0]), .CK(clk), .R(
        n171), .Q(data_in_real_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__0_ ( .D(n1670), .CK(clk), .R(n173), .Q(
        FIFO_real_r[14]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__0_ ( .D(n1660), .CK(clk), .R(n174), .Q(
        N66) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__1_ ( .D(n1650), .CK(clk), .R(n175), .Q(
        FIFO_real_r[15]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__1_ ( .D(n1640), .CK(clk), .R(n174), .Q(
        FIFO_real_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__2_ ( .D(n1630), .CK(clk), .R(n175), .Q(
        FIFO_real_r[16]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__2_ ( .D(n1620), .CK(clk), .R(n174), .Q(
        FIFO_real_r[1]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__3_ ( .D(n1610), .CK(clk), .R(n175), .Q(
        FIFO_real_r[17]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__3_ ( .D(n1600), .CK(clk), .R(n174), .Q(
        FIFO_real_r[2]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__4_ ( .D(n1590), .CK(clk), .R(n175), .Q(
        FIFO_real_r[18]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__4_ ( .D(n1580), .CK(clk), .R(n174), .Q(
        FIFO_real_r[3]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__5_ ( .D(n1570), .CK(clk), .R(n175), .Q(
        FIFO_real_r[19]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__5_ ( .D(n1560), .CK(clk), .R(n171), .Q(
        FIFO_real_r[4]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__6_ ( .D(n1550), .CK(clk), .R(n174), .Q(
        FIFO_real_r[20]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__6_ ( .D(n1540), .CK(clk), .R(n174), .Q(
        FIFO_real_r[5]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__7_ ( .D(n1530), .CK(clk), .R(n173), .Q(
        FIFO_real_r[21]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__7_ ( .D(n1520), .CK(clk), .R(n174), .Q(
        FIFO_real_r[6]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__8_ ( .D(n1510), .CK(clk), .R(n171), .Q(
        FIFO_real_r[22]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__8_ ( .D(n1500), .CK(clk), .R(n173), .Q(
        FIFO_real_r[7]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__9_ ( .D(n1490), .CK(clk), .R(n172), .Q(
        FIFO_real_r[23]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__9_ ( .D(n1480), .CK(clk), .R(n172), .Q(
        FIFO_real_r[8]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__10_ ( .D(n1470), .CK(clk), .R(n174), .Q(
        FIFO_real_r[24]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__10_ ( .D(n1460), .CK(clk), .R(n174), .Q(
        FIFO_real_r[9]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__11_ ( .D(n1450), .CK(clk), .R(n174), .Q(
        FIFO_real_r[25]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__11_ ( .D(n1440), .CK(clk), .R(n174), .Q(
        FIFO_real_r[10]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__12_ ( .D(n1430), .CK(clk), .R(n174), .Q(
        FIFO_real_r[26]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__12_ ( .D(n1420), .CK(clk), .R(n174), .Q(
        FIFO_real_r[11]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__13_ ( .D(n1410), .CK(clk), .R(n174), .Q(
        FIFO_real_r[27]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__13_ ( .D(n1400), .CK(clk), .R(n174), .Q(
        FIFO_real_r[12]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0__14_ ( .D(n1390), .CK(clk), .R(n174), .Q(
        FIFO_real_r[28]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1__14_ ( .D(n1380), .CK(clk), .R(n174), .Q(
        FIFO_real_r[13]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_1_ ( .D(data_out_real_w[1]), .CK(clk), 
        .R(n173), .Q(n209) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_2_ ( .D(data_out_real_w[2]), .CK(clk), 
        .R(n175), .Q(n208) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_3_ ( .D(data_out_real_w[3]), .CK(clk), 
        .R(n174), .Q(n207) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_4_ ( .D(data_out_real_w[4]), .CK(clk), 
        .R(n175), .Q(n206) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_5_ ( .D(data_out_real_w[5]), .CK(clk), 
        .R(n174), .Q(n205) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_6_ ( .D(data_out_real_w[6]), .CK(clk), 
        .R(n175), .Q(n204) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_7_ ( .D(data_out_real_w[7]), .CK(clk), 
        .R(n175), .Q(n203) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_8_ ( .D(data_out_real_w[8]), .CK(clk), 
        .R(n175), .Q(n202) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_9_ ( .D(data_out_real_w[9]), .CK(clk), 
        .R(n175), .Q(n201) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_10_ ( .D(data_out_real_w[10]), .CK(clk), 
        .R(n175), .Q(n200) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_11_ ( .D(data_out_real_w[11]), .CK(clk), 
        .R(n175), .Q(n199) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_12_ ( .D(data_out_real_w[12]), .CK(clk), 
        .R(n175), .Q(n198) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_13_ ( .D(data_out_real_w[13]), .CK(clk), 
        .R(n175), .Q(n197) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_14_ ( .D(data_out_real_w[14]), .CK(clk), 
        .R(n175), .Q(n196) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_0_ ( .D(data_out_real_w[0]), .CK(clk), 
        .R(n174), .Q(n210) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_14_ ( .D(data_in_imag[14]), .CK(clk), .R(
        n175), .Q(data_in_imag_r[14]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_13_ ( .D(data_in_imag[13]), .CK(clk), .R(
        n174), .Q(data_in_imag_r[13]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_12_ ( .D(data_in_imag[12]), .CK(clk), .R(
        n175), .Q(data_in_imag_r[12]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_11_ ( .D(data_in_imag[11]), .CK(clk), .R(
        n174), .Q(data_in_imag_r[11]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_10_ ( .D(data_in_imag[10]), .CK(clk), .R(
        n175), .Q(data_in_imag_r[10]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_9_ ( .D(data_in_imag[9]), .CK(clk), .R(
        n174), .Q(data_in_imag_r[9]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_8_ ( .D(data_in_imag[8]), .CK(clk), .R(
        n171), .Q(data_in_imag_r[8]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_7_ ( .D(data_in_imag[7]), .CK(clk), .R(
        n172), .Q(data_in_imag_r[7]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_6_ ( .D(data_in_imag[6]), .CK(clk), .R(
        n173), .Q(data_in_imag_r[6]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_5_ ( .D(data_in_imag[5]), .CK(clk), .R(
        n171), .Q(data_in_imag_r[5]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_4_ ( .D(data_in_imag[4]), .CK(clk), .R(
        n174), .Q(data_in_imag_r[4]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_3_ ( .D(data_in_imag[3]), .CK(clk), .R(
        n175), .Q(data_in_imag_r[3]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_2_ ( .D(data_in_imag[2]), .CK(clk), .R(
        n174), .Q(data_in_imag_r[2]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_1_ ( .D(data_in_imag[1]), .CK(clk), .R(
        n175), .Q(data_in_imag_r[1]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_0_ ( .D(data_in_imag[0]), .CK(clk), .R(
        n175), .Q(data_in_imag_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__0_ ( .D(n1370), .CK(clk), .R(n174), .Q(
        FIFO_imag_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__0_ ( .D(n1360), .CK(clk), .R(n173), .Q(
        N51) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__1_ ( .D(n1350), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[1]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__1_ ( .D(n1340), .CK(clk), .R(n173), .Q(
        N52) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__2_ ( .D(n1330), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[2]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__2_ ( .D(n1320), .CK(clk), .R(n173), .Q(
        N53) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__3_ ( .D(n1310), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[3]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__3_ ( .D(n1300), .CK(clk), .R(n173), .Q(
        N54) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__4_ ( .D(n1290), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[4]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__4_ ( .D(n1280), .CK(clk), .R(n173), .Q(
        N55) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__5_ ( .D(n1270), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[5]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__5_ ( .D(n1260), .CK(clk), .R(n173), .Q(
        N56) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__6_ ( .D(n1250), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[6]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__6_ ( .D(n1240), .CK(clk), .R(n173), .Q(
        N57) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__7_ ( .D(n1230), .CK(clk), .R(n173), .Q(
        FIFO_imag_r[7]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__7_ ( .D(n1220), .CK(clk), .R(n173), .Q(
        N58) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__8_ ( .D(n1210), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[8]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__8_ ( .D(n1200), .CK(clk), .R(n172), .Q(
        N59) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__9_ ( .D(n1190), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[9]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__9_ ( .D(n1180), .CK(clk), .R(n172), .Q(
        N60) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__10_ ( .D(n1170), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[10]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__10_ ( .D(n1160), .CK(clk), .R(n172), .Q(
        N61) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__11_ ( .D(n1150), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[11]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__11_ ( .D(n1140), .CK(clk), .R(n172), .Q(
        N62) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__12_ ( .D(n1130), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[12]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__12_ ( .D(n1120), .CK(clk), .R(n172), .Q(
        N63) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__13_ ( .D(n1110), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[13]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__13_ ( .D(n110), .CK(clk), .R(n172), .Q(
        N64) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0__14_ ( .D(n109), .CK(clk), .R(n172), .Q(
        FIFO_imag_r[14]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1__14_ ( .D(n108), .CK(clk), .R(n172), .Q(
        N65) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_1_ ( .D(data_out_imag_w[1]), .CK(clk), 
        .R(n172), .Q(n224) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_2_ ( .D(data_out_imag_w[2]), .CK(clk), 
        .R(n171), .Q(n223) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_3_ ( .D(data_out_imag_w[3]), .CK(clk), 
        .R(n171), .Q(n222) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_4_ ( .D(data_out_imag_w[4]), .CK(clk), 
        .R(n171), .Q(n221) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_5_ ( .D(data_out_imag_w[5]), .CK(clk), 
        .R(n171), .Q(n220) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_6_ ( .D(data_out_imag_w[6]), .CK(clk), 
        .R(n171), .Q(n219) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_7_ ( .D(data_out_imag_w[7]), .CK(clk), 
        .R(n171), .Q(n218) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_8_ ( .D(data_out_imag_w[8]), .CK(clk), 
        .R(n171), .Q(n217) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_9_ ( .D(data_out_imag_w[9]), .CK(clk), 
        .R(n171), .Q(n216) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_10_ ( .D(data_out_imag_w[10]), .CK(clk), 
        .R(n171), .Q(n215) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_11_ ( .D(data_out_imag_w[11]), .CK(clk), 
        .R(n171), .Q(n214) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_12_ ( .D(data_out_imag_w[12]), .CK(clk), 
        .R(n171), .Q(n213) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_13_ ( .D(data_out_imag_w[13]), .CK(clk), 
        .R(n171), .Q(n212) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_14_ ( .D(data_out_imag_w[14]), .CK(clk), 
        .R(n171), .Q(n211) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_0_ ( .D(data_out_imag_w[0]), .CK(clk), 
        .R(n171), .Q(n225) );
  DFFRPQ_X2M_A9TL valid_out_r_reg ( .D(n107), .CK(clk), .R(n171), .Q(valid_out) );
  FFT_4_DATA_WIDTH15_DW01_add_0 add_642 ( .A({N65, N64, N63, N62, N61, N60, 
        N59, N58, N57, N56, N55, N54, N53, N52, N51}), .B(data_in_imag_r), 
        .SUM({N170, N169, N168, N167, N166, N165, N164, N163, N162, N161, N160, 
        N159, N158, N157, N156}) );
  FFT_4_DATA_WIDTH15_DW01_add_1 add_641 ( .A({FIFO_real_r[13:0], N66}), .B(
        data_in_real_r), .SUM({N155, N154, N153, N152, N151, N150, N149, N148, 
        N147, N146, N145, N144, N143, N142, N141}) );
  FFT_4_DATA_WIDTH15_DW01_sub_0 sub_639_2 ( .A({N65, N64, N63, N62, N61, N60, 
        N59, N58, N57, N56, N55, N54, N53, N52, N51}), .B(data_in_imag_r), 
        .DIFF({N140, N139, N138, N137, N136, N135, N134, N133, N132, N131, 
        N130, N129, N128, N127, N126}) );
  FFT_4_DATA_WIDTH15_DW01_sub_1 sub_639 ( .A({FIFO_real_r[13:0], N66}), .B(
        data_in_real_r), .DIFF({N125, N124, N123, N122, N121, N120, N119, N118, 
        N117, N116, N115, N114, N113, N112, N111}) );
  TIELO_X1M_A9TL U3 ( .Y(n1) );
  BUFH_X1M_A9TL U4 ( .A(n225), .Y(data_out_imag[0]) );
  BUFH_X1M_A9TL U5 ( .A(n224), .Y(data_out_imag[1]) );
  BUFH_X1M_A9TL U6 ( .A(n223), .Y(data_out_imag[2]) );
  BUFH_X1M_A9TL U7 ( .A(n222), .Y(data_out_imag[3]) );
  BUFH_X1M_A9TL U8 ( .A(n221), .Y(data_out_imag[4]) );
  BUFH_X1M_A9TL U9 ( .A(n220), .Y(data_out_imag[5]) );
  BUFH_X1M_A9TL U10 ( .A(n219), .Y(data_out_imag[6]) );
  BUFH_X1M_A9TL U11 ( .A(n218), .Y(data_out_imag[7]) );
  BUFH_X1M_A9TL U12 ( .A(n217), .Y(data_out_imag[8]) );
  BUFH_X1M_A9TL U13 ( .A(n216), .Y(data_out_imag[9]) );
  BUFH_X1M_A9TL U14 ( .A(n215), .Y(data_out_imag[10]) );
  BUFH_X1M_A9TL U15 ( .A(n214), .Y(data_out_imag[11]) );
  BUFH_X1M_A9TL U16 ( .A(n213), .Y(data_out_imag[12]) );
  BUFH_X1M_A9TL U17 ( .A(n212), .Y(data_out_imag[13]) );
  BUFH_X1M_A9TL U18 ( .A(n211), .Y(data_out_imag[14]) );
  BUFH_X1M_A9TL U19 ( .A(n210), .Y(data_out_real[0]) );
  BUFH_X1M_A9TL U20 ( .A(n209), .Y(data_out_real[1]) );
  BUFH_X1M_A9TL U21 ( .A(n208), .Y(data_out_real[2]) );
  BUFH_X1M_A9TL U22 ( .A(n207), .Y(data_out_real[3]) );
  BUFH_X1M_A9TL U23 ( .A(n206), .Y(data_out_real[4]) );
  BUFH_X1M_A9TL U24 ( .A(n205), .Y(data_out_real[5]) );
  BUFH_X1M_A9TL U25 ( .A(n204), .Y(data_out_real[6]) );
  BUFH_X1M_A9TL U26 ( .A(n203), .Y(data_out_real[7]) );
  BUFH_X1M_A9TL U27 ( .A(n202), .Y(data_out_real[8]) );
  BUFH_X1M_A9TL U28 ( .A(n201), .Y(data_out_real[9]) );
  BUFH_X1M_A9TL U29 ( .A(n200), .Y(data_out_real[10]) );
  BUFH_X1M_A9TL U30 ( .A(n199), .Y(data_out_real[11]) );
  BUFH_X1M_A9TL U31 ( .A(n198), .Y(data_out_real[12]) );
  BUFH_X1M_A9TL U32 ( .A(n197), .Y(data_out_real[13]) );
  BUFH_X1M_A9TL U33 ( .A(n196), .Y(data_out_real[14]) );
  OR2_X1B_A9TL U34 ( .A(n195), .B(state_r[0]), .Y(n32) );
  BUFH_X1M_A9TL U35 ( .A(n175), .Y(n172) );
  BUFH_X1M_A9TL U36 ( .A(n175), .Y(n173) );
  INV_X1M_A9TL U37 ( .A(n37), .Y(n1690) );
  INV_X1M_A9TL U38 ( .A(n37), .Y(n1700) );
  BUFH_X1M_A9TL U39 ( .A(n175), .Y(n171) );
  INV_X1M_A9TL U40 ( .A(rst_n), .Y(n175) );
  INV_X1M_A9TL U41 ( .A(rst_n), .Y(n174) );
  BUFH_X1M_A9TL U42 ( .A(n39), .Y(n1680) );
  NOR2_X1A_A9TL U43 ( .A(n32), .B(n1690), .Y(n39) );
  NAND2_X1A_A9TL U44 ( .A(n710), .B(n32), .Y(n37) );
  BUFH_X1M_A9TL U45 ( .A(n750), .Y(n36) );
  BUFH_X1M_A9TL U46 ( .A(n40), .Y(n105) );
  INV_X1M_A9TL U47 ( .A(n32), .Y(n33) );
  NOR2_X1A_A9TL U48 ( .A(n191), .B(n710), .Y(n750) );
  NOR2_X1A_A9TL U49 ( .A(n700), .B(n1690), .Y(n40) );
  NOR2_X1A_A9TL U50 ( .A(n193), .B(n194), .Y(n710) );
  INV_X1M_A9TL U51 ( .A(n34), .Y(n194) );
  INV_X1M_A9TL U52 ( .A(n700), .Y(n193) );
  BUFH_X1M_A9TL U53 ( .A(n740), .Y(n720) );
  INV_X1M_A9TL U54 ( .A(N66), .Y(n190) );
  AO1B2_X1M_A9TL U55 ( .B0(N170), .B1(n33), .A0N(n99), .Y(data_out_imag_w[14])
         );
  AOI22_X1M_A9TL U56 ( .A0(n720), .A1(N65), .B0(N80), .B1(n36), .Y(n99) );
  AO1B2_X1M_A9TL U57 ( .B0(N168), .B1(n33), .A0N(n101), .Y(data_out_imag_w[12]) );
  AOI22_X1M_A9TL U58 ( .A0(n720), .A1(N63), .B0(N78), .B1(n36), .Y(n101) );
  AO1B2_X1M_A9TL U59 ( .B0(N167), .B1(n33), .A0N(n102), .Y(data_out_imag_w[11]) );
  AOI22_X1M_A9TL U60 ( .A0(n740), .A1(N62), .B0(N77), .B1(n36), .Y(n102) );
  AO1B2_X1M_A9TL U61 ( .B0(N165), .B1(n33), .A0N(n90), .Y(data_out_imag_w[9])
         );
  AOI22_X1M_A9TL U62 ( .A0(n740), .A1(N60), .B0(N75), .B1(n36), .Y(n90) );
  AO1B2_X1M_A9TL U63 ( .B0(N169), .B1(n33), .A0N(n100), .Y(data_out_imag_w[13]) );
  AOI22_X1M_A9TL U64 ( .A0(n740), .A1(N64), .B0(N79), .B1(n36), .Y(n100) );
  AO1B2_X1M_A9TL U65 ( .B0(N166), .B1(n33), .A0N(n103), .Y(data_out_imag_w[10]) );
  AOI22_X1M_A9TL U66 ( .A0(n720), .A1(N61), .B0(N76), .B1(n36), .Y(n103) );
  INV_X1M_A9TL U67 ( .A(FIFO_real_r[0]), .Y(n189) );
  INV_X1M_A9TL U68 ( .A(FIFO_real_r[1]), .Y(n188) );
  INV_X1M_A9TL U69 ( .A(FIFO_real_r[2]), .Y(n187) );
  INV_X1M_A9TL U70 ( .A(FIFO_real_r[3]), .Y(n186) );
  INV_X1M_A9TL U71 ( .A(FIFO_real_r[4]), .Y(n185) );
  INV_X1M_A9TL U72 ( .A(FIFO_real_r[5]), .Y(n184) );
  AO1B2_X1M_A9TL U73 ( .B0(N161), .B1(n33), .A0N(n94), .Y(data_out_imag_w[5])
         );
  AOI22_X1M_A9TL U74 ( .A0(n740), .A1(N56), .B0(N71), .B1(n36), .Y(n94) );
  AO1B2_X1M_A9TL U75 ( .B0(n1700), .B1(FIFO_real_r[28]), .A0N(n550), .Y(n1390)
         );
  AOI22_X1M_A9TL U76 ( .A0(N125), .A1(n1680), .B0(data_in_real_r[14]), .B1(n40), .Y(n550) );
  AO1B2_X1M_A9TL U77 ( .B0(N164), .B1(n33), .A0N(n91), .Y(data_out_imag_w[8])
         );
  AOI22_X1M_A9TL U78 ( .A0(n740), .A1(N59), .B0(N74), .B1(n36), .Y(n91) );
  AO1B2_X1M_A9TL U79 ( .B0(N163), .B1(n33), .A0N(n92), .Y(data_out_imag_w[7])
         );
  AOI22_X1M_A9TL U80 ( .A0(n740), .A1(N58), .B0(N73), .B1(n36), .Y(n92) );
  AO1B2_X1M_A9TL U81 ( .B0(N162), .B1(n33), .A0N(n93), .Y(data_out_imag_w[6])
         );
  AOI22_X1M_A9TL U82 ( .A0(n740), .A1(N57), .B0(N72), .B1(n36), .Y(n93) );
  AO1B2_X1M_A9TL U83 ( .B0(N160), .B1(n33), .A0N(n95), .Y(data_out_imag_w[4])
         );
  AOI22_X1M_A9TL U84 ( .A0(n740), .A1(N55), .B0(N70), .B1(n36), .Y(n95) );
  AO1B2_X1M_A9TL U85 ( .B0(N159), .B1(n33), .A0N(n96), .Y(data_out_imag_w[3])
         );
  AOI22_X1M_A9TL U86 ( .A0(n740), .A1(N54), .B0(N69), .B1(n36), .Y(n96) );
  INV_X1M_A9TL U87 ( .A(FIFO_real_r[6]), .Y(n183) );
  INV_X1M_A9TL U88 ( .A(FIFO_real_r[7]), .Y(n182) );
  INV_X1M_A9TL U89 ( .A(FIFO_real_r[8]), .Y(n181) );
  INV_X1M_A9TL U90 ( .A(FIFO_real_r[9]), .Y(n180) );
  INV_X1M_A9TL U91 ( .A(FIFO_real_r[10]), .Y(n179) );
  AO1B2_X1M_A9TL U92 ( .B0(N155), .B1(n33), .A0N(n84), .Y(data_out_real_w[14])
         );
  AOI22_X1M_A9TL U93 ( .A0(n720), .A1(FIFO_real_r[13]), .B0(N65), .B1(n36), 
        .Y(n84) );
  AO1B2_X1M_A9TL U94 ( .B0(N154), .B1(n33), .A0N(n85), .Y(data_out_real_w[13])
         );
  AOI22_X1M_A9TL U95 ( .A0(n720), .A1(FIFO_real_r[12]), .B0(N64), .B1(n750), 
        .Y(n85) );
  AO1B2_X1M_A9TL U96 ( .B0(N153), .B1(n33), .A0N(n86), .Y(data_out_real_w[12])
         );
  AOI22_X1M_A9TL U97 ( .A0(n720), .A1(FIFO_real_r[11]), .B0(N63), .B1(n750), 
        .Y(n86) );
  AO1B2_X1M_A9TL U98 ( .B0(N152), .B1(n33), .A0N(n87), .Y(data_out_real_w[11])
         );
  AOI22_X1M_A9TL U99 ( .A0(n720), .A1(FIFO_real_r[10]), .B0(N62), .B1(n750), 
        .Y(n87) );
  AO1B2_X1M_A9TL U100 ( .B0(N151), .B1(n33), .A0N(n88), .Y(data_out_real_w[10]) );
  AOI22_X1M_A9TL U101 ( .A0(n720), .A1(FIFO_real_r[9]), .B0(N61), .B1(n750), 
        .Y(n88) );
  AO1B2_X1M_A9TL U102 ( .B0(N150), .B1(n33), .A0N(n730), .Y(data_out_real_w[9]) );
  AOI22_X1M_A9TL U103 ( .A0(n720), .A1(FIFO_real_r[8]), .B0(N60), .B1(n750), 
        .Y(n730) );
  AO1B2_X1M_A9TL U104 ( .B0(N149), .B1(n33), .A0N(n760), .Y(data_out_real_w[8]) );
  AOI22_X1M_A9TL U105 ( .A0(n720), .A1(FIFO_real_r[7]), .B0(N59), .B1(n750), 
        .Y(n760) );
  AO1B2_X1M_A9TL U106 ( .B0(n1700), .B1(FIFO_imag_r[14]), .A0N(n38), .Y(n109)
         );
  AOI22_X1M_A9TL U107 ( .A0(N140), .A1(n1680), .B0(data_in_imag_r[14]), .B1(
        n105), .Y(n38) );
  AO1B2_X1M_A9TL U108 ( .B0(n1700), .B1(FIFO_imag_r[13]), .A0N(n41), .Y(n1110)
         );
  AOI22_X1M_A9TL U109 ( .A0(N139), .A1(n1680), .B0(data_in_imag_r[13]), .B1(
        n105), .Y(n41) );
  AO1B2_X1M_A9TL U110 ( .B0(n1700), .B1(FIFO_imag_r[12]), .A0N(n42), .Y(n1130)
         );
  AOI22_X1M_A9TL U111 ( .A0(N138), .A1(n1680), .B0(data_in_imag_r[12]), .B1(
        n105), .Y(n42) );
  AO1B2_X1M_A9TL U112 ( .B0(n1700), .B1(FIFO_imag_r[11]), .A0N(n43), .Y(n1150)
         );
  AOI22_X1M_A9TL U113 ( .A0(N137), .A1(n1680), .B0(data_in_imag_r[11]), .B1(
        n105), .Y(n43) );
  AO1B2_X1M_A9TL U114 ( .B0(n1700), .B1(FIFO_imag_r[10]), .A0N(n44), .Y(n1170)
         );
  AOI22_X1M_A9TL U115 ( .A0(N136), .A1(n1680), .B0(data_in_imag_r[10]), .B1(
        n105), .Y(n44) );
  AO1B2_X1M_A9TL U116 ( .B0(n1700), .B1(FIFO_imag_r[9]), .A0N(n45), .Y(n1190)
         );
  AOI22_X1M_A9TL U117 ( .A0(N135), .A1(n1680), .B0(data_in_imag_r[9]), .B1(
        n105), .Y(n45) );
  AO1B2_X1M_A9TL U118 ( .B0(n1700), .B1(FIFO_imag_r[8]), .A0N(n46), .Y(n1210)
         );
  AOI22_X1M_A9TL U119 ( .A0(N134), .A1(n1680), .B0(data_in_imag_r[8]), .B1(
        n105), .Y(n46) );
  AO1B2_X1M_A9TL U120 ( .B0(n1700), .B1(FIFO_real_r[27]), .A0N(n560), .Y(n1410) );
  AOI22_X1M_A9TL U121 ( .A0(N124), .A1(n1680), .B0(data_in_real_r[13]), .B1(
        n40), .Y(n560) );
  AO1B2_X1M_A9TL U122 ( .B0(n1700), .B1(FIFO_real_r[26]), .A0N(n570), .Y(n1430) );
  AOI22_X1M_A9TL U123 ( .A0(N123), .A1(n1680), .B0(data_in_real_r[12]), .B1(
        n40), .Y(n570) );
  AO1B2_X1M_A9TL U124 ( .B0(n1700), .B1(FIFO_real_r[25]), .A0N(n580), .Y(n1450) );
  AOI22_X1M_A9TL U125 ( .A0(N122), .A1(n1680), .B0(data_in_real_r[11]), .B1(
        n40), .Y(n580) );
  AO1B2_X1M_A9TL U126 ( .B0(n1700), .B1(FIFO_real_r[24]), .A0N(n590), .Y(n1470) );
  AOI22_X1M_A9TL U127 ( .A0(N121), .A1(n39), .B0(data_in_real_r[10]), .B1(n105), .Y(n590) );
  AO1B2_X1M_A9TL U128 ( .B0(n1700), .B1(FIFO_real_r[23]), .A0N(n600), .Y(n1490) );
  AOI22_X1M_A9TL U129 ( .A0(N120), .A1(n39), .B0(data_in_real_r[9]), .B1(n105), 
        .Y(n600) );
  AO1B2_X1M_A9TL U130 ( .B0(n1700), .B1(FIFO_real_r[22]), .A0N(n610), .Y(n1510) );
  AOI22_X1M_A9TL U131 ( .A0(N119), .A1(n39), .B0(data_in_real_r[8]), .B1(n105), 
        .Y(n610) );
  AO1B2_X1M_A9TL U132 ( .B0(n1700), .B1(FIFO_real_r[21]), .A0N(n620), .Y(n1530) );
  AOI22_X1M_A9TL U133 ( .A0(N118), .A1(n39), .B0(data_in_real_r[7]), .B1(n40), 
        .Y(n620) );
  AO1B2_X1M_A9TL U134 ( .B0(N157), .B1(n33), .A0N(n98), .Y(data_out_imag_w[1])
         );
  AOI22_X1M_A9TL U135 ( .A0(n740), .A1(N52), .B0(N67), .B1(n36), .Y(n98) );
  NOR2_X1A_A9TL U136 ( .A(n710), .B(counter_r), .Y(n740) );
  OAI222_X1M_A9TL U137 ( .A0(n700), .A1(n191), .B0(valid_in), .B1(n32), .C0(
        counter_r), .C1(n195), .Y(N27) );
  INV_X1M_A9TL U138 ( .A(state_r[1]), .Y(n195) );
  INV_X1M_A9TL U139 ( .A(counter_r), .Y(n191) );
  OAI22_X1M_A9TL U140 ( .A0(n195), .A1(counter_r), .B0(n192), .B1(counter_r), 
        .Y(counter_w) );
  INV_X1M_A9TL U141 ( .A(state_r[0]), .Y(n192) );
  AO1B2_X1M_A9TL U142 ( .B0(N142), .B1(n33), .A0N(n83), .Y(data_out_real_w[1])
         );
  AOI22_X1M_A9TL U143 ( .A0(n720), .A1(FIFO_real_r[0]), .B0(N52), .B1(n750), 
        .Y(n83) );
  NAND2_X1A_A9TL U144 ( .A(state_r[0]), .B(n195), .Y(n700) );
  AO1B2_X1M_A9TL U145 ( .B0(n1700), .B1(FIFO_real_r[14]), .A0N(n690), .Y(n1670) );
  AOI22_X1M_A9TL U146 ( .A0(N111), .A1(n1680), .B0(data_in_real_r[0]), .B1(n40), .Y(n690) );
  AO1B2_X1M_A9TL U147 ( .B0(N158), .B1(n33), .A0N(n97), .Y(data_out_imag_w[2])
         );
  AOI22_X1M_A9TL U148 ( .A0(n740), .A1(N53), .B0(N68), .B1(n36), .Y(n97) );
  OAI21_X1M_A9TL U149 ( .A0(counter_r), .A1(n192), .B0(n106), .Y(N26) );
  AOI32_X1M_A9TL U150 ( .A0(n192), .A1(n195), .A2(valid_in), .B0(counter_r), 
        .B1(n33), .Y(n106) );
  INV_X1M_A9TL U151 ( .A(FIFO_real_r[11]), .Y(n178) );
  INV_X1M_A9TL U152 ( .A(FIFO_real_r[12]), .Y(n177) );
  NAND2_X1A_A9TL U153 ( .A(state_r[1]), .B(state_r[0]), .Y(n34) );
  INV_X1M_A9TL U154 ( .A(FIFO_real_r[13]), .Y(n176) );
  AO1B2_X1M_A9TL U155 ( .B0(N156), .B1(n33), .A0N(n104), .Y(data_out_imag_w[0]) );
  AOI22_X1M_A9TL U156 ( .A0(n720), .A1(N51), .B0(N66), .B1(n750), .Y(n104) );
  NAND3_X1A_A9TL U157 ( .A(n32), .B(n35), .C(n34), .Y(n107) );
  NAND2_X1A_A9TL U158 ( .A(valid_out), .B(n193), .Y(n35) );
  AO1B2_X1M_A9TL U159 ( .B0(N141), .B1(n33), .A0N(n89), .Y(data_out_real_w[0])
         );
  AOI22_X1M_A9TL U160 ( .A0(n740), .A1(N66), .B0(N51), .B1(n36), .Y(n89) );
  AO1B2_X1M_A9TL U161 ( .B0(N148), .B1(n33), .A0N(n770), .Y(data_out_real_w[7]) );
  AOI22_X1M_A9TL U162 ( .A0(n720), .A1(FIFO_real_r[6]), .B0(N58), .B1(n750), 
        .Y(n770) );
  AO1B2_X1M_A9TL U163 ( .B0(N147), .B1(n33), .A0N(n780), .Y(data_out_real_w[6]) );
  AOI22_X1M_A9TL U164 ( .A0(n720), .A1(FIFO_real_r[5]), .B0(N57), .B1(n750), 
        .Y(n780) );
  AO1B2_X1M_A9TL U165 ( .B0(N146), .B1(n33), .A0N(n790), .Y(data_out_real_w[5]) );
  AOI22_X1M_A9TL U166 ( .A0(n720), .A1(FIFO_real_r[4]), .B0(N56), .B1(n750), 
        .Y(n790) );
  AO1B2_X1M_A9TL U167 ( .B0(N145), .B1(n33), .A0N(n800), .Y(data_out_real_w[4]) );
  AOI22_X1M_A9TL U168 ( .A0(n720), .A1(FIFO_real_r[3]), .B0(N55), .B1(n750), 
        .Y(n800) );
  AO1B2_X1M_A9TL U169 ( .B0(N144), .B1(n33), .A0N(n81), .Y(data_out_real_w[3])
         );
  AOI22_X1M_A9TL U170 ( .A0(n740), .A1(FIFO_real_r[2]), .B0(N54), .B1(n36), 
        .Y(n81) );
  AO1B2_X1M_A9TL U171 ( .B0(N143), .B1(n33), .A0N(n82), .Y(data_out_real_w[2])
         );
  AOI22_X1M_A9TL U172 ( .A0(n720), .A1(FIFO_real_r[1]), .B0(N53), .B1(n750), 
        .Y(n82) );
  AO22_X1M_A9TL U173 ( .A0(n37), .A1(FIFO_real_r[14]), .B0(n1700), .B1(N66), 
        .Y(n1660) );
  AO1B2_X1M_A9TL U174 ( .B0(n1700), .B1(FIFO_imag_r[0]), .A0N(n540), .Y(n1370)
         );
  AOI22_X1M_A9TL U175 ( .A0(N126), .A1(n39), .B0(data_in_imag_r[0]), .B1(n40), 
        .Y(n540) );
  AO22_X1M_A9TL U176 ( .A0(n37), .A1(FIFO_imag_r[0]), .B0(n1690), .B1(N51), 
        .Y(n1360) );
  AO1B2_X1M_A9TL U177 ( .B0(n1700), .B1(FIFO_imag_r[7]), .A0N(n47), .Y(n1230)
         );
  AOI22_X1M_A9TL U178 ( .A0(N133), .A1(n1680), .B0(data_in_imag_r[7]), .B1(
        n105), .Y(n47) );
  AO1B2_X1M_A9TL U179 ( .B0(n1700), .B1(FIFO_imag_r[6]), .A0N(n48), .Y(n1250)
         );
  AOI22_X1M_A9TL U180 ( .A0(N132), .A1(n1680), .B0(data_in_imag_r[6]), .B1(
        n105), .Y(n48) );
  AO1B2_X1M_A9TL U181 ( .B0(n1700), .B1(FIFO_imag_r[5]), .A0N(n49), .Y(n1270)
         );
  AOI22_X1M_A9TL U182 ( .A0(N131), .A1(n1680), .B0(data_in_imag_r[5]), .B1(
        n105), .Y(n49) );
  AO1B2_X1M_A9TL U183 ( .B0(n1700), .B1(FIFO_imag_r[4]), .A0N(n50), .Y(n1290)
         );
  AOI22_X1M_A9TL U184 ( .A0(N130), .A1(n1680), .B0(data_in_imag_r[4]), .B1(
        n105), .Y(n50) );
  AO1B2_X1M_A9TL U185 ( .B0(n1700), .B1(FIFO_imag_r[3]), .A0N(n510), .Y(n1310)
         );
  AOI22_X1M_A9TL U186 ( .A0(N129), .A1(n1680), .B0(data_in_imag_r[3]), .B1(
        n105), .Y(n510) );
  AO1B2_X1M_A9TL U187 ( .B0(n1700), .B1(FIFO_imag_r[2]), .A0N(n520), .Y(n1330)
         );
  AOI22_X1M_A9TL U188 ( .A0(N128), .A1(n1680), .B0(data_in_imag_r[2]), .B1(
        n105), .Y(n520) );
  AO1B2_X1M_A9TL U189 ( .B0(n1700), .B1(FIFO_imag_r[1]), .A0N(n530), .Y(n1350)
         );
  AOI22_X1M_A9TL U190 ( .A0(N127), .A1(n1680), .B0(data_in_imag_r[1]), .B1(
        n105), .Y(n530) );
  AO1B2_X1M_A9TL U191 ( .B0(n1700), .B1(FIFO_real_r[20]), .A0N(n630), .Y(n1550) );
  AOI22_X1M_A9TL U192 ( .A0(N117), .A1(n39), .B0(data_in_real_r[6]), .B1(n40), 
        .Y(n630) );
  AO1B2_X1M_A9TL U193 ( .B0(n1700), .B1(FIFO_real_r[19]), .A0N(n640), .Y(n1570) );
  AOI22_X1M_A9TL U194 ( .A0(N116), .A1(n39), .B0(data_in_real_r[5]), .B1(n40), 
        .Y(n640) );
  AO1B2_X1M_A9TL U195 ( .B0(n1700), .B1(FIFO_real_r[18]), .A0N(n650), .Y(n1590) );
  AOI22_X1M_A9TL U196 ( .A0(N115), .A1(n39), .B0(data_in_real_r[4]), .B1(n40), 
        .Y(n650) );
  AO1B2_X1M_A9TL U197 ( .B0(n1700), .B1(FIFO_real_r[17]), .A0N(n660), .Y(n1610) );
  AOI22_X1M_A9TL U198 ( .A0(N114), .A1(n39), .B0(data_in_real_r[3]), .B1(n40), 
        .Y(n660) );
  AO1B2_X1M_A9TL U199 ( .B0(n1700), .B1(FIFO_real_r[16]), .A0N(n670), .Y(n1630) );
  AOI22_X1M_A9TL U200 ( .A0(N113), .A1(n39), .B0(data_in_real_r[2]), .B1(n40), 
        .Y(n670) );
  AO1B2_X1M_A9TL U201 ( .B0(n1700), .B1(FIFO_real_r[15]), .A0N(n680), .Y(n1650) );
  AOI22_X1M_A9TL U202 ( .A0(N112), .A1(n39), .B0(data_in_real_r[1]), .B1(n105), 
        .Y(n680) );
  AO22_X1M_A9TL U203 ( .A0(n37), .A1(FIFO_imag_r[14]), .B0(n1700), .B1(N65), 
        .Y(n108) );
  AO22_X1M_A9TL U204 ( .A0(n37), .A1(FIFO_imag_r[13]), .B0(n1690), .B1(N64), 
        .Y(n110) );
  AO22_X1M_A9TL U205 ( .A0(n37), .A1(FIFO_imag_r[12]), .B0(n1690), .B1(N63), 
        .Y(n1120) );
  AO22_X1M_A9TL U206 ( .A0(n37), .A1(FIFO_imag_r[11]), .B0(n1690), .B1(N62), 
        .Y(n1140) );
  AO22_X1M_A9TL U207 ( .A0(n37), .A1(FIFO_imag_r[10]), .B0(n1690), .B1(N61), 
        .Y(n1160) );
  AO22_X1M_A9TL U208 ( .A0(n37), .A1(FIFO_imag_r[9]), .B0(n1690), .B1(N60), 
        .Y(n1180) );
  AO22_X1M_A9TL U209 ( .A0(n37), .A1(FIFO_imag_r[8]), .B0(n1690), .B1(N59), 
        .Y(n1200) );
  AO22_X1M_A9TL U210 ( .A0(n37), .A1(FIFO_imag_r[7]), .B0(n1690), .B1(N58), 
        .Y(n1220) );
  AO22_X1M_A9TL U211 ( .A0(n37), .A1(FIFO_imag_r[6]), .B0(n1690), .B1(N57), 
        .Y(n1240) );
  AO22_X1M_A9TL U212 ( .A0(n37), .A1(FIFO_imag_r[5]), .B0(n1690), .B1(N56), 
        .Y(n1260) );
  AO22_X1M_A9TL U213 ( .A0(n37), .A1(FIFO_imag_r[4]), .B0(n1690), .B1(N55), 
        .Y(n1280) );
  AO22_X1M_A9TL U214 ( .A0(n37), .A1(FIFO_imag_r[3]), .B0(n1690), .B1(N54), 
        .Y(n1300) );
  AO22_X1M_A9TL U215 ( .A0(n37), .A1(FIFO_imag_r[2]), .B0(n1690), .B1(N53), 
        .Y(n1320) );
  AO22_X1M_A9TL U216 ( .A0(n37), .A1(FIFO_imag_r[1]), .B0(n1690), .B1(N52), 
        .Y(n1340) );
  AO22_X1M_A9TL U217 ( .A0(n37), .A1(FIFO_real_r[28]), .B0(n1700), .B1(
        FIFO_real_r[13]), .Y(n1380) );
  AO22_X1M_A9TL U218 ( .A0(n37), .A1(FIFO_real_r[27]), .B0(n1700), .B1(
        FIFO_real_r[12]), .Y(n1400) );
  AO22_X1M_A9TL U219 ( .A0(n37), .A1(FIFO_real_r[26]), .B0(n1700), .B1(
        FIFO_real_r[11]), .Y(n1420) );
  AO22_X1M_A9TL U220 ( .A0(n37), .A1(FIFO_real_r[25]), .B0(n1700), .B1(
        FIFO_real_r[10]), .Y(n1440) );
  AO22_X1M_A9TL U221 ( .A0(n37), .A1(FIFO_real_r[24]), .B0(n1700), .B1(
        FIFO_real_r[9]), .Y(n1460) );
  AO22_X1M_A9TL U222 ( .A0(n37), .A1(FIFO_real_r[23]), .B0(n1690), .B1(
        FIFO_real_r[8]), .Y(n1480) );
  AO22_X1M_A9TL U223 ( .A0(n37), .A1(FIFO_real_r[22]), .B0(n1690), .B1(
        FIFO_real_r[7]), .Y(n1500) );
  AO22_X1M_A9TL U224 ( .A0(n37), .A1(FIFO_real_r[21]), .B0(n1690), .B1(
        FIFO_real_r[6]), .Y(n1520) );
  AO22_X1M_A9TL U225 ( .A0(n37), .A1(FIFO_real_r[20]), .B0(n1690), .B1(
        FIFO_real_r[5]), .Y(n1540) );
  AO22_X1M_A9TL U226 ( .A0(n37), .A1(FIFO_real_r[19]), .B0(n1690), .B1(
        FIFO_real_r[4]), .Y(n1560) );
  AO22_X1M_A9TL U227 ( .A0(n37), .A1(FIFO_real_r[18]), .B0(n1690), .B1(
        FIFO_real_r[3]), .Y(n1580) );
  AO22_X1M_A9TL U228 ( .A0(n37), .A1(FIFO_real_r[17]), .B0(n1690), .B1(
        FIFO_real_r[2]), .Y(n1600) );
  AO22_X1M_A9TL U229 ( .A0(n37), .A1(FIFO_real_r[16]), .B0(n1690), .B1(
        FIFO_real_r[1]), .Y(n1620) );
  AO22_X1M_A9TL U230 ( .A0(n37), .A1(FIFO_real_r[15]), .B0(n1690), .B1(
        FIFO_real_r[0]), .Y(n1640) );
  XOR2_X0P5M_A9TH U231 ( .A(n176), .B(r341_carry[14]), .Y(N80) );
  AND2_X0P5B_A9TH U232 ( .A(r341_carry[13]), .B(n177), .Y(r341_carry[14]) );
  XOR2_X0P5M_A9TH U233 ( .A(n177), .B(r341_carry[13]), .Y(N79) );
  AND2_X0P5B_A9TH U234 ( .A(r341_carry[12]), .B(n178), .Y(r341_carry[13]) );
  XOR2_X0P5M_A9TH U235 ( .A(n178), .B(r341_carry[12]), .Y(N78) );
  AND2_X0P5B_A9TH U236 ( .A(r341_carry[11]), .B(n179), .Y(r341_carry[12]) );
  XOR2_X0P5M_A9TH U237 ( .A(n179), .B(r341_carry[11]), .Y(N77) );
  AND2_X0P5B_A9TH U238 ( .A(r341_carry[10]), .B(n180), .Y(r341_carry[11]) );
  XOR2_X0P5M_A9TH U239 ( .A(n180), .B(r341_carry[10]), .Y(N76) );
  AND2_X0P5B_A9TH U240 ( .A(r341_carry[9]), .B(n181), .Y(r341_carry[10]) );
  XOR2_X0P5M_A9TH U241 ( .A(n181), .B(r341_carry[9]), .Y(N75) );
  AND2_X0P5B_A9TH U242 ( .A(r341_carry[8]), .B(n182), .Y(r341_carry[9]) );
  XOR2_X0P5M_A9TH U243 ( .A(n182), .B(r341_carry[8]), .Y(N74) );
  AND2_X0P5B_A9TH U244 ( .A(r341_carry[7]), .B(n183), .Y(r341_carry[8]) );
  XOR2_X0P5M_A9TH U245 ( .A(n183), .B(r341_carry[7]), .Y(N73) );
  AND2_X0P5B_A9TH U246 ( .A(r341_carry[6]), .B(n184), .Y(r341_carry[7]) );
  XOR2_X0P5M_A9TH U247 ( .A(n184), .B(r341_carry[6]), .Y(N72) );
  AND2_X0P5B_A9TH U248 ( .A(r341_carry[5]), .B(n185), .Y(r341_carry[6]) );
  XOR2_X0P5M_A9TH U249 ( .A(n185), .B(r341_carry[5]), .Y(N71) );
  AND2_X0P5B_A9TH U250 ( .A(r341_carry[4]), .B(n186), .Y(r341_carry[5]) );
  XOR2_X0P5M_A9TH U251 ( .A(n186), .B(r341_carry[4]), .Y(N70) );
  AND2_X0P5B_A9TH U252 ( .A(r341_carry[3]), .B(n187), .Y(r341_carry[4]) );
  XOR2_X0P5M_A9TH U253 ( .A(n187), .B(r341_carry[3]), .Y(N69) );
  AND2_X0P5B_A9TH U254 ( .A(r341_carry[2]), .B(n188), .Y(r341_carry[3]) );
  XOR2_X0P5M_A9TH U255 ( .A(n188), .B(r341_carry[2]), .Y(N68) );
  AND2_X0P5B_A9TH U256 ( .A(n190), .B(n189), .Y(r341_carry[2]) );
  XOR2_X0P5M_A9TH U257 ( .A(n189), .B(n190), .Y(N67) );
endmodule


module FFT_2_DATA_WIDTH16_DW01_add_0 ( A, B, SUM );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  wire   n1;
  wire   [15:2] carry;

  ADDF_X1M_A9TL U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .S(SUM[15]) );
  ADDF_X1M_A9TL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), 
        .S(SUM[14]) );
  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), 
        .S(SUM[13]) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM[12]) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM[11]) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM[10]) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM[8]) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  AND2_X1B_A9TL U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2_X0P7M_A9TL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FFT_2_DATA_WIDTH16_DW01_add_1 ( A, B, SUM );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  wire   n1;
  wire   [15:2] carry;

  ADDF_X1M_A9TL U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .S(SUM[15]) );
  ADDF_X1M_A9TL U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), 
        .S(SUM[14]) );
  ADDF_X1M_A9TL U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), 
        .S(SUM[13]) );
  ADDF_X1M_A9TL U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(SUM[12]) );
  ADDF_X1M_A9TL U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(SUM[11]) );
  ADDF_X1M_A9TL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(SUM[10]) );
  ADDF_X1M_A9TL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDF_X1M_A9TL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(
        SUM[8]) );
  ADDF_X1M_A9TL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(
        SUM[7]) );
  ADDF_X1M_A9TL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  ADDF_X1M_A9TL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  ADDF_X1M_A9TL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  ADDF_X1M_A9TL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  ADDF_X1M_A9TL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  ADDF_X1M_A9TL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1])
         );
  AND2_X1B_A9TL U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2_X0P7M_A9TL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module FFT_2_DATA_WIDTH16_DW01_sub_0 ( A, B, DIFF );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [15:2] carry;

  ADDF_X1M_A9TL U2_15 ( .A(A[15]), .B(n2), .CI(carry[15]), .S(DIFF[15]) );
  ADDF_X1M_A9TL U2_14 ( .A(A[14]), .B(n3), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n4), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n5), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n6), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n7), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n8), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n10), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n11), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  ADDF_X1M_A9TL U2_5 ( .A(A[5]), .B(n12), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  ADDF_X1M_A9TL U2_4 ( .A(A[4]), .B(n13), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  ADDF_X1M_A9TL U2_3 ( .A(A[3]), .B(n14), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  ADDF_X1M_A9TL U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  ADDF_X1M_A9TL U2_1 ( .A(A[1]), .B(n16), .CI(n1), .CO(carry[2]), .S(DIFF[1])
         );
  OR2_X1B_A9TL U1 ( .A(A[0]), .B(n17), .Y(n1) );
  INV_X1M_A9TL U2 ( .A(B[1]), .Y(n16) );
  INV_X1M_A9TL U3 ( .A(B[2]), .Y(n15) );
  INV_X1M_A9TL U4 ( .A(B[3]), .Y(n14) );
  INV_X1M_A9TL U5 ( .A(B[4]), .Y(n13) );
  INV_X1M_A9TL U6 ( .A(B[5]), .Y(n12) );
  INV_X1M_A9TL U7 ( .A(B[6]), .Y(n11) );
  INV_X1M_A9TL U8 ( .A(B[7]), .Y(n10) );
  INV_X1M_A9TL U9 ( .A(B[8]), .Y(n9) );
  INV_X1M_A9TL U10 ( .A(B[9]), .Y(n8) );
  INV_X1M_A9TL U11 ( .A(B[10]), .Y(n7) );
  INV_X1M_A9TL U12 ( .A(B[11]), .Y(n6) );
  INV_X1M_A9TL U13 ( .A(B[12]), .Y(n5) );
  INV_X1M_A9TL U14 ( .A(B[13]), .Y(n4) );
  INV_X1M_A9TL U15 ( .A(B[14]), .Y(n3) );
  INV_X1M_A9TL U16 ( .A(B[0]), .Y(n17) );
  INV_X1M_A9TL U17 ( .A(B[15]), .Y(n2) );
  XNOR2_X0P7M_A9TL U18 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FFT_2_DATA_WIDTH16_DW01_sub_1 ( A, B, DIFF );
  input [15:0] A;
  input [15:0] B;
  output [15:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [15:2] carry;

  ADDF_X1M_A9TL U2_15 ( .A(A[15]), .B(n2), .CI(carry[15]), .S(DIFF[15]) );
  ADDF_X1M_A9TL U2_14 ( .A(A[14]), .B(n3), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDF_X1M_A9TL U2_13 ( .A(A[13]), .B(n4), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDF_X1M_A9TL U2_12 ( .A(A[12]), .B(n5), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDF_X1M_A9TL U2_11 ( .A(A[11]), .B(n6), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDF_X1M_A9TL U2_10 ( .A(A[10]), .B(n7), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDF_X1M_A9TL U2_9 ( .A(A[9]), .B(n8), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  ADDF_X1M_A9TL U2_8 ( .A(A[8]), .B(n9), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  ADDF_X1M_A9TL U2_7 ( .A(A[7]), .B(n10), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  ADDF_X1M_A9TL U2_6 ( .A(A[6]), .B(n11), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  ADDF_X1M_A9TL U2_5 ( .A(A[5]), .B(n12), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  ADDF_X1M_A9TL U2_4 ( .A(A[4]), .B(n13), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  ADDF_X1M_A9TL U2_3 ( .A(A[3]), .B(n14), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  ADDF_X1M_A9TL U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  ADDF_X1M_A9TL U2_1 ( .A(A[1]), .B(n16), .CI(n1), .CO(carry[2]), .S(DIFF[1])
         );
  OR2_X1B_A9TL U1 ( .A(A[0]), .B(n17), .Y(n1) );
  INV_X1M_A9TL U2 ( .A(B[1]), .Y(n16) );
  INV_X1M_A9TL U3 ( .A(B[2]), .Y(n15) );
  INV_X1M_A9TL U4 ( .A(B[3]), .Y(n14) );
  INV_X1M_A9TL U5 ( .A(B[4]), .Y(n13) );
  INV_X1M_A9TL U6 ( .A(B[5]), .Y(n12) );
  INV_X1M_A9TL U7 ( .A(B[6]), .Y(n11) );
  INV_X1M_A9TL U8 ( .A(B[7]), .Y(n10) );
  INV_X1M_A9TL U9 ( .A(B[8]), .Y(n9) );
  INV_X1M_A9TL U10 ( .A(B[9]), .Y(n8) );
  INV_X1M_A9TL U11 ( .A(B[10]), .Y(n7) );
  INV_X1M_A9TL U12 ( .A(B[11]), .Y(n6) );
  INV_X1M_A9TL U13 ( .A(B[12]), .Y(n5) );
  INV_X1M_A9TL U14 ( .A(B[13]), .Y(n4) );
  INV_X1M_A9TL U15 ( .A(B[14]), .Y(n3) );
  INV_X1M_A9TL U16 ( .A(B[0]), .Y(n17) );
  INV_X1M_A9TL U17 ( .A(B[15]), .Y(n2) );
  XNOR2_X0P7M_A9TL U18 ( .A(n17), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FFT_2_DATA_WIDTH16 ( clk, rst_n, valid_in, data_in_real, data_in_imag, 
        valid_out, data_out_real, data_out_imag );
  input [15:0] data_in_real;
  input [15:0] data_in_imag;
  output [15:0] data_out_real;
  output [15:0] data_out_imag;
  input clk, rst_n, valid_in;
  output valid_out;
  wire   N19, N20, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N51, N52,
         N53, N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66,
         N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80,
         N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, n13, n14, n15, n16,
         n17, n18, n190, n200, n21, n22, n23, n24, n25, n26, n270, n280, n290,
         n300, n310, n320, n330, n340, n350, n360, n370, n380, n390, n400,
         n410, n420, n430, n440, n450, n460, n470, n480, n490, n500, n520,
         n530, n540, n550, n560, n570, n580, n590, n600, n610, n620, n630,
         n640, n650, n660, n670, n680, n690, n700, n710, n720, n730, n740,
         n750, n760, n770, n780, n790, n800, n810, n820, n830, n840, n850,
         n860, n870, n880, n890, n900, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11;
  wire   [1:0] state_r;
  wire   [15:0] FIFO_real_r;
  wire   [15:0] FIFO_imag_r;
  wire   [15:0] data_in_real_r;
  wire   [15:0] data_in_imag_r;

  DFFRPQ_X2M_A9TL state_r_reg_0_ ( .D(N19), .CK(clk), .R(n6), .Q(state_r[0])
         );
  DFFRPQ_X2M_A9TL state_r_reg_1_ ( .D(N20), .CK(clk), .R(n8), .Q(state_r[1])
         );
  DFFRPQ_X2M_A9TL valid_out_r_reg ( .D(n152), .CK(clk), .R(n6), .Q(valid_out)
         );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_15_ ( .D(data_in_real[15]), .CK(clk), .R(
        n7), .Q(data_in_real_r[15]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_14_ ( .D(data_in_real[14]), .CK(clk), .R(
        n8), .Q(data_in_real_r[14]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_13_ ( .D(data_in_real[13]), .CK(clk), .R(
        n7), .Q(data_in_real_r[13]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_12_ ( .D(data_in_real[12]), .CK(clk), .R(
        n8), .Q(data_in_real_r[12]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_11_ ( .D(data_in_real[11]), .CK(clk), .R(
        n6), .Q(data_in_real_r[11]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_10_ ( .D(data_in_real[10]), .CK(clk), .R(
        n7), .Q(data_in_real_r[10]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_9_ ( .D(data_in_real[9]), .CK(clk), .R(n6), .Q(data_in_real_r[9]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_8_ ( .D(data_in_real[8]), .CK(clk), .R(n9), .Q(data_in_real_r[8]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_7_ ( .D(data_in_real[7]), .CK(clk), .R(n7), .Q(data_in_real_r[7]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_6_ ( .D(data_in_real[6]), .CK(clk), .R(n8), .Q(data_in_real_r[6]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_5_ ( .D(data_in_real[5]), .CK(clk), .R(n6), .Q(data_in_real_r[5]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_4_ ( .D(data_in_real[4]), .CK(clk), .R(n7), .Q(data_in_real_r[4]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_3_ ( .D(data_in_real[3]), .CK(clk), .R(n6), .Q(data_in_real_r[3]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_2_ ( .D(data_in_real[2]), .CK(clk), .R(n9), .Q(data_in_real_r[2]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_1_ ( .D(data_in_real[1]), .CK(clk), .R(n9), .Q(data_in_real_r[1]) );
  DFFRPQ_X2M_A9TL data_in_real_r_reg_0_ ( .D(data_in_real[0]), .CK(clk), .R(n9), .Q(data_in_real_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_0_ ( .D(n151), .CK(clk), .R(n9), .Q(
        FIFO_real_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_1_ ( .D(n150), .CK(clk), .R(n9), .Q(
        FIFO_real_r[1]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_2_ ( .D(n149), .CK(clk), .R(n9), .Q(
        FIFO_real_r[2]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_3_ ( .D(n148), .CK(clk), .R(n8), .Q(
        FIFO_real_r[3]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_4_ ( .D(n147), .CK(clk), .R(n9), .Q(
        FIFO_real_r[4]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_5_ ( .D(n146), .CK(clk), .R(n8), .Q(
        FIFO_real_r[5]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_6_ ( .D(n145), .CK(clk), .R(n8), .Q(
        FIFO_real_r[6]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_7_ ( .D(n144), .CK(clk), .R(n8), .Q(
        FIFO_real_r[7]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_8_ ( .D(n143), .CK(clk), .R(n8), .Q(
        FIFO_real_r[8]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_9_ ( .D(n142), .CK(clk), .R(n8), .Q(
        FIFO_real_r[9]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_10_ ( .D(n141), .CK(clk), .R(n8), .Q(
        FIFO_real_r[10]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_11_ ( .D(n140), .CK(clk), .R(n8), .Q(
        FIFO_real_r[11]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_12_ ( .D(n139), .CK(clk), .R(n8), .Q(
        FIFO_real_r[12]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_13_ ( .D(n138), .CK(clk), .R(n8), .Q(
        FIFO_real_r[13]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_14_ ( .D(n137), .CK(clk), .R(n8), .Q(
        FIFO_real_r[14]) );
  DFFRPQ_X2M_A9TL FIFO_real_r_reg_15_ ( .D(n136), .CK(clk), .R(n8), .Q(
        FIFO_real_r[15]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_15_ ( .D(data_in_imag[15]), .CK(clk), .R(
        n8), .Q(data_in_imag_r[15]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_14_ ( .D(data_in_imag[14]), .CK(clk), .R(
        n8), .Q(data_in_imag_r[14]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_13_ ( .D(data_in_imag[13]), .CK(clk), .R(
        n8), .Q(data_in_imag_r[13]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_12_ ( .D(data_in_imag[12]), .CK(clk), .R(
        n8), .Q(data_in_imag_r[12]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_11_ ( .D(data_in_imag[11]), .CK(clk), .R(
        n7), .Q(data_in_imag_r[11]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_10_ ( .D(data_in_imag[10]), .CK(clk), .R(
        n7), .Q(data_in_imag_r[10]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_9_ ( .D(data_in_imag[9]), .CK(clk), .R(n7), .Q(data_in_imag_r[9]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_8_ ( .D(data_in_imag[8]), .CK(clk), .R(n7), .Q(data_in_imag_r[8]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_7_ ( .D(data_in_imag[7]), .CK(clk), .R(n7), .Q(data_in_imag_r[7]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_6_ ( .D(data_in_imag[6]), .CK(clk), .R(n7), .Q(data_in_imag_r[6]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_5_ ( .D(data_in_imag[5]), .CK(clk), .R(n7), .Q(data_in_imag_r[5]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_4_ ( .D(data_in_imag[4]), .CK(clk), .R(n7), .Q(data_in_imag_r[4]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_3_ ( .D(data_in_imag[3]), .CK(clk), .R(n7), .Q(data_in_imag_r[3]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_2_ ( .D(data_in_imag[2]), .CK(clk), .R(n7), .Q(data_in_imag_r[2]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_1_ ( .D(data_in_imag[1]), .CK(clk), .R(n7), .Q(data_in_imag_r[1]) );
  DFFRPQ_X2M_A9TL data_in_imag_r_reg_0_ ( .D(data_in_imag[0]), .CK(clk), .R(n7), .Q(data_in_imag_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_0_ ( .D(n135), .CK(clk), .R(n7), .Q(
        FIFO_imag_r[0]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_1_ ( .D(n134), .CK(clk), .R(n7), .Q(
        FIFO_imag_r[1]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_2_ ( .D(n133), .CK(clk), .R(n7), .Q(
        FIFO_imag_r[2]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_3_ ( .D(n132), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[3]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_4_ ( .D(n131), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[4]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_5_ ( .D(n130), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[5]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_6_ ( .D(n129), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[6]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_7_ ( .D(n128), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[7]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_8_ ( .D(n127), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[8]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_9_ ( .D(n126), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[9]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_10_ ( .D(n125), .CK(clk), .R(n7), .Q(
        FIFO_imag_r[10]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_11_ ( .D(n124), .CK(clk), .R(n8), .Q(
        FIFO_imag_r[11]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_12_ ( .D(n123), .CK(clk), .R(n6), .Q(
        FIFO_imag_r[12]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_13_ ( .D(n122), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[13]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_14_ ( .D(n121), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[14]) );
  DFFRPQ_X2M_A9TL FIFO_imag_r_reg_15_ ( .D(n120), .CK(clk), .R(n9), .Q(
        FIFO_imag_r[15]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_1_ ( .D(n118), .CK(clk), .R(n9), .Q(
        data_out_imag[1]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_2_ ( .D(n117), .CK(clk), .R(n9), .Q(
        data_out_imag[2]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_3_ ( .D(n116), .CK(clk), .R(n6), .Q(
        data_out_imag[3]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_4_ ( .D(n115), .CK(clk), .R(n6), .Q(
        data_out_imag[4]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_5_ ( .D(n114), .CK(clk), .R(n6), .Q(
        data_out_imag[5]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_6_ ( .D(n113), .CK(clk), .R(n6), .Q(
        data_out_imag[6]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_7_ ( .D(n112), .CK(clk), .R(n6), .Q(
        data_out_imag[7]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_8_ ( .D(n111), .CK(clk), .R(n6), .Q(
        data_out_imag[8]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_9_ ( .D(n110), .CK(clk), .R(n6), .Q(
        data_out_imag[9]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_10_ ( .D(n109), .CK(clk), .R(n6), .Q(
        data_out_imag[10]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_11_ ( .D(n108), .CK(clk), .R(n6), .Q(
        data_out_imag[11]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_12_ ( .D(n107), .CK(clk), .R(n6), .Q(
        data_out_imag[12]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_13_ ( .D(n106), .CK(clk), .R(n6), .Q(
        data_out_imag[13]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_14_ ( .D(n105), .CK(clk), .R(n6), .Q(
        data_out_imag[14]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_15_ ( .D(n104), .CK(clk), .R(n6), .Q(
        data_out_imag[15]) );
  DFFRPQ_X2M_A9TL data_out_imag_r_reg_0_ ( .D(n119), .CK(clk), .R(n6), .Q(
        data_out_imag[0]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_15_ ( .D(n103), .CK(clk), .R(n6), .Q(
        data_out_real[15]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_14_ ( .D(n102), .CK(clk), .R(n7), .Q(
        data_out_real[14]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_13_ ( .D(n101), .CK(clk), .R(n9), .Q(
        data_out_real[13]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_12_ ( .D(n100), .CK(clk), .R(n9), .Q(
        data_out_real[12]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_11_ ( .D(n99), .CK(clk), .R(n6), .Q(
        data_out_real[11]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_10_ ( .D(n98), .CK(clk), .R(n8), .Q(
        data_out_real[10]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_9_ ( .D(n97), .CK(clk), .R(n7), .Q(
        data_out_real[9]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_8_ ( .D(n96), .CK(clk), .R(n7), .Q(
        data_out_real[8]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_7_ ( .D(n95), .CK(clk), .R(n8), .Q(
        data_out_real[7]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_6_ ( .D(n94), .CK(clk), .R(n6), .Q(
        data_out_real[6]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_5_ ( .D(n93), .CK(clk), .R(n9), .Q(
        data_out_real[5]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_4_ ( .D(n92), .CK(clk), .R(n9), .Q(
        data_out_real[4]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_3_ ( .D(n91), .CK(clk), .R(n8), .Q(
        data_out_real[3]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_2_ ( .D(n900), .CK(clk), .R(n7), .Q(
        data_out_real[2]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_1_ ( .D(n890), .CK(clk), .R(n8), .Q(
        data_out_real[1]) );
  DFFRPQ_X2M_A9TL data_out_real_r_reg_0_ ( .D(n880), .CK(clk), .R(n6), .Q(
        data_out_real[0]) );
  FFT_2_DATA_WIDTH16_DW01_add_0 add_764 ( .A(FIFO_imag_r), .B(data_in_imag_r), 
        .SUM({N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N79, N78, 
        N77, N76, N75}) );
  FFT_2_DATA_WIDTH16_DW01_add_1 add_763 ( .A(FIFO_real_r), .B(data_in_real_r), 
        .SUM({N74, N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, 
        N61, N60, N59}) );
  FFT_2_DATA_WIDTH16_DW01_sub_0 sub_762 ( .A(FIFO_imag_r), .B(data_in_imag_r), 
        .DIFF({N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, 
        N45, N44, N43}) );
  FFT_2_DATA_WIDTH16_DW01_sub_1 sub_761 ( .A(FIFO_real_r), .B(data_in_real_r), 
        .DIFF({N42, N41, N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, 
        N29, N28, N27}) );
  TIELO_X1M_A9TL U3 ( .Y(n1) );
  BUFH_X1M_A9TL U4 ( .A(n9), .Y(n6) );
  BUFH_X1M_A9TL U5 ( .A(n9), .Y(n7) );
  BUFH_X1M_A9TL U6 ( .A(n9), .Y(n8) );
  INV_X1M_A9TL U7 ( .A(rst_n), .Y(n9) );
  BUFH_X1M_A9TL U8 ( .A(n16), .Y(n4) );
  BUFH_X1M_A9TL U9 ( .A(n540), .Y(n3) );
  BUFH_X1M_A9TL U10 ( .A(n15), .Y(n5) );
  AOI21_X1M_A9TL U11 ( .A0(n490), .A1(n10), .B0(n13), .Y(n15) );
  NOR2_X1A_A9TL U12 ( .A(n480), .B(n13), .Y(n16) );
  NOR2B_X1M_A9TL U13 ( .AN(n500), .B(n480), .Y(n540) );
  NAND2_X1A_A9TL U14 ( .A(n480), .B(n10), .Y(n500) );
  INV_X1M_A9TL U15 ( .A(n860), .Y(n10) );
  AND2_X1B_A9TL U16 ( .A(n500), .B(n860), .Y(n530) );
  NAND2B_X1M_A9TL U17 ( .AN(n500), .B(n490), .Y(n2) );
  INV_X1M_A9TL U18 ( .A(n2), .Y(n13) );
  OAI2XB1_X1M_A9TL U19 ( .A1N(FIFO_imag_r[15]), .A0(n500), .B0(n520), .Y(n120)
         );
  AOI22_X1M_A9TL U20 ( .A0(data_in_imag_r[15]), .A1(n530), .B0(N58), .B1(n3), 
        .Y(n520) );
  OAI2XB1_X1M_A9TL U21 ( .A1N(FIFO_imag_r[13]), .A0(n500), .B0(n560), .Y(n122)
         );
  AOI22_X1M_A9TL U22 ( .A0(data_in_imag_r[13]), .A1(n530), .B0(N56), .B1(n3), 
        .Y(n560) );
  OAI2XB1_X1M_A9TL U23 ( .A1N(FIFO_imag_r[12]), .A0(n500), .B0(n570), .Y(n123)
         );
  AOI22_X1M_A9TL U24 ( .A0(data_in_imag_r[12]), .A1(n530), .B0(N55), .B1(n3), 
        .Y(n570) );
  OAI2XB1_X1M_A9TL U25 ( .A1N(FIFO_imag_r[11]), .A0(n500), .B0(n580), .Y(n124)
         );
  AOI22_X1M_A9TL U26 ( .A0(data_in_imag_r[11]), .A1(n530), .B0(N54), .B1(n3), 
        .Y(n580) );
  OAI2XB1_X1M_A9TL U27 ( .A1N(FIFO_imag_r[10]), .A0(n500), .B0(n590), .Y(n125)
         );
  AOI22_X1M_A9TL U28 ( .A0(data_in_imag_r[10]), .A1(n530), .B0(N53), .B1(n3), 
        .Y(n590) );
  OAI2XB1_X1M_A9TL U29 ( .A1N(FIFO_imag_r[9]), .A0(n500), .B0(n600), .Y(n126)
         );
  AOI22_X1M_A9TL U30 ( .A0(data_in_imag_r[9]), .A1(n530), .B0(N52), .B1(n3), 
        .Y(n600) );
  OAI2XB1_X1M_A9TL U31 ( .A1N(FIFO_imag_r[8]), .A0(n500), .B0(n610), .Y(n127)
         );
  AOI22_X1M_A9TL U32 ( .A0(data_in_imag_r[8]), .A1(n530), .B0(N51), .B1(n3), 
        .Y(n610) );
  OAI2XB1_X1M_A9TL U33 ( .A1N(FIFO_real_r[15]), .A0(n500), .B0(n700), .Y(n136)
         );
  AOI22_X1M_A9TL U34 ( .A0(data_in_real_r[15]), .A1(n530), .B0(N42), .B1(n3), 
        .Y(n700) );
  OAI2XB1_X1M_A9TL U35 ( .A1N(FIFO_real_r[13]), .A0(n500), .B0(n720), .Y(n138)
         );
  AOI22_X1M_A9TL U36 ( .A0(data_in_real_r[13]), .A1(n530), .B0(N40), .B1(n540), 
        .Y(n720) );
  OAI2XB1_X1M_A9TL U37 ( .A1N(FIFO_real_r[12]), .A0(n500), .B0(n730), .Y(n139)
         );
  AOI22_X1M_A9TL U38 ( .A0(data_in_real_r[12]), .A1(n530), .B0(N39), .B1(n540), 
        .Y(n730) );
  OAI2XB1_X1M_A9TL U39 ( .A1N(FIFO_real_r[11]), .A0(n500), .B0(n740), .Y(n140)
         );
  AOI22_X1M_A9TL U40 ( .A0(data_in_real_r[11]), .A1(n530), .B0(N38), .B1(n540), 
        .Y(n740) );
  OAI2XB1_X1M_A9TL U41 ( .A1N(FIFO_real_r[10]), .A0(n500), .B0(n750), .Y(n141)
         );
  AOI22_X1M_A9TL U42 ( .A0(data_in_real_r[10]), .A1(n530), .B0(N37), .B1(n540), 
        .Y(n750) );
  OAI2XB1_X1M_A9TL U43 ( .A1N(FIFO_real_r[9]), .A0(n500), .B0(n760), .Y(n142)
         );
  AOI22_X1M_A9TL U44 ( .A0(data_in_real_r[9]), .A1(n530), .B0(N36), .B1(n540), 
        .Y(n760) );
  OAI2XB1_X1M_A9TL U45 ( .A1N(FIFO_real_r[8]), .A0(n500), .B0(n770), .Y(n143)
         );
  AOI22_X1M_A9TL U46 ( .A0(data_in_real_r[8]), .A1(n530), .B0(N35), .B1(n540), 
        .Y(n770) );
  OAI2XB1_X1M_A9TL U47 ( .A1N(FIFO_imag_r[14]), .A0(n500), .B0(n550), .Y(n121)
         );
  AOI22_X1M_A9TL U48 ( .A0(data_in_imag_r[14]), .A1(n530), .B0(N57), .B1(n3), 
        .Y(n550) );
  OAI2XB1_X1M_A9TL U49 ( .A1N(FIFO_real_r[14]), .A0(n500), .B0(n710), .Y(n137)
         );
  AOI22_X1M_A9TL U50 ( .A0(data_in_real_r[14]), .A1(n530), .B0(N41), .B1(n540), 
        .Y(n710) );
  AO1B2_X1M_A9TL U51 ( .B0(data_out_real[8]), .B1(n13), .A0N(n24), .Y(n96) );
  AOI22_X1M_A9TL U52 ( .A0(FIFO_real_r[8]), .A1(n5), .B0(N67), .B1(n4), .Y(n24) );
  AO1B2_X1M_A9TL U53 ( .B0(data_out_real[9]), .B1(n13), .A0N(n25), .Y(n97) );
  AOI22_X1M_A9TL U54 ( .A0(FIFO_real_r[9]), .A1(n5), .B0(N68), .B1(n4), .Y(n25) );
  AO1B2_X1M_A9TL U55 ( .B0(data_out_real[10]), .B1(n13), .A0N(n26), .Y(n98) );
  AOI22_X1M_A9TL U56 ( .A0(FIFO_real_r[10]), .A1(n5), .B0(N69), .B1(n4), .Y(
        n26) );
  AO1B2_X1M_A9TL U57 ( .B0(data_out_real[11]), .B1(n13), .A0N(n270), .Y(n99)
         );
  AOI22_X1M_A9TL U58 ( .A0(FIFO_real_r[11]), .A1(n5), .B0(N70), .B1(n4), .Y(
        n270) );
  AO1B2_X1M_A9TL U59 ( .B0(data_out_real[12]), .B1(n13), .A0N(n280), .Y(n100)
         );
  AOI22_X1M_A9TL U60 ( .A0(FIFO_real_r[12]), .A1(n5), .B0(N71), .B1(n4), .Y(
        n280) );
  AO1B2_X1M_A9TL U61 ( .B0(data_out_real[13]), .B1(n13), .A0N(n290), .Y(n101)
         );
  AOI22_X1M_A9TL U62 ( .A0(FIFO_real_r[13]), .A1(n5), .B0(N72), .B1(n4), .Y(
        n290) );
  AO1B2_X1M_A9TL U63 ( .B0(data_out_real[14]), .B1(n13), .A0N(n300), .Y(n102)
         );
  AOI22_X1M_A9TL U64 ( .A0(FIFO_real_r[14]), .A1(n5), .B0(N73), .B1(n16), .Y(
        n300) );
  AO1B2_X1M_A9TL U65 ( .B0(data_out_real[15]), .B1(n13), .A0N(n310), .Y(n103)
         );
  AOI22_X1M_A9TL U66 ( .A0(FIFO_real_r[15]), .A1(n5), .B0(N74), .B1(n16), .Y(
        n310) );
  AO1B2_X1M_A9TL U67 ( .B0(data_out_imag[15]), .B1(n13), .A0N(n320), .Y(n104)
         );
  AOI22_X1M_A9TL U68 ( .A0(FIFO_imag_r[15]), .A1(n5), .B0(N90), .B1(n16), .Y(
        n320) );
  AO1B2_X1M_A9TL U69 ( .B0(data_out_imag[14]), .B1(n13), .A0N(n330), .Y(n105)
         );
  AOI22_X1M_A9TL U70 ( .A0(FIFO_imag_r[14]), .A1(n5), .B0(N89), .B1(n16), .Y(
        n330) );
  AO1B2_X1M_A9TL U71 ( .B0(data_out_imag[13]), .B1(n13), .A0N(n340), .Y(n106)
         );
  AOI22_X1M_A9TL U72 ( .A0(FIFO_imag_r[13]), .A1(n15), .B0(N88), .B1(n4), .Y(
        n340) );
  AO1B2_X1M_A9TL U73 ( .B0(data_out_imag[12]), .B1(n13), .A0N(n350), .Y(n107)
         );
  AOI22_X1M_A9TL U74 ( .A0(FIFO_imag_r[12]), .A1(n15), .B0(N87), .B1(n4), .Y(
        n350) );
  AO1B2_X1M_A9TL U75 ( .B0(data_out_imag[11]), .B1(n13), .A0N(n360), .Y(n108)
         );
  AOI22_X1M_A9TL U76 ( .A0(FIFO_imag_r[11]), .A1(n15), .B0(N86), .B1(n4), .Y(
        n360) );
  AO1B2_X1M_A9TL U77 ( .B0(data_out_imag[10]), .B1(n13), .A0N(n370), .Y(n109)
         );
  AOI22_X1M_A9TL U78 ( .A0(FIFO_imag_r[10]), .A1(n15), .B0(N85), .B1(n4), .Y(
        n370) );
  AO1B2_X1M_A9TL U79 ( .B0(data_out_imag[9]), .B1(n13), .A0N(n380), .Y(n110)
         );
  AOI22_X1M_A9TL U80 ( .A0(FIFO_imag_r[9]), .A1(n15), .B0(N84), .B1(n16), .Y(
        n380) );
  AO1B2_X1M_A9TL U81 ( .B0(data_out_imag[8]), .B1(n13), .A0N(n390), .Y(n111)
         );
  AOI22_X1M_A9TL U82 ( .A0(FIFO_imag_r[8]), .A1(n15), .B0(N83), .B1(n16), .Y(
        n390) );
  NAND2_X1A_A9TL U83 ( .A(state_r[1]), .B(n11), .Y(n480) );
  NAND2_X1A_A9TL U84 ( .A(state_r[1]), .B(state_r[0]), .Y(n490) );
  NOR2_X1A_A9TL U85 ( .A(n11), .B(state_r[1]), .Y(n860) );
  OAI2XB1_X1M_A9TL U86 ( .A1N(FIFO_imag_r[7]), .A0(n500), .B0(n620), .Y(n128)
         );
  AOI22_X1M_A9TL U87 ( .A0(data_in_imag_r[7]), .A1(n530), .B0(N50), .B1(n3), 
        .Y(n620) );
  OAI2XB1_X1M_A9TL U88 ( .A1N(FIFO_imag_r[6]), .A0(n500), .B0(n630), .Y(n129)
         );
  AOI22_X1M_A9TL U89 ( .A0(data_in_imag_r[6]), .A1(n530), .B0(N49), .B1(n3), 
        .Y(n630) );
  OAI2XB1_X1M_A9TL U90 ( .A1N(FIFO_imag_r[5]), .A0(n500), .B0(n640), .Y(n130)
         );
  AOI22_X1M_A9TL U91 ( .A0(data_in_imag_r[5]), .A1(n530), .B0(N48), .B1(n3), 
        .Y(n640) );
  OAI2XB1_X1M_A9TL U92 ( .A1N(FIFO_imag_r[4]), .A0(n500), .B0(n650), .Y(n131)
         );
  AOI22_X1M_A9TL U93 ( .A0(data_in_imag_r[4]), .A1(n530), .B0(N47), .B1(n3), 
        .Y(n650) );
  OAI2XB1_X1M_A9TL U94 ( .A1N(FIFO_imag_r[2]), .A0(n500), .B0(n670), .Y(n133)
         );
  AOI22_X1M_A9TL U95 ( .A0(data_in_imag_r[2]), .A1(n530), .B0(N45), .B1(n3), 
        .Y(n670) );
  OAI2XB1_X1M_A9TL U96 ( .A1N(FIFO_imag_r[1]), .A0(n500), .B0(n680), .Y(n134)
         );
  AOI22_X1M_A9TL U97 ( .A0(data_in_imag_r[1]), .A1(n530), .B0(N44), .B1(n3), 
        .Y(n680) );
  OAI2XB1_X1M_A9TL U98 ( .A1N(FIFO_real_r[7]), .A0(n500), .B0(n780), .Y(n144)
         );
  AOI22_X1M_A9TL U99 ( .A0(data_in_real_r[7]), .A1(n530), .B0(N34), .B1(n540), 
        .Y(n780) );
  OAI2XB1_X1M_A9TL U100 ( .A1N(FIFO_real_r[6]), .A0(n500), .B0(n790), .Y(n145)
         );
  AOI22_X1M_A9TL U101 ( .A0(data_in_real_r[6]), .A1(n530), .B0(N33), .B1(n540), 
        .Y(n790) );
  OAI2XB1_X1M_A9TL U102 ( .A1N(FIFO_real_r[5]), .A0(n500), .B0(n800), .Y(n146)
         );
  AOI22_X1M_A9TL U103 ( .A0(data_in_real_r[5]), .A1(n530), .B0(N32), .B1(n540), 
        .Y(n800) );
  OAI2XB1_X1M_A9TL U104 ( .A1N(FIFO_real_r[4]), .A0(n500), .B0(n810), .Y(n147)
         );
  AOI22_X1M_A9TL U105 ( .A0(data_in_real_r[4]), .A1(n530), .B0(N31), .B1(n540), 
        .Y(n810) );
  OAI2XB1_X1M_A9TL U106 ( .A1N(FIFO_real_r[2]), .A0(n500), .B0(n830), .Y(n149)
         );
  AOI22_X1M_A9TL U107 ( .A0(data_in_real_r[2]), .A1(n530), .B0(N29), .B1(n540), 
        .Y(n830) );
  OAI2XB1_X1M_A9TL U108 ( .A1N(FIFO_real_r[1]), .A0(n500), .B0(n840), .Y(n150)
         );
  AOI22_X1M_A9TL U109 ( .A0(data_in_real_r[1]), .A1(n530), .B0(N28), .B1(n3), 
        .Y(n840) );
  INV_X1M_A9TL U110 ( .A(state_r[0]), .Y(n11) );
  NAND3_X1A_A9TL U111 ( .A(n490), .B(n870), .C(n480), .Y(n152) );
  NAND2_X1A_A9TL U112 ( .A(n860), .B(valid_out), .Y(n870) );
  OAI2XB1_X1M_A9TL U113 ( .A1N(FIFO_imag_r[0]), .A0(n500), .B0(n690), .Y(n135)
         );
  AOI22_X1M_A9TL U114 ( .A0(data_in_imag_r[0]), .A1(n530), .B0(N43), .B1(n540), 
        .Y(n690) );
  OAI2XB1_X1M_A9TL U115 ( .A1N(FIFO_real_r[0]), .A0(n500), .B0(n850), .Y(n151)
         );
  AOI22_X1M_A9TL U116 ( .A0(data_in_real_r[0]), .A1(n530), .B0(N27), .B1(n3), 
        .Y(n850) );
  AO1B2_X1M_A9TL U117 ( .B0(n11), .B1(valid_in), .A0N(n480), .Y(N19) );
  OAI2XB1_X1M_A9TL U118 ( .A1N(FIFO_imag_r[3]), .A0(n500), .B0(n660), .Y(n132)
         );
  AOI22_X1M_A9TL U119 ( .A0(data_in_imag_r[3]), .A1(n530), .B0(N46), .B1(n3), 
        .Y(n660) );
  OAI2XB1_X1M_A9TL U120 ( .A1N(FIFO_real_r[3]), .A0(n500), .B0(n820), .Y(n148)
         );
  AOI22_X1M_A9TL U121 ( .A0(data_in_real_r[3]), .A1(n530), .B0(N30), .B1(n540), 
        .Y(n820) );
  OAI21_X1M_A9TL U122 ( .A0(valid_in), .A1(n480), .B0(n10), .Y(N20) );
  AO1B2_X1M_A9TL U123 ( .B0(data_out_real[0]), .B1(n13), .A0N(n14), .Y(n880)
         );
  AOI22_X1M_A9TL U124 ( .A0(FIFO_real_r[0]), .A1(n5), .B0(N59), .B1(n4), .Y(
        n14) );
  AO1B2_X1M_A9TL U125 ( .B0(data_out_imag[0]), .B1(n13), .A0N(n470), .Y(n119)
         );
  AOI22_X1M_A9TL U126 ( .A0(FIFO_imag_r[0]), .A1(n5), .B0(N75), .B1(n4), .Y(
        n470) );
  AO1B2_X1M_A9TL U127 ( .B0(data_out_real[1]), .B1(n13), .A0N(n17), .Y(n890)
         );
  AOI22_X1M_A9TL U128 ( .A0(FIFO_real_r[1]), .A1(n5), .B0(N60), .B1(n4), .Y(
        n17) );
  AO1B2_X1M_A9TL U129 ( .B0(data_out_real[2]), .B1(n13), .A0N(n18), .Y(n900)
         );
  AOI22_X1M_A9TL U130 ( .A0(FIFO_real_r[2]), .A1(n5), .B0(N61), .B1(n4), .Y(
        n18) );
  AO1B2_X1M_A9TL U131 ( .B0(data_out_real[3]), .B1(n13), .A0N(n190), .Y(n91)
         );
  AOI22_X1M_A9TL U132 ( .A0(FIFO_real_r[3]), .A1(n5), .B0(N62), .B1(n4), .Y(
        n190) );
  AO1B2_X1M_A9TL U133 ( .B0(data_out_real[4]), .B1(n13), .A0N(n200), .Y(n92)
         );
  AOI22_X1M_A9TL U134 ( .A0(FIFO_real_r[4]), .A1(n5), .B0(N63), .B1(n4), .Y(
        n200) );
  AO1B2_X1M_A9TL U135 ( .B0(data_out_real[5]), .B1(n13), .A0N(n21), .Y(n93) );
  AOI22_X1M_A9TL U136 ( .A0(FIFO_real_r[5]), .A1(n5), .B0(N64), .B1(n4), .Y(
        n21) );
  AO1B2_X1M_A9TL U137 ( .B0(data_out_real[6]), .B1(n13), .A0N(n22), .Y(n94) );
  AOI22_X1M_A9TL U138 ( .A0(FIFO_real_r[6]), .A1(n5), .B0(N65), .B1(n4), .Y(
        n22) );
  AO1B2_X1M_A9TL U139 ( .B0(data_out_real[7]), .B1(n13), .A0N(n23), .Y(n95) );
  AOI22_X1M_A9TL U140 ( .A0(FIFO_real_r[7]), .A1(n5), .B0(N66), .B1(n4), .Y(
        n23) );
  AO1B2_X1M_A9TL U141 ( .B0(data_out_imag[7]), .B1(n13), .A0N(n400), .Y(n112)
         );
  AOI22_X1M_A9TL U142 ( .A0(FIFO_imag_r[7]), .A1(n15), .B0(N82), .B1(n16), .Y(
        n400) );
  AO1B2_X1M_A9TL U143 ( .B0(data_out_imag[6]), .B1(n13), .A0N(n410), .Y(n113)
         );
  AOI22_X1M_A9TL U144 ( .A0(FIFO_imag_r[6]), .A1(n15), .B0(N81), .B1(n16), .Y(
        n410) );
  AO1B2_X1M_A9TL U145 ( .B0(data_out_imag[5]), .B1(n13), .A0N(n420), .Y(n114)
         );
  AOI22_X1M_A9TL U146 ( .A0(FIFO_imag_r[5]), .A1(n15), .B0(N80), .B1(n16), .Y(
        n420) );
  AO1B2_X1M_A9TL U147 ( .B0(data_out_imag[4]), .B1(n13), .A0N(n430), .Y(n115)
         );
  AOI22_X1M_A9TL U148 ( .A0(FIFO_imag_r[4]), .A1(n15), .B0(N79), .B1(n16), .Y(
        n430) );
  AO1B2_X1M_A9TL U149 ( .B0(data_out_imag[3]), .B1(n13), .A0N(n440), .Y(n116)
         );
  AOI22_X1M_A9TL U150 ( .A0(FIFO_imag_r[3]), .A1(n5), .B0(N78), .B1(n16), .Y(
        n440) );
  AO1B2_X1M_A9TL U151 ( .B0(data_out_imag[2]), .B1(n13), .A0N(n450), .Y(n117)
         );
  AOI22_X1M_A9TL U152 ( .A0(FIFO_imag_r[2]), .A1(n5), .B0(N77), .B1(n4), .Y(
        n450) );
  AO1B2_X1M_A9TL U153 ( .B0(data_out_imag[1]), .B1(n13), .A0N(n460), .Y(n118)
         );
  AOI22_X1M_A9TL U154 ( .A0(FIFO_imag_r[1]), .A1(n5), .B0(N76), .B1(n16), .Y(
        n460) );
endmodule


module FFT_PROC ( clk, rst_n, valid_in, data_in_real, data_in_imag, mode, 
        mode_en, ready, valid_out, data_out_real, data_out_imag );
  input [12:0] data_in_real;
  input [12:0] data_in_imag;
  input [2:0] mode;
  output [15:0] data_out_real;
  output [15:0] data_out_imag;
  input clk, rst_n, valid_in, mode_en;
  output ready, valid_out;
  wire   N41, N42, N43, fft_8_valid_in, fft_8_valid_out, fft_4_valid_in,
         fft_4_valid_out, fft_2_valid_out, N57, N58, N59, N60, valid_in_r, N71,
         N72, N73, N78, N107, N108, N131, N132, N133, N134, N135, N196, N197,
         N198, N199, N200, N201, N507, N508, N509, N510, N511, N512, N513,
         N514, N515, N516, N517, N518, N519, N520, N521, N522, N523, N524,
         N525, N526, N527, N528, N529, N530, N531, N532, N533, N534, N535,
         N536, N537, N538, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n1070, n1080, n109, n110,
         n111, n112, n113, n114, n115, n1340, n1350, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n186, n187, n188, n190, n192, n193, n195, n1970, n1990, n2010, n203,
         n205, n207, n209, n211, n213, n215, n217, n219, n221, n223, n225,
         n227, n229, n231, n233, n235, n237, n239, n241, n243, n245, n247,
         n249, n251, n253, n255, n257, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n5070, n5080, n5090, n5100, n5110, n5120, n5130, n5140;
  wire   [1:0] state_r;
  wire   [13:0] fft_8_in_real;
  wire   [13:0] fft_8_in_imag;
  wire   [13:0] fft_8_out_real;
  wire   [13:0] fft_8_out_imag;
  wire   [14:0] fft_4_in_real;
  wire   [14:0] fft_4_in_imag;
  wire   [14:0] fft_4_out_real;
  wire   [14:0] fft_4_out_imag;
  wire   [15:0] fft_2_out_real;
  wire   [15:0] fft_2_out_imag;
  wire   [2:0] mode_r;
  wire   [4:2] fft_point;
  wire   [5:3] counter_r;
  wire   [15:0] data_out_real_w;
  wire   [15:0] data_out_imag_w;
  wire   [127:0] output_buf_real_r;
  wire   [127:0] output_buf_imag_r;
  wire   [127:0] output_buf_real_w;
  wire   [127:0] output_buf_imag_w;
  wire   [5:2] r398_carry;

  DFFRPQ_X2M_A9TL valid_in_r_reg ( .D(valid_in), .CK(clk), .R(n456), .Q(
        valid_in_r) );
  DFFRPQ_X2M_A9TL counter_r_reg_0_ ( .D(N196), .CK(clk), .R(n456), .Q(N41) );
  DFFRPQ_X2M_A9TL state_r_reg_0_ ( .D(N107), .CK(clk), .R(n456), .Q(state_r[0]) );
  DFFRPQ_X2M_A9TL state_r_reg_1_ ( .D(N108), .CK(clk), .R(n456), .Q(state_r[1]) );
  DFFRPQ_X2M_A9TL mode_r_reg_1_ ( .D(n259), .CK(clk), .R(n456), .Q(mode_r[1])
         );
  DFFRPQ_X2M_A9TL mode_r_reg_2_ ( .D(n261), .CK(clk), .R(n456), .Q(mode_r[2])
         );
  DFFRPQ_X2M_A9TL counter_r_reg_1_ ( .D(N197), .CK(clk), .R(n456), .Q(N42) );
  DFFRPQ_X2M_A9TL counter_r_reg_2_ ( .D(N198), .CK(clk), .R(n456), .Q(N43) );
  DFFRPQ_X2M_A9TL counter_r_reg_3_ ( .D(N199), .CK(clk), .R(n456), .Q(
        counter_r[3]) );
  DFFRPQ_X2M_A9TL counter_r_reg_4_ ( .D(N200), .CK(clk), .R(n455), .Q(
        counter_r[4]) );
  DFFRPQ_X2M_A9TL counter_r_reg_5_ ( .D(N201), .CK(clk), .R(n455), .Q(
        counter_r[5]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__9_ ( .D(output_buf_real_w[9]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[9]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__8_ ( .D(output_buf_real_w[8]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[8]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__7_ ( .D(output_buf_real_w[7]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[7]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__6_ ( .D(output_buf_real_w[6]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[6]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__5_ ( .D(output_buf_real_w[5]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[5]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__4_ ( .D(output_buf_real_w[4]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[4]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__3_ ( .D(output_buf_real_w[3]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[3]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__2_ ( .D(output_buf_real_w[2]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[2]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__1_ ( .D(output_buf_real_w[1]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[1]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__15_ ( .D(output_buf_real_w[15]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[15]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__14_ ( .D(output_buf_real_w[14]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[14]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__13_ ( .D(output_buf_real_w[13]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[13]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__12_ ( .D(output_buf_real_w[12]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[12]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__11_ ( .D(output_buf_real_w[11]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[11]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__10_ ( .D(output_buf_real_w[10]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[10]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_0__0_ ( .D(output_buf_real_w[0]), .CK(
        clk), .R(n455), .Q(output_buf_real_r[0]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__9_ ( .D(output_buf_real_w[25]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[25]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__8_ ( .D(output_buf_real_w[24]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[24]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__7_ ( .D(output_buf_real_w[23]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[23]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__6_ ( .D(output_buf_real_w[22]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[22]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__5_ ( .D(output_buf_real_w[21]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[21]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__4_ ( .D(output_buf_real_w[20]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[20]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__3_ ( .D(output_buf_real_w[19]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[19]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__2_ ( .D(output_buf_real_w[18]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[18]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__1_ ( .D(output_buf_real_w[17]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[17]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__15_ ( .D(output_buf_real_w[31]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[31]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__14_ ( .D(output_buf_real_w[30]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[30]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__13_ ( .D(output_buf_real_w[29]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[29]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__12_ ( .D(output_buf_real_w[28]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[28]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__11_ ( .D(output_buf_real_w[27]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[27]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__10_ ( .D(output_buf_real_w[26]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[26]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_1__0_ ( .D(output_buf_real_w[16]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[16]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__9_ ( .D(output_buf_real_w[121]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[121]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__8_ ( .D(output_buf_real_w[120]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[120]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__7_ ( .D(output_buf_real_w[119]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[119]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__6_ ( .D(output_buf_real_w[118]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[118]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__5_ ( .D(output_buf_real_w[117]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[117]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__4_ ( .D(output_buf_real_w[116]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[116]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__3_ ( .D(output_buf_real_w[115]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[115]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__2_ ( .D(output_buf_real_w[114]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[114]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__1_ ( .D(output_buf_real_w[113]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[113]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__15_ ( .D(output_buf_real_w[127]), 
        .CK(clk), .R(n458), .Q(output_buf_real_r[127]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__14_ ( .D(output_buf_real_w[126]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[126]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__13_ ( .D(output_buf_real_w[125]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[125]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__12_ ( .D(output_buf_real_w[124]), 
        .CK(clk), .R(n458), .Q(output_buf_real_r[124]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__11_ ( .D(output_buf_real_w[123]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[123]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__10_ ( .D(output_buf_real_w[122]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[122]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_7__0_ ( .D(output_buf_real_w[112]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[112]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__9_ ( .D(output_buf_real_w[105]), 
        .CK(clk), .R(n458), .Q(output_buf_real_r[105]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__8_ ( .D(output_buf_real_w[104]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[104]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__7_ ( .D(output_buf_real_w[103]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[103]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__6_ ( .D(output_buf_real_w[102]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[102]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__5_ ( .D(output_buf_real_w[101]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[101]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__4_ ( .D(output_buf_real_w[100]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[100]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__3_ ( .D(output_buf_real_w[99]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[99]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__2_ ( .D(output_buf_real_w[98]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[98]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__1_ ( .D(output_buf_real_w[97]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[97]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__15_ ( .D(output_buf_real_w[111]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[111]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__14_ ( .D(output_buf_real_w[110]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[110]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__13_ ( .D(output_buf_real_w[109]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[109]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__12_ ( .D(output_buf_real_w[108]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[108]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__11_ ( .D(output_buf_real_w[107]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[107]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__10_ ( .D(output_buf_real_w[106]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[106]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_6__0_ ( .D(output_buf_real_w[96]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[96]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__9_ ( .D(output_buf_real_w[57]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[57]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__8_ ( .D(output_buf_real_w[56]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[56]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__7_ ( .D(output_buf_real_w[55]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[55]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__6_ ( .D(output_buf_real_w[54]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[54]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__5_ ( .D(output_buf_real_w[53]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[53]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__4_ ( .D(output_buf_real_w[52]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[52]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__3_ ( .D(output_buf_real_w[51]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[51]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__2_ ( .D(output_buf_real_w[50]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[50]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__1_ ( .D(output_buf_real_w[49]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[49]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__15_ ( .D(output_buf_real_w[63]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[63]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__14_ ( .D(output_buf_real_w[62]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[62]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__13_ ( .D(output_buf_real_w[61]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[61]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__12_ ( .D(output_buf_real_w[60]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[60]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__11_ ( .D(output_buf_real_w[59]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[59]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__10_ ( .D(output_buf_real_w[58]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[58]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_3__0_ ( .D(output_buf_real_w[48]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[48]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__9_ ( .D(output_buf_real_w[89]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[89]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__8_ ( .D(output_buf_real_w[88]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[88]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__7_ ( .D(output_buf_real_w[87]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[87]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__6_ ( .D(output_buf_real_w[86]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[86]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__5_ ( .D(output_buf_real_w[85]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[85]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__4_ ( .D(output_buf_real_w[84]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[84]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__3_ ( .D(output_buf_real_w[83]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[83]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__2_ ( .D(output_buf_real_w[82]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[82]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__1_ ( .D(output_buf_real_w[81]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[81]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__15_ ( .D(output_buf_real_w[95]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[95]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__14_ ( .D(output_buf_real_w[94]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[94]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__13_ ( .D(output_buf_real_w[93]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[93]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__12_ ( .D(output_buf_real_w[92]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[92]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__11_ ( .D(output_buf_real_w[91]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[91]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__10_ ( .D(output_buf_real_w[90]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[90]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_5__0_ ( .D(output_buf_real_w[80]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[80]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__9_ ( .D(output_buf_real_w[73]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[73]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__8_ ( .D(output_buf_real_w[72]), 
        .CK(clk), .R(n454), .Q(output_buf_real_r[72]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__7_ ( .D(output_buf_real_w[71]), 
        .CK(clk), .R(n455), .Q(output_buf_real_r[71]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__6_ ( .D(output_buf_real_w[70]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[70]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__5_ ( .D(output_buf_real_w[69]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[69]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__4_ ( .D(output_buf_real_w[68]), 
        .CK(clk), .R(n459), .Q(output_buf_real_r[68]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__3_ ( .D(output_buf_real_w[67]), 
        .CK(clk), .R(n461), .Q(output_buf_real_r[67]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__2_ ( .D(output_buf_real_w[66]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[66]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__1_ ( .D(output_buf_real_w[65]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[65]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__15_ ( .D(output_buf_real_w[79]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[79]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__14_ ( .D(output_buf_real_w[78]), 
        .CK(clk), .R(n460), .Q(output_buf_real_r[78]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__13_ ( .D(output_buf_real_w[77]), 
        .CK(clk), .R(n457), .Q(output_buf_real_r[77]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__12_ ( .D(output_buf_real_w[76]), 
        .CK(clk), .R(n461), .Q(output_buf_real_r[76]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__11_ ( .D(output_buf_real_w[75]), 
        .CK(clk), .R(n459), .Q(output_buf_real_r[75]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__10_ ( .D(output_buf_real_w[74]), 
        .CK(clk), .R(n456), .Q(output_buf_real_r[74]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_4__0_ ( .D(output_buf_real_w[64]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[64]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__9_ ( .D(output_buf_real_w[41]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[41]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__8_ ( .D(output_buf_real_w[40]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[40]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__7_ ( .D(output_buf_real_w[39]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[39]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__6_ ( .D(output_buf_real_w[38]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[38]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__5_ ( .D(output_buf_real_w[37]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[37]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__4_ ( .D(output_buf_real_w[36]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[36]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__3_ ( .D(output_buf_real_w[35]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[35]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__2_ ( .D(output_buf_real_w[34]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[34]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__1_ ( .D(output_buf_real_w[33]), 
        .CK(clk), .R(n452), .Q(output_buf_real_r[33]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__15_ ( .D(output_buf_real_w[47]), 
        .CK(clk), .R(n453), .Q(output_buf_real_r[47]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__14_ ( .D(output_buf_real_w[46]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[46]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__13_ ( .D(output_buf_real_w[45]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[45]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__12_ ( .D(output_buf_real_w[44]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[44]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__11_ ( .D(output_buf_real_w[43]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[43]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__10_ ( .D(output_buf_real_w[42]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[42]) );
  DFFRPQ_X2M_A9TL output_buf_real_r_reg_2__0_ ( .D(output_buf_real_w[32]), 
        .CK(clk), .R(n462), .Q(output_buf_real_r[32]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__15_ ( .D(output_buf_imag_w[127]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[127]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__14_ ( .D(output_buf_imag_w[126]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[126]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__13_ ( .D(output_buf_imag_w[125]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[125]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__12_ ( .D(output_buf_imag_w[124]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[124]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__11_ ( .D(output_buf_imag_w[123]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[123]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__10_ ( .D(output_buf_imag_w[122]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[122]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__9_ ( .D(output_buf_imag_w[121]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[121]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__8_ ( .D(output_buf_imag_w[120]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[120]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__7_ ( .D(output_buf_imag_w[119]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[119]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__6_ ( .D(output_buf_imag_w[118]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[118]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__5_ ( .D(output_buf_imag_w[117]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[117]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__4_ ( .D(output_buf_imag_w[116]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[116]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__3_ ( .D(output_buf_imag_w[115]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[115]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__2_ ( .D(output_buf_imag_w[114]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[114]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__1_ ( .D(output_buf_imag_w[113]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[113]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_7__0_ ( .D(output_buf_imag_w[112]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[112]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__15_ ( .D(output_buf_imag_w[111]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[111]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__14_ ( .D(output_buf_imag_w[110]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[110]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__13_ ( .D(output_buf_imag_w[109]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[109]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__12_ ( .D(output_buf_imag_w[108]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[108]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__11_ ( .D(output_buf_imag_w[107]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[107]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__10_ ( .D(output_buf_imag_w[106]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[106]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__9_ ( .D(output_buf_imag_w[105]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[105]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__8_ ( .D(output_buf_imag_w[104]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[104]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__7_ ( .D(output_buf_imag_w[103]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[103]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__6_ ( .D(output_buf_imag_w[102]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[102]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__5_ ( .D(output_buf_imag_w[101]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[101]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__4_ ( .D(output_buf_imag_w[100]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[100]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__3_ ( .D(output_buf_imag_w[99]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[99]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__2_ ( .D(output_buf_imag_w[98]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[98]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__1_ ( .D(output_buf_imag_w[97]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[97]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_6__0_ ( .D(output_buf_imag_w[96]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[96]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__15_ ( .D(output_buf_imag_w[95]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[95]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__14_ ( .D(output_buf_imag_w[94]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[94]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__13_ ( .D(output_buf_imag_w[93]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[93]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__12_ ( .D(output_buf_imag_w[92]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[92]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__11_ ( .D(output_buf_imag_w[91]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[91]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__10_ ( .D(output_buf_imag_w[90]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[90]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__9_ ( .D(output_buf_imag_w[89]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[89]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__8_ ( .D(output_buf_imag_w[88]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[88]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__7_ ( .D(output_buf_imag_w[87]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[87]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__6_ ( .D(output_buf_imag_w[86]), 
        .CK(clk), .R(n460), .Q(output_buf_imag_r[86]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__5_ ( .D(output_buf_imag_w[85]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[85]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__4_ ( .D(output_buf_imag_w[84]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[84]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__3_ ( .D(output_buf_imag_w[83]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[83]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__2_ ( .D(output_buf_imag_w[82]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[82]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__1_ ( .D(output_buf_imag_w[81]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[81]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_5__0_ ( .D(output_buf_imag_w[80]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[80]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__15_ ( .D(output_buf_imag_w[79]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[79]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__14_ ( .D(output_buf_imag_w[78]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[78]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__13_ ( .D(output_buf_imag_w[77]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[77]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__12_ ( .D(output_buf_imag_w[76]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[76]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__11_ ( .D(output_buf_imag_w[75]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[75]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__10_ ( .D(output_buf_imag_w[74]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[74]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__9_ ( .D(output_buf_imag_w[73]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[73]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__8_ ( .D(output_buf_imag_w[72]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[72]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__7_ ( .D(output_buf_imag_w[71]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[71]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__6_ ( .D(output_buf_imag_w[70]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[70]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__5_ ( .D(output_buf_imag_w[69]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[69]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__4_ ( .D(output_buf_imag_w[68]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[68]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__3_ ( .D(output_buf_imag_w[67]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[67]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__2_ ( .D(output_buf_imag_w[66]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[66]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__1_ ( .D(output_buf_imag_w[65]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[65]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_4__0_ ( .D(output_buf_imag_w[64]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[64]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__15_ ( .D(output_buf_imag_w[63]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[63]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__14_ ( .D(output_buf_imag_w[62]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[62]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__13_ ( .D(output_buf_imag_w[61]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[61]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__12_ ( .D(output_buf_imag_w[60]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[60]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__11_ ( .D(output_buf_imag_w[59]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[59]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__10_ ( .D(output_buf_imag_w[58]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[58]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__9_ ( .D(output_buf_imag_w[57]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[57]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__8_ ( .D(output_buf_imag_w[56]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[56]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__7_ ( .D(output_buf_imag_w[55]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[55]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__6_ ( .D(output_buf_imag_w[54]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[54]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__5_ ( .D(output_buf_imag_w[53]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[53]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__4_ ( .D(output_buf_imag_w[52]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[52]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__3_ ( .D(output_buf_imag_w[51]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[51]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__2_ ( .D(output_buf_imag_w[50]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[50]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__1_ ( .D(output_buf_imag_w[49]), 
        .CK(clk), .R(n458), .Q(output_buf_imag_r[49]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_3__0_ ( .D(output_buf_imag_w[48]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[48]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__15_ ( .D(output_buf_imag_w[47]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[47]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__14_ ( .D(output_buf_imag_w[46]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[46]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__13_ ( .D(output_buf_imag_w[45]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[45]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__12_ ( .D(output_buf_imag_w[44]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[44]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__11_ ( .D(output_buf_imag_w[43]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[43]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__10_ ( .D(output_buf_imag_w[42]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[42]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__9_ ( .D(output_buf_imag_w[41]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[41]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__8_ ( .D(output_buf_imag_w[40]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[40]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__7_ ( .D(output_buf_imag_w[39]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[39]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__6_ ( .D(output_buf_imag_w[38]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[38]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__5_ ( .D(output_buf_imag_w[37]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[37]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__4_ ( .D(output_buf_imag_w[36]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[36]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__3_ ( .D(output_buf_imag_w[35]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[35]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__2_ ( .D(output_buf_imag_w[34]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[34]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__1_ ( .D(output_buf_imag_w[33]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[33]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_2__0_ ( .D(output_buf_imag_w[32]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[32]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__15_ ( .D(output_buf_imag_w[31]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[31]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__14_ ( .D(output_buf_imag_w[30]), 
        .CK(clk), .R(n457), .Q(output_buf_imag_r[30]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__13_ ( .D(output_buf_imag_w[29]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[29]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__12_ ( .D(output_buf_imag_w[28]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[28]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__11_ ( .D(output_buf_imag_w[27]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[27]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__10_ ( .D(output_buf_imag_w[26]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[26]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__9_ ( .D(output_buf_imag_w[25]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[25]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__8_ ( .D(output_buf_imag_w[24]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[24]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__7_ ( .D(output_buf_imag_w[23]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[23]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__6_ ( .D(output_buf_imag_w[22]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[22]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__5_ ( .D(output_buf_imag_w[21]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[21]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__4_ ( .D(output_buf_imag_w[20]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[20]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__3_ ( .D(output_buf_imag_w[19]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[19]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__2_ ( .D(output_buf_imag_w[18]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[18]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__1_ ( .D(output_buf_imag_w[17]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[17]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_1__0_ ( .D(output_buf_imag_w[16]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[16]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__15_ ( .D(output_buf_imag_w[15]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[15]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__14_ ( .D(output_buf_imag_w[14]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[14]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__13_ ( .D(output_buf_imag_w[13]), 
        .CK(clk), .R(n459), .Q(output_buf_imag_r[13]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__12_ ( .D(output_buf_imag_w[12]), 
        .CK(clk), .R(n461), .Q(output_buf_imag_r[12]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__11_ ( .D(output_buf_imag_w[11]), 
        .CK(clk), .R(n462), .Q(output_buf_imag_r[11]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__10_ ( .D(output_buf_imag_w[10]), 
        .CK(clk), .R(n456), .Q(output_buf_imag_r[10]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__9_ ( .D(output_buf_imag_w[9]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[9]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__8_ ( .D(output_buf_imag_w[8]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[8]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__7_ ( .D(output_buf_imag_w[7]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[7]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__6_ ( .D(output_buf_imag_w[6]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[6]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__5_ ( .D(output_buf_imag_w[5]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[5]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__4_ ( .D(output_buf_imag_w[4]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[4]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__3_ ( .D(output_buf_imag_w[3]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[3]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__2_ ( .D(output_buf_imag_w[2]), .CK(
        clk), .R(n456), .Q(output_buf_imag_r[2]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__1_ ( .D(output_buf_imag_w[1]), .CK(
        clk), .R(n459), .Q(output_buf_imag_r[1]) );
  DFFRPQ_X2M_A9TL output_buf_imag_r_reg_0__0_ ( .D(output_buf_imag_w[0]), .CK(
        clk), .R(n452), .Q(output_buf_imag_r[0]) );
  FFT_8_DATA_WIDTH14 fft8 ( .clk(clk), .rst_n(n463), .valid_in(fft_8_valid_in), 
        .data_in_real({fft_8_in_real[13], fft_8_in_real[13], 
        fft_8_in_real[11:0]}), .data_in_imag({fft_8_in_imag[13], 
        fft_8_in_imag[13], fft_8_in_imag[11:0]}), .valid_out(fft_8_valid_out), 
        .data_out_real(fft_8_out_real), .data_out_imag(fft_8_out_imag) );
  FFT_4_DATA_WIDTH15 fft4 ( .clk(clk), .rst_n(n463), .valid_in(fft_4_valid_in), 
        .data_in_real({fft_4_in_real[14], fft_4_in_real[14], 
        fft_4_in_real[12:0]}), .data_in_imag({fft_4_in_imag[14], 
        fft_4_in_imag[14], fft_4_in_imag[12:0]}), .valid_out(fft_4_valid_out), 
        .data_out_real(fft_4_out_real), .data_out_imag(fft_4_out_imag) );
  FFT_2_DATA_WIDTH16 fft2 ( .clk(clk), .rst_n(n463), .valid_in(fft_4_valid_out), .data_in_real({fft_4_out_real[14], fft_4_out_real}), .data_in_imag({
        fft_4_out_imag[14], fft_4_out_imag}), .valid_out(fft_2_valid_out), 
        .data_out_real(fft_2_out_real), .data_out_imag(fft_2_out_imag) );
  LATQ_X1M_A9TL fft_point_reg_4_ ( .G(N60), .D(N59), .Q(fft_point[4]) );
  LATQ_X1M_A9TL fft_point_reg_3_ ( .G(N60), .D(N58), .Q(fft_point[3]) );
  LATQ_X1M_A9TL fft_point_reg_2_ ( .G(N60), .D(N57), .Q(fft_point[2]) );
  DFFSQ_X1M_A9TL mode_r_reg_0_ ( .D(n260), .CK(clk), .SN(n463), .Q(mode_r[0])
         );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_11_ ( .D(data_in_imag[11]), .CK(clk), 
        .R(n458), .QN(n91) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_10_ ( .D(data_in_imag[10]), .CK(clk), 
        .R(n455), .QN(n92) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_9_ ( .D(data_in_imag[9]), .CK(clk), .R(
        n454), .QN(n93) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_8_ ( .D(data_in_imag[8]), .CK(clk), .R(
        n453), .QN(n94) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_7_ ( .D(data_in_imag[7]), .CK(clk), .R(
        n458), .QN(n95) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_6_ ( .D(data_in_imag[6]), .CK(clk), .R(
        n462), .QN(n96) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_5_ ( .D(data_in_imag[5]), .CK(clk), .R(
        n462), .QN(n97) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_4_ ( .D(data_in_imag[4]), .CK(clk), .R(
        n456), .QN(n98) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_3_ ( .D(data_in_imag[3]), .CK(clk), .R(
        n458), .QN(n99) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_2_ ( .D(data_in_imag[2]), .CK(clk), .R(
        n456), .QN(n100) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_1_ ( .D(data_in_imag[1]), .CK(clk), .R(
        n455), .QN(n101) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_0_ ( .D(data_in_imag[0]), .CK(clk), .R(
        n455), .QN(n102) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_11_ ( .D(data_in_real[11]), .CK(clk), 
        .R(n458), .QN(n104) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_10_ ( .D(data_in_real[10]), .CK(clk), 
        .R(n454), .QN(n105) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_9_ ( .D(data_in_real[9]), .CK(clk), .R(
        n454), .QN(n106) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_8_ ( .D(data_in_real[8]), .CK(clk), .R(
        n452), .QN(n1070) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_7_ ( .D(data_in_real[7]), .CK(clk), .R(
        n452), .QN(n1080) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_6_ ( .D(data_in_real[6]), .CK(clk), .R(
        n452), .QN(n109) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_5_ ( .D(data_in_real[5]), .CK(clk), .R(
        n452), .QN(n110) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_4_ ( .D(data_in_real[4]), .CK(clk), .R(
        n452), .QN(n111) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_3_ ( .D(data_in_real[3]), .CK(clk), .R(
        n452), .QN(n112) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_2_ ( .D(data_in_real[2]), .CK(clk), .R(
        n452), .QN(n113) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_1_ ( .D(data_in_real[1]), .CK(clk), .R(
        n452), .QN(n114) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_0_ ( .D(data_in_real[0]), .CK(clk), .R(
        n452), .QN(n115) );
  DFFRPQN_X1M_A9TL data_in_imag_r_reg_12_ ( .D(data_in_imag[12]), .CK(clk), 
        .R(n453), .QN(n90) );
  DFFRPQN_X1M_A9TL data_in_real_r_reg_12_ ( .D(data_in_real[12]), .CK(clk), 
        .R(n458), .QN(n103) );
  DFFSRPQ_X2M_A9TL valid_out_r_reg ( .D(n262), .CK(clk), .R(n257), .SN(n263), 
        .Q(valid_out) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_15_ ( .D(data_out_imag_w[15]), .CK(clk), 
        .R(n255), .SN(n299), .Q(data_out_imag[15]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_14_ ( .D(data_out_imag_w[14]), .CK(clk), 
        .R(n253), .SN(n298), .Q(data_out_imag[14]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_13_ ( .D(data_out_imag_w[13]), .CK(clk), 
        .R(n251), .SN(n297), .Q(data_out_imag[13]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_12_ ( .D(data_out_imag_w[12]), .CK(clk), 
        .R(n249), .SN(n296), .Q(data_out_imag[12]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_11_ ( .D(data_out_imag_w[11]), .CK(clk), 
        .R(n247), .SN(n295), .Q(data_out_imag[11]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_10_ ( .D(data_out_imag_w[10]), .CK(clk), 
        .R(n245), .SN(n294), .Q(data_out_imag[10]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_9_ ( .D(data_out_imag_w[9]), .CK(clk), 
        .R(n243), .SN(n293), .Q(data_out_imag[9]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_8_ ( .D(data_out_imag_w[8]), .CK(clk), 
        .R(n241), .SN(n292), .Q(data_out_imag[8]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_7_ ( .D(data_out_imag_w[7]), .CK(clk), 
        .R(n239), .SN(n291), .Q(data_out_imag[7]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_6_ ( .D(data_out_imag_w[6]), .CK(clk), 
        .R(n237), .SN(n290), .Q(data_out_imag[6]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_5_ ( .D(data_out_imag_w[5]), .CK(clk), 
        .R(n235), .SN(n289), .Q(data_out_imag[5]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_4_ ( .D(data_out_imag_w[4]), .CK(clk), 
        .R(n233), .SN(n288), .Q(data_out_imag[4]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_3_ ( .D(data_out_imag_w[3]), .CK(clk), 
        .R(n231), .SN(n287), .Q(data_out_imag[3]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_2_ ( .D(data_out_imag_w[2]), .CK(clk), 
        .R(n229), .SN(n286), .Q(data_out_imag[2]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_1_ ( .D(data_out_imag_w[1]), .CK(clk), 
        .R(n227), .SN(n285), .Q(data_out_imag[1]) );
  DFFSRPQ_X2M_A9TL data_out_imag_r_reg_0_ ( .D(data_out_imag_w[0]), .CK(clk), 
        .R(n225), .SN(n284), .Q(data_out_imag[0]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_15_ ( .D(data_out_real_w[15]), .CK(clk), 
        .R(n223), .SN(n283), .Q(data_out_real[15]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_14_ ( .D(data_out_real_w[14]), .CK(clk), 
        .R(n221), .SN(n282), .Q(data_out_real[14]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_13_ ( .D(data_out_real_w[13]), .CK(clk), 
        .R(n219), .SN(n281), .Q(data_out_real[13]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_12_ ( .D(data_out_real_w[12]), .CK(clk), 
        .R(n217), .SN(n280), .Q(data_out_real[12]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_11_ ( .D(data_out_real_w[11]), .CK(clk), 
        .R(n215), .SN(n279), .Q(data_out_real[11]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_10_ ( .D(data_out_real_w[10]), .CK(clk), 
        .R(n213), .SN(n278), .Q(data_out_real[10]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_9_ ( .D(data_out_real_w[9]), .CK(clk), 
        .R(n211), .SN(n277), .Q(data_out_real[9]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_8_ ( .D(data_out_real_w[8]), .CK(clk), 
        .R(n209), .SN(n276), .Q(data_out_real[8]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_7_ ( .D(data_out_real_w[7]), .CK(clk), 
        .R(n207), .SN(n275), .Q(data_out_real[7]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_6_ ( .D(data_out_real_w[6]), .CK(clk), 
        .R(n205), .SN(n274), .Q(data_out_real[6]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_5_ ( .D(data_out_real_w[5]), .CK(clk), 
        .R(n203), .SN(n273), .Q(data_out_real[5]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_4_ ( .D(data_out_real_w[4]), .CK(clk), 
        .R(n2010), .SN(n272), .Q(data_out_real[4]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_3_ ( .D(data_out_real_w[3]), .CK(clk), 
        .R(n1990), .SN(n271), .Q(data_out_real[3]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_2_ ( .D(data_out_real_w[2]), .CK(clk), 
        .R(n1970), .SN(n270), .Q(data_out_real[2]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_1_ ( .D(data_out_real_w[1]), .CK(clk), 
        .R(n195), .SN(n269), .Q(data_out_real[1]) );
  DFFSRPQ_X2M_A9TL data_out_real_r_reg_0_ ( .D(data_out_real_w[0]), .CK(clk), 
        .R(n193), .SN(n268), .Q(data_out_real[0]) );
  NAND2_X1A_A9TL U584 ( .A(n262), .B(n452), .Y(n263) );
  AND2_X1B_A9TL U585 ( .A(n301), .B(N41), .Y(n264) );
  AND2_X1B_A9TL U586 ( .A(n300), .B(N41), .Y(n265) );
  AND2_X1B_A9TL U587 ( .A(n303), .B(N41), .Y(n266) );
  AND2_X1B_A9TL U588 ( .A(n302), .B(N41), .Y(n267) );
  INV_X1M_A9TL U589 ( .A(n263), .Y(n443) );
  NAND2_X1A_A9TL U590 ( .A(n167), .B(n158), .Y(n145) );
  INV_X1M_A9TL U591 ( .A(fft_8_valid_in), .Y(n500) );
  BUFH_X1M_A9TL U592 ( .A(n137), .Y(n448) );
  BUFH_X1M_A9TL U593 ( .A(n1350), .Y(n450) );
  BUFH_X1M_A9TL U594 ( .A(n1340), .Y(n451) );
  NAND2_X1A_A9TL U595 ( .A(n504), .B(n441), .Y(n161) );
  BUFH_X1M_A9TL U596 ( .A(n262), .Y(n442) );
  NOR2_X1A_A9TL U597 ( .A(n166), .B(n441), .Y(n163) );
  NOR2_X1A_A9TL U598 ( .A(n166), .B(N43), .Y(n167) );
  NAND2_X1A_A9TL U599 ( .A(n504), .B(N43), .Y(n159) );
  BUFH_X1M_A9TL U600 ( .A(n141), .Y(n446) );
  BUFH_X1M_A9TL U601 ( .A(n139), .Y(n447) );
  BUFH_X1M_A9TL U602 ( .A(n143), .Y(n445) );
  BUFH_X1M_A9TL U603 ( .A(n136), .Y(n449) );
  INV_X1M_A9TL U604 ( .A(n172), .Y(n499) );
  INV_X1M_A9TL U605 ( .A(rst_n), .Y(n452) );
  INV_X1M_A9TL U606 ( .A(rst_n), .Y(n458) );
  NAND2_X1A_A9TL U607 ( .A(n443), .B(N522), .Y(n268) );
  NAND2_X1A_A9TL U608 ( .A(n443), .B(N521), .Y(n269) );
  NAND2_X1A_A9TL U609 ( .A(n443), .B(N520), .Y(n270) );
  NAND2_X1A_A9TL U610 ( .A(n443), .B(N519), .Y(n271) );
  NAND2_X1A_A9TL U611 ( .A(n443), .B(N518), .Y(n272) );
  NAND2_X1A_A9TL U612 ( .A(n443), .B(N517), .Y(n273) );
  NAND2_X1A_A9TL U613 ( .A(n443), .B(N516), .Y(n274) );
  NAND2_X1A_A9TL U614 ( .A(n443), .B(N515), .Y(n275) );
  NAND2_X1A_A9TL U615 ( .A(n443), .B(N514), .Y(n276) );
  NAND2_X1A_A9TL U616 ( .A(n443), .B(N513), .Y(n277) );
  NAND2_X1A_A9TL U617 ( .A(n443), .B(N512), .Y(n278) );
  NAND2_X1A_A9TL U618 ( .A(n443), .B(N511), .Y(n279) );
  NAND2_X1A_A9TL U619 ( .A(n443), .B(N510), .Y(n280) );
  NAND2_X1A_A9TL U620 ( .A(n443), .B(N509), .Y(n281) );
  NAND2_X1A_A9TL U621 ( .A(n443), .B(N508), .Y(n282) );
  NAND2_X1A_A9TL U622 ( .A(n443), .B(N507), .Y(n283) );
  NAND2_X1A_A9TL U623 ( .A(n443), .B(N538), .Y(n284) );
  NAND2_X1A_A9TL U624 ( .A(n443), .B(N537), .Y(n285) );
  NAND2_X1A_A9TL U625 ( .A(n443), .B(N536), .Y(n286) );
  NAND2_X1A_A9TL U626 ( .A(n443), .B(N535), .Y(n287) );
  NAND2_X1A_A9TL U627 ( .A(n443), .B(N534), .Y(n288) );
  NAND2_X1A_A9TL U628 ( .A(n443), .B(N533), .Y(n289) );
  NAND2_X1A_A9TL U629 ( .A(n443), .B(N532), .Y(n290) );
  NAND2_X1A_A9TL U630 ( .A(n443), .B(N531), .Y(n291) );
  NAND2_X1A_A9TL U631 ( .A(n443), .B(N530), .Y(n292) );
  NAND2_X1A_A9TL U632 ( .A(n443), .B(N529), .Y(n293) );
  NAND2_X1A_A9TL U633 ( .A(n443), .B(N528), .Y(n294) );
  NAND2_X1A_A9TL U634 ( .A(n443), .B(N527), .Y(n295) );
  NAND2_X1A_A9TL U635 ( .A(n443), .B(N526), .Y(n296) );
  NAND2_X1A_A9TL U636 ( .A(n443), .B(N525), .Y(n297) );
  NAND2_X1A_A9TL U637 ( .A(n443), .B(N524), .Y(n298) );
  NAND2_X1A_A9TL U638 ( .A(n443), .B(N523), .Y(n299) );
  INV_X1M_A9TL U639 ( .A(n463), .Y(n457) );
  INV_X1M_A9TL U640 ( .A(n463), .Y(n460) );
  INV_X1M_A9TL U641 ( .A(n463), .Y(n453) );
  INV_X1M_A9TL U642 ( .A(n463), .Y(n454) );
  INV_X1M_A9TL U643 ( .A(n463), .Y(n455) );
  INV_X1M_A9TL U644 ( .A(n463), .Y(n456) );
  INV_X1M_A9TL U645 ( .A(n463), .Y(n459) );
  INV_X1M_A9TL U646 ( .A(n463), .Y(n461) );
  NOR2_X1A_A9TL U647 ( .A(rst_n), .B(data_out_real_w[1]), .Y(n195) );
  NOR2_X1A_A9TL U648 ( .A(rst_n), .B(data_out_real_w[2]), .Y(n1970) );
  NOR2_X1A_A9TL U649 ( .A(rst_n), .B(data_out_real_w[3]), .Y(n1990) );
  NOR2_X1A_A9TL U650 ( .A(rst_n), .B(data_out_real_w[4]), .Y(n2010) );
  NOR2_X1A_A9TL U651 ( .A(rst_n), .B(data_out_real_w[5]), .Y(n203) );
  NOR2_X1A_A9TL U652 ( .A(rst_n), .B(data_out_real_w[6]), .Y(n205) );
  NOR2_X1A_A9TL U653 ( .A(rst_n), .B(data_out_real_w[7]), .Y(n207) );
  NOR2_X1A_A9TL U654 ( .A(rst_n), .B(data_out_real_w[8]), .Y(n209) );
  NOR2_X1A_A9TL U655 ( .A(rst_n), .B(data_out_real_w[9]), .Y(n211) );
  NOR2_X1A_A9TL U656 ( .A(rst_n), .B(data_out_real_w[10]), .Y(n213) );
  NOR2_X1A_A9TL U657 ( .A(rst_n), .B(data_out_real_w[11]), .Y(n215) );
  NOR2_X1A_A9TL U658 ( .A(rst_n), .B(data_out_real_w[12]), .Y(n217) );
  NOR2_X1A_A9TL U659 ( .A(rst_n), .B(data_out_real_w[13]), .Y(n219) );
  NOR2_X1A_A9TL U660 ( .A(rst_n), .B(data_out_real_w[14]), .Y(n221) );
  NOR2_X1A_A9TL U661 ( .A(rst_n), .B(data_out_real_w[15]), .Y(n223) );
  INV_X1M_A9TL U662 ( .A(n463), .Y(n462) );
  NOR2_X1A_A9TL U663 ( .A(n463), .B(data_out_real_w[0]), .Y(n193) );
  NOR2_X1A_A9TL U664 ( .A(n463), .B(data_out_imag_w[0]), .Y(n225) );
  NOR2_X1A_A9TL U665 ( .A(n463), .B(data_out_imag_w[1]), .Y(n227) );
  NOR2_X1A_A9TL U666 ( .A(n463), .B(data_out_imag_w[2]), .Y(n229) );
  NOR2_X1A_A9TL U667 ( .A(n463), .B(data_out_imag_w[3]), .Y(n231) );
  NOR2_X1A_A9TL U668 ( .A(n463), .B(data_out_imag_w[4]), .Y(n233) );
  NOR2_X1A_A9TL U669 ( .A(n463), .B(data_out_imag_w[5]), .Y(n235) );
  NOR2_X1A_A9TL U670 ( .A(n463), .B(data_out_imag_w[6]), .Y(n237) );
  NOR2_X1A_A9TL U671 ( .A(n463), .B(data_out_imag_w[7]), .Y(n239) );
  NOR2_X1A_A9TL U672 ( .A(n463), .B(data_out_imag_w[8]), .Y(n241) );
  NOR2_X1A_A9TL U673 ( .A(n463), .B(data_out_imag_w[9]), .Y(n243) );
  NOR2_X1A_A9TL U674 ( .A(n463), .B(data_out_imag_w[10]), .Y(n245) );
  NOR2_X1A_A9TL U675 ( .A(n463), .B(data_out_imag_w[11]), .Y(n247) );
  NOR2_X1A_A9TL U676 ( .A(n463), .B(data_out_imag_w[12]), .Y(n249) );
  NOR2_X1A_A9TL U677 ( .A(n463), .B(data_out_imag_w[13]), .Y(n251) );
  NOR2_X1A_A9TL U678 ( .A(n463), .B(data_out_imag_w[14]), .Y(n253) );
  NOR2_X1A_A9TL U679 ( .A(n463), .B(data_out_imag_w[15]), .Y(n255) );
  NOR2_X1A_A9TL U680 ( .A(n463), .B(n442), .Y(n257) );
  AND2_X1B_A9TL U681 ( .A(N522), .B(n442), .Y(data_out_real_w[0]) );
  AND2_X1B_A9TL U682 ( .A(N521), .B(n442), .Y(data_out_real_w[1]) );
  AND2_X1B_A9TL U683 ( .A(N520), .B(n442), .Y(data_out_real_w[2]) );
  AND2_X1B_A9TL U684 ( .A(N519), .B(n442), .Y(data_out_real_w[3]) );
  AND2_X1B_A9TL U685 ( .A(N518), .B(n442), .Y(data_out_real_w[4]) );
  AND2_X1B_A9TL U686 ( .A(N517), .B(n442), .Y(data_out_real_w[5]) );
  AND2_X1B_A9TL U687 ( .A(N516), .B(n442), .Y(data_out_real_w[6]) );
  AND2_X1B_A9TL U688 ( .A(N515), .B(n442), .Y(data_out_real_w[7]) );
  AND2_X1B_A9TL U689 ( .A(N514), .B(n262), .Y(data_out_real_w[8]) );
  AND2_X1B_A9TL U690 ( .A(N513), .B(n262), .Y(data_out_real_w[9]) );
  AND2_X1B_A9TL U691 ( .A(N512), .B(n442), .Y(data_out_real_w[10]) );
  AND2_X1B_A9TL U692 ( .A(N511), .B(n262), .Y(data_out_real_w[11]) );
  AND2_X1B_A9TL U693 ( .A(N510), .B(n262), .Y(data_out_real_w[12]) );
  AND2_X1B_A9TL U694 ( .A(N509), .B(n262), .Y(data_out_real_w[13]) );
  AND2_X1B_A9TL U695 ( .A(N508), .B(n262), .Y(data_out_real_w[14]) );
  AND2_X1B_A9TL U696 ( .A(N507), .B(n262), .Y(data_out_real_w[15]) );
  AND2_X1B_A9TL U697 ( .A(N538), .B(n442), .Y(data_out_imag_w[0]) );
  AND2_X1B_A9TL U698 ( .A(N537), .B(n442), .Y(data_out_imag_w[1]) );
  AND2_X1B_A9TL U699 ( .A(N536), .B(n442), .Y(data_out_imag_w[2]) );
  AND2_X1B_A9TL U700 ( .A(N535), .B(n442), .Y(data_out_imag_w[3]) );
  AND2_X1B_A9TL U701 ( .A(N534), .B(n442), .Y(data_out_imag_w[4]) );
  AND2_X1B_A9TL U702 ( .A(N533), .B(n442), .Y(data_out_imag_w[5]) );
  AND2_X1B_A9TL U703 ( .A(N532), .B(n442), .Y(data_out_imag_w[6]) );
  AND2_X1B_A9TL U704 ( .A(N531), .B(n442), .Y(data_out_imag_w[7]) );
  AND2_X1B_A9TL U705 ( .A(N530), .B(n442), .Y(data_out_imag_w[8]) );
  AND2_X1B_A9TL U706 ( .A(N529), .B(n442), .Y(data_out_imag_w[9]) );
  AND2_X1B_A9TL U707 ( .A(N528), .B(n442), .Y(data_out_imag_w[10]) );
  AND2_X1B_A9TL U708 ( .A(N527), .B(n442), .Y(data_out_imag_w[11]) );
  AND2_X1B_A9TL U709 ( .A(N526), .B(n442), .Y(data_out_imag_w[12]) );
  AND2_X1B_A9TL U710 ( .A(N525), .B(n442), .Y(data_out_imag_w[13]) );
  AND2_X1B_A9TL U711 ( .A(N524), .B(n442), .Y(data_out_imag_w[14]) );
  AND2_X1B_A9TL U712 ( .A(N523), .B(n442), .Y(data_out_imag_w[15]) );
  OAI221_X1M_A9TL U713 ( .A0(n5080), .A1(n156), .B0(n503), .B1(n157), .C0(n158), .Y(n141) );
  INV_X1M_A9TL U714 ( .A(n151), .Y(n5080) );
  INV_X1M_A9TL U715 ( .A(n161), .Y(n503) );
  OAI221_X1M_A9TL U716 ( .A0(n5090), .A1(n156), .B0(n502), .B1(n157), .C0(n158), .Y(n139) );
  INV_X1M_A9TL U717 ( .A(n148), .Y(n5090) );
  INV_X1M_A9TL U718 ( .A(n159), .Y(n502) );
  OAI221_X1M_A9TL U719 ( .A0(n504), .A1(n156), .B0(n163), .B1(n157), .C0(n158), 
        .Y(n143) );
  NOR3_X1A_A9TL U720 ( .A(n5120), .B(n177), .C(n5130), .Y(fft_8_valid_in) );
  NAND2_X1A_A9TL U721 ( .A(n168), .B(n5130), .Y(n156) );
  NAND2_X1A_A9TL U722 ( .A(n152), .B(n147), .Y(n137) );
  NOR2_X1A_A9TL U723 ( .A(n151), .B(N43), .Y(n152) );
  NAND2_X1A_A9TL U724 ( .A(n150), .B(n147), .Y(n136) );
  NOR2_X1A_A9TL U725 ( .A(n151), .B(n441), .Y(n150) );
  NAND2_X1A_A9TL U726 ( .A(n149), .B(n147), .Y(n1350) );
  NOR2_X1A_A9TL U727 ( .A(n148), .B(N43), .Y(n149) );
  NAND2_X1A_A9TL U728 ( .A(n146), .B(n147), .Y(n1340) );
  NOR2_X1A_A9TL U729 ( .A(n441), .B(n148), .Y(n146) );
  NAND2_X1A_A9TL U730 ( .A(n153), .B(n162), .Y(n140) );
  OAI22_X1M_A9TL U731 ( .A0(n157), .A1(n161), .B0(n151), .B1(n156), .Y(n162)
         );
  NAND2_X1A_A9TL U732 ( .A(n153), .B(n160), .Y(n138) );
  OAI22_X1M_A9TL U733 ( .A0(n159), .A1(n157), .B0(n148), .B1(n156), .Y(n160)
         );
  NAND2_X1A_A9TL U734 ( .A(n153), .B(n165), .Y(n142) );
  OAI22_X1M_A9TL U735 ( .A0(n157), .A1(n506), .B0(n156), .B1(n164), .Y(n165)
         );
  INV_X1M_A9TL U736 ( .A(n163), .Y(n506) );
  NAND2_X1A_A9TL U737 ( .A(n153), .B(n169), .Y(n144) );
  OAI22_X1M_A9TL U738 ( .A0(n157), .A1(n505), .B0(n156), .B1(n166), .Y(n169)
         );
  INV_X1M_A9TL U739 ( .A(n167), .Y(n505) );
  INV_X1M_A9TL U740 ( .A(n183), .Y(n501) );
  NOR2_X1A_A9TL U741 ( .A(n5110), .B(n5100), .Y(n262) );
  AND3_X1M_A9TL U742 ( .A(n153), .B(n154), .C(n155), .Y(n147) );
  OAI221_X1M_A9TL U743 ( .A0(n171), .A1(n183), .B0(n501), .B1(n5100), .C0(n180), .Y(N107) );
  NAND2_X1A_A9TL U744 ( .A(n5070), .B(n436), .Y(n166) );
  OA211_X1M_A9TL U745 ( .A0(n168), .A1(n155), .B0(n153), .C0(n154), .Y(n158)
         );
  INV_X1M_A9TL U746 ( .A(n164), .Y(n504) );
  OR2_X1B_A9TL U747 ( .A(n177), .B(n155), .Y(n173) );
  NAND2_X1A_A9TL U748 ( .A(n170), .B(n5130), .Y(n155) );
  NOR2B_X1M_A9TL U749 ( .AN(n154), .B(N43), .Y(n168) );
  INV_X1M_A9TL U750 ( .A(n170), .Y(n5120) );
  BUFH_X1M_A9TL U751 ( .A(n174), .Y(n444) );
  ADDH_X1M_A9TL U752 ( .A(N43), .B(r398_carry[2]), .CO(r398_carry[3]), .S(N132) );
  AO22_X1M_A9TL U753 ( .A0(n179), .A1(N43), .B0(N132), .B1(n178), .Y(N198) );
  INV_X1M_A9TL U754 ( .A(N78), .Y(n5140) );
  NOR2B_X3M_A9TL U755 ( .AN(n5110), .B(state_r[0]), .Y(ready) );
  NAND2_X1A_A9TL U756 ( .A(mode_en), .B(ready), .Y(n172) );
  INV_X1M_A9TL U757 ( .A(state_r[1]), .Y(n5110) );
  BUFH_X1M_A9TL U758 ( .A(rst_n), .Y(n463) );
  AO22_X1M_A9TL U759 ( .A0(n172), .A1(mode_r[0]), .B0(mode[0]), .B1(n499), .Y(
        n260) );
  AO22_X1M_A9TL U760 ( .A0(n172), .A1(mode_r[2]), .B0(mode[2]), .B1(n499), .Y(
        n261) );
  AO22_X1M_A9TL U761 ( .A0(n172), .A1(mode_r[1]), .B0(mode[1]), .B1(n499), .Y(
        n259) );
  BUFH_X1M_A9TL U762 ( .A(n430), .Y(n439) );
  BUFH_X1M_A9TL U763 ( .A(n431), .Y(n440) );
  BUFH_X1M_A9TL U764 ( .A(n428), .Y(n437) );
  BUFH_X1M_A9TL U765 ( .A(n429), .Y(n438) );
  INV_X1M_A9TL U766 ( .A(N42), .Y(n436) );
  INV_X1M_A9TL U767 ( .A(N43), .Y(n441) );
  XNOR2_X0P7M_A9TL U768 ( .A(counter_r[5]), .B(N78), .Y(n188) );
  NOR3_X1A_A9TL U769 ( .A(n501), .B(fft_2_valid_out), .C(n171), .Y(n179) );
  OA21A1OI2_X0P7M_A9TL U770 ( .A0(n465), .A1(n171), .B0(n5100), .C0(n501), .Y(
        n178) );
  INV_X1M_A9TL U771 ( .A(fft_2_valid_out), .Y(n465) );
  XOR2_X0P7M_A9TL U772 ( .A(counter_r[4]), .B(N73), .Y(n192) );
  XOR2_X0P7M_A9TL U773 ( .A(counter_r[3]), .B(N72), .Y(n190) );
  INV_X1M_A9TL U774 ( .A(fft_2_out_imag[0]), .Y(n482) );
  INV_X1M_A9TL U775 ( .A(fft_2_out_imag[1]), .Y(n467) );
  INV_X1M_A9TL U776 ( .A(fft_2_out_imag[2]), .Y(n468) );
  INV_X1M_A9TL U777 ( .A(fft_2_out_imag[3]), .Y(n469) );
  INV_X1M_A9TL U778 ( .A(fft_2_out_imag[4]), .Y(n470) );
  INV_X1M_A9TL U779 ( .A(fft_2_out_imag[5]), .Y(n471) );
  INV_X1M_A9TL U780 ( .A(fft_2_out_imag[6]), .Y(n472) );
  INV_X1M_A9TL U781 ( .A(fft_2_out_imag[7]), .Y(n473) );
  INV_X1M_A9TL U782 ( .A(fft_2_out_imag[8]), .Y(n474) );
  INV_X1M_A9TL U783 ( .A(fft_2_out_imag[9]), .Y(n475) );
  INV_X1M_A9TL U784 ( .A(fft_2_out_imag[10]), .Y(n476) );
  INV_X1M_A9TL U785 ( .A(fft_2_out_imag[11]), .Y(n477) );
  INV_X1M_A9TL U786 ( .A(fft_2_out_imag[12]), .Y(n478) );
  INV_X1M_A9TL U787 ( .A(fft_2_out_imag[13]), .Y(n479) );
  INV_X1M_A9TL U788 ( .A(fft_2_out_imag[14]), .Y(n480) );
  INV_X1M_A9TL U789 ( .A(fft_2_out_imag[15]), .Y(n481) );
  INV_X1M_A9TL U790 ( .A(fft_2_out_real[0]), .Y(n498) );
  INV_X1M_A9TL U791 ( .A(fft_2_out_real[10]), .Y(n488) );
  INV_X1M_A9TL U792 ( .A(fft_2_out_real[11]), .Y(n487) );
  INV_X1M_A9TL U793 ( .A(fft_2_out_real[12]), .Y(n486) );
  INV_X1M_A9TL U794 ( .A(fft_2_out_real[13]), .Y(n485) );
  INV_X1M_A9TL U795 ( .A(fft_2_out_real[14]), .Y(n484) );
  INV_X1M_A9TL U796 ( .A(fft_2_out_real[15]), .Y(n483) );
  INV_X1M_A9TL U797 ( .A(fft_2_out_real[1]), .Y(n497) );
  INV_X1M_A9TL U798 ( .A(fft_2_out_real[2]), .Y(n496) );
  INV_X1M_A9TL U799 ( .A(fft_2_out_real[3]), .Y(n495) );
  INV_X1M_A9TL U800 ( .A(fft_2_out_real[4]), .Y(n494) );
  INV_X1M_A9TL U801 ( .A(fft_2_out_real[5]), .Y(n493) );
  INV_X1M_A9TL U802 ( .A(fft_2_out_real[6]), .Y(n492) );
  INV_X1M_A9TL U803 ( .A(fft_2_out_real[7]), .Y(n491) );
  INV_X1M_A9TL U804 ( .A(fft_2_out_real[8]), .Y(n490) );
  INV_X1M_A9TL U805 ( .A(fft_2_out_real[9]), .Y(n489) );
  NOR3_X1A_A9TL U806 ( .A(counter_r[4]), .B(counter_r[5]), .C(counter_r[3]), 
        .Y(n154) );
  AOI22_X1M_A9TL U807 ( .A0(state_r[0]), .A1(n5110), .B0(ready), .B1(
        valid_in_r), .Y(n177) );
  NAND4_X1A_A9TL U808 ( .A(n5110), .B(n170), .C(n176), .D(n500), .Y(n174) );
  NAND2B_X1M_A9TL U809 ( .AN(valid_in_r), .B(ready), .Y(n176) );
  NAND2_X1A_A9TL U810 ( .A(mode_r[0]), .B(n154), .Y(n157) );
  NAND4_X1A_A9TL U811 ( .A(n184), .B(N41), .C(n186), .D(n187), .Y(n183) );
  NOR3_X1A_A9TL U812 ( .A(n190), .B(n436), .C(n192), .Y(n186) );
  XOR2_X0P7M_A9TL U813 ( .A(n441), .B(N71), .Y(n184) );
  NOR3BB_X0P5M_A9TH U814 ( .AN(n5140), .BN(n188), .C(N78), .Y(n187) );
  NAND2_X1A_A9TL U815 ( .A(N41), .B(n436), .Y(n151) );
  NAND2_X1A_A9TL U816 ( .A(N42), .B(N41), .Y(n148) );
  NOR3BB_X1M_A9TL U817 ( .AN(n170), .BN(fft_2_valid_out), .C(n171), .Y(n153)
         );
  INV_X1M_A9TL U818 ( .A(N41), .Y(n5070) );
  INV_X1M_A9TL U819 ( .A(state_r[0]), .Y(n5100) );
  NAND2_X1A_A9TL U820 ( .A(state_r[1]), .B(n5100), .Y(n171) );
  NOR2_X1A_A9TL U821 ( .A(mode_r[1]), .B(mode_r[2]), .Y(n170) );
  INV_X1M_A9TL U822 ( .A(mode_r[0]), .Y(n5130) );
  NAND2_X1A_A9TL U823 ( .A(N42), .B(n5070), .Y(n164) );
  NAND3_X1A_A9TL U824 ( .A(n5100), .B(n5110), .C(valid_in_r), .Y(n180) );
  OAI211_X1M_A9TL U825 ( .A0(n5070), .A1(n466), .B0(n180), .C0(n181), .Y(N196)
         );
  NAND2_X1A_A9TL U826 ( .A(n5070), .B(n178), .Y(n181) );
  INV_X1M_A9TL U827 ( .A(n179), .Y(n466) );
  OAI22BB_X1M_A9TL U828 ( .A0(n498), .A1(n140), .B0N(output_buf_real_r[32]), 
        .B1N(n446), .Y(output_buf_real_w[32]) );
  OAI22BB_X1M_A9TL U829 ( .A0(n488), .A1(n140), .B0N(output_buf_real_r[42]), 
        .B1N(n446), .Y(output_buf_real_w[42]) );
  OAI22BB_X1M_A9TL U830 ( .A0(n487), .A1(n140), .B0N(output_buf_real_r[43]), 
        .B1N(n446), .Y(output_buf_real_w[43]) );
  OAI22BB_X1M_A9TL U831 ( .A0(n486), .A1(n140), .B0N(output_buf_real_r[44]), 
        .B1N(n446), .Y(output_buf_real_w[44]) );
  OAI22BB_X1M_A9TL U832 ( .A0(n485), .A1(n140), .B0N(output_buf_real_r[45]), 
        .B1N(n141), .Y(output_buf_real_w[45]) );
  OAI22BB_X1M_A9TL U833 ( .A0(n484), .A1(n140), .B0N(output_buf_real_r[46]), 
        .B1N(n141), .Y(output_buf_real_w[46]) );
  OAI22BB_X1M_A9TL U834 ( .A0(n483), .A1(n140), .B0N(output_buf_real_r[47]), 
        .B1N(n141), .Y(output_buf_real_w[47]) );
  OAI22BB_X1M_A9TL U835 ( .A0(n497), .A1(n140), .B0N(output_buf_real_r[33]), 
        .B1N(n141), .Y(output_buf_real_w[33]) );
  OAI22BB_X1M_A9TL U836 ( .A0(n496), .A1(n140), .B0N(output_buf_real_r[34]), 
        .B1N(n141), .Y(output_buf_real_w[34]) );
  OAI22BB_X1M_A9TL U837 ( .A0(n495), .A1(n140), .B0N(output_buf_real_r[35]), 
        .B1N(n141), .Y(output_buf_real_w[35]) );
  OAI22BB_X1M_A9TL U838 ( .A0(n494), .A1(n140), .B0N(output_buf_real_r[36]), 
        .B1N(n141), .Y(output_buf_real_w[36]) );
  OAI22BB_X1M_A9TL U839 ( .A0(n493), .A1(n140), .B0N(output_buf_real_r[37]), 
        .B1N(n141), .Y(output_buf_real_w[37]) );
  OAI22BB_X1M_A9TL U840 ( .A0(n492), .A1(n140), .B0N(output_buf_real_r[38]), 
        .B1N(n141), .Y(output_buf_real_w[38]) );
  OAI22BB_X1M_A9TL U841 ( .A0(n491), .A1(n140), .B0N(output_buf_real_r[39]), 
        .B1N(n141), .Y(output_buf_real_w[39]) );
  OAI22BB_X1M_A9TL U842 ( .A0(n490), .A1(n140), .B0N(output_buf_real_r[40]), 
        .B1N(n141), .Y(output_buf_real_w[40]) );
  OAI22BB_X1M_A9TL U843 ( .A0(n489), .A1(n140), .B0N(output_buf_real_r[41]), 
        .B1N(n141), .Y(output_buf_real_w[41]) );
  OAI22BB_X1M_A9TL U844 ( .A0(n498), .A1(n137), .B0N(output_buf_real_r[64]), 
        .B1N(n448), .Y(output_buf_real_w[64]) );
  OAI22BB_X1M_A9TL U845 ( .A0(n488), .A1(n137), .B0N(output_buf_real_r[74]), 
        .B1N(n137), .Y(output_buf_real_w[74]) );
  OAI22BB_X1M_A9TL U846 ( .A0(n487), .A1(n137), .B0N(output_buf_real_r[75]), 
        .B1N(n448), .Y(output_buf_real_w[75]) );
  OAI22BB_X1M_A9TL U847 ( .A0(n486), .A1(n137), .B0N(output_buf_real_r[76]), 
        .B1N(n448), .Y(output_buf_real_w[76]) );
  OAI22BB_X1M_A9TL U848 ( .A0(n485), .A1(n137), .B0N(output_buf_real_r[77]), 
        .B1N(n137), .Y(output_buf_real_w[77]) );
  OAI22BB_X1M_A9TL U849 ( .A0(n484), .A1(n137), .B0N(output_buf_real_r[78]), 
        .B1N(n137), .Y(output_buf_real_w[78]) );
  OAI22BB_X1M_A9TL U850 ( .A0(n483), .A1(n137), .B0N(output_buf_real_r[79]), 
        .B1N(n137), .Y(output_buf_real_w[79]) );
  OAI22BB_X1M_A9TL U851 ( .A0(n497), .A1(n137), .B0N(output_buf_real_r[65]), 
        .B1N(n137), .Y(output_buf_real_w[65]) );
  OAI22BB_X1M_A9TL U852 ( .A0(n496), .A1(n137), .B0N(output_buf_real_r[66]), 
        .B1N(n137), .Y(output_buf_real_w[66]) );
  OAI22BB_X1M_A9TL U853 ( .A0(n495), .A1(n137), .B0N(output_buf_real_r[67]), 
        .B1N(n137), .Y(output_buf_real_w[67]) );
  OAI22BB_X1M_A9TL U854 ( .A0(n494), .A1(n137), .B0N(output_buf_real_r[68]), 
        .B1N(n137), .Y(output_buf_real_w[68]) );
  OAI22BB_X1M_A9TL U855 ( .A0(n493), .A1(n137), .B0N(output_buf_real_r[69]), 
        .B1N(n137), .Y(output_buf_real_w[69]) );
  OAI22BB_X1M_A9TL U856 ( .A0(n492), .A1(n137), .B0N(output_buf_real_r[70]), 
        .B1N(n137), .Y(output_buf_real_w[70]) );
  OAI22BB_X1M_A9TL U857 ( .A0(n491), .A1(n137), .B0N(output_buf_real_r[71]), 
        .B1N(n137), .Y(output_buf_real_w[71]) );
  OAI22BB_X1M_A9TL U858 ( .A0(n490), .A1(n448), .B0N(output_buf_real_r[72]), 
        .B1N(n137), .Y(output_buf_real_w[72]) );
  OAI22BB_X1M_A9TL U859 ( .A0(n489), .A1(n137), .B0N(output_buf_real_r[73]), 
        .B1N(n448), .Y(output_buf_real_w[73]) );
  OAI22BB_X1M_A9TL U860 ( .A0(n498), .A1(n449), .B0N(output_buf_real_r[80]), 
        .B1N(n449), .Y(output_buf_real_w[80]) );
  OAI22BB_X1M_A9TL U861 ( .A0(n488), .A1(n136), .B0N(output_buf_real_r[90]), 
        .B1N(n449), .Y(output_buf_real_w[90]) );
  OAI22BB_X1M_A9TL U862 ( .A0(n487), .A1(n136), .B0N(output_buf_real_r[91]), 
        .B1N(n449), .Y(output_buf_real_w[91]) );
  OAI22BB_X1M_A9TL U863 ( .A0(n486), .A1(n449), .B0N(output_buf_real_r[92]), 
        .B1N(n449), .Y(output_buf_real_w[92]) );
  OAI22BB_X1M_A9TL U864 ( .A0(n485), .A1(n136), .B0N(output_buf_real_r[93]), 
        .B1N(n449), .Y(output_buf_real_w[93]) );
  OAI22BB_X1M_A9TL U865 ( .A0(n484), .A1(n449), .B0N(output_buf_real_r[94]), 
        .B1N(n449), .Y(output_buf_real_w[94]) );
  OAI22BB_X1M_A9TL U866 ( .A0(n483), .A1(n136), .B0N(output_buf_real_r[95]), 
        .B1N(n449), .Y(output_buf_real_w[95]) );
  OAI22BB_X1M_A9TL U867 ( .A0(n497), .A1(n136), .B0N(output_buf_real_r[81]), 
        .B1N(n449), .Y(output_buf_real_w[81]) );
  OAI22BB_X1M_A9TL U868 ( .A0(n496), .A1(n136), .B0N(output_buf_real_r[82]), 
        .B1N(n449), .Y(output_buf_real_w[82]) );
  OAI22BB_X1M_A9TL U869 ( .A0(n495), .A1(n136), .B0N(output_buf_real_r[83]), 
        .B1N(n449), .Y(output_buf_real_w[83]) );
  OAI22BB_X1M_A9TL U870 ( .A0(n494), .A1(n136), .B0N(output_buf_real_r[84]), 
        .B1N(n449), .Y(output_buf_real_w[84]) );
  OAI22BB_X1M_A9TL U871 ( .A0(n493), .A1(n136), .B0N(output_buf_real_r[85]), 
        .B1N(n449), .Y(output_buf_real_w[85]) );
  OAI22BB_X1M_A9TL U872 ( .A0(n492), .A1(n136), .B0N(output_buf_real_r[86]), 
        .B1N(n449), .Y(output_buf_real_w[86]) );
  OAI22BB_X1M_A9TL U873 ( .A0(n491), .A1(n136), .B0N(output_buf_real_r[87]), 
        .B1N(n449), .Y(output_buf_real_w[87]) );
  OAI22BB_X1M_A9TL U874 ( .A0(n490), .A1(n136), .B0N(output_buf_real_r[88]), 
        .B1N(n449), .Y(output_buf_real_w[88]) );
  OAI22BB_X1M_A9TL U875 ( .A0(n489), .A1(n449), .B0N(output_buf_real_r[89]), 
        .B1N(n136), .Y(output_buf_real_w[89]) );
  OAI22BB_X1M_A9TL U876 ( .A0(n498), .A1(n138), .B0N(output_buf_real_r[48]), 
        .B1N(n447), .Y(output_buf_real_w[48]) );
  OAI22BB_X1M_A9TL U877 ( .A0(n488), .A1(n138), .B0N(output_buf_real_r[58]), 
        .B1N(n447), .Y(output_buf_real_w[58]) );
  OAI22BB_X1M_A9TL U878 ( .A0(n487), .A1(n138), .B0N(output_buf_real_r[59]), 
        .B1N(n447), .Y(output_buf_real_w[59]) );
  OAI22BB_X1M_A9TL U879 ( .A0(n486), .A1(n138), .B0N(output_buf_real_r[60]), 
        .B1N(n447), .Y(output_buf_real_w[60]) );
  OAI22BB_X1M_A9TL U880 ( .A0(n485), .A1(n138), .B0N(output_buf_real_r[61]), 
        .B1N(n139), .Y(output_buf_real_w[61]) );
  OAI22BB_X1M_A9TL U881 ( .A0(n484), .A1(n138), .B0N(output_buf_real_r[62]), 
        .B1N(n139), .Y(output_buf_real_w[62]) );
  OAI22BB_X1M_A9TL U882 ( .A0(n483), .A1(n138), .B0N(output_buf_real_r[63]), 
        .B1N(n139), .Y(output_buf_real_w[63]) );
  OAI22BB_X1M_A9TL U883 ( .A0(n497), .A1(n138), .B0N(output_buf_real_r[49]), 
        .B1N(n139), .Y(output_buf_real_w[49]) );
  OAI22BB_X1M_A9TL U884 ( .A0(n496), .A1(n138), .B0N(output_buf_real_r[50]), 
        .B1N(n139), .Y(output_buf_real_w[50]) );
  OAI22BB_X1M_A9TL U885 ( .A0(n495), .A1(n138), .B0N(output_buf_real_r[51]), 
        .B1N(n139), .Y(output_buf_real_w[51]) );
  OAI22BB_X1M_A9TL U886 ( .A0(n494), .A1(n138), .B0N(output_buf_real_r[52]), 
        .B1N(n139), .Y(output_buf_real_w[52]) );
  OAI22BB_X1M_A9TL U887 ( .A0(n493), .A1(n138), .B0N(output_buf_real_r[53]), 
        .B1N(n139), .Y(output_buf_real_w[53]) );
  OAI22BB_X1M_A9TL U888 ( .A0(n492), .A1(n138), .B0N(output_buf_real_r[54]), 
        .B1N(n139), .Y(output_buf_real_w[54]) );
  OAI22BB_X1M_A9TL U889 ( .A0(n491), .A1(n138), .B0N(output_buf_real_r[55]), 
        .B1N(n139), .Y(output_buf_real_w[55]) );
  OAI22BB_X1M_A9TL U890 ( .A0(n490), .A1(n138), .B0N(output_buf_real_r[56]), 
        .B1N(n139), .Y(output_buf_real_w[56]) );
  OAI22BB_X1M_A9TL U891 ( .A0(n489), .A1(n138), .B0N(output_buf_real_r[57]), 
        .B1N(n139), .Y(output_buf_real_w[57]) );
  OAI22BB_X1M_A9TL U892 ( .A0(n498), .A1(n1350), .B0N(output_buf_real_r[96]), 
        .B1N(n450), .Y(output_buf_real_w[96]) );
  OAI22BB_X1M_A9TL U893 ( .A0(n488), .A1(n1350), .B0N(output_buf_real_r[106]), 
        .B1N(n1350), .Y(output_buf_real_w[106]) );
  OAI22BB_X1M_A9TL U894 ( .A0(n487), .A1(n1350), .B0N(output_buf_real_r[107]), 
        .B1N(n450), .Y(output_buf_real_w[107]) );
  OAI22BB_X1M_A9TL U895 ( .A0(n486), .A1(n1350), .B0N(output_buf_real_r[108]), 
        .B1N(n450), .Y(output_buf_real_w[108]) );
  OAI22BB_X1M_A9TL U896 ( .A0(n485), .A1(n1350), .B0N(output_buf_real_r[109]), 
        .B1N(n1350), .Y(output_buf_real_w[109]) );
  OAI22BB_X1M_A9TL U897 ( .A0(n484), .A1(n1350), .B0N(output_buf_real_r[110]), 
        .B1N(n1350), .Y(output_buf_real_w[110]) );
  OAI22BB_X1M_A9TL U898 ( .A0(n483), .A1(n1350), .B0N(output_buf_real_r[111]), 
        .B1N(n1350), .Y(output_buf_real_w[111]) );
  OAI22BB_X1M_A9TL U899 ( .A0(n497), .A1(n1350), .B0N(output_buf_real_r[97]), 
        .B1N(n1350), .Y(output_buf_real_w[97]) );
  OAI22BB_X1M_A9TL U900 ( .A0(n496), .A1(n1350), .B0N(output_buf_real_r[98]), 
        .B1N(n1350), .Y(output_buf_real_w[98]) );
  OAI22BB_X1M_A9TL U901 ( .A0(n495), .A1(n1350), .B0N(output_buf_real_r[99]), 
        .B1N(n1350), .Y(output_buf_real_w[99]) );
  OAI22BB_X1M_A9TL U902 ( .A0(n494), .A1(n1350), .B0N(output_buf_real_r[100]), 
        .B1N(n1350), .Y(output_buf_real_w[100]) );
  OAI22BB_X1M_A9TL U903 ( .A0(n493), .A1(n1350), .B0N(output_buf_real_r[101]), 
        .B1N(n1350), .Y(output_buf_real_w[101]) );
  OAI22BB_X1M_A9TL U904 ( .A0(n492), .A1(n1350), .B0N(output_buf_real_r[102]), 
        .B1N(n1350), .Y(output_buf_real_w[102]) );
  OAI22BB_X1M_A9TL U905 ( .A0(n491), .A1(n1350), .B0N(output_buf_real_r[103]), 
        .B1N(n1350), .Y(output_buf_real_w[103]) );
  OAI22BB_X1M_A9TL U906 ( .A0(n490), .A1(n450), .B0N(output_buf_real_r[104]), 
        .B1N(n1350), .Y(output_buf_real_w[104]) );
  OAI22BB_X1M_A9TL U907 ( .A0(n489), .A1(n1350), .B0N(output_buf_real_r[105]), 
        .B1N(n450), .Y(output_buf_real_w[105]) );
  OAI22BB_X1M_A9TL U908 ( .A0(n498), .A1(n142), .B0N(output_buf_real_r[16]), 
        .B1N(n445), .Y(output_buf_real_w[16]) );
  OAI22BB_X1M_A9TL U909 ( .A0(n488), .A1(n142), .B0N(output_buf_real_r[26]), 
        .B1N(n445), .Y(output_buf_real_w[26]) );
  OAI22BB_X1M_A9TL U910 ( .A0(n487), .A1(n142), .B0N(output_buf_real_r[27]), 
        .B1N(n445), .Y(output_buf_real_w[27]) );
  OAI22BB_X1M_A9TL U911 ( .A0(n486), .A1(n142), .B0N(output_buf_real_r[28]), 
        .B1N(n445), .Y(output_buf_real_w[28]) );
  OAI22BB_X1M_A9TL U912 ( .A0(n485), .A1(n142), .B0N(output_buf_real_r[29]), 
        .B1N(n143), .Y(output_buf_real_w[29]) );
  OAI22BB_X1M_A9TL U913 ( .A0(n484), .A1(n142), .B0N(output_buf_real_r[30]), 
        .B1N(n143), .Y(output_buf_real_w[30]) );
  OAI22BB_X1M_A9TL U914 ( .A0(n483), .A1(n142), .B0N(output_buf_real_r[31]), 
        .B1N(n143), .Y(output_buf_real_w[31]) );
  OAI22BB_X1M_A9TL U915 ( .A0(n497), .A1(n142), .B0N(output_buf_real_r[17]), 
        .B1N(n143), .Y(output_buf_real_w[17]) );
  OAI22BB_X1M_A9TL U916 ( .A0(n496), .A1(n142), .B0N(output_buf_real_r[18]), 
        .B1N(n143), .Y(output_buf_real_w[18]) );
  OAI22BB_X1M_A9TL U917 ( .A0(n495), .A1(n142), .B0N(output_buf_real_r[19]), 
        .B1N(n143), .Y(output_buf_real_w[19]) );
  OAI22BB_X1M_A9TL U918 ( .A0(n494), .A1(n142), .B0N(output_buf_real_r[20]), 
        .B1N(n143), .Y(output_buf_real_w[20]) );
  OAI22BB_X1M_A9TL U919 ( .A0(n493), .A1(n142), .B0N(output_buf_real_r[21]), 
        .B1N(n143), .Y(output_buf_real_w[21]) );
  OAI22BB_X1M_A9TL U920 ( .A0(n492), .A1(n142), .B0N(output_buf_real_r[22]), 
        .B1N(n143), .Y(output_buf_real_w[22]) );
  OAI22BB_X1M_A9TL U921 ( .A0(n491), .A1(n142), .B0N(output_buf_real_r[23]), 
        .B1N(n143), .Y(output_buf_real_w[23]) );
  OAI22BB_X1M_A9TL U922 ( .A0(n490), .A1(n142), .B0N(output_buf_real_r[24]), 
        .B1N(n143), .Y(output_buf_real_w[24]) );
  OAI22BB_X1M_A9TL U923 ( .A0(n489), .A1(n142), .B0N(output_buf_real_r[25]), 
        .B1N(n143), .Y(output_buf_real_w[25]) );
  OAI22BB_X1M_A9TL U924 ( .A0(n498), .A1(n144), .B0N(output_buf_real_r[0]), 
        .B1N(n145), .Y(output_buf_real_w[0]) );
  OAI22BB_X1M_A9TL U925 ( .A0(n488), .A1(n144), .B0N(output_buf_real_r[10]), 
        .B1N(n145), .Y(output_buf_real_w[10]) );
  OAI22BB_X1M_A9TL U926 ( .A0(n487), .A1(n144), .B0N(output_buf_real_r[11]), 
        .B1N(n145), .Y(output_buf_real_w[11]) );
  OAI22BB_X1M_A9TL U927 ( .A0(n486), .A1(n144), .B0N(output_buf_real_r[12]), 
        .B1N(n145), .Y(output_buf_real_w[12]) );
  OAI22BB_X1M_A9TL U928 ( .A0(n485), .A1(n144), .B0N(output_buf_real_r[13]), 
        .B1N(n145), .Y(output_buf_real_w[13]) );
  OAI22BB_X1M_A9TL U929 ( .A0(n484), .A1(n144), .B0N(output_buf_real_r[14]), 
        .B1N(n145), .Y(output_buf_real_w[14]) );
  OAI22BB_X1M_A9TL U930 ( .A0(n483), .A1(n144), .B0N(output_buf_real_r[15]), 
        .B1N(n145), .Y(output_buf_real_w[15]) );
  OAI22BB_X1M_A9TL U931 ( .A0(n497), .A1(n144), .B0N(output_buf_real_r[1]), 
        .B1N(n145), .Y(output_buf_real_w[1]) );
  OAI22BB_X1M_A9TL U932 ( .A0(n496), .A1(n144), .B0N(output_buf_real_r[2]), 
        .B1N(n145), .Y(output_buf_real_w[2]) );
  OAI22BB_X1M_A9TL U933 ( .A0(n495), .A1(n144), .B0N(output_buf_real_r[3]), 
        .B1N(n145), .Y(output_buf_real_w[3]) );
  OAI22BB_X1M_A9TL U934 ( .A0(n494), .A1(n144), .B0N(output_buf_real_r[4]), 
        .B1N(n145), .Y(output_buf_real_w[4]) );
  OAI22BB_X1M_A9TL U935 ( .A0(n493), .A1(n144), .B0N(output_buf_real_r[5]), 
        .B1N(n145), .Y(output_buf_real_w[5]) );
  OAI22BB_X1M_A9TL U936 ( .A0(n492), .A1(n144), .B0N(output_buf_real_r[6]), 
        .B1N(n145), .Y(output_buf_real_w[6]) );
  OAI22BB_X1M_A9TL U937 ( .A0(n491), .A1(n144), .B0N(output_buf_real_r[7]), 
        .B1N(n145), .Y(output_buf_real_w[7]) );
  OAI22BB_X1M_A9TL U938 ( .A0(n490), .A1(n144), .B0N(output_buf_real_r[8]), 
        .B1N(n145), .Y(output_buf_real_w[8]) );
  OAI22BB_X1M_A9TL U939 ( .A0(n489), .A1(n144), .B0N(output_buf_real_r[9]), 
        .B1N(n145), .Y(output_buf_real_w[9]) );
  OAI211_X1M_A9TL U940 ( .A0(n501), .A1(n5110), .B0(n182), .C0(n171), .Y(N108)
         );
  NAND3_X1A_A9TL U941 ( .A(state_r[0]), .B(n5110), .C(n501), .Y(n182) );
  OAI22BB_X1M_A9TL U942 ( .A0(n90), .A1(n173), .B0N(fft_8_out_imag[13]), .B1N(
        n444), .Y(fft_4_in_imag[14]) );
  OAI22BB_X1M_A9TL U943 ( .A0(n103), .A1(n173), .B0N(fft_8_out_real[13]), 
        .B1N(n444), .Y(fft_4_in_real[14]) );
  OAI22BB_X1M_A9TL U944 ( .A0(n144), .A1(n482), .B0N(output_buf_imag_r[0]), 
        .B1N(n145), .Y(output_buf_imag_w[0]) );
  OAI22BB_X1M_A9TL U945 ( .A0(n144), .A1(n467), .B0N(output_buf_imag_r[1]), 
        .B1N(n145), .Y(output_buf_imag_w[1]) );
  OAI22BB_X1M_A9TL U946 ( .A0(n144), .A1(n468), .B0N(output_buf_imag_r[2]), 
        .B1N(n145), .Y(output_buf_imag_w[2]) );
  OAI22BB_X1M_A9TL U947 ( .A0(n144), .A1(n469), .B0N(output_buf_imag_r[3]), 
        .B1N(n145), .Y(output_buf_imag_w[3]) );
  OAI22BB_X1M_A9TL U948 ( .A0(n144), .A1(n470), .B0N(output_buf_imag_r[4]), 
        .B1N(n145), .Y(output_buf_imag_w[4]) );
  OAI22BB_X1M_A9TL U949 ( .A0(n144), .A1(n471), .B0N(output_buf_imag_r[5]), 
        .B1N(n145), .Y(output_buf_imag_w[5]) );
  OAI22BB_X1M_A9TL U950 ( .A0(n144), .A1(n472), .B0N(output_buf_imag_r[6]), 
        .B1N(n145), .Y(output_buf_imag_w[6]) );
  OAI22BB_X1M_A9TL U951 ( .A0(n144), .A1(n473), .B0N(output_buf_imag_r[7]), 
        .B1N(n145), .Y(output_buf_imag_w[7]) );
  OAI22BB_X1M_A9TL U952 ( .A0(n144), .A1(n474), .B0N(output_buf_imag_r[8]), 
        .B1N(n145), .Y(output_buf_imag_w[8]) );
  OAI22BB_X1M_A9TL U953 ( .A0(n144), .A1(n475), .B0N(output_buf_imag_r[9]), 
        .B1N(n145), .Y(output_buf_imag_w[9]) );
  OAI22BB_X1M_A9TL U954 ( .A0(n144), .A1(n476), .B0N(output_buf_imag_r[10]), 
        .B1N(n145), .Y(output_buf_imag_w[10]) );
  OAI22BB_X1M_A9TL U955 ( .A0(n144), .A1(n477), .B0N(output_buf_imag_r[11]), 
        .B1N(n145), .Y(output_buf_imag_w[11]) );
  OAI22BB_X1M_A9TL U956 ( .A0(n144), .A1(n478), .B0N(output_buf_imag_r[12]), 
        .B1N(n145), .Y(output_buf_imag_w[12]) );
  OAI22BB_X1M_A9TL U957 ( .A0(n144), .A1(n479), .B0N(output_buf_imag_r[13]), 
        .B1N(n145), .Y(output_buf_imag_w[13]) );
  OAI22BB_X1M_A9TL U958 ( .A0(n144), .A1(n480), .B0N(output_buf_imag_r[14]), 
        .B1N(n145), .Y(output_buf_imag_w[14]) );
  OAI22BB_X1M_A9TL U959 ( .A0(n144), .A1(n481), .B0N(output_buf_imag_r[15]), 
        .B1N(n145), .Y(output_buf_imag_w[15]) );
  OAI22BB_X1M_A9TL U960 ( .A0(n142), .A1(n482), .B0N(output_buf_imag_r[16]), 
        .B1N(n445), .Y(output_buf_imag_w[16]) );
  OAI22BB_X1M_A9TL U961 ( .A0(n142), .A1(n467), .B0N(output_buf_imag_r[17]), 
        .B1N(n445), .Y(output_buf_imag_w[17]) );
  OAI22BB_X1M_A9TL U962 ( .A0(n142), .A1(n468), .B0N(output_buf_imag_r[18]), 
        .B1N(n445), .Y(output_buf_imag_w[18]) );
  OAI22BB_X1M_A9TL U963 ( .A0(n142), .A1(n469), .B0N(output_buf_imag_r[19]), 
        .B1N(n445), .Y(output_buf_imag_w[19]) );
  OAI22BB_X1M_A9TL U964 ( .A0(n142), .A1(n470), .B0N(output_buf_imag_r[20]), 
        .B1N(n445), .Y(output_buf_imag_w[20]) );
  OAI22BB_X1M_A9TL U965 ( .A0(n142), .A1(n471), .B0N(output_buf_imag_r[21]), 
        .B1N(n445), .Y(output_buf_imag_w[21]) );
  OAI22BB_X1M_A9TL U966 ( .A0(n142), .A1(n472), .B0N(output_buf_imag_r[22]), 
        .B1N(n445), .Y(output_buf_imag_w[22]) );
  OAI22BB_X1M_A9TL U967 ( .A0(n142), .A1(n473), .B0N(output_buf_imag_r[23]), 
        .B1N(n445), .Y(output_buf_imag_w[23]) );
  OAI22BB_X1M_A9TL U968 ( .A0(n142), .A1(n474), .B0N(output_buf_imag_r[24]), 
        .B1N(n445), .Y(output_buf_imag_w[24]) );
  OAI22BB_X1M_A9TL U969 ( .A0(n142), .A1(n475), .B0N(output_buf_imag_r[25]), 
        .B1N(n445), .Y(output_buf_imag_w[25]) );
  OAI22BB_X1M_A9TL U970 ( .A0(n142), .A1(n476), .B0N(output_buf_imag_r[26]), 
        .B1N(n143), .Y(output_buf_imag_w[26]) );
  OAI22BB_X1M_A9TL U971 ( .A0(n142), .A1(n477), .B0N(output_buf_imag_r[27]), 
        .B1N(n445), .Y(output_buf_imag_w[27]) );
  OAI22BB_X1M_A9TL U972 ( .A0(n142), .A1(n478), .B0N(output_buf_imag_r[28]), 
        .B1N(n445), .Y(output_buf_imag_w[28]) );
  OAI22BB_X1M_A9TL U973 ( .A0(n142), .A1(n479), .B0N(output_buf_imag_r[29]), 
        .B1N(n445), .Y(output_buf_imag_w[29]) );
  OAI22BB_X1M_A9TL U974 ( .A0(n142), .A1(n480), .B0N(output_buf_imag_r[30]), 
        .B1N(n445), .Y(output_buf_imag_w[30]) );
  OAI22BB_X1M_A9TL U975 ( .A0(n142), .A1(n481), .B0N(output_buf_imag_r[31]), 
        .B1N(n445), .Y(output_buf_imag_w[31]) );
  OAI22BB_X1M_A9TL U976 ( .A0(n140), .A1(n482), .B0N(output_buf_imag_r[32]), 
        .B1N(n446), .Y(output_buf_imag_w[32]) );
  OAI22BB_X1M_A9TL U977 ( .A0(n140), .A1(n467), .B0N(output_buf_imag_r[33]), 
        .B1N(n446), .Y(output_buf_imag_w[33]) );
  OAI22BB_X1M_A9TL U978 ( .A0(n140), .A1(n468), .B0N(output_buf_imag_r[34]), 
        .B1N(n446), .Y(output_buf_imag_w[34]) );
  OAI22BB_X1M_A9TL U979 ( .A0(n140), .A1(n469), .B0N(output_buf_imag_r[35]), 
        .B1N(n446), .Y(output_buf_imag_w[35]) );
  OAI22BB_X1M_A9TL U980 ( .A0(n140), .A1(n470), .B0N(output_buf_imag_r[36]), 
        .B1N(n446), .Y(output_buf_imag_w[36]) );
  OAI22BB_X1M_A9TL U981 ( .A0(n140), .A1(n471), .B0N(output_buf_imag_r[37]), 
        .B1N(n446), .Y(output_buf_imag_w[37]) );
  OAI22BB_X1M_A9TL U982 ( .A0(n140), .A1(n472), .B0N(output_buf_imag_r[38]), 
        .B1N(n446), .Y(output_buf_imag_w[38]) );
  OAI22BB_X1M_A9TL U983 ( .A0(n140), .A1(n473), .B0N(output_buf_imag_r[39]), 
        .B1N(n446), .Y(output_buf_imag_w[39]) );
  OAI22BB_X1M_A9TL U984 ( .A0(n140), .A1(n474), .B0N(output_buf_imag_r[40]), 
        .B1N(n446), .Y(output_buf_imag_w[40]) );
  OAI22BB_X1M_A9TL U985 ( .A0(n140), .A1(n475), .B0N(output_buf_imag_r[41]), 
        .B1N(n446), .Y(output_buf_imag_w[41]) );
  OAI22BB_X1M_A9TL U986 ( .A0(n140), .A1(n476), .B0N(output_buf_imag_r[42]), 
        .B1N(n141), .Y(output_buf_imag_w[42]) );
  OAI22BB_X1M_A9TL U987 ( .A0(n140), .A1(n477), .B0N(output_buf_imag_r[43]), 
        .B1N(n446), .Y(output_buf_imag_w[43]) );
  OAI22BB_X1M_A9TL U988 ( .A0(n140), .A1(n478), .B0N(output_buf_imag_r[44]), 
        .B1N(n446), .Y(output_buf_imag_w[44]) );
  OAI22BB_X1M_A9TL U989 ( .A0(n140), .A1(n479), .B0N(output_buf_imag_r[45]), 
        .B1N(n446), .Y(output_buf_imag_w[45]) );
  OAI22BB_X1M_A9TL U990 ( .A0(n140), .A1(n480), .B0N(output_buf_imag_r[46]), 
        .B1N(n446), .Y(output_buf_imag_w[46]) );
  OAI22BB_X1M_A9TL U991 ( .A0(n140), .A1(n481), .B0N(output_buf_imag_r[47]), 
        .B1N(n446), .Y(output_buf_imag_w[47]) );
  OAI22BB_X1M_A9TL U992 ( .A0(n138), .A1(n482), .B0N(output_buf_imag_r[48]), 
        .B1N(n447), .Y(output_buf_imag_w[48]) );
  OAI22BB_X1M_A9TL U993 ( .A0(n138), .A1(n467), .B0N(output_buf_imag_r[49]), 
        .B1N(n447), .Y(output_buf_imag_w[49]) );
  OAI22BB_X1M_A9TL U994 ( .A0(n138), .A1(n468), .B0N(output_buf_imag_r[50]), 
        .B1N(n447), .Y(output_buf_imag_w[50]) );
  OAI22BB_X1M_A9TL U995 ( .A0(n138), .A1(n469), .B0N(output_buf_imag_r[51]), 
        .B1N(n447), .Y(output_buf_imag_w[51]) );
  OAI22BB_X1M_A9TL U996 ( .A0(n138), .A1(n470), .B0N(output_buf_imag_r[52]), 
        .B1N(n447), .Y(output_buf_imag_w[52]) );
  OAI22BB_X1M_A9TL U997 ( .A0(n138), .A1(n471), .B0N(output_buf_imag_r[53]), 
        .B1N(n447), .Y(output_buf_imag_w[53]) );
  OAI22BB_X1M_A9TL U998 ( .A0(n138), .A1(n472), .B0N(output_buf_imag_r[54]), 
        .B1N(n447), .Y(output_buf_imag_w[54]) );
  OAI22BB_X1M_A9TL U999 ( .A0(n138), .A1(n473), .B0N(output_buf_imag_r[55]), 
        .B1N(n447), .Y(output_buf_imag_w[55]) );
  OAI22BB_X1M_A9TL U1000 ( .A0(n138), .A1(n474), .B0N(output_buf_imag_r[56]), 
        .B1N(n447), .Y(output_buf_imag_w[56]) );
  OAI22BB_X1M_A9TL U1001 ( .A0(n138), .A1(n475), .B0N(output_buf_imag_r[57]), 
        .B1N(n447), .Y(output_buf_imag_w[57]) );
  OAI22BB_X1M_A9TL U1002 ( .A0(n138), .A1(n476), .B0N(output_buf_imag_r[58]), 
        .B1N(n139), .Y(output_buf_imag_w[58]) );
  OAI22BB_X1M_A9TL U1003 ( .A0(n138), .A1(n477), .B0N(output_buf_imag_r[59]), 
        .B1N(n447), .Y(output_buf_imag_w[59]) );
  OAI22BB_X1M_A9TL U1004 ( .A0(n138), .A1(n478), .B0N(output_buf_imag_r[60]), 
        .B1N(n447), .Y(output_buf_imag_w[60]) );
  OAI22BB_X1M_A9TL U1005 ( .A0(n138), .A1(n479), .B0N(output_buf_imag_r[61]), 
        .B1N(n447), .Y(output_buf_imag_w[61]) );
  OAI22BB_X1M_A9TL U1006 ( .A0(n138), .A1(n480), .B0N(output_buf_imag_r[62]), 
        .B1N(n447), .Y(output_buf_imag_w[62]) );
  OAI22BB_X1M_A9TL U1007 ( .A0(n138), .A1(n481), .B0N(output_buf_imag_r[63]), 
        .B1N(n447), .Y(output_buf_imag_w[63]) );
  OAI22BB_X1M_A9TL U1008 ( .A0(n137), .A1(n482), .B0N(output_buf_imag_r[64]), 
        .B1N(n448), .Y(output_buf_imag_w[64]) );
  OAI22BB_X1M_A9TL U1009 ( .A0(n137), .A1(n467), .B0N(output_buf_imag_r[65]), 
        .B1N(n448), .Y(output_buf_imag_w[65]) );
  OAI22BB_X1M_A9TL U1010 ( .A0(n448), .A1(n468), .B0N(output_buf_imag_r[66]), 
        .B1N(n448), .Y(output_buf_imag_w[66]) );
  OAI22BB_X1M_A9TL U1011 ( .A0(n137), .A1(n469), .B0N(output_buf_imag_r[67]), 
        .B1N(n448), .Y(output_buf_imag_w[67]) );
  OAI22BB_X1M_A9TL U1012 ( .A0(n137), .A1(n470), .B0N(output_buf_imag_r[68]), 
        .B1N(n448), .Y(output_buf_imag_w[68]) );
  OAI22BB_X1M_A9TL U1013 ( .A0(n448), .A1(n471), .B0N(output_buf_imag_r[69]), 
        .B1N(n448), .Y(output_buf_imag_w[69]) );
  OAI22BB_X1M_A9TL U1014 ( .A0(n448), .A1(n472), .B0N(output_buf_imag_r[70]), 
        .B1N(n448), .Y(output_buf_imag_w[70]) );
  OAI22BB_X1M_A9TL U1015 ( .A0(n137), .A1(n473), .B0N(output_buf_imag_r[71]), 
        .B1N(n448), .Y(output_buf_imag_w[71]) );
  OAI22BB_X1M_A9TL U1016 ( .A0(n448), .A1(n474), .B0N(output_buf_imag_r[72]), 
        .B1N(n448), .Y(output_buf_imag_w[72]) );
  OAI22BB_X1M_A9TL U1017 ( .A0(n137), .A1(n475), .B0N(output_buf_imag_r[73]), 
        .B1N(n448), .Y(output_buf_imag_w[73]) );
  OAI22BB_X1M_A9TL U1018 ( .A0(n137), .A1(n476), .B0N(output_buf_imag_r[74]), 
        .B1N(n448), .Y(output_buf_imag_w[74]) );
  OAI22BB_X1M_A9TL U1019 ( .A0(n137), .A1(n477), .B0N(output_buf_imag_r[75]), 
        .B1N(n448), .Y(output_buf_imag_w[75]) );
  OAI22BB_X1M_A9TL U1020 ( .A0(n137), .A1(n478), .B0N(output_buf_imag_r[76]), 
        .B1N(n448), .Y(output_buf_imag_w[76]) );
  OAI22BB_X1M_A9TL U1021 ( .A0(n137), .A1(n479), .B0N(output_buf_imag_r[77]), 
        .B1N(n448), .Y(output_buf_imag_w[77]) );
  OAI22BB_X1M_A9TL U1022 ( .A0(n137), .A1(n480), .B0N(output_buf_imag_r[78]), 
        .B1N(n448), .Y(output_buf_imag_w[78]) );
  OAI22BB_X1M_A9TL U1023 ( .A0(n137), .A1(n481), .B0N(output_buf_imag_r[79]), 
        .B1N(n448), .Y(output_buf_imag_w[79]) );
  OAI22BB_X1M_A9TL U1024 ( .A0(n449), .A1(n482), .B0N(output_buf_imag_r[80]), 
        .B1N(n136), .Y(output_buf_imag_w[80]) );
  OAI22BB_X1M_A9TL U1025 ( .A0(n136), .A1(n467), .B0N(output_buf_imag_r[81]), 
        .B1N(n136), .Y(output_buf_imag_w[81]) );
  OAI22BB_X1M_A9TL U1026 ( .A0(n136), .A1(n468), .B0N(output_buf_imag_r[82]), 
        .B1N(n136), .Y(output_buf_imag_w[82]) );
  OAI22BB_X1M_A9TL U1027 ( .A0(n449), .A1(n469), .B0N(output_buf_imag_r[83]), 
        .B1N(n136), .Y(output_buf_imag_w[83]) );
  OAI22BB_X1M_A9TL U1028 ( .A0(n136), .A1(n470), .B0N(output_buf_imag_r[84]), 
        .B1N(n136), .Y(output_buf_imag_w[84]) );
  OAI22BB_X1M_A9TL U1029 ( .A0(n136), .A1(n471), .B0N(output_buf_imag_r[85]), 
        .B1N(n136), .Y(output_buf_imag_w[85]) );
  OAI22BB_X1M_A9TL U1030 ( .A0(n136), .A1(n472), .B0N(output_buf_imag_r[86]), 
        .B1N(n136), .Y(output_buf_imag_w[86]) );
  OAI22BB_X1M_A9TL U1031 ( .A0(n449), .A1(n473), .B0N(output_buf_imag_r[87]), 
        .B1N(n136), .Y(output_buf_imag_w[87]) );
  OAI22BB_X1M_A9TL U1032 ( .A0(n136), .A1(n474), .B0N(output_buf_imag_r[88]), 
        .B1N(n136), .Y(output_buf_imag_w[88]) );
  OAI22BB_X1M_A9TL U1033 ( .A0(n136), .A1(n475), .B0N(output_buf_imag_r[89]), 
        .B1N(n136), .Y(output_buf_imag_w[89]) );
  OAI22BB_X1M_A9TL U1034 ( .A0(n449), .A1(n476), .B0N(output_buf_imag_r[90]), 
        .B1N(n136), .Y(output_buf_imag_w[90]) );
  OAI22BB_X1M_A9TL U1035 ( .A0(n136), .A1(n477), .B0N(output_buf_imag_r[91]), 
        .B1N(n136), .Y(output_buf_imag_w[91]) );
  OAI22BB_X1M_A9TL U1036 ( .A0(n449), .A1(n478), .B0N(output_buf_imag_r[92]), 
        .B1N(n136), .Y(output_buf_imag_w[92]) );
  OAI22BB_X1M_A9TL U1037 ( .A0(n136), .A1(n479), .B0N(output_buf_imag_r[93]), 
        .B1N(n136), .Y(output_buf_imag_w[93]) );
  OAI22BB_X1M_A9TL U1038 ( .A0(n449), .A1(n480), .B0N(output_buf_imag_r[94]), 
        .B1N(n136), .Y(output_buf_imag_w[94]) );
  OAI22BB_X1M_A9TL U1039 ( .A0(n136), .A1(n481), .B0N(output_buf_imag_r[95]), 
        .B1N(n136), .Y(output_buf_imag_w[95]) );
  OAI22BB_X1M_A9TL U1040 ( .A0(n1350), .A1(n482), .B0N(output_buf_imag_r[96]), 
        .B1N(n450), .Y(output_buf_imag_w[96]) );
  OAI22BB_X1M_A9TL U1041 ( .A0(n1350), .A1(n467), .B0N(output_buf_imag_r[97]), 
        .B1N(n450), .Y(output_buf_imag_w[97]) );
  OAI22BB_X1M_A9TL U1042 ( .A0(n450), .A1(n468), .B0N(output_buf_imag_r[98]), 
        .B1N(n450), .Y(output_buf_imag_w[98]) );
  OAI22BB_X1M_A9TL U1043 ( .A0(n1350), .A1(n469), .B0N(output_buf_imag_r[99]), 
        .B1N(n450), .Y(output_buf_imag_w[99]) );
  OAI22BB_X1M_A9TL U1044 ( .A0(n1350), .A1(n470), .B0N(output_buf_imag_r[100]), 
        .B1N(n450), .Y(output_buf_imag_w[100]) );
  OAI22BB_X1M_A9TL U1045 ( .A0(n450), .A1(n471), .B0N(output_buf_imag_r[101]), 
        .B1N(n450), .Y(output_buf_imag_w[101]) );
  OAI22BB_X1M_A9TL U1046 ( .A0(n450), .A1(n472), .B0N(output_buf_imag_r[102]), 
        .B1N(n450), .Y(output_buf_imag_w[102]) );
  OAI22BB_X1M_A9TL U1047 ( .A0(n1350), .A1(n473), .B0N(output_buf_imag_r[103]), 
        .B1N(n450), .Y(output_buf_imag_w[103]) );
  OAI22BB_X1M_A9TL U1048 ( .A0(n450), .A1(n474), .B0N(output_buf_imag_r[104]), 
        .B1N(n450), .Y(output_buf_imag_w[104]) );
  OAI22BB_X1M_A9TL U1049 ( .A0(n1350), .A1(n475), .B0N(output_buf_imag_r[105]), 
        .B1N(n450), .Y(output_buf_imag_w[105]) );
  OAI22BB_X1M_A9TL U1050 ( .A0(n1350), .A1(n476), .B0N(output_buf_imag_r[106]), 
        .B1N(n450), .Y(output_buf_imag_w[106]) );
  OAI22BB_X1M_A9TL U1051 ( .A0(n1350), .A1(n477), .B0N(output_buf_imag_r[107]), 
        .B1N(n450), .Y(output_buf_imag_w[107]) );
  OAI22BB_X1M_A9TL U1052 ( .A0(n1350), .A1(n478), .B0N(output_buf_imag_r[108]), 
        .B1N(n450), .Y(output_buf_imag_w[108]) );
  OAI22BB_X1M_A9TL U1053 ( .A0(n1350), .A1(n479), .B0N(output_buf_imag_r[109]), 
        .B1N(n450), .Y(output_buf_imag_w[109]) );
  OAI22BB_X1M_A9TL U1054 ( .A0(n1350), .A1(n480), .B0N(output_buf_imag_r[110]), 
        .B1N(n450), .Y(output_buf_imag_w[110]) );
  OAI22BB_X1M_A9TL U1055 ( .A0(n1350), .A1(n481), .B0N(output_buf_imag_r[111]), 
        .B1N(n450), .Y(output_buf_imag_w[111]) );
  OAI22BB_X1M_A9TL U1056 ( .A0(n1340), .A1(n482), .B0N(output_buf_imag_r[112]), 
        .B1N(n1340), .Y(output_buf_imag_w[112]) );
  OAI22BB_X1M_A9TL U1057 ( .A0(n451), .A1(n467), .B0N(output_buf_imag_r[113]), 
        .B1N(n1340), .Y(output_buf_imag_w[113]) );
  OAI22BB_X1M_A9TL U1058 ( .A0(n1340), .A1(n468), .B0N(output_buf_imag_r[114]), 
        .B1N(n1340), .Y(output_buf_imag_w[114]) );
  OAI22BB_X1M_A9TL U1059 ( .A0(n451), .A1(n469), .B0N(output_buf_imag_r[115]), 
        .B1N(n1340), .Y(output_buf_imag_w[115]) );
  OAI22BB_X1M_A9TL U1060 ( .A0(n451), .A1(n470), .B0N(output_buf_imag_r[116]), 
        .B1N(n451), .Y(output_buf_imag_w[116]) );
  OAI22BB_X1M_A9TL U1061 ( .A0(n1340), .A1(n471), .B0N(output_buf_imag_r[117]), 
        .B1N(n1340), .Y(output_buf_imag_w[117]) );
  OAI22BB_X1M_A9TL U1062 ( .A0(n1340), .A1(n472), .B0N(output_buf_imag_r[118]), 
        .B1N(n1340), .Y(output_buf_imag_w[118]) );
  OAI22BB_X1M_A9TL U1063 ( .A0(n451), .A1(n473), .B0N(output_buf_imag_r[119]), 
        .B1N(n1340), .Y(output_buf_imag_w[119]) );
  OAI22BB_X1M_A9TL U1064 ( .A0(n1340), .A1(n474), .B0N(output_buf_imag_r[120]), 
        .B1N(n1340), .Y(output_buf_imag_w[120]) );
  OAI22BB_X1M_A9TL U1065 ( .A0(n451), .A1(n475), .B0N(output_buf_imag_r[121]), 
        .B1N(n1340), .Y(output_buf_imag_w[121]) );
  OAI22BB_X1M_A9TL U1066 ( .A0(n1340), .A1(n476), .B0N(output_buf_imag_r[122]), 
        .B1N(n1340), .Y(output_buf_imag_w[122]) );
  OAI22BB_X1M_A9TL U1067 ( .A0(n1340), .A1(n477), .B0N(output_buf_imag_r[123]), 
        .B1N(n1340), .Y(output_buf_imag_w[123]) );
  OAI22BB_X1M_A9TL U1068 ( .A0(n1340), .A1(n478), .B0N(output_buf_imag_r[124]), 
        .B1N(n1340), .Y(output_buf_imag_w[124]) );
  OAI22BB_X1M_A9TL U1069 ( .A0(n451), .A1(n479), .B0N(output_buf_imag_r[125]), 
        .B1N(n1340), .Y(output_buf_imag_w[125]) );
  OAI22BB_X1M_A9TL U1070 ( .A0(n451), .A1(n480), .B0N(output_buf_imag_r[126]), 
        .B1N(n1340), .Y(output_buf_imag_w[126]) );
  OAI22BB_X1M_A9TL U1071 ( .A0(n451), .A1(n481), .B0N(output_buf_imag_r[127]), 
        .B1N(n1340), .Y(output_buf_imag_w[127]) );
  NOR2_X1A_A9TL U1072 ( .A(n103), .B(n500), .Y(fft_8_in_real[13]) );
  NOR2_X1A_A9TL U1073 ( .A(n90), .B(n500), .Y(fft_8_in_imag[13]) );
  OAI22BB_X1M_A9TL U1074 ( .A0(n90), .A1(n173), .B0N(fft_8_out_imag[12]), 
        .B1N(n444), .Y(fft_4_in_imag[12]) );
  OAI22BB_X1M_A9TL U1075 ( .A0(n103), .A1(n173), .B0N(fft_8_out_real[12]), 
        .B1N(n444), .Y(fft_4_in_real[12]) );
  OAI22BB_X1M_A9TL U1076 ( .A0(n451), .A1(n498), .B0N(output_buf_real_r[112]), 
        .B1N(n451), .Y(output_buf_real_w[112]) );
  OAI22BB_X1M_A9TL U1077 ( .A0(n451), .A1(n488), .B0N(output_buf_real_r[122]), 
        .B1N(n1340), .Y(output_buf_real_w[122]) );
  OAI22BB_X1M_A9TL U1078 ( .A0(n451), .A1(n487), .B0N(output_buf_real_r[123]), 
        .B1N(n451), .Y(output_buf_real_w[123]) );
  OAI22BB_X1M_A9TL U1079 ( .A0(n451), .A1(n486), .B0N(output_buf_real_r[124]), 
        .B1N(n1340), .Y(output_buf_real_w[124]) );
  OAI22BB_X1M_A9TL U1080 ( .A0(n451), .A1(n485), .B0N(output_buf_real_r[125]), 
        .B1N(n451), .Y(output_buf_real_w[125]) );
  OAI22BB_X1M_A9TL U1081 ( .A0(n451), .A1(n484), .B0N(output_buf_real_r[126]), 
        .B1N(n1340), .Y(output_buf_real_w[126]) );
  OAI22BB_X1M_A9TL U1082 ( .A0(n1340), .A1(n483), .B0N(output_buf_real_r[127]), 
        .B1N(n451), .Y(output_buf_real_w[127]) );
  OAI22BB_X1M_A9TL U1083 ( .A0(n1340), .A1(n497), .B0N(output_buf_real_r[113]), 
        .B1N(n1340), .Y(output_buf_real_w[113]) );
  OAI22BB_X1M_A9TL U1084 ( .A0(n1340), .A1(n496), .B0N(output_buf_real_r[114]), 
        .B1N(n451), .Y(output_buf_real_w[114]) );
  OAI22BB_X1M_A9TL U1085 ( .A0(n1340), .A1(n495), .B0N(output_buf_real_r[115]), 
        .B1N(n1340), .Y(output_buf_real_w[115]) );
  OAI22BB_X1M_A9TL U1086 ( .A0(n1340), .A1(n494), .B0N(output_buf_real_r[116]), 
        .B1N(n451), .Y(output_buf_real_w[116]) );
  OAI22BB_X1M_A9TL U1087 ( .A0(n1340), .A1(n493), .B0N(output_buf_real_r[117]), 
        .B1N(n1340), .Y(output_buf_real_w[117]) );
  OAI22BB_X1M_A9TL U1088 ( .A0(n1340), .A1(n492), .B0N(output_buf_real_r[118]), 
        .B1N(n451), .Y(output_buf_real_w[118]) );
  OAI22BB_X1M_A9TL U1089 ( .A0(n1340), .A1(n491), .B0N(output_buf_real_r[119]), 
        .B1N(n1340), .Y(output_buf_real_w[119]) );
  OAI22BB_X1M_A9TL U1090 ( .A0(n1340), .A1(n490), .B0N(output_buf_real_r[120]), 
        .B1N(n451), .Y(output_buf_real_w[120]) );
  OAI22BB_X1M_A9TL U1091 ( .A0(n451), .A1(n489), .B0N(output_buf_real_r[121]), 
        .B1N(n1340), .Y(output_buf_real_w[121]) );
  AO22_X1M_A9TL U1092 ( .A0(N135), .A1(n178), .B0(n179), .B1(counter_r[5]), 
        .Y(N201) );
  OAI22BB_X1M_A9TL U1093 ( .A0(n102), .A1(n173), .B0N(fft_8_out_imag[0]), 
        .B1N(n174), .Y(fft_4_in_imag[0]) );
  OAI22BB_X1M_A9TL U1094 ( .A0(n101), .A1(n173), .B0N(fft_8_out_imag[1]), 
        .B1N(n174), .Y(fft_4_in_imag[1]) );
  OAI22BB_X1M_A9TL U1095 ( .A0(n100), .A1(n173), .B0N(fft_8_out_imag[2]), 
        .B1N(n174), .Y(fft_4_in_imag[2]) );
  OAI22BB_X1M_A9TL U1096 ( .A0(n99), .A1(n173), .B0N(fft_8_out_imag[3]), .B1N(
        n174), .Y(fft_4_in_imag[3]) );
  OAI22BB_X1M_A9TL U1097 ( .A0(n98), .A1(n173), .B0N(fft_8_out_imag[4]), .B1N(
        n174), .Y(fft_4_in_imag[4]) );
  OAI22BB_X1M_A9TL U1098 ( .A0(n97), .A1(n173), .B0N(fft_8_out_imag[5]), .B1N(
        n174), .Y(fft_4_in_imag[5]) );
  OAI22BB_X1M_A9TL U1099 ( .A0(n96), .A1(n173), .B0N(fft_8_out_imag[6]), .B1N(
        n174), .Y(fft_4_in_imag[6]) );
  OAI22BB_X1M_A9TL U1100 ( .A0(n95), .A1(n173), .B0N(fft_8_out_imag[7]), .B1N(
        n174), .Y(fft_4_in_imag[7]) );
  OAI22BB_X1M_A9TL U1101 ( .A0(n94), .A1(n173), .B0N(fft_8_out_imag[8]), .B1N(
        n174), .Y(fft_4_in_imag[8]) );
  OAI22BB_X1M_A9TL U1102 ( .A0(n93), .A1(n173), .B0N(fft_8_out_imag[9]), .B1N(
        n444), .Y(fft_4_in_imag[9]) );
  OAI22BB_X1M_A9TL U1103 ( .A0(n92), .A1(n173), .B0N(fft_8_out_imag[10]), 
        .B1N(n174), .Y(fft_4_in_imag[10]) );
  OAI22BB_X1M_A9TL U1104 ( .A0(n91), .A1(n173), .B0N(fft_8_out_imag[11]), 
        .B1N(n174), .Y(fft_4_in_imag[11]) );
  OAI22BB_X1M_A9TL U1105 ( .A0(n115), .A1(n173), .B0N(fft_8_out_real[0]), 
        .B1N(n444), .Y(fft_4_in_real[0]) );
  OAI22BB_X1M_A9TL U1106 ( .A0(n114), .A1(n173), .B0N(fft_8_out_real[1]), 
        .B1N(n444), .Y(fft_4_in_real[1]) );
  OAI22BB_X1M_A9TL U1107 ( .A0(n113), .A1(n173), .B0N(fft_8_out_real[2]), 
        .B1N(n444), .Y(fft_4_in_real[2]) );
  OAI22BB_X1M_A9TL U1108 ( .A0(n112), .A1(n173), .B0N(fft_8_out_real[3]), 
        .B1N(n444), .Y(fft_4_in_real[3]) );
  OAI22BB_X1M_A9TL U1109 ( .A0(n111), .A1(n173), .B0N(fft_8_out_real[4]), 
        .B1N(n444), .Y(fft_4_in_real[4]) );
  OAI22BB_X1M_A9TL U1110 ( .A0(n110), .A1(n173), .B0N(fft_8_out_real[5]), 
        .B1N(n444), .Y(fft_4_in_real[5]) );
  OAI22BB_X1M_A9TL U1111 ( .A0(n109), .A1(n173), .B0N(fft_8_out_real[6]), 
        .B1N(n444), .Y(fft_4_in_real[6]) );
  OAI22BB_X1M_A9TL U1112 ( .A0(n1080), .A1(n173), .B0N(fft_8_out_real[7]), 
        .B1N(n444), .Y(fft_4_in_real[7]) );
  OAI22BB_X1M_A9TL U1113 ( .A0(n1070), .A1(n173), .B0N(fft_8_out_real[8]), 
        .B1N(n444), .Y(fft_4_in_real[8]) );
  OAI22BB_X1M_A9TL U1114 ( .A0(n106), .A1(n173), .B0N(fft_8_out_real[9]), 
        .B1N(n444), .Y(fft_4_in_real[9]) );
  OAI22BB_X1M_A9TL U1115 ( .A0(n105), .A1(n173), .B0N(fft_8_out_real[10]), 
        .B1N(n444), .Y(fft_4_in_real[10]) );
  OAI22BB_X1M_A9TL U1116 ( .A0(n104), .A1(n173), .B0N(fft_8_out_real[11]), 
        .B1N(n444), .Y(fft_4_in_real[11]) );
  ADDH_X1M_A9TL U1117 ( .A(N42), .B(N41), .CO(r398_carry[2]), .S(N131) );
  NAND2B_X1M_A9TL U1118 ( .AN(fft_8_valid_out), .B(n173), .Y(fft_4_valid_in)
         );
  ADDH_X1M_A9TL U1119 ( .A(counter_r[3]), .B(r398_carry[3]), .CO(r398_carry[4]), .S(N133) );
  AO22_X1M_A9TL U1120 ( .A0(N134), .A1(n178), .B0(n179), .B1(counter_r[4]), 
        .Y(N200) );
  AO22_X1M_A9TL U1121 ( .A0(N133), .A1(n178), .B0(n179), .B1(counter_r[3]), 
        .Y(N199) );
  ADDH_X1M_A9TL U1122 ( .A(counter_r[4]), .B(r398_carry[4]), .CO(r398_carry[5]), .S(N134) );
  NOR2_X1A_A9TL U1123 ( .A(n500), .B(n115), .Y(fft_8_in_real[0]) );
  NOR2_X1A_A9TL U1124 ( .A(n500), .B(n114), .Y(fft_8_in_real[1]) );
  NOR2_X1A_A9TL U1125 ( .A(n500), .B(n113), .Y(fft_8_in_real[2]) );
  NOR2_X1A_A9TL U1126 ( .A(n500), .B(n112), .Y(fft_8_in_real[3]) );
  NOR2_X1A_A9TL U1127 ( .A(n500), .B(n111), .Y(fft_8_in_real[4]) );
  NOR2_X1A_A9TL U1128 ( .A(n500), .B(n110), .Y(fft_8_in_real[5]) );
  NOR2_X1A_A9TL U1129 ( .A(n500), .B(n109), .Y(fft_8_in_real[6]) );
  NOR2_X1A_A9TL U1130 ( .A(n500), .B(n1080), .Y(fft_8_in_real[7]) );
  NOR2_X1A_A9TL U1131 ( .A(n500), .B(n1070), .Y(fft_8_in_real[8]) );
  NOR2_X1A_A9TL U1132 ( .A(n500), .B(n106), .Y(fft_8_in_real[9]) );
  NOR2_X1A_A9TL U1133 ( .A(n500), .B(n105), .Y(fft_8_in_real[10]) );
  NOR2_X1A_A9TL U1134 ( .A(n500), .B(n104), .Y(fft_8_in_real[11]) );
  NOR2_X1A_A9TL U1135 ( .A(n500), .B(n102), .Y(fft_8_in_imag[0]) );
  NOR2_X1A_A9TL U1136 ( .A(n500), .B(n101), .Y(fft_8_in_imag[1]) );
  NOR2_X1A_A9TL U1137 ( .A(n500), .B(n100), .Y(fft_8_in_imag[2]) );
  NOR2_X1A_A9TL U1138 ( .A(n500), .B(n99), .Y(fft_8_in_imag[3]) );
  NOR2_X1A_A9TL U1139 ( .A(n500), .B(n98), .Y(fft_8_in_imag[4]) );
  NOR2_X1A_A9TL U1140 ( .A(n500), .B(n97), .Y(fft_8_in_imag[5]) );
  NOR2_X1A_A9TL U1141 ( .A(n500), .B(n96), .Y(fft_8_in_imag[6]) );
  NOR2_X1A_A9TL U1142 ( .A(n500), .B(n95), .Y(fft_8_in_imag[7]) );
  NOR2_X1A_A9TL U1143 ( .A(n500), .B(n94), .Y(fft_8_in_imag[8]) );
  NOR2_X1A_A9TL U1144 ( .A(n500), .B(n93), .Y(fft_8_in_imag[9]) );
  NOR2_X1A_A9TL U1145 ( .A(n500), .B(n92), .Y(fft_8_in_imag[10]) );
  NOR2_X1A_A9TL U1146 ( .A(n500), .B(n91), .Y(fft_8_in_imag[11]) );
  AO22_X1M_A9TL U1147 ( .A0(n179), .A1(N42), .B0(N131), .B1(n178), .Y(N197) );
  OAI21_X1M_A9TL U1148 ( .A0(mode_r[2]), .A1(mode_r[0]), .B0(n5120), .Y(N60)
         );
  NOR2_X1A_A9TL U1149 ( .A(mode_r[1]), .B(n5130), .Y(N58) );
  NOR2_X1A_A9TL U1150 ( .A(mode_r[1]), .B(mode_r[0]), .Y(N57) );
  AND2_X1B_A9TL U1151 ( .A(mode_r[1]), .B(n5130), .Y(N59) );
  NOR2_X0P5A_A9TH U1152 ( .A(n441), .B(N42), .Y(n300) );
  NOR2_X0P5A_A9TH U1153 ( .A(n441), .B(n436), .Y(n301) );
  AOI22_X0P5M_A9TH U1154 ( .A0(output_buf_imag_r[80]), .A1(n265), .B0(
        output_buf_imag_r[112]), .B1(n264), .Y(n307) );
  NOR2_X0P5A_A9TH U1155 ( .A(N42), .B(N43), .Y(n302) );
  NOR2_X0P5A_A9TH U1156 ( .A(n436), .B(N43), .Y(n303) );
  AOI22_X0P5M_A9TH U1157 ( .A0(output_buf_imag_r[16]), .A1(n267), .B0(
        output_buf_imag_r[48]), .B1(n266), .Y(n306) );
  NOR2B_X0P5M_A9TH U1158 ( .AN(n300), .B(N41), .Y(n429) );
  NOR2B_X0P5M_A9TH U1159 ( .AN(n301), .B(N41), .Y(n428) );
  AOI22_X0P5M_A9TH U1160 ( .A0(output_buf_imag_r[64]), .A1(n438), .B0(
        output_buf_imag_r[96]), .B1(n437), .Y(n305) );
  NOR2B_X0P5M_A9TH U1161 ( .AN(n302), .B(N41), .Y(n431) );
  NOR2B_X0P5M_A9TH U1162 ( .AN(n303), .B(N41), .Y(n430) );
  AOI22_X0P5M_A9TH U1163 ( .A0(output_buf_imag_r[0]), .A1(n440), .B0(
        output_buf_imag_r[32]), .B1(n439), .Y(n304) );
  NAND4_X0P5A_A9TH U1164 ( .A(n307), .B(n306), .C(n305), .D(n304), .Y(N538) );
  AOI22_X0P5M_A9TH U1165 ( .A0(output_buf_imag_r[81]), .A1(n265), .B0(
        output_buf_imag_r[113]), .B1(n264), .Y(n311) );
  AOI22_X0P5M_A9TH U1166 ( .A0(output_buf_imag_r[17]), .A1(n267), .B0(
        output_buf_imag_r[49]), .B1(n266), .Y(n310) );
  AOI22_X0P5M_A9TH U1167 ( .A0(output_buf_imag_r[65]), .A1(n438), .B0(
        output_buf_imag_r[97]), .B1(n437), .Y(n309) );
  AOI22_X0P5M_A9TH U1168 ( .A0(output_buf_imag_r[1]), .A1(n440), .B0(
        output_buf_imag_r[33]), .B1(n439), .Y(n308) );
  NAND4_X0P5A_A9TH U1169 ( .A(n311), .B(n310), .C(n309), .D(n308), .Y(N537) );
  AOI22_X0P5M_A9TH U1170 ( .A0(output_buf_imag_r[82]), .A1(n265), .B0(
        output_buf_imag_r[114]), .B1(n264), .Y(n315) );
  AOI22_X0P5M_A9TH U1171 ( .A0(output_buf_imag_r[18]), .A1(n267), .B0(
        output_buf_imag_r[50]), .B1(n266), .Y(n314) );
  AOI22_X0P5M_A9TH U1172 ( .A0(output_buf_imag_r[66]), .A1(n438), .B0(
        output_buf_imag_r[98]), .B1(n437), .Y(n313) );
  AOI22_X0P5M_A9TH U1173 ( .A0(output_buf_imag_r[2]), .A1(n440), .B0(
        output_buf_imag_r[34]), .B1(n439), .Y(n312) );
  NAND4_X0P5A_A9TH U1174 ( .A(n315), .B(n314), .C(n313), .D(n312), .Y(N536) );
  AOI22_X0P5M_A9TH U1175 ( .A0(output_buf_imag_r[83]), .A1(n265), .B0(
        output_buf_imag_r[115]), .B1(n264), .Y(n319) );
  AOI22_X0P5M_A9TH U1176 ( .A0(output_buf_imag_r[19]), .A1(n267), .B0(
        output_buf_imag_r[51]), .B1(n266), .Y(n318) );
  AOI22_X0P5M_A9TH U1177 ( .A0(output_buf_imag_r[67]), .A1(n438), .B0(
        output_buf_imag_r[99]), .B1(n437), .Y(n317) );
  AOI22_X0P5M_A9TH U1178 ( .A0(output_buf_imag_r[3]), .A1(n440), .B0(
        output_buf_imag_r[35]), .B1(n439), .Y(n316) );
  NAND4_X0P5A_A9TH U1179 ( .A(n319), .B(n318), .C(n317), .D(n316), .Y(N535) );
  AOI22_X0P5M_A9TH U1180 ( .A0(output_buf_imag_r[84]), .A1(n265), .B0(
        output_buf_imag_r[116]), .B1(n264), .Y(n323) );
  AOI22_X0P5M_A9TH U1181 ( .A0(output_buf_imag_r[20]), .A1(n267), .B0(
        output_buf_imag_r[52]), .B1(n266), .Y(n322) );
  AOI22_X0P5M_A9TH U1182 ( .A0(output_buf_imag_r[68]), .A1(n438), .B0(
        output_buf_imag_r[100]), .B1(n428), .Y(n321) );
  AOI22_X0P5M_A9TH U1183 ( .A0(output_buf_imag_r[4]), .A1(n440), .B0(
        output_buf_imag_r[36]), .B1(n430), .Y(n320) );
  NAND4_X0P5A_A9TH U1184 ( .A(n323), .B(n322), .C(n321), .D(n320), .Y(N534) );
  AOI22_X0P5M_A9TH U1185 ( .A0(output_buf_imag_r[85]), .A1(n265), .B0(
        output_buf_imag_r[117]), .B1(n264), .Y(n327) );
  AOI22_X0P5M_A9TH U1186 ( .A0(output_buf_imag_r[21]), .A1(n267), .B0(
        output_buf_imag_r[53]), .B1(n266), .Y(n326) );
  AOI22_X0P5M_A9TH U1187 ( .A0(output_buf_imag_r[69]), .A1(n438), .B0(
        output_buf_imag_r[101]), .B1(n428), .Y(n325) );
  AOI22_X0P5M_A9TH U1188 ( .A0(output_buf_imag_r[5]), .A1(n440), .B0(
        output_buf_imag_r[37]), .B1(n430), .Y(n324) );
  NAND4_X0P5A_A9TH U1189 ( .A(n327), .B(n326), .C(n325), .D(n324), .Y(N533) );
  AOI22_X0P5M_A9TH U1190 ( .A0(output_buf_imag_r[86]), .A1(n265), .B0(
        output_buf_imag_r[118]), .B1(n264), .Y(n331) );
  AOI22_X0P5M_A9TH U1191 ( .A0(output_buf_imag_r[22]), .A1(n267), .B0(
        output_buf_imag_r[54]), .B1(n266), .Y(n330) );
  AOI22_X0P5M_A9TH U1192 ( .A0(output_buf_imag_r[70]), .A1(n438), .B0(
        output_buf_imag_r[102]), .B1(n428), .Y(n329) );
  AOI22_X0P5M_A9TH U1193 ( .A0(output_buf_imag_r[6]), .A1(n440), .B0(
        output_buf_imag_r[38]), .B1(n430), .Y(n328) );
  NAND4_X0P5A_A9TH U1194 ( .A(n331), .B(n330), .C(n329), .D(n328), .Y(N532) );
  AOI22_X0P5M_A9TH U1195 ( .A0(output_buf_imag_r[87]), .A1(n265), .B0(
        output_buf_imag_r[119]), .B1(n264), .Y(n335) );
  AOI22_X0P5M_A9TH U1196 ( .A0(output_buf_imag_r[23]), .A1(n267), .B0(
        output_buf_imag_r[55]), .B1(n266), .Y(n334) );
  AOI22_X0P5M_A9TH U1197 ( .A0(output_buf_imag_r[71]), .A1(n438), .B0(
        output_buf_imag_r[103]), .B1(n428), .Y(n333) );
  AOI22_X0P5M_A9TH U1198 ( .A0(output_buf_imag_r[7]), .A1(n440), .B0(
        output_buf_imag_r[39]), .B1(n430), .Y(n332) );
  NAND4_X0P5A_A9TH U1199 ( .A(n335), .B(n334), .C(n333), .D(n332), .Y(N531) );
  AOI22_X0P5M_A9TH U1200 ( .A0(output_buf_imag_r[88]), .A1(n265), .B0(
        output_buf_imag_r[120]), .B1(n264), .Y(n339) );
  AOI22_X0P5M_A9TH U1201 ( .A0(output_buf_imag_r[24]), .A1(n267), .B0(
        output_buf_imag_r[56]), .B1(n266), .Y(n338) );
  AOI22_X0P5M_A9TH U1202 ( .A0(output_buf_imag_r[72]), .A1(n438), .B0(
        output_buf_imag_r[104]), .B1(n428), .Y(n337) );
  AOI22_X0P5M_A9TH U1203 ( .A0(output_buf_imag_r[8]), .A1(n440), .B0(
        output_buf_imag_r[40]), .B1(n430), .Y(n336) );
  NAND4_X0P5A_A9TH U1204 ( .A(n339), .B(n338), .C(n337), .D(n336), .Y(N530) );
  AOI22_X0P5M_A9TH U1205 ( .A0(output_buf_imag_r[89]), .A1(n265), .B0(
        output_buf_imag_r[121]), .B1(n264), .Y(n343) );
  AOI22_X0P5M_A9TH U1206 ( .A0(output_buf_imag_r[25]), .A1(n267), .B0(
        output_buf_imag_r[57]), .B1(n266), .Y(n342) );
  AOI22_X0P5M_A9TH U1207 ( .A0(output_buf_imag_r[73]), .A1(n438), .B0(
        output_buf_imag_r[105]), .B1(n437), .Y(n341) );
  AOI22_X0P5M_A9TH U1208 ( .A0(output_buf_imag_r[9]), .A1(n440), .B0(
        output_buf_imag_r[41]), .B1(n439), .Y(n340) );
  NAND4_X0P5A_A9TH U1209 ( .A(n343), .B(n342), .C(n341), .D(n340), .Y(N529) );
  AOI22_X0P5M_A9TH U1210 ( .A0(output_buf_imag_r[90]), .A1(n265), .B0(
        output_buf_imag_r[122]), .B1(n264), .Y(n347) );
  AOI22_X0P5M_A9TH U1211 ( .A0(output_buf_imag_r[26]), .A1(n267), .B0(
        output_buf_imag_r[58]), .B1(n266), .Y(n346) );
  AOI22_X0P5M_A9TH U1212 ( .A0(output_buf_imag_r[74]), .A1(n438), .B0(
        output_buf_imag_r[106]), .B1(n437), .Y(n345) );
  AOI22_X0P5M_A9TH U1213 ( .A0(output_buf_imag_r[10]), .A1(n440), .B0(
        output_buf_imag_r[42]), .B1(n439), .Y(n344) );
  NAND4_X0P5A_A9TH U1214 ( .A(n347), .B(n346), .C(n345), .D(n344), .Y(N528) );
  AOI22_X0P5M_A9TH U1215 ( .A0(output_buf_imag_r[91]), .A1(n265), .B0(
        output_buf_imag_r[123]), .B1(n264), .Y(n351) );
  AOI22_X0P5M_A9TH U1216 ( .A0(output_buf_imag_r[27]), .A1(n267), .B0(
        output_buf_imag_r[59]), .B1(n266), .Y(n350) );
  AOI22_X0P5M_A9TH U1217 ( .A0(output_buf_imag_r[75]), .A1(n438), .B0(
        output_buf_imag_r[107]), .B1(n437), .Y(n349) );
  AOI22_X0P5M_A9TH U1218 ( .A0(output_buf_imag_r[11]), .A1(n440), .B0(
        output_buf_imag_r[43]), .B1(n439), .Y(n348) );
  NAND4_X0P5A_A9TH U1219 ( .A(n351), .B(n350), .C(n349), .D(n348), .Y(N527) );
  AOI22_X0P5M_A9TH U1220 ( .A0(output_buf_imag_r[92]), .A1(n265), .B0(
        output_buf_imag_r[124]), .B1(n264), .Y(n355) );
  AOI22_X0P5M_A9TH U1221 ( .A0(output_buf_imag_r[28]), .A1(n267), .B0(
        output_buf_imag_r[60]), .B1(n266), .Y(n354) );
  AOI22_X0P5M_A9TH U1222 ( .A0(output_buf_imag_r[76]), .A1(n438), .B0(
        output_buf_imag_r[108]), .B1(n437), .Y(n353) );
  AOI22_X0P5M_A9TH U1223 ( .A0(output_buf_imag_r[12]), .A1(n440), .B0(
        output_buf_imag_r[44]), .B1(n439), .Y(n352) );
  NAND4_X0P5A_A9TH U1224 ( .A(n355), .B(n354), .C(n353), .D(n352), .Y(N526) );
  AOI22_X0P5M_A9TH U1225 ( .A0(output_buf_imag_r[93]), .A1(n265), .B0(
        output_buf_imag_r[125]), .B1(n264), .Y(n359) );
  AOI22_X0P5M_A9TH U1226 ( .A0(output_buf_imag_r[29]), .A1(n267), .B0(
        output_buf_imag_r[61]), .B1(n266), .Y(n358) );
  AOI22_X0P5M_A9TH U1227 ( .A0(output_buf_imag_r[77]), .A1(n438), .B0(
        output_buf_imag_r[109]), .B1(n437), .Y(n357) );
  AOI22_X0P5M_A9TH U1228 ( .A0(output_buf_imag_r[13]), .A1(n440), .B0(
        output_buf_imag_r[45]), .B1(n439), .Y(n356) );
  NAND4_X0P5A_A9TH U1229 ( .A(n359), .B(n358), .C(n357), .D(n356), .Y(N525) );
  AOI22_X0P5M_A9TH U1230 ( .A0(output_buf_imag_r[94]), .A1(n265), .B0(
        output_buf_imag_r[126]), .B1(n264), .Y(n363) );
  AOI22_X0P5M_A9TH U1231 ( .A0(output_buf_imag_r[30]), .A1(n267), .B0(
        output_buf_imag_r[62]), .B1(n266), .Y(n362) );
  AOI22_X0P5M_A9TH U1232 ( .A0(output_buf_imag_r[78]), .A1(n438), .B0(
        output_buf_imag_r[110]), .B1(n437), .Y(n361) );
  AOI22_X0P5M_A9TH U1233 ( .A0(output_buf_imag_r[14]), .A1(n440), .B0(
        output_buf_imag_r[46]), .B1(n439), .Y(n360) );
  NAND4_X0P5A_A9TH U1234 ( .A(n363), .B(n362), .C(n361), .D(n360), .Y(N524) );
  AOI22_X0P5M_A9TH U1235 ( .A0(output_buf_imag_r[95]), .A1(n265), .B0(
        output_buf_imag_r[127]), .B1(n264), .Y(n367) );
  AOI22_X0P5M_A9TH U1236 ( .A0(output_buf_imag_r[31]), .A1(n267), .B0(
        output_buf_imag_r[63]), .B1(n266), .Y(n366) );
  AOI22_X0P5M_A9TH U1237 ( .A0(output_buf_imag_r[79]), .A1(n438), .B0(
        output_buf_imag_r[111]), .B1(n437), .Y(n365) );
  AOI22_X0P5M_A9TH U1238 ( .A0(output_buf_imag_r[15]), .A1(n440), .B0(
        output_buf_imag_r[47]), .B1(n439), .Y(n364) );
  NAND4_X0P5A_A9TH U1239 ( .A(n367), .B(n366), .C(n365), .D(n364), .Y(N523) );
  AOI22_X0P5M_A9TH U1240 ( .A0(output_buf_real_r[80]), .A1(n265), .B0(
        output_buf_real_r[112]), .B1(n264), .Y(n371) );
  AOI22_X0P5M_A9TH U1241 ( .A0(output_buf_real_r[16]), .A1(n267), .B0(
        output_buf_real_r[48]), .B1(n266), .Y(n370) );
  AOI22_X0P5M_A9TH U1242 ( .A0(output_buf_real_r[64]), .A1(n438), .B0(
        output_buf_real_r[96]), .B1(n437), .Y(n369) );
  AOI22_X0P5M_A9TH U1243 ( .A0(output_buf_real_r[0]), .A1(n440), .B0(
        output_buf_real_r[32]), .B1(n439), .Y(n368) );
  NAND4_X0P5A_A9TH U1244 ( .A(n371), .B(n370), .C(n369), .D(n368), .Y(N522) );
  AOI22_X0P5M_A9TH U1245 ( .A0(output_buf_real_r[81]), .A1(n265), .B0(
        output_buf_real_r[113]), .B1(n264), .Y(n375) );
  AOI22_X0P5M_A9TH U1246 ( .A0(output_buf_real_r[17]), .A1(n267), .B0(
        output_buf_real_r[49]), .B1(n266), .Y(n374) );
  AOI22_X0P5M_A9TH U1247 ( .A0(output_buf_real_r[65]), .A1(n438), .B0(
        output_buf_real_r[97]), .B1(n437), .Y(n373) );
  AOI22_X0P5M_A9TH U1248 ( .A0(output_buf_real_r[1]), .A1(n440), .B0(
        output_buf_real_r[33]), .B1(n439), .Y(n372) );
  NAND4_X0P5A_A9TH U1249 ( .A(n375), .B(n374), .C(n373), .D(n372), .Y(N521) );
  AOI22_X0P5M_A9TH U1250 ( .A0(output_buf_real_r[82]), .A1(n265), .B0(
        output_buf_real_r[114]), .B1(n264), .Y(n379) );
  AOI22_X0P5M_A9TH U1251 ( .A0(output_buf_real_r[18]), .A1(n267), .B0(
        output_buf_real_r[50]), .B1(n266), .Y(n378) );
  AOI22_X0P5M_A9TH U1252 ( .A0(output_buf_real_r[66]), .A1(n438), .B0(
        output_buf_real_r[98]), .B1(n437), .Y(n377) );
  AOI22_X0P5M_A9TH U1253 ( .A0(output_buf_real_r[2]), .A1(n440), .B0(
        output_buf_real_r[34]), .B1(n439), .Y(n376) );
  NAND4_X0P5A_A9TH U1254 ( .A(n379), .B(n378), .C(n377), .D(n376), .Y(N520) );
  AOI22_X0P5M_A9TH U1255 ( .A0(output_buf_real_r[83]), .A1(n265), .B0(
        output_buf_real_r[115]), .B1(n264), .Y(n383) );
  AOI22_X0P5M_A9TH U1256 ( .A0(output_buf_real_r[19]), .A1(n267), .B0(
        output_buf_real_r[51]), .B1(n266), .Y(n382) );
  AOI22_X0P5M_A9TH U1257 ( .A0(output_buf_real_r[67]), .A1(n438), .B0(
        output_buf_real_r[99]), .B1(n437), .Y(n381) );
  AOI22_X0P5M_A9TH U1258 ( .A0(output_buf_real_r[3]), .A1(n440), .B0(
        output_buf_real_r[35]), .B1(n439), .Y(n380) );
  NAND4_X0P5A_A9TH U1259 ( .A(n383), .B(n382), .C(n381), .D(n380), .Y(N519) );
  AOI22_X0P5M_A9TH U1260 ( .A0(output_buf_real_r[84]), .A1(n265), .B0(
        output_buf_real_r[116]), .B1(n264), .Y(n387) );
  AOI22_X0P5M_A9TH U1261 ( .A0(output_buf_real_r[20]), .A1(n267), .B0(
        output_buf_real_r[52]), .B1(n266), .Y(n386) );
  AOI22_X0P5M_A9TH U1262 ( .A0(output_buf_real_r[68]), .A1(n429), .B0(
        output_buf_real_r[100]), .B1(n437), .Y(n385) );
  AOI22_X0P5M_A9TH U1263 ( .A0(output_buf_real_r[4]), .A1(n431), .B0(
        output_buf_real_r[36]), .B1(n439), .Y(n384) );
  NAND4_X0P5A_A9TH U1264 ( .A(n387), .B(n386), .C(n385), .D(n384), .Y(N518) );
  AOI22_X0P5M_A9TH U1265 ( .A0(output_buf_real_r[85]), .A1(n265), .B0(
        output_buf_real_r[117]), .B1(n264), .Y(n391) );
  AOI22_X0P5M_A9TH U1266 ( .A0(output_buf_real_r[21]), .A1(n267), .B0(
        output_buf_real_r[53]), .B1(n266), .Y(n390) );
  AOI22_X0P5M_A9TH U1267 ( .A0(output_buf_real_r[69]), .A1(n429), .B0(
        output_buf_real_r[101]), .B1(n437), .Y(n389) );
  AOI22_X0P5M_A9TH U1268 ( .A0(output_buf_real_r[5]), .A1(n431), .B0(
        output_buf_real_r[37]), .B1(n439), .Y(n388) );
  NAND4_X0P5A_A9TH U1269 ( .A(n391), .B(n390), .C(n389), .D(n388), .Y(N517) );
  AOI22_X0P5M_A9TH U1270 ( .A0(output_buf_real_r[86]), .A1(n265), .B0(
        output_buf_real_r[118]), .B1(n264), .Y(n395) );
  AOI22_X0P5M_A9TH U1271 ( .A0(output_buf_real_r[22]), .A1(n267), .B0(
        output_buf_real_r[54]), .B1(n266), .Y(n394) );
  AOI22_X0P5M_A9TH U1272 ( .A0(output_buf_real_r[70]), .A1(n429), .B0(
        output_buf_real_r[102]), .B1(n437), .Y(n393) );
  AOI22_X0P5M_A9TH U1273 ( .A0(output_buf_real_r[6]), .A1(n431), .B0(
        output_buf_real_r[38]), .B1(n439), .Y(n392) );
  NAND4_X0P5A_A9TH U1274 ( .A(n395), .B(n394), .C(n393), .D(n392), .Y(N516) );
  AOI22_X0P5M_A9TH U1275 ( .A0(output_buf_real_r[87]), .A1(n265), .B0(
        output_buf_real_r[119]), .B1(n264), .Y(n399) );
  AOI22_X0P5M_A9TH U1276 ( .A0(output_buf_real_r[23]), .A1(n267), .B0(
        output_buf_real_r[55]), .B1(n266), .Y(n398) );
  AOI22_X0P5M_A9TH U1277 ( .A0(output_buf_real_r[71]), .A1(n429), .B0(
        output_buf_real_r[103]), .B1(n437), .Y(n397) );
  AOI22_X0P5M_A9TH U1278 ( .A0(output_buf_real_r[7]), .A1(n431), .B0(
        output_buf_real_r[39]), .B1(n439), .Y(n396) );
  NAND4_X0P5A_A9TH U1279 ( .A(n399), .B(n398), .C(n397), .D(n396), .Y(N515) );
  AOI22_X0P5M_A9TH U1280 ( .A0(output_buf_real_r[88]), .A1(n265), .B0(
        output_buf_real_r[120]), .B1(n264), .Y(n403) );
  AOI22_X0P5M_A9TH U1281 ( .A0(output_buf_real_r[24]), .A1(n267), .B0(
        output_buf_real_r[56]), .B1(n266), .Y(n402) );
  AOI22_X0P5M_A9TH U1282 ( .A0(output_buf_real_r[72]), .A1(n429), .B0(
        output_buf_real_r[104]), .B1(n437), .Y(n401) );
  AOI22_X0P5M_A9TH U1283 ( .A0(output_buf_real_r[8]), .A1(n431), .B0(
        output_buf_real_r[40]), .B1(n439), .Y(n400) );
  NAND4_X0P5A_A9TH U1284 ( .A(n403), .B(n402), .C(n401), .D(n400), .Y(N514) );
  AOI22_X0P5M_A9TH U1285 ( .A0(output_buf_real_r[89]), .A1(n265), .B0(
        output_buf_real_r[121]), .B1(n264), .Y(n407) );
  AOI22_X0P5M_A9TH U1286 ( .A0(output_buf_real_r[25]), .A1(n267), .B0(
        output_buf_real_r[57]), .B1(n266), .Y(n406) );
  AOI22_X0P5M_A9TH U1287 ( .A0(output_buf_real_r[73]), .A1(n438), .B0(
        output_buf_real_r[105]), .B1(n437), .Y(n405) );
  AOI22_X0P5M_A9TH U1288 ( .A0(output_buf_real_r[9]), .A1(n440), .B0(
        output_buf_real_r[41]), .B1(n439), .Y(n404) );
  NAND4_X0P5A_A9TH U1289 ( .A(n407), .B(n406), .C(n405), .D(n404), .Y(N513) );
  AOI22_X0P5M_A9TH U1290 ( .A0(output_buf_real_r[90]), .A1(n265), .B0(
        output_buf_real_r[122]), .B1(n264), .Y(n411) );
  AOI22_X0P5M_A9TH U1291 ( .A0(output_buf_real_r[26]), .A1(n267), .B0(
        output_buf_real_r[58]), .B1(n266), .Y(n410) );
  AOI22_X0P5M_A9TH U1292 ( .A0(output_buf_real_r[74]), .A1(n438), .B0(
        output_buf_real_r[106]), .B1(n437), .Y(n409) );
  AOI22_X0P5M_A9TH U1293 ( .A0(output_buf_real_r[10]), .A1(n440), .B0(
        output_buf_real_r[42]), .B1(n439), .Y(n408) );
  NAND4_X0P5A_A9TH U1294 ( .A(n411), .B(n410), .C(n409), .D(n408), .Y(N512) );
  AOI22_X0P5M_A9TH U1295 ( .A0(output_buf_real_r[91]), .A1(n265), .B0(
        output_buf_real_r[123]), .B1(n264), .Y(n415) );
  AOI22_X0P5M_A9TH U1296 ( .A0(output_buf_real_r[27]), .A1(n267), .B0(
        output_buf_real_r[59]), .B1(n266), .Y(n414) );
  AOI22_X0P5M_A9TH U1297 ( .A0(output_buf_real_r[75]), .A1(n438), .B0(
        output_buf_real_r[107]), .B1(n437), .Y(n413) );
  AOI22_X0P5M_A9TH U1298 ( .A0(output_buf_real_r[11]), .A1(n440), .B0(
        output_buf_real_r[43]), .B1(n439), .Y(n412) );
  NAND4_X0P5A_A9TH U1299 ( .A(n415), .B(n414), .C(n413), .D(n412), .Y(N511) );
  AOI22_X0P5M_A9TH U1300 ( .A0(output_buf_real_r[92]), .A1(n265), .B0(
        output_buf_real_r[124]), .B1(n264), .Y(n419) );
  AOI22_X0P5M_A9TH U1301 ( .A0(output_buf_real_r[28]), .A1(n267), .B0(
        output_buf_real_r[60]), .B1(n266), .Y(n418) );
  AOI22_X0P5M_A9TH U1302 ( .A0(output_buf_real_r[76]), .A1(n438), .B0(
        output_buf_real_r[108]), .B1(n437), .Y(n417) );
  AOI22_X0P5M_A9TH U1303 ( .A0(output_buf_real_r[12]), .A1(n440), .B0(
        output_buf_real_r[44]), .B1(n439), .Y(n416) );
  NAND4_X0P5A_A9TH U1304 ( .A(n419), .B(n418), .C(n417), .D(n416), .Y(N510) );
  AOI22_X0P5M_A9TH U1305 ( .A0(output_buf_real_r[93]), .A1(n265), .B0(
        output_buf_real_r[125]), .B1(n264), .Y(n423) );
  AOI22_X0P5M_A9TH U1306 ( .A0(output_buf_real_r[29]), .A1(n267), .B0(
        output_buf_real_r[61]), .B1(n266), .Y(n422) );
  AOI22_X0P5M_A9TH U1307 ( .A0(output_buf_real_r[77]), .A1(n438), .B0(
        output_buf_real_r[109]), .B1(n437), .Y(n421) );
  AOI22_X0P5M_A9TH U1308 ( .A0(output_buf_real_r[13]), .A1(n440), .B0(
        output_buf_real_r[45]), .B1(n439), .Y(n420) );
  NAND4_X0P5A_A9TH U1309 ( .A(n423), .B(n422), .C(n421), .D(n420), .Y(N509) );
  AOI22_X0P5M_A9TH U1310 ( .A0(output_buf_real_r[94]), .A1(n265), .B0(
        output_buf_real_r[126]), .B1(n264), .Y(n427) );
  AOI22_X0P5M_A9TH U1311 ( .A0(output_buf_real_r[30]), .A1(n267), .B0(
        output_buf_real_r[62]), .B1(n266), .Y(n426) );
  AOI22_X0P5M_A9TH U1312 ( .A0(output_buf_real_r[78]), .A1(n438), .B0(
        output_buf_real_r[110]), .B1(n437), .Y(n425) );
  AOI22_X0P5M_A9TH U1313 ( .A0(output_buf_real_r[14]), .A1(n440), .B0(
        output_buf_real_r[46]), .B1(n439), .Y(n424) );
  NAND4_X0P5A_A9TH U1314 ( .A(n427), .B(n426), .C(n425), .D(n424), .Y(N508) );
  AOI22_X0P5M_A9TH U1315 ( .A0(output_buf_real_r[95]), .A1(n265), .B0(
        output_buf_real_r[127]), .B1(n264), .Y(n435) );
  AOI22_X0P5M_A9TH U1316 ( .A0(output_buf_real_r[31]), .A1(n267), .B0(
        output_buf_real_r[63]), .B1(n266), .Y(n434) );
  AOI22_X0P5M_A9TH U1317 ( .A0(output_buf_real_r[79]), .A1(n438), .B0(
        output_buf_real_r[111]), .B1(n437), .Y(n433) );
  AOI22_X0P5M_A9TH U1318 ( .A0(output_buf_real_r[15]), .A1(n440), .B0(
        output_buf_real_r[47]), .B1(n439), .Y(n432) );
  NAND4_X0P5A_A9TH U1319 ( .A(n435), .B(n434), .C(n433), .D(n432), .Y(N507) );
  NOR3_X0P5A_A9TH U1320 ( .A(fft_point[3]), .B(fft_point[4]), .C(fft_point[2]), 
        .Y(N78) );
  INV_X0P5B_A9TH U1321 ( .A(fft_point[2]), .Y(N71) );
  XNOR2_X0P5M_A9TH U1322 ( .A(fft_point[3]), .B(fft_point[2]), .Y(N72) );
  NOR2_X0P5A_A9TH U1323 ( .A(fft_point[2]), .B(fft_point[3]), .Y(n464) );
  XOR2_X0P5M_A9TH U1324 ( .A(fft_point[4]), .B(n464), .Y(N73) );
  XOR2_X0P5M_A9TH U1325 ( .A(r398_carry[5]), .B(counter_r[5]), .Y(N135) );
endmodule

