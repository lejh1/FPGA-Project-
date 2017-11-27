`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2016 07:25:47 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input logic CLK,
    input logic RST,
    output [5:0] Pout
    );
    
    logic [5:0] temp;
    
always_ff @(posedge CLK) begin 
    if (RST | temp == 6'b111111) begin 
        temp <= 0; 
    end else begin
        temp <= temp + 1'b1;
    end
end
assign Pout = temp;
endmodule
