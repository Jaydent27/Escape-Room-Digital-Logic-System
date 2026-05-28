`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 15:49:45
// Design Name: 
// Module Name: ChallengeThreeCircuit
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


module ChallengeThreeCircuit(
    input [3:0] A,
    input [3:0] B,
    output CORR2
    );
    
    wire [3:0] S;
    wire [2:0] C;
    wire [2:0] x;
    wire [3:0] a;
    
    // Add LSB, calculate carry-out
    xor g0(S[0], A[0], B[0]);
    and g1(C[0], A[0], B[0]);
    
    // Add 2nd LSB and carry-in from 1st LSB, calculate carry-out
    xor g2(x[0], A[1], B[1]);
    xor g3(S[1], x[0], C[0]);
    and g4(a[0], A[1], B[1]);
    and g5(a[1], x[0], C[0]);
    or g6(C[1], a[0], a[1]);
   
    
    //Add 3rd LSB and carry-in from 2nd LSB, calculate carry-out
    xor g7(x[1], A[2], B[2]);
    xor g8(S[2], x[1], C[1]);
    and g9(a[2], A[2], B[2]);
    and g10(a[3], x[1], x[1]);
    or g11(C[2], a[2], a[3]);
    
    //Add 4th LSB and carry-in from 3rd LSB
    xor g12(x[2], A[3], B[3]);
    xor g13(S[3], x[2], C[2]);
    
    // Output CORR2
    nor g14(CORR2, S[0], S[1], S[2], S[3]);
    
    
endmodule
