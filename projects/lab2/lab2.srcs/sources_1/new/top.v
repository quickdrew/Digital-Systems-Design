`timescale 1ns / 1ps

// Top-level module implementing the 4:1 multiplexer using 3 instances of Mux2
module Mux4(
    input [3:0] SW,        // 4 Input switches (SW[3:0] -> I0, I1, I2, I3)
    input [1:0] S,         // 2 Select signals (S[1:0] -> A (S[1]) and B (S[0]))
    output LED             // Output (LED -> Y)
    );
    
    wire Wire1, Wire2;     // Intermediate wires

    // First stage: Select between I0 and I1, and I2 and I3 based on S0 (B)
    Mux2 MuxStage1_0 (.I0(SW[0]), .I1(SW[1]), .sel(S[0]), .Y(Wire1));  // Select between I0 and I1
    Mux2 MuxStage1_1 (.I0(SW[2]), .I1(SW[3]), .sel(S[0]), .Y(Wire2));  // Select between I2 and I3

    // Second stage: Select between the results of the first stage (Wire1, Wire2) based on S1 (A)
    Mux2 MuxStage2 (.I0(Wire1), .I1(Wire2), .sel(S[1]), .Y(LED));     // Final output to LED
    
endmodule

// 2:1 Multiplexer module definition
module Mux2 (
    input wire I0,        // Input 0
    input wire I1,        // Input 1
    input wire sel,       // Select signal
    output reg Y          // Output
    );
    
    always @(*) begin
        if (sel == 1'b0)
            Y = I0;       // If sel is 0, choose I0
        else
            Y = I1;       // If sel is 1, choose I1
    end
endmodule
