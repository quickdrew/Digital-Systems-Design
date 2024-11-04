module sr_latch_gate_level (
    input wire S,   // Set
    input wire Reset,   // Reset
    output wire Q,  // Output
    output wire Qn  // Inverted output
);

    wire nand0_out, nand1_out;

 
    nand (nand0_out, S, Qn);  
    nand (nand1_out, Reset, Q);  

    assign Q = nand0_out;
    assign Qn = nand1_out;

endmodule
