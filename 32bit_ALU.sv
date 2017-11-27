`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module alu_32bit ( op1 , op2 , opsel , mode , result , c_flag);

    parameter DWIDTH = 32;
    input  logic [DWIDTH - 1:0] op1 ;
    input  logic [DWIDTH - 1:0] op2 ;
    input  logic [2:0]         opsel ;
    input  logic                mode ;
    input  logic         c_flag ; 
    output logic [DWIDTH - 1:0] result ;

  
    //alu_1bit ALU_1(.op1(op1[0]), .op2(op2[0]), .cin(c_flag), .opsel(opsel) , .mode(mode) , .result(result[0]), .cout(o_flag));
    //assign c_flag = o_flag;
    
    genvar i;
    generate
        for(i=0; i<DWIDTH; i = i +1) begin: J
            wire carry;
            if (i == 0) begin
                alu_1bit ALU_1(.op1(op1[i]), .op2(op2[i]), .cin(c_flag), .opsel(opsel) , .mode(mode) , .result(result[i]), .cout(carry));
            end
            else begin
            alu_1bit ALU_(.op1(op1[i]), .op2(op2[i]), .cin(J[i-1].carry), .opsel(opsel), .mode(mode), .result(result[i]), .cout(carry));
            end
        end
    endgenerate
    assign o_flag = J[31].carry;
    assign s_flag = result[31];
    assign z_flag = (result == 0) ? 1'b1 : 1'b0;
      
endmodule 
