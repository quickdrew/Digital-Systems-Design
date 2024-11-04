`timescale 1ns / 1ps
// SW[11] (Load): Loads the value from SW[7:0] into the counter when 1.
// SW[10] (Clear): Resets the counter to 0 when 1.
// SW[9] (Count Down): Decrements the counter by 1 when 1.
// SW[8] (Count Up): Increments the counter by 1 when 1.


module TopCounter (
    input CLK100MHZ,        // Clock signal
    input [11:0] SW,        // 12-bit switch input (SW[11:0])
    output [15:0] LED       // 16-bit LED output (LED[15:0])
);

    wire [7:0] Load;        // Define Load as a wire
    reg [7:0] count;        // Current count value
    wire [7:0] add_sub_result; // Output from the adder/subtractor
    wire carry_out;         // Carry out from the adder/subtractor
    wire clk_slow;          // Slow clock signal

    // Assign switch values to Load (SW[7:0])
    assign Load = SW[7:0];

    // Slow clock for human-readable counting
    slow_clock #(.size(100000000)) clk_divider (
        .Clk(CLK100MHZ),
        .Clk_Slow(clk_slow)
    );

    // Counter logic controlled by SW[11:8]
    always @(posedge clk_slow) begin
        if (SW[10]) begin
            // Reset the counter when SW[10] is high (clear signal)
            count <= 8'b00000000;
        end else if (SW[11]) begin
            // Load a new value when SW[11] is high
            count <= Load;
        end else if (SW[8]) begin
            // Count up when SW[8] is high
            count <= count + 1;
        end else if (SW[9]) begin
            // Count down when SW[9] is high
            count <= count - 1;
        end
    end

    // Assign the current count to the lower 8 LEDs
    assign LED[7:0] = count;

endmodule

// Mux4to1: 4-to-1 multiplexer
module Mux4to1 (out, in0, load, up, down, sel);

    input [7:0] in0, load, up, down;  
    input [1:0] sel;                
    output reg [7:0] out;                

    always @(*) begin
        case (sel)
            2'b00: out = in0;   // Hold current value
            2'b01: out = load;  // Load new value
            2'b10: out = up;    // Increment
            2'b11: out = down;  // Decrement
        endcase
    end
endmodule

// D Flip-Flop: Stores and updates the value of D on the rising edge of the clock
module DFF (D, Q, Clock);

    input wire D;           // Data input (D) to be stored in the flip-flop
    input wire Clock;       // Clock signal (updates the value on the rising edge)
    output reg Q;           // Output (Q) holds the value stored in the flip-flop
 
    // On the rising edge of the clock, Q is updated to the value of D
    always @(posedge Clock) begin
        Q <= D;             // Transfer the input value D to output Q
    end
endmodule

// FullAdder: 1-bit full adder
module FullAdder (A, B, Cin, Cout, Sum);

    input A, B, Cin;       // 1-bit inputs: A, B, Carry in (Cin)
    output Cout, Sum;      // 1-bit outputs: Carry out (Cout), Sum (Sum)

    assign {Cout, Sum} = A + B + Cin;  // Full adder logic: Sum and Carry out

endmodule

// 8-bit adder/subtractor
module Adder8 (S, Co, A, B, Ci);

    input [7:0] A, B;  // 8-bit inputs
    input Ci;          // Carry input (used to decide add/subtract)
    output [7:0] S;    // 8-bit sum output
    output Co;         // Carry out
    wire [7:1] C;      // Internal carry signals

    // Instantiate 8 Full Adders
    FullAdder FA0 (A[0], B[0], Ci, C[1], S[0]);
    FullAdder FA1 (A[1], B[1], C[1], C[2], S[1]);
    FullAdder FA2 (A[2], B[2], C[2], C[3], S[2]);
    FullAdder FA3 (A[3], B[3], C[3], C[4], S[3]);
    FullAdder FA4 (A[4], B[4], C[4], C[5], S[4]);
    FullAdder FA5 (A[5], B[5], C[5], C[6], S[5]);
    FullAdder FA6 (A[6], B[6], C[6], C[7], S[6]);
    FullAdder FA7 (A[7], B[7], C[7], Co, S[7]);

endmodule

// This module slows down the 100 MHz clock to a 2-second period.
module slow_clock(Clk, Clk_Slow);
    parameter size = 100000000;  // Slow down the clock to a reasonable frequency
    input Clk;
    output reg Clk_Slow;
    reg [31:0] counter_out;

    initial begin
        counter_out <= 32'h00000000;
        Clk_Slow <= 0;
    end
    
    always @(posedge Clk) begin
        counter_out <= counter_out + 1;
        
        if (counter_out > size) begin
            counter_out <= 32'h00000000;
            Clk_Slow <= ~Clk_Slow;
        end
    end
endmodule
