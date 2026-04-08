`timescale 1ns / 1ps

module alu_4bit_tb;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] ALU_Sel;
    // Outputs
    wire [3:0] ALU_Out;
    wire CarryOut;

    // Instantiate the Unit Under Test (UUT)
    alu_4bit uut (
        .A(A), .B(B), .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), .CarryOut(CarryOut)
    );

    initial begin
        // Initialize Inputs
        A = 4'b1010; // Decimal 10
        B = 4'b0010; // Decimal 2
        
        // Test Addition
        ALU_Sel = 3'b000; #10;
        // Test Subtraction
        ALU_Sel = 3'b001; #10;
        // Test Bitwise AND
        ALU_Sel = 3'b110; #10;
        // Test Bitwise OR
        ALU_Sel = 3'b111; #10;
        
        $finish;
    end
endmodule