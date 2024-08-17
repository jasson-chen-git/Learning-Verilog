`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2024 03:51:11 PM
// Design Name: 
// Module Name: xs3_bcd_TB
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


module xs3_bcd_TB();

    logic [3:0] pqrs, dcba;
    
    xs3_bcd_lut uut(pqrs, dcba);
    
    
    initial begin
        for(int i = 0; i < 'd15; i++) begin
            pqrs = i; #10;
            assert(dcba == pqrs - 2'b11)
            else $error("Test failed for pqrs = %b", pqrs);     //  will report errors for dcba = xxxx
        end
        $finish;
    end
            
endmodule
