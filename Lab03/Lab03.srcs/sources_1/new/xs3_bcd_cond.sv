`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         08/17/2024 02:00:16 PM
// Design Name:         XS3 Code to Binary Code Converter with Conditional Statements
// Module Name:         xs3_bcd_cond
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


module xs3_bcd_cond(
    input wire  p, q, r, s,
    output reg  d, c, b, a  
    );
    
    logic [3:0] xs3;            //  bus for all inputs, takes on wire
    
    assign xs3 = {p,q,r,s};
    
    always_comb begin
        d = (xs3 == 4'hB || xs3 == 4'hC) ? 1'b1 : 1'b0;     //  ternary operator ~~ value = (expression) ? true_statement : false_statement;
        
        c = (xs3 >= 4'h7 && xs3 <= 4'hA) ? 1'b1 : 1'b0;
        
        if(({p,q} == 2'b01 || {p,q} == 2'b10)               //  ternary operator is equivalent to an if-else statement
            && ({r,s} == 2'b01 || {r,s} == 2'b10))          //  ternary operator true/false statements can also contain ternary expressions
           b = 1'b1;
        else b = 1'b0;     
        
        a = (s == 1'h0) ? 1'b1 : 1'b0;
    end
endmodule
