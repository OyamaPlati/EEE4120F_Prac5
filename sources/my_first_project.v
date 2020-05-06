`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2020 15:05:03
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
    input[3:0] SW,
    output reg [7:0] LED
    );
    
    reg [19:0] count = 0;
    reg [3:0] led_values = 0;
    
    always @(*) begin 
        LED[0] <= !SW[0];
        LED[1] <= !SW[1];
        LED[2] <= SW[2];
        LED[3] <= SW[3];
    end
    
    always @(posedge CLK100MHZ) begin
        count <= count + 1;
        if (count == 1000000) begin
            count <= 0;
            led_values <= led_values + 1;
            LED[7:4] <= led_values;
        end
    end
endmodule
