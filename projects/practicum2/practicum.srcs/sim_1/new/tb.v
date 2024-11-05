`timescale 1ns/10ps

module practicum_tb;

  // Parameters
  parameter NUM_SEGMENTS = 8;
  parameter CLK_PERIOD = 20;  // 50 MHz clock, i.e., 20 ns period

  // Testbench signals
  reg clk;
  reg CPU_RESETN;
  wire [NUM_SEGMENTS-1:0] anode;
  wire [7:0] cathode;

  // Instantiate the practicum module
  practicum #(
    .NUM_SEGMENTS(NUM_SEGMENTS),
    .CLK_PER(10),
    .REFR_RATE(1000)
  ) dut (
    .clk(clk),
    .CPU_RESETN(CPU_RESETN),
    .anode(anode),
    .cathode(cathode)
  );

  // Generate 50 MHz clock
  initial begin
    clk = 0;
    forever #(CLK_PERIOD / 2) clk = ~clk;
  end

  // Test procedure
  initial begin
    // Initialize signals
    CPU_RESETN = 0;

    // Apply reset
    #100;
    CPU_RESETN = 1;

    // Observe encoded value
    $monitor("Time: %0t | Encoded: %0h", $time, dut.encoded);

    // Run simulation for a while to observe behavior
    #50000000;  // Run simulation for 50 ms

    // Finish simulation
    $stop;
  end

endmodule
