module b_reg(input clk, clr, Lb,
             input [7:0] bus_in,
             output [7:0] add_sub);  //output to add_sub
  
  wire [7:0] in;
  reg [7:0] out;
  assign in = Lb?bus_in:8'hz;  //tri-state buffer on input connection with bus
  always@(posedge clk)
    begin
      if(clr)
        out <= 0;
      else if (Lb)
        out <= in;
    end
  assign add_sub = out;
endmodule

             