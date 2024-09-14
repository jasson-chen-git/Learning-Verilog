`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/14/2024 09:43:30 AM
// Design Name:         BCD to Weighted Code (8, 4, -2, -1) Converter
// Module Name:         bcd_to_weighted
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


module bcd_to_weighted(
    input wire  d, c, b, a,
    output reg  p, q, r, s
    );
    
    //  write p in csop
    always_comb p = (~d & c & ~b & a) | (~d & c & b & ~a) | (~d & c & b & a) | (d & ~c & ~b & ~a) | (d & ~c & ~b & a);
    
    //  write q in cpos
    always_comb q = (d | c | b | a) & (d | ~c | b | ~a) & (d | ~c | ~b | a) & (d | ~c | ~b | ~a) & (~d | c | b | a);
    
    //  write r with case assignments
    always_comb begin
        case({d, c, b, a})
            4'b0001: r = 'b1;
            4'b0010: r = 'b1;
            4'b0101: r = 'b1;
            4'b0110: r = 'b1;
            4'b1001: r = 'b1;
            default: r = 'b0;
        endcase
    end
    
    //  write s with conditional statements
    always_comb s = (a) ? 'b1 : 'b0;            //  technically s = a here but its written as an if-else statement
endmodule
