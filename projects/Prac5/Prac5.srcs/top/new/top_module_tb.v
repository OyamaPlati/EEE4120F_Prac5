module top_module_tb();
    // Registered
    // Inputs
    reg CLK100MHZ;
    reg [7:0] SW;
    reg BTNL;
    
    // Outputs
    wire AUD_PWM;
    wire AUD_SD;
    wire [2:0] LED;
    
    // Instantiate Design Under Test
    top DUT (.CLK100MHZ(CLK100MHZ),
        .SW(SW),
        .BTNL(BTNL),
        .AUD_PWM(AUD_PWM), 
        .AUD_SD(AUD_SD),
        .LED(LED)
    );
    
    // Initialise
    initial begin
        CLK100MHZ = 0;
        SW = 0;
        BTNL = 0;
    end
       
    always begin
        #5 CLK100MHZ <= ~CLK100MHZ;
    end
    
    always begin
        #10 BTNL <= ~BTNL; 
    end
endmodule