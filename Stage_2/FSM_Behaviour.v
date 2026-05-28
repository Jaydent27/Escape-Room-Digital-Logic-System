`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2025 11:48:52
// Design Name: 
// Module Name: FSM_Behaviour
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


module FSM_Behaviour(
   input clk, reset, input_x,
   output reg over
   );

   // Signal Declaration
   reg [1:0] present_state, next_state;
   parameter A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
   
   // State Register Behaviour
   always@(posedge clk, posedge reset) begin
     if (reset)
        present_state <= A;
     else
        present_state <= next_state;
   end
   
   // Next state logic
   always@* begin
     case(present_state)
        A: next_state = B;
        B: next_state = C;
        C: next_state = D;
        D: if (input_x == 1) next_state = A; else next_state = B;
     endcase
   end
   
   // Output Login 
   always@* begin
      if (reset) 
         over <= 0;
      else if (present_state == D && input_x == 1)
         over <= 1;
   end
   
endmodule
