`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2016 05:42:32 PM
// Design Name: 
// Module Name: Midterm_project
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


module Midterm_project(op1 , op2 , opsel , mode , result);

    input  logic [31:0] op1 ;
    input  logic [31:0] op2 ;
    input  logic [ 2:0]         opsel ;
    input  logic                mode ;
    logic         c_flag ; 
    output logic [31:0] result ;
    
    mux8to1 CinMux(1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, opsel, c_flag);
    
    alu_32bit x(.op1(op1), .op2(op2), .opsel(opsel), .mode(mode), 
        .result(result), .c_flag(c_flag));
        
endmodule
