`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/14/2024 01:02:40 PM
// Design Name:         Dual 2 Line to 1 Line Data Selector (multiplexer)
// Module Name:         dual2line_to_1line
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


module dual2line_to_1line(
    input wire  a1, b1, a2, b2, gn, an,
    output reg  y1, y2
    );
    
    logic   c0, c1;     //  intermediate signals
    
    control     ctrl (gn, an, c0, c1);
    route       rte1 (a1, c0, b1, c1, y1);
    route       rte2 (a2, c0, b2, c1, y2);
endmodule
