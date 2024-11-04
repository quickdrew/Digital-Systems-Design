`timescale 1ns/1ps

module practicum_tb;

  // Inputs
  reg clk;
  reg BTNC;
  reg CPU_RESETN;

  // Outputs
  wire [7:0] anode;
  wire [7:0] cathode;
  wire [1:0] LED;

  // Instantiate the practicum module
  practicum uut (
    .clk(clk),
    .BTNC(BTNC),
    .CPU_RESETN(CPU_RESETN),
    .anode(anode),
    .cathode(cathode),
    .LED(LED)
  );

  // Clock generation (100 MHz clock for example, 10ns period)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock with 10ns period
  end

  // Test sequence
  initial begin
    // Initialize inputs
//    CPU_RESETN = ;
    BTNC = 0;
    
//    // Apply reset
//    #20 CPU_RESETN = 1;  // Release reset after 20ns

    // Wait for the system to initialize
    #100;
    
    // Stimulate button press after full sequence
    BTNC = 1;
    #10 BTNC = 0;  // Button pressed for 10ns
    
    // Let the simulation run for some time
    #1000;
    
    // Apply another button press after a delay
    BTNC = 1;
    #10 BTNC = 0;

    // Run the simulation long enough to observe the full sequence
    #5000;
    
    // Stop the simulation
    $finish;
  end

  // Monitor for debugging
  initial begin
    $monitor("Time=%0t, CPU_RESETN=%b, BTNC=%b, anode=%b, cathode=%b, LED=%b", 
              $time, CPU_RESETN, BTNC, anode, cathode, LED);
  end

endmodule
