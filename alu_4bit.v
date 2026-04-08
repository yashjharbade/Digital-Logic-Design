`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2026 23:09:25
// Design Name: 
// Module Name: alu_4bit
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


`timescale 1ns / 1ps

module alu_4bit (
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    input [2:0] ALU_Sel,// 3-bit selection line
    output reg [3:0] ALU_Out, // 4-bit output
    output reg CarryOut // Carry out flag
);

    always @(*) begin
        CarryOut = 1'b0; // Default carry
        case(ALU_Sel)
            3'b000: {CarryOut, ALU_Out} = A + B;       // Addition
            3'b001: ALU_Out = A - B;                   // Subtraction
            3'b010: ALU_Out = A * B;                   // Multiplication (lower 4 bits)
            3'b011: ALU_Out = A / B;                   // Division
            3'b100: ALU_Out = A << 1;                  // Logical shift left
            3'b101: ALU_Out = A >> 1;                  // Logical shift right
            3'b110: ALU_Out = A & B;                   // Bitwise AND
            3'b111: ALU_Out = A | B;                   // Bitwise OR
            default: ALU_Out = A + B; 
        endcase
    end
endmodule