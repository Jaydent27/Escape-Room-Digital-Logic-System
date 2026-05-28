`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2025 17:30:11
// Design Name: 
// Module Name: D_Latch
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


module D_Latch(
    input D, EN,
    output reg Q,
    output reg Q_b
    );
    
    initial begin
        Q = 0;
        Q_b = 1;
    end

    always @* begin
        if (EN) begin
            Q = D;
            Q_b = ~D;
        end
    end
endmodule
