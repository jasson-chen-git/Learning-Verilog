`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         08/17/2024 03:40:13 PM
// Design Name:         XS3 Code to Binary Code Converter with Lookup Table
// Module Name:         xs3_bcd_lut
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


module xs3_bcd_lut(
    input wire [3:0] pqrs,
    output reg [3:0] dcba
    );
    
    //  this lookup table ultimately takes form of reg data type
    logic [3:0] xs3_bcd_table [0:15] = {
    4'hx, 4'hx, 4'hx, 4'h0, 4'h1, 4'h2, 4'h3, 4'h4,
    4'h5, 4'h6, 4'h7, 4'h8, 4'h9, 4'hx, 4'hx, 4'hx};
    
    assign dcba = xs3_bcd_table[pqrs];
    
endmodule
