`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         08/17/2024 03:51:11 PM
// Design Name:         XS3 Code to Binary Code Converter Testbench
// Module Name:         xs3_bcd_TB
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

    //  create test signals
    logic [3:0] pqrs, dcba;
    
    //  instantiate UUT - module, name, ports
    xs3_bcd_lut uut(pqrs, dcba);
    
    //  begin stimulus
    initial begin
        $display("\n\nStart of Stimulus\n\n");
        
        for(int i = 0; i <= 15; i++) begin
            pqrs = i; #10;
            
            if(i > 2 && i < 13) begin
                assert(dcba == pqrs - 2'b11) $display("Success!");
                else $error("Failed for PQRS = %b", pqrs);          //  will report errors for dcba = xxxx
                
                $display();
            end
        end
        $display("\n\End of Stimulus\n\n");
        $finish;
    end       
endmodule
