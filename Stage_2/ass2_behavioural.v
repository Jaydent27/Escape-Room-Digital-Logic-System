`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2025 11:48:06
// Design Name: 
// Module Name: ass2_behavioural
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


module ass2_behavioural(START, TIME, COMP, OUTS, CODE, OVER);
   input START, TIME;
   input [1:0] COMP;
   input [3:0] OUTS, CODE;
   output OVER;
   
   wire X;
   wire Over_Success;
   
   input_x i1(
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
     
     FSM_Behaviour f1(
        .clk(TIME),
        .reset(START),
        .input_x(X),
        .over(Over_Success)
     );
     
     assign OVER = Over_Success;
   
endmodule
