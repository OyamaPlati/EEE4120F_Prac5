`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2020 12:33:33
// Design Name: 
// Module Name: Clock
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


module Clock(
    // inputs - these will depend on your board's constraint files
    // Clocks
    input   CLK100MHZ,
    
    // Buttons
    input   BTNU,       //Up -- increment hours
    input   BTNR,       //Right -- increment minutes
    input   BTNC,        //Center -- reset button
    
	// outputs - these will depend on your board's constraint files
	// Seconds display output
	output wire [5:0]  LED,
	
	// 7-Segment Display
	output reg [3:0]    SegmentDrivers,        //Anode signals of the 7-segment LED display
    output reg [7:0]    SevenSegment           //Cathode patterns of the 7-segment LED display
    );
    
    //Add the reset
    wire Reset;
    Delay_Reset Delay_Reset1(CLK100MHZ, BTNC, Reset); 


	//Add and debounce the buttons
	wire MButton;
	wire HButton;
	
	// Instantiate Debounce modules here
	Debounce DebounceM(CLK100MHZ, BTNR, MButton);
	Debounce DebounceH(CLK100MHZ, BTNU, HButton);
	
	// registers for storing the time
    reg [3:0]hours1=4'd0;
	reg [3:0]hours2=4'd0;
	reg [3:0]mins1=4'd0;
	reg [3:0]mins2=4'd0;
	reg [5:0]secs=6'd0;
    
	//Initialize seven segment
	// You will need to change some signals depending on you constraints
	SS_Driver SS_Driver1(
		CLK100MHZ, Reset,
		hours2, hours1, mins2, mins1, // Use temporary test values before adding hours2, hours1, mins2, mins1
		SegmentDrivers, SevenSegment
	);
	
	// Display the seconds on the LEDs
	assign LED = secs;
	
	//The main logic
	always @(posedge CLK100MHZ) begin
        // Block to let time run continuously
        if(secs != 6'd59)
            secs <= secs + 1'b1;
        else begin
            secs <= 6'd0;
            mins2 <= mins2 + 1'b1;
            if (mins2 > 9) begin 
                mins1 <= mins1 + 1'b1;
            end
        end
        
        if(mins1 == 4'd5 && mins2 == 4'd9) begin
            mins1 <= 4'd0;
            mins2 <= 4'd0;
            hours2 <= hours2 + 1'b1;
            if (hours2 > 9) begin 
                hours1 <= hours1 + 1'b1;
            end
        end
        
        if(hours1 == 4'd2 && hours2 == 4'd4) begin
            hours1 <= 4'd0;
            hours2 <= 4'd0;
        end    
	end
	
	// Block to set the current time
	always @(posedge CLK100MHZ) begin 
	   // Increment the hour 
		if(HButton == 1'b1) begin // If increment push button (BTNU) is pressed 
            if(hours1 == 4'd2 && hours2 == 4'd4) begin
                // hours1 and hours2 are registers to stores the current time values
                hours1 <= 4'd0; 
                hours2 <= 4'd0;
            end else
                hours1 <= hours1 + 1'b1;
                hours2 <= hours2 + 1'b1;
        end
	end
	// Block to set the current time
	always @(posedge CLK100MHZ) begin 
	   // Increment the minute
		if(MButton == 1'b1) begin // If increment push button (BTNR) is pressed 
            if(mins1 == 4'd5 && mins2 == 4'd9) begin
                // mins1 and mins2 are registers to stores the current time values
                mins1 <= 4'd0; 
                mins2 <= 4'd0;
            end else
                mins1 <= mins1 + 1'b1;
                mins2 <= mins2 + 1'b1;
        end
	end
    
endmodule