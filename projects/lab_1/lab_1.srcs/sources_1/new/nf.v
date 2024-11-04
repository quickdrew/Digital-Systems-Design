`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: tutorial
//////////////////////////////////////////////////////////////////////////////////


module tutorial(
    input [7:0] swt,
     output [7:0] led
    );
    
    assign led[0] = ~swt[0];
    assign led[1] = swt[1] & ~swt[2];
    assign led[3] = swt[2] & swt[3];
    assign led[2] = swt[1] | swt[3];
    
    //assign led[7:4] = swt[7:4];
    
    assign led[4] = ~swt[4] & ~swt[5] & ~swt[6];
    assign led[5] = ~swt[4] | ~swt[5] | ~swt[6];
    assign led[6] =  swt[4] ^  swt[5] ^ swt[6];
    
    assign led[7] = swt[7];
    
endmodule
