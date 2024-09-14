`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/13/2024 07:06:46 PM
// Design Name:         Gray Code to Binary Code Converter with Vector IO
// Module Name:         gray_to_bcd_scalar
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


module gray_to_bcd_vector(
    input wire[3:0]     gray_code,
    output reg[3:0]     binary_code
    );
    
    reg[4:0] bcd_code = 5'b0;           //  this algorithm will require an extra bit
    
    always_comb begin
        for(int i = 3; i >= 0 ; i--) begin
            bcd_code[i] = bcd_code[i + 1] ^ gray_code[i];       //  b[i] = b[i+1] ^ g[i]
        end
        binary_code = bcd_code[3:0];
    end
endmodule
    