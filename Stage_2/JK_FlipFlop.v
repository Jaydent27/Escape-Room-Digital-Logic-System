`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2025 00:41:38
// Design Name: 
// Module Name: JK_FlipFlop
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


module JK_FlipFlop(
   input J, K, clk, reset,
   output reg Q,
   output Q_b
   );
   
   assign Q_b = ~Q;
   
   initial begin
   Q = 1'b0;
   end
   
   always@(posedge clk, posedge reset) begin
      if (reset) begin
         Q <= 1'b0;
      end else begin
         case ({J, K})
           2'b00: Q <= Q;
           2'b01: Q <= 1'b0;
           2'b10: Q <= 1'b1;
           2'b11: Q <= ~Q;
         endcase
      end
   end
   
   
   
endmodule
