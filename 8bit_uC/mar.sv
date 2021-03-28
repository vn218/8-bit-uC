module mar(input clk, clr,
           input [3:0] in_bus,
           input Lm,
           output reg [3:0] out); //output to ram
  
  wire [3:0] in ;
  assign in = Lm?in_bus:4'bz; //tri-state buffer on input connection with bus
  always@(posedge clk)
   begin
     if (clr)
       out <= 0;
     else if (Lm)
       out <= in;
   end
endmodule
