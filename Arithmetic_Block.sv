`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2016 09:38:01 AM
// Design Name: 
// Module Name: FullAdder
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


module Arithmetic(
		input logic op1, op2, cin, [2:0] opsel,
		output logic result, cout);

	assign result = (opsel == 3'b000) ? op1^op2^cin : //add
	                (opsel == 3'b001) ? op1^op2^cin : //takeout?
	                (opsel == 3'b010) ? op1 :         
	                (opsel == 3'b011) ? op1^op2^cin : 
	                (opsel == 3'b100) ? op1:      
	                (opsel == 3'b101) ? op1-cin:      
	                (opsel == 3'b110) ? op1 : op1;
	                 	
	assign cout = (opsel == 3'b000) ? (op2&cin)|(op1&cin)|(op1&op2): 
	              (opsel == 3'b001) ? ((!op1)&cin)|((!op1)&op2)|(op2&cin): 
	              (opsel == 3'b010) ? cin: 
	              (opsel == 3'b011) ? ((!op1)&cin)|((!op1)&op2)|(op2&cin):
	              (opsel == 3'b100) ? cin: 
	              (opsel == 3'b101) ? (!op1)&cin :
	              (opsel == 3'b110) ? cin : cin; 

endmodule
