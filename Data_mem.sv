`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 07:03:52 PM
// Design Name: 
// Module Name: Data_mem
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


module Data_mem(
    input logic CLK,
    input logic MemWrite,
    input logic [6:0] address,
    input logic [31:0] WriteData,
    output logic [31:0] ReadData
    );
    
    logic [31:0] mem [127:0];

    always_comb begin
        ReadData = mem[address];
    end
    
    always_ff@(posedge CLK) begin
        if(MemWrite) begin
            mem[address]  <= WriteData;
        end
    end
    
endmodule
