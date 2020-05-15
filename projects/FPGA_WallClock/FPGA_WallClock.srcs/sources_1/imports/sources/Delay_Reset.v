`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2020 12:36:53
// Design Name: 
// Module Name: Delay_Reset
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Delay_Reset(
     input Clk, // Input clock signal
     input BTNS, // Input reset signal (external button)
     output reg Reset // Output reset signal (delayed)
    );
    
    //------------------------------------------------------------------------------
    reg LocalReset; 
    reg [22:0] Count;
    // Assume Count is null on FPGA configuration
    
    //------------------------------------------------------------------------------
    always @(posedge Clk) 
    begin
        // Activates every clock edge
        LocalReset <= BTNS;
        // Localise the reset signal
        if(LocalReset) 
            begin
            // Reset block
            Count <= 0;
            // Reset Count to 0
            Reset <= 1'b1;
            // Reset the output to 1
        end 
        else if(&Count) 
        begin
        // When Count is all ones...
            Reset <= 1'b0;
            // Release the output signal
            // Count remains unchanged
            // And do nothing else
        end else 
        begin
            // Otherwise...
            Reset <= 1'b1;
            // Make sure the output signal is high
            Count <= Count + 1'b1;
            // And increment Count
        end
    end
    
endmodule
