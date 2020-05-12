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
    input [7:0] pwm_in, //switches
    output reg pwm_out 	//output of PWM
    );
    
    // Counter to reduce the 100 MHz clock to 762.939 Hz (100 MHz / 2^17)
    reg [16:0] Count;
    
    always @(posedge clk) begin
        Count <= Count + 1'b1;
        if (Count <= (pwm_in << 9)) pwm_out <= 1;	
        else pwm_out <= 0;
    end
    
endmodule
