module accu(input clk, clr, La, Ea,
            input [7:0] bus_in,
            output [7:0] bus_out,
            output [7:0] add_sub);  //output to add_sub
  
  wire [7:0] in;
  reg [7:0] out;
  assign in = La?bus_in:8'hz;     //tri-state buffer on input connection with bus
  assign bus_out = Ea?out:8'hz;   //tri-state buffer on output connection with bus
  always@(posedge clk)
    begin
      if(clr)
        out <= 0;
      else if (La)
        out <= in;
    end    
  assign add_sub = out;
endmodule
  