`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 20:59:15
// Design Name: 
// Module Name: ass2_structural
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ass2_structural(
    input TIME, START,
    input [1:0] COMP, 
    input [3:0] CODE, OUTS,
    output OVER
    );
    
    wire X;
    wire out_over;
    wire J_M, K_M, J_N, K_N;
    wire Out_M, Out_N, Out_Mb, Out_Nb;
    // Latch wires
    wire EN_control, Latch_Q;
    
    Input_Circuit i1(
       .Y(COMP[1]),
       .Z(COMP[0]),
       .A(CODE[3]),
       .B(CODE[2]),
       .C(CODE[1]),
       .D(CODE[0]),
       .E(OUTS[3]),
       .F(OUTS[2]),
       .G(OUTS[1]),
       .H(OUTS[0]),
       .X(X)
       );
       
      // Combinational Logic for JK Inputs
      assign J_M =  Out_N;
      assign K_M = Out_N;
      assign J_N = 1'b1;
      assign K_N = Out_Mb | X;
      
      
      
      JK_FlipFlop FM(
          .J(J_M), 
          .K(K_M),
          .clk(TIME),
          .reset(START),
          .Q(Out_M),
          .Q_b(Out_Mb)
      );
      
      JK_FlipFlop FN(
          .J(J_N),
          .K(K_N),
          .clk(TIME),
          .reset(START),
          .Q(Out_N),
          .Q_b(Out_Nb)
      );
      
      assign EN_Control = START | ~Latch_Q;
      
      
      assign out_over = Out_M&Out_N&X;
      
       D_Latch DO(
          .D(out_over),
          .EN(EN_Control),
          .Q(Latch_Q)
      );
      
      assign OVER = Latch_Q;
    
endmodule


