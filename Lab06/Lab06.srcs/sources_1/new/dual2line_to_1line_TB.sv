`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/14/2024 01:47:48 PM
// Design Name:         Dual 2 Line to 1 Line Data Selector Testbench
// Module Name:         dual2line_to_1line_TB
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
localparam  CONTROL_BITS    = 2;
localparam  ROUTE_BITS      = 4;

module dual2line_to_1line_TB();

    //  create test signals
    reg     a1, b1, a2, b2, gn, an;
    wire    y1, y2;
    
    //  instantiate uut/dut
    dual2line_to_1line uut(
        a1, b1, a2, b2, gn, an,
        y1, y2);
    
    //  create stimulus
    initial begin
        $display("\n\nStart of Stimulus\n\n");
        
        for(int i = 0 ; i < 2**CONTROL_BITS; i++) begin
            {gn, an} = i[CONTROL_BITS - 1:0];
            for(int j = 0; j < 2**ROUTE_BITS; j++) begin
                {a1, b1, a2, b2} = j[ROUTE_BITS - 1:0];
                #10;
            end
        end 
        
        $display("\nEnd of Stimulus\n\n");
        $finish;
    end
    
    //  monitor signals
    initial $monitor("{gn, an} = %b, %b\t\t{a1, b2} = %b, %b\t\t{a2, b2} = %b, %b", gn, an, a1, b1, a2, b2);
endmodule
