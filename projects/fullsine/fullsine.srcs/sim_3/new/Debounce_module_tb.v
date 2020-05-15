module Debounce_module_tb();
    // Inputs
    reg clk;
    reg button;
    // Outputs
    wire Flag;
    
    // Instantiate Design Under Test
    Debounce_module DUT (.clk(clk), .Button(button), .Flag(Flag));
    
    // Initialise Inputs
    initial begin
        clk = 0; 
        button = 1; 
    end
    
    always begin
        #5 clk <= ~clk;
    end
    
    always begin
        #20 button <= ~button;
    end
endmodule