`timescale 1ns / 1ps

module top(
    input CLK100MHZ,     // 100 MHz clock input
    input [15:0] SW,     // Switch inputs: SW[15:11] for address, SW[7:0] for data
    input BTNL,          // Button for clear
    input BTNR,          // Button for load
    output [15:0] LED    // LED outputs: LED[12:8] for Ao, LED[7:0] for data
);

    // Internal signals
    wire clk;
    wire [7:0] D;
    wire [4:0] A;
    wire load, clear;
    wire [7:0] data_out;
    wire [4:0] Ao;

    // Assign switch inputs
    assign D = SW[7:0];          // SW[7:0] used for data input
    assign A = SW[15:11];        // SW[15:11] used for address input
    assign load = BTNR;          // BTNR is the load signal
    assign clear = BTNL;         // BTNL is the clear signal
    
    //assign SW[10:8] = 3'b000;  // Tie unused switches to 0
    assign LED[10:8] = 3'b000;  // Turn off unused LEDs

    // Instantiate the clock for the ROM
    assign clk = CLK100MHZ;      // Use 100 MHz clock

    // Instantiate the ROM_with_clock module
    ROM_with_clock rom_instance (
        .clk(clk),
        .D(D),
        .A(A),
        .load(load),
        .clear(clear),
        .led(data_out),
        .Ao(Ao)
    );

    // Assign output to LEDs
    assign LED[7:0] = data_out;   // Display ROM data
    assign LED[15:11] = Ao;        // Display address

endmodule



module ROM_with_clock(
    input clk,              // Clock input
    input [7:0] D,          // Data input (8-bit)
    input [4:0] A,          // Address input (5-bit)
    input load,             // Load control signal (triggered by Right button)
    input clear,            // Clear control signal (triggered by Left button)
    output reg [7:0] led,   // LED display for ROM contents at current address
    output reg [4:0] Ao     // LED display for current address
);

    // Register array to hold ROM data (32 x 8-bit storage)
    reg [7:0] Store [0:31];
    reg load_prev, clear_prev;

    integer i; // Variable for clearing ROM with a for loop

    // Initial block to clear the ROM on start-up
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            Store[i] = 8'b00000000;
        end
    end

    always @(posedge clk) begin
        Ao <= A;           // Display the address on high LEDs

        // Edge detection for load and clear
        load_prev <= load;
        clear_prev <= clear;

        // Load data into ROM on positive edge of load signal
        if (load && !load_prev) begin
            Store[A] <= D;
        end

        // Clear the data at the given address on positive edge of clear signal
        if (clear && !clear_prev) begin
            Store[A] <= 8'b00000000;
        end

        // Display the stored data at the current address
        led <= Store[A];
    end
endmodule
