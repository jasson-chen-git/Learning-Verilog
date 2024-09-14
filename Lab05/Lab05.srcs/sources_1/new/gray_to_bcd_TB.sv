`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/13/2024 07:47:55 PM
// Design Name:         Gray Code to Binary Code Converter Testbench
// Module Name:         gray_to_bcd_TB
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


module gray_to_bcd_TB();
    
    //  create my test signals
    logic g3, g2, g1, g0;       //  input test scalar signals
    logic b3, b2, b1, b0;       //  output test scalar signals
    
    reg[3:0] gray_code;         //  input test vector signals
    reg[3:0] binary_code;       //  output test vector signals
    
    //  instantiate my UUT/DUTs - module, name, ports
    gray_to_bcd_scalar  UUT_scalar  (g3, g2, g1, g0, b3, b2, b1, b0);
    gray_to_bcd_vector  UUT_vector  (gray_code, binary_code);
    
    //  create connections from scalar signals to vector signals
    //  reduces multiple assignments to test both UUTs
    assign gray_code = {g3, g2, g1, g0};
    
    //  create lut to verify behavioral simulation
    logic[3:0] g_b [0:15] = {
    4'b0000, 4'b0001, 4'b0011, 4'b0010,
    4'b0111, 4'b0110, 4'b0100, 4'b0101,
    4'b1111, 4'b1110, 4'b1100, 4'b1101,
    4'b1000, 4'b1001, 4'b1011, 4'b1010
    };
    
    //  begin stimulus
    initial begin
        $display("\n\nStart of Stimulus\n\n");
//        $monitor("Scalar: Gray Code = %b%b%b%b\t\tBinary Code = %b%b%b%b", g3, g2, g1, g0, b3, b2, b1, b0);
//        $monitor("Vector: Gray Code = %b\t\tBinary Code = %b", gray_code, binary_code);
        
        for(int i = 4'b0000; i <= 4'b1111; i++) begin
            {g3, g2, g1, g0} = i[3:0];  #10;
            
            assert({b3, b2, b1, b0} == g_b[i])
            $display("Success!\tScalar: Gray Code = %b%b%b%b\t\tBinary Code = %b%b%b%b", g3, g2, g1, g0, b3, b2, b1, b0);
            else $error("Failed");
            
            assert(binary_code == g_b[i])
            $display("Success!\tVector: Gray Code = %b\t\tBinary Code = %b", gray_code, binary_code);
            else $error("Failed");
            
            $display();
        end
        $display("\nEnd of Stimulus\n");
        $finish;
    end
endmodule
