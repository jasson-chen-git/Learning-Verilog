`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         08/17/2024 11:04:24 AM
// Design Name:         Half Adder
// Module Name:         half_adder
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


module half_adder(
    input logic     a,      //  logic is used to let tool decide whether wire/reg is needed
    input logic     b,      //  logic can be used in any assignment and in always/initial blocks
    output logic    s,      //  logic cannot drive the same signal continuously
    output logic    c       //  logic can be assigned to the same signal in race condition
    );
        
//    //  gate level model (lowest structural coding style)
//    xor(s, a, b);           //  both assignments occur concurrently
//    and(c, a, b);           //  this is a physical description and synthesizer will create these exact gates
        
//    //  dataflow
//    assign s = a ^ b;       //  preferred way of describing hardware opposed to gate level modeling
//    assign c = a & b;       //  synthesizer can decide how to implement this, however it will likely be the same gates
     
    //  behavioral
    always_comb begin           //  always_comb is the same as always @(*)
        if(a == 1'b1) begin     //  begin keyword for multiple statements
            s = ~b;             //  ~ is the negation symbol
            c = b;
        end else begin          //  end keyword to close out begin block
            s = b;
            c = 1'b1;
        end
    end  
endmodule
