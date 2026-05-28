`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 22:02:31
// Design Name: 
// Module Name: Input_Circuit
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


module Input_Circuit(
    input A, B, C, D, E, F, G, H, Y, Z,
    output X
    );
    
    assign X = ~(Y|Z|A|B|C|D|E|F|G|H);
endmodule
