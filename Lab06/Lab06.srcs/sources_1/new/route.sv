`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/14/2024 12:57:29 PM
// Design Name:         Route
// Module Name:         route
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


module route(
    input wire  a, ae, b, be,
    output reg  y
    );
    
    always_comb 
        y = ~((a & ae) | (b & be));
endmodule
