`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/17/2024 11:34:19 AM
// Design Name: 
// Module Name: half_adder_TB
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


module half_adder_TB();     //  testbench has no input or output

    reg     a;      //  reg do not always correspond to physical registers, but data storage element
    reg     b;      //  ideal for retaining their values until a new value is assigned
    wire    s, c;   //  treated as physical wires to be read from or assigned to
    
    
    //  instantiate test module(s) and name it
    half_adder ha_uut(      //  half_adder is the module, ha_uut is the name
        .a(a), .b(b),       //  ._port_id_(_local_signal_) to specify connection
        .s(s), .c(c));      //  not required to specify connections when ordered correctly
    
    
    //  generate stimulus
    initial begin               //  initial is a non-synthesizable construct and executes once
        {a, b} = 2'b00;         //  left-hand side can be concatenated 
        #10;                    //  delay 10ns, delays do not exist in hardware but are useful for simulations
        {a, b} = 2'b01; #10;
        {a, b} = 2'b10; #10;
        {a, b} = 2'b11; #10;
        $display("Done\n");        
        $finish;                //  end simulation
    end
       
    //  monitoring signals
    initial $monitor("Applying: a = %b, b = %b\n", a, b); 
    
    //  always blocks are sometimes synthesizable and typically produce a register
    always @(s, c) begin
        assert (s == a ^ b && c == a & b)           //  assert a true/false statement
//        $display ("OK!\n");                         //  pass statement, not necessary
                                                    //  fail statement, should always be included for debugging
        else $error("Error with %b\n", {a, b});     //  severity levels are $info, $warning, $error, $fatal    
    end
    
endmodule
