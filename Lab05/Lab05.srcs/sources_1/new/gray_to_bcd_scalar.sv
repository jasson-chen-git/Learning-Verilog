`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:            Jason Chen
// 
// Create Date:         09/13/2024 07:06:46 PM
// Design Name:         Gray Code to Binary Code Converter with Scalar IO
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


module gray_to_bcd_scalar(
    input logic     g3, g2, g1, g0,
    output logic    b3, b2, b1, b0      //  logic typing allows for last assignment wins
    );                                  //  logic does not allow multiple drivers
                                        //  meaning no more than 1 signal can be driven at any moment in time
                                        //  wires allow multiple drivers through its resolution function
    
    assign b3 = g3;                 //  b3 mirrors g3
    assign b2 = b3 ^ g2;            //  b2 is the exclusive product of b3 and g2
    assign b1 = b2 ^ g1;            //  b1 is the exclusive product of b2 and g1
    assign b0 = b1 ^ g0;            //  b0 is the exclusive product of b1 and g0

endmodule
