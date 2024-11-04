module comparator
  #(
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,
   parameter REFR_RATE    = 1000
  )
  (
   input wire                      clk,
   input wire                      CPU_RESETN,
   input wire [7:0]                SW,
   output logic [NUM_SEGMENTS-1:0] anode,
   output logic [7:0]              cathode
   );

  logic [NUM_SEGMENTS-1:0][7:0] encoded;
  logic [NUM_SEGMENTS-1:0]      digit_point;
  logic                         reset;

  assign reset = !CPU_RESETN;  // Tie reset to CPU_RESETN

  // Comparator Logic
  wire [3:0] B = SW[3:0];
  wire [3:0] A = SW[7:4];
  logic A_greater, A_less, A_equal;
  
  assign A_greater = (A > B);
  assign A_less = (A < B);
  assign A_equal = (A == B);

  // 7-segment display for comparison result
  always @(*) begin
    encoded = '0;  // Initialize to zero
    encoded[2] = A;  // Display A
    encoded[0] = B;  // Display B
    if (A_greater)
      encoded[1] = 8'h10; // "G"
    else if (A_less)
      encoded[1] = 8'h11; // "L"
    else
      encoded[1] = 8'h12; // "E"
  end

  // Instantiate seven_segment module
  seven_segment #(
    .NUM_SEGMENTS(NUM_SEGMENTS),
    .CLK_PER(CLK_PER),
    .REFR_RATE(REFR_RATE)
  ) u_7seg (
    .clk(clk),
    .reset(reset),
    .encoded(encoded),
    .digit_point(digit_point),
    .anode(anode),
    .cathode(cathode)
  );
endmodule
