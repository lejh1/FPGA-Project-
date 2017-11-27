`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 09:56:51 PM
// Design Name: 
// Module Name: Register_file
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


module Register_file(
    input logic CLK,
    input logic [5:0] rs,
    input logic [5:0] rt,
    input logic [5:0] rd,
    input logic [31:0] wd,
    input logic RegWrite,
    output logic [31:0] RD1,
    output logic [31:0] RD2
    );
    
    logic [31:0] mem [63:0];
    assign mem[0] = 0;
    
    always_comb begin
        RD1 = mem[rs];
        RD2 = mem[rt];
    end
    
    always_ff@(posedge CLK) begin
        if(RegWrite) begin
            mem[rd] <= wd;
        end
    end
    
            
endmodule
