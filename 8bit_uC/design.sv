// Code your design here

`include "controller.sv"
`include "pc.sv"
`include "mar.sv"
`include "ram.sv"
`include "ir.sv"
`include "accu.sv"
`include "add_sub.sv"
`include "b_reg.sv"
`include "out_reg.sv"

module uC(input clk, clr,
          output [7:0] out);
  
  wire [11:0] control_bus;    //control bus
  wire [7:0] bus;             //main bus
  wire [7:0] accu_add_sub;   //connection between accumulator and add_sub
  wire [7:0] b_add_sub;      //connection between b register and add_sub
  wire [3:0] mar_ram;        //connection between MAR and RAM
  wire [3:0] ir_control;     //connetion between IR and controller
  
  //Importing components
  controller controller(clk, clr, ir_control, control_bus);
  
  pc pc(clk, clr, control_bus[11], control_bus[10], bus[3:0]);
  
  mar mar(clk, clr, bus[3:0], ~control_bus[9], mar_ram);
  
  RAM RAM(mar_ram, ~control_bus[8], bus);
  
  IR IR(~control_bus[7], ~control_bus[6], clr, clk, bus, bus[3:0], ir_control);
  
  accu accu(clk, clr, ~control_bus[5], control_bus[4], bus, bus, accu_add_sub);
  
  add_sub add_sub(control_bus[3], control_bus[2], accu_add_sub, b_add_sub, bus);
  
  b_reg b_reg(clk, clr, ~control_bus[1], bus, b_add_sub);
  
  out_reg out_reg(clk, clr, ~control_bus[0], bus, out);

endmodule
  
  







          
  
  
        
        

      
          
  