`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2024 02:15:32 PM
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

    reg p, q, r, s;
    wire d0, c0, b0, a0;
    wire d1, c1, b1, a1;
    
    reg [3:0] pqrs;         //  4-bit register
    reg [3:0] case_dcba;    //  4-bit wire
    reg [3:0] cond_dcba;
    
    
    //  instantiate UUT
    xs3_bcd_case uut0(p, q, r, s, d0, c0, b0, a0);
    xs3_bcd_cond uut1(p, q, r, s, d1, c1, b1, a1);
    
    
    //  establish connections  
    assign {p, q, r, s} = pqrs;
    assign case_dcba = {d0, c0, b0, a0};
    assign cond_dcba = {d1, c1, b1, a1};
    
    
    //  stimulus
    initial begin
        $monitor("PQRS = %b\n", pqrs);
        for(int i = 4'b0000; i <= 4'b1111; i++) begin
            pqrs = i[3:0]; #10;
            if (pqrs > 4'b0010 && pqrs < 4'b1101) begin
//                $display("pqrs = %b, dcba = %b, %b", pqrs - 4'b11, case_dcba, cond_dcba);
//                $display("%s, %s", (pqrs - 4'b11 == case_dcba) ? "true":"false", (pqrs - 4'b11 == cond_dcba) ? "true":"false");
                assert(case_dcba == pqrs - 2'b11)
                else $error("Case conversion failed for pqrs = %b", pqrs);
                assert(cond_dcba == pqrs - 2'b11)
                else $error("Conditional conversion failed for pqrs = %b", pqrs);
            end
        end
        $finish;
    end

endmodule
