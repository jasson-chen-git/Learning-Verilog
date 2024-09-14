`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/14/2024 10:06:06 AM
// Design Name:         BCD to Weighted Code Testbench
// Module Name:         bcd_to_weighted_TB
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


module bcd_to_weighted_TB();
    
    //  create test signals
    reg     d, c, b, a;
    wire    p, q, r, s;
    
    //  create lookup table to self-check
    reg[3:0] test_table[0:9] = {
    4'b0000, 4'b0111, 4'b0110, 4'b0101, 4'b0100,
    4'b1011, 4'b1010, 4'b1001, 4'b1000, 4'b1111    
    };
    
    //  instantiate UUT/DUT - module, name, ports
    bcd_to_weighted uut(d, c, b, a, p, q, r, s);
    
    //  create stimulus
    initial begin
        $display("\n\nStart of Stimulus\n\n");
        for(int i = 0; i < $size(test_table); i++) begin
            {d, c, b, a} = i[3:0]; #10;
            
            assert ({p, q, r, s} == test_table[i]) $display("\tPassed for %b", {d, c, b, a});
            else $error("Failed @ %b\t\tExpected: %b\t\tReceived: %b", {d, c, b, a}, test_table[i], {p, q, r, s});
            
            $display();            
        end
        $display("\nEnd of Stimulus\n\n");
        $finish;
    end
endmodule
