// Code your testbench here
// or browse Examples
module tb();
  reg clk, clr;
  wire [7:0] out;
  uC DUT(clk, clr, out);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    clr = 1;
    #11 clr = 0;
    #300
    $finish;
  end
endmodule
  