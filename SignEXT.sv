`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2016 06:19:32 PM
// Design Name: 
// Module Name: SignEXT
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


module SignEXT(
    input signed [14:0] A,
    output signed [31:0] EXT
    );

    logic [16:0] ext_part;

    assign ext_part = {17{A[14]}}; 
    assign EXT = { ext_part, A}; 

endmodule
