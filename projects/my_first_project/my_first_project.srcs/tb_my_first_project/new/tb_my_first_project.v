module tb_my_first_project();
    reg	CLK100MHZ;
    reg [3:0] SW;
    wire [7:0] LED;
    
    // Instantiate the DUT
    my_first_project DUT(CLK100MHZ, SW, LED);
    
    initial begin
        CLK100MHZ = 0;  
        SW = 0;
    end
    
    always begin
        #5 CLK100MHZ <= ~CLK100MHZ;
    end
    
    always begin
        #20 SW <= SW + 1;
    end
    
    always @(posedge CLK100MHZ) begin
    
    end

endmodule