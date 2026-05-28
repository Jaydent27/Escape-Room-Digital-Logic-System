`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 15:17:01
// Design Name: 
// Module Name: ChallengeTwoCircuit
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

module ChallengeTwoCircuit(
    input A, B, C, D, O, U, T, S,
    output CORR1
    );
    
    wire [6:0] x;
    wire [1:0] w;
    
    xor g1(x[0], O, U);
    xor g2(x[1], x[0], T);
    xor g3(x[2], x[1], S);
    
    or g4(w[0], C, D);
    or g5(w[1], B, C, D);
    xor g6(x[3], w[0], C);
    xor g7(x[4], x[3], B);
    xor g8(x[5], x[4], w[1]);
    xor g9(x[6], x[5], A);
    
    xnor g10(CORR1, x[2], x[6]);
endmodule
