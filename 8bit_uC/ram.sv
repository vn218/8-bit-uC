module RAM(input [3:0] address, //input from MAR
           input CE,
           output [7:0] out_bus);
  
  reg [7:0] out;
  assign out_bus = CE?out:8'bz; //tri-state buffer on output connection with bus
  
  always@(address)
    begin
      //assigning data to addresses
      case(address)
        'h0: out = 'h08;
        'h1: out = 'h19;
        'h2: out = 'h2A;
        'h3: out = 'hE0;
        'h8: out = 6;
        'h9: out = 5;
        'hA: out = 2;
        
      endcase
    end
endmodule
      
  