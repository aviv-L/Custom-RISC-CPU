`timescale 1ns / 1ps


module micro_controller(
input clk,
input rst,
input [7:0]in_port1,
input [7:0]in_port2,
input [7:0]in_port3,
input [7:0]in_port4,
output  [3:0]in_strobe,
output [7:0]out_port1,  
output [7:0]out_port2,     
output [7:0]out_port3,      
output [7:0]out_port4,      
output  [3:0]out_strobe 
    );


wire [7:0] program_adress;
wire [7:0]program_bus;


my_cpu controller1(
.clk(clk),
.rst(rst),
.program_bus(program_bus),
.in_port1   (in_port1  ) ,
.in_port2   (in_port2  ) ,
.in_port3   (in_port3  ) ,
.in_port4   (in_port4  ) ,
.in_strobe  (in_strobe ) ,
.out_port1  (out_port1 ) ,
.out_port2  (out_port2 ) ,
.out_port3  (out_port3 ) ,
.out_port4  (out_port4 ) ,
.out_strobe (out_strobe) ,
.program_adress(program_adress)
);

program_mem p1(
.program_adress(program_adress),
.program_bus(program_bus),
.rst(rst)     
);
     
endmodule


