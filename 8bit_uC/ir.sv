module IR(input Li,Ei, clr, clk,
          input [7:0] bus_in,
          output [3:0] bus_out,
          output [3:0] instruction); //output to controller
  
  wire [7:0] in;
  reg [7:0] out;
  assign in = Li?bus_in:8'hz;       //tri-state buffer on input connection with bus
  
  //Extracting address of data
  assign bus_out = Ei?out[3:0]:4'hz;  //tri-state buffer on output connection with bus
  
  //Extracting instruction
  assign instruction = out[7:4];  
  always@(posedge clk)
    begin
      if (clr)
        out <= 0;
      else if(Li)
        out <= in;
    end
endmodule
  