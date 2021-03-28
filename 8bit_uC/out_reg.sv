module out_reg(input clk, clr, Lo,
               input [7:0] bus_in,
               output reg [7:0] out); //final output
  
  wire [7:0] in;
  assign in = Lo?bus_in:8'hz; //tri-state buffer on input connection with bus
  always@(posedge clk)
    begin
      if(clr)
        out <= 0;
      else if(Lo)
        out <= in;
    end
endmodule
  