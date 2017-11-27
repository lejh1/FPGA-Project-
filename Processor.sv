`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 11:05:15 PM
// Design Name: 
// Module Name: Processor
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


module processor(
    input logic CLK,
    input logic RST,
    output logic [31:0] reg_write_data
    );
    
    wire [5:0] Pout;
    wire [31:0] instruction;
    wire ri, mode, RegWrite, MemWrite;
    wire [5:0] rs;
    wire [5:0] rd; 
    wire [2:0] F_Code;
    wire [5:0] rt;
    wire [14:0] imm;
    wire [31:0] imm2; 
    wire [31:0] wd; 
    wire [31:0] RD1; 
    wire [31:0] RD2;
    wire [31:0] OperandB;
    wire [31:0] AluResult;
    wire [31:0] ReadData;
    
    
    PC counter(.CLK(CLK), .RST(RST),.Pout(Pout));
    Instruction_mem I_mem(.count(Pout), .instruction(instruction));
    Controller Con(.Instruction(instruction), .ri(ri), .rs(rs), .rd(rd), .F_Code(F_Code), .mode(mode), .rt(rt), .imm(imm), .RegWrite(RegWrite), .MemWrite(MemWrite));
    Register_file Reg_file(.CLK(CLK), .rs(rs), .rt(rt), .rd(rd), .wd(wd), .RegWrite(RegWrite), .RD1(RD1), .RD2(RD2));
    
    SignEXT sign(.A(imm), .EXT(imm2));
    
    mux2to1_32 mux21(.A(RD2), .B(imm2), .sel(ri), .Y(OperandB));
    
    
    Midterm_project alu_32bit(.op1(RD1), .op2(OperandB), .opsel(F_Code), .mode(mode), .result(AluResult));
    
    wire [6:0] DataMemAddress = AluResult[6:0];
     
    Data_mem Dmem(.CLK(CLK), .MemWrite(MemWrite),.address(DataMemAddress), .WriteData(RD2), .ReadData(ReadData));
    
    mux2to1_32 mux_21(.A(ReadData), .B(AluResult), .sel(RegWrite), .Y(wd));
    
    assign reg_write_data = wd;
    
    
    
endmodule