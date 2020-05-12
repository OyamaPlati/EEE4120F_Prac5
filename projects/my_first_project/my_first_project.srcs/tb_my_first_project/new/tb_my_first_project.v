module tb_my_first_project();
    reg	CLK100MHZ;
    wire [3:0] SW;
    wire [7:0] LED;
    
    // Instantiate the DUT
    my_first_project DUT(CLK100MHZ, SW, LED);
    
    initial begin
        // enable monitoring of wires of interest
        $monitor("CLOCK = %d switch = %d LED = %d\n", CLK100MHZ, SW, LED);
        
        CLK100MHZ = 0; #10;
        CLK100MHZ = 0; #10;
        
        CLK100MHZ = 0; #10;
        CLK100MHZ = 1; #10;
        
        CLK100MHZ = 0; #10;
        CLK100MHZ = 1; #10;
        
        CLK100MHZ = 0; #10;
        CLK100MHZ = 0; #10;
        
        CLK100MHZ = 1; #10;
        CLK100MHZ = 1; #10;
        
        CLK100MHZ = 0; #10;
        CLK100MHZ = 1;   
    end

endmodule