`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2024 01:20:30 PM
// Design Name: 
// Module Name: xc3_bcd_case
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


module xs3_bcd_case(
    input logic     p, q, r, s,     //  inputs generally take on wires
    output logic    d, c, b, a      //  outputs generally take on regs since they hold their values until changes occur
    );
    
    
    always @(p, q, r, s) begin
        case({p, q, r, s}) 
            4'h3:{d, c, b, a} = 4'h0;
            4'h4:{d, c, b, a} = 4'h1;
            4'h5:{d, c, b, a} = 4'h2;
            4'h6:{d, c, b, a} = 4'h3;
            4'h7:{d, c, b, a} = 4'h4;
            4'h8:{d, c, b, a} = 4'h5;
            4'h9:{d, c, b, a} = 4'h6;
            4'hA:{d, c, b, a} = 4'h7;
            4'hB:{d, c, b, a} = 4'h8;
            4'hC:{d, c, b, a} = 4'h9;
            default: {d, c, b, a} = 4'bxxxx;
        endcase
    end
    
    
endmodule
