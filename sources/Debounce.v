`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2020 12:38:15
// Design Name: 
// Module Name: Debounce
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


module Debounce(
    input clk, 
    input button,
    output reg out
    );
    
    reg previous_state;
    reg [21:0]Count = 0; //assume count is null on FPGA configuration
 
    //--------------------------------------------
    always @(posedge clk) begin 
        // implement your logic here
        previous_state <= button;
        if (previous_state != out) begin
        
            out <= previous_state;
            #30e6 // Delay by 30ms              
            
            // Check Rising edge of clock
            if (previous_state == 0 && out == 1) begin
                // Rising edge of clock 
                // Count rising edges of clock
                Count <= Count + 1'b1;
            end
        end
    end
    
endmodule
