`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2025 17:41:07
// Design Name: 
// Module Name: input_x
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


module input_x(
    input A, B, C, D, E, F, G, H, Y, Z,
    output X
    );
    
    assign X = ~(Y|Z|A|B|C|D|E|F|G|H);
endmodule
