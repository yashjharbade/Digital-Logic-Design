`timescale 1ns / 1ps

module seq_detector (
    input clk,
    input reset,
    input din,
    output reg dout
);
    // State Encodings
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;
    reg [2:0] current_state, next_state;

    // State Transition Logic
    always @(posedge clk or posedge reset) begin
        if (reset) current_state <= S0;
        else       current_state <= next_state;
    end

    // Next State Logic
    always @(*) begin
        case(current_state)
            S0: next_state = din ? S1 : S0;
            S1: next_state = din ? S1 : S2;
            S2: next_state = din ? S3 : S0;
            S3: next_state = din ? S4 : S2;
            S4: next_state = din ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    // Output Logic (Moore Machine)
    always @(*) begin
        dout = (current_state == S4) ? 1'b1 : 1'b0;
    end
endmodule