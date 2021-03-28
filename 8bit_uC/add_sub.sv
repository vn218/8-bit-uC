module add_sub(input Su, Eu,
               input [7:0] accu,  //input from accumulator
               input [7:0] b,     //input from b register
               output [7:0] out_bus);
  wire [7:0] out;
  assign out_bus = Eu?out:8'hz;  //tri-state buffer on output connection with bus
  assign out = Su?accu-b:accu+b; //mux to chooose b/w add and sub
endmodule
      