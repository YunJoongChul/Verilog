`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/26 16:38:37
// Design Name: 
// Module Name: Mult_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mult_tb();

reg clk, start, rst;
wire [15:0] data_out;
wire [7:0] step;
wire done;

Multipiler DUT(.clk(clk), .rst(rst), .start(start), .data_out(data_out), .step(step), .done(done));

always #3 clk = ~clk;

initial begin
clk = 0; rst = 0; start = 0;
#99; 
#15 rst = 1;
#15 rst = 0;
#6 start = 1;
#6 start = 0;
#300;
end

endmodule
