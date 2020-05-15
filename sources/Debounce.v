`timescale 1ns / 1ps
module Debounce(
    input clk, 
    input button,
    output reg out
    );
    
    reg previous_state;
    reg [21:0]Count = 0; //assume count is null on FPGA configuration
 
    //--------------------------------------------
    always @(posedge clk) begin  	//activates every clock edge
     //previous_state <= Button;		// localise the reset signal
      if (button && button != previous_state && &Count) begin		// reset block
        out <= 1'b1;					// reset the output to 1
         Count <= 0;
         previous_state <= 1;
      end 
      else if (button && button != previous_state) begin
         out <= 1'b0;
         Count <= Count + 1'b1;
      end 
      else begin
         out <= 1'b0;
         previous_state <= button;
      end   
    end
endmodule
