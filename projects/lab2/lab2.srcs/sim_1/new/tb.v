`timescale 1ns / 1ps

module Top_tb;

    // Inputs to the 4:1 MUX
    reg [3:0] SW;   // 4 input switches: I0, I1, I2, I3
    reg [1:0] S;    // 2 select lines: S1 and S0

    // Output of the 4:1 MUX
    wire LED;

    // Instantiate the 4:1 multiplexer (DUT - Device Under Test)
    Top uut (
        .SW(SW),
        .S(S),
        .LED(LED)
    );

    // Initialize inputs and apply test cases
    initial begin
        // Monitor signals to observe values in simulation
        $monitor("Time: %0d SW = %b S = %b -> LED = %b", $time, SW, S, LED);
        
        // Test Case 1: Select input I0
        SW = 4'b1010;  // I0=0, I1=1, I2=0, I3=1
        S = 2'b00;     // Select I0
        #10;           // Wait for 10 time units

        // Test Case 2: Select input I1
        S = 2'b01;     // Select I1
        #10;

        // Test Case 3: Select input I2
        S = 2'b10;     // Select I2
        #10;

        // Test Case 4: Select input I3
        S = 2'b11;     // Select I3
        #10;

        // Test Case 5: New Input set, select I0
        SW = 4'b1101;  // I0=1, I1=1, I2=0, I3=1
        S = 2'b00;     // Select I0
        #10;

        // Test Case 6: Select I2 with new input set
        S = 2'b10;     // Select I2
        #10;

        // Test complete, finish simulation
        $finish;
    end
endmodule
