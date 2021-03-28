module controller(input clk, clr,
                  input [3:0] instruction, // instruction from IR
                  output reg [11:0] out);  // control bus
  reg [3:0] state;
  
  //assigning values to states
  parameter fetch1 = 0;
  parameter fetch2 = 1;
  parameter fetch3 = 2;
  parameter lda1 = 3;
  parameter lda2 = 4;
  parameter lda3 = 5;
  parameter add1 = 6;
  parameter add2 = 7;
  parameter add3 = 8;
  parameter sub1 = 9;
  parameter sub2 = 10;
  parameter sub3 = 11;
  parameter out1 = 12;
  parameter out2 = 13;
  parameter out3 = 14;

  //assigning output to states
  always@(state)
    begin
      case(state)
        fetch1:
          out = 'h5E3; 
        fetch2:
          out = 'hBE3;  
  		fetch3:
          out = 'h263;
        lda1,add1,sub1:
          out = 'h1A3;
        lda2:
          out = 'h2C3;
        lda3,out2,out3:
          out = 'h3E3;
        add2,sub2:
          out = 'h2E1;
        add3:
          out = 'h3C7;
        sub3:
          out = 'h3CF;
        out1:
          out = 'h3F2;
      endcase
    end     
        
  //state change logic
  always@(negedge clk)
    begin
      if (clr)
        state <= 0;
      else
        begin
          case(state)
            fetch3: begin
              if (instruction == 0)
                state <= lda1;
              else if (instruction == 1)
                state <= add1;
              else if (instruction == 2)
                state <= sub1;
              else if (instruction == 'hE)
                state <= out1;
            end
            lda3,add3,sub3,out3: state <= fetch1;
            default: state <= state + 1;
          endcase
        end
    end
endmodule
