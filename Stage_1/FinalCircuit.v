`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2025 19:20:05
// Design Name: 
// Module Name: FinalCircuit
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


module FinalCircuit(
   input [1:0] COMP,
   input CORR1,
   input CORR2,
   output OPEN
   );
   
   assign OPEN = ~COMP[0]&~COMP[1]&CORR1&CORR2;
   
endmodule
