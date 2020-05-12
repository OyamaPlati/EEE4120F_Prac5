module tb_clock;
    reg   CLK100MHZ;
    reg   BTNU;       //Up -- increment hours
    reg   BTNR;       //Right -- increment minutes
    reg   BTNC;        //Center -- reset button
    
    wire [5:0]  LED;
    wire [3:0]    SegmentDrivers;
    wire [7:0]    SevenSegment; 
    
    
    // Instantiate the clock
    Clock myClock(CLK100MHZ, BTNU, BTNR, BTNC, LED, SegmentDrivers, SevenSegment);
    
    // Method for testing the clock
    initial begin
        // Enable the monitoring of wire of interest
        $monitor("Clock = %d Reset = %d LED = %d 7-Seg Drivers = %d 7-Seg Display = %d\n", CLK100MHZ, BTNC, LED, SegmentDrivers, SevenSegment);
        
        CLK100MHZ = 0; BTNC = 1; #10;
        BTNC = 0; CLK100MHZ = 1; #10;
        
        
     end   
    
endmodule