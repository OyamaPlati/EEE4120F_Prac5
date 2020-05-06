`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2020 14:05:37
// Design Name: 
// Module Name: my_first_project
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


module my_first_project(
    input	CLK100MHZ,
    input[1:0] SW,
    output reg [1:0] LED
    );
    
    always @(posedge CLK100MHZ) begin
        LED[0] <= SW[0];
        LED[1] <= !SW[1];
    end
endmodule
