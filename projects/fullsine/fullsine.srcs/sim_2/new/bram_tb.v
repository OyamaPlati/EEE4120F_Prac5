`timescale 1ns / 1ps
module bram_tb();
    // Registers
    // Inputs
    reg clka;
    reg ena;
    reg [0:0]wea;
    reg [7:0]addra;
    reg [10:0]dina;
    // Outputs
    wire [10:0]douta;
    
    // Instantiate the Design Under Test
    blk_mem_gen_0 DUT (
      .clka(clka),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [7 : 0] addra
      .dina(dina),    // input wire [10 : 0] dina
      .douta(douta)  // output wire [10 : 0] douta
    );
    
    // Internal variable
    integer counter;
    
    //Initialise
    initial begin
        counter = 0;
        clka = 0;
        ena = 1;
        wea = 0;
        addra = 0;
        dina = 0;
    end
    
    always begin
        #5 clka <= ~clka;
    end
    
   // Read 
   task readstuff;
        begin
            addra <= addra + 1; // Or increment by 4?
        end
   endtask
  
   always @(posedge clka) begin
        if (!(wea)) begin
            readstuff;
            counter <= counter + 1;
        end
   end
endmodule