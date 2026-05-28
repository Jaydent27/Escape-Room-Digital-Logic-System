`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2025 12:31:21
// Design Name: 
// Module Name: ChallengeOneCircuit
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


module ChallengeOneCircuit(
    input [3:0] A,
    input [3:0] B,
   
    output [1:0] C
    );
    
    wire [7:0] n;
    wire [13:0] w;
    wire d1, d2, d3;
    
    // Compare MSB 
    not g1(n[0], A[3]);
    and g2(w[0], n[0], B[3]);
    not g3(n[1], B[3]);
    and g4(w[1], n[1], A[3]);
    
    // Compare next 2nd MSB without interference from 1st MSB bit
    xnor g5(d3, A[3], B[3]);
    not g6(n[2], A[2]);
    and g7(w[2], n[2], B[2]);
    not g8(n[3], B[2]);
    and g9(w[4], n[3], A[2]);
    and g10(w[3], w[2], d3);
    and g11(w[5], w[4], d3);
    
    // Compare 3rd MSB without intereference from 2nd MSB
    xnor g12(d2, A[2], B[2]);
    not g13(n[4], A[1]);
    and g14(w[6], n[4], B[1]);
    not g15(n[5], B[1]);
    and g16(w[8], n[5], A[1]);
    and g17(w[7], w[6], d2, d3);
    and g18(w[9], w[8], d2, d3);
    
    // Compare 4th MSB without interference from 1st MSB
    xnor g19(d1, A[1], B[1]);
    not g20(n[6], A[0]);
    and g21(w[10], n[6], B[0]);
    not g22(n[7], B[0]);
    and g23(w[12], n[7], A[0]);
    and g24(w[11], w[10], d1, d2, d3);
    and g25(w[13], w[12], d1, d2, d3);
    
    // Output LSB
    or g26(C[0], w[0], w[3], w[7], w[11]);
    
    // Output MSB
    or g27(C[1], w[1], w[5], w[9], w[13]);
    
    
    
endmodule
