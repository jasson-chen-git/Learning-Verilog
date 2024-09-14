`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/14/2024 12:52:37 PM
// Design Name:         Control
// Module Name:         control
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


module control(
    input wire  gn, an,
    output reg  c0, c1
    );
    
    always_comb begin
        c0 = ~gn & ~an;
        c1 = ~gn & an;
    end
endmodule
