module pc(input clk,clr,
          input Cp, Ep,
          output [3:0] out);
  reg [3:0] address;
  assign out = Ep?address:4'bz; //tri-state buffer on output connection with bus
  always@(posedge clk)
    begin
      if (clr)
        address <= 0;
      else if (Cp == 1)
        address <= address + 1;
    end
endmodule