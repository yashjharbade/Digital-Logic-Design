`timescale 1ns / 1ps

module seq_detector_tb;
    reg clk;
    reg reset;
    reg din;
    wire dout;

    seq_detector uut (.clk(clk), .reset(reset), .din(din), .dout(dout));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; din = 0;
        #10 reset = 0;
        
        // Feed the sequence: 1 0 1 1
        #10 din = 1;
        #10 din = 0;
        #10 din = 1;
        #10 din = 1; // Output should go high here
        
        #10 din = 0;
        #10 din = 1;
        
        #20 $finish;
    end
endmodule