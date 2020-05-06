`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2020 12:39:00
// Design Name: 
// Module Name: PWM
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


module PWM(
    input clk,			//input clock
    input [7:0] pwm_in, 
    output reg pwm_out 	//output of PWM
    );
    
    always @(posedge clk) begin
        //Write your implementation here	
    end
    
endmodule
