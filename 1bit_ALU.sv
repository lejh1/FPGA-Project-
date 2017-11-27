`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCI-EECS 31L
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: alu_1bit
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


module alu_1bit ( op1 , op2 , cin, opsel , mode , result, cout);

    input  logic        op1 ;
    input  logic        op2 ;
    input  logic        cin ;
    input  logic [ 2:0] opsel ;
    input  logic        mode ;
    output logic        result ;
    output logic        cout;
    
    wire result1;
    wire result2;
    wire cout1;
    wire cout2;
    
    Arithmetic AB(op1, op2, cin, opsel, result1, cout1);
    Logic_block LB(op1, op2, cin, opsel, result2, cout2);
    mux2to1 m1(result1, result2 , mode, result);
    mux2to1 m2(cout1, cout2, mode, cout);


endmodule 