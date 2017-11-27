`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2016 07:31:41 PM
// Design Name: 
// Module Name: Logic_block
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


module Logic_block(op1, op2, cin, opsel, result, cout);
    
    input logic op1;
    input logic op2;
    input logic cin;
    input logic [2:0] opsel;
    output logic result;
    output logic cout;
    
    assign result = (opsel == 3'b000) ? op1 & op2 :
                    (opsel == 3'b001) ? op1 | op2: 
                    (opsel == 3'b010) ? op1 ^ op2:  
                    (opsel == 3'b011) ? !op1: 
                    (opsel == 3'b101) ? ~cin : ~cin; 
                    
    assign cout = (opsel == 3'b101) ? ~op1 : ~op1;
    
endmodule

