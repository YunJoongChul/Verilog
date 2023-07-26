`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/26 16:05:59
// Design Name: 
// Module Name: Multipiler
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


module Multipiler(clk, rst, start, data_out, step, done);

input clk, rst, start;
output [15:0] data_out;
output reg [7:0] step;
output reg done;
reg [7:0] A, B;
mult_gen_0 DUT(.clk(clk), .A(A), .B(B), .P(data_out));

reg [2:0] state;

localparam IDLE = 2'd0, MULT_LOW= 2'd1, MULT_HIGH = 2'd2, DONE = 2'd3;

always@(posedge clk or posedge rst)
begin
 if(rst)
    state <= IDLE;
 else
    case(state)
        IDLE : if(start) state <= MULT_LOW; else state <= IDLE;
        MULT_LOW : if(A == 8'd8) state <= MULT_HIGH; else state <= MULT_LOW;
        MULT_HIGH : if(B == 8'd9) state <= DONE; else state <= MULT_LOW;
        DONE : state <= IDLE;
        default : state <= IDLE;
        endcase
end
/*
always@(posedge clk or posedge rst)
begin
 if(rst)
    cnt_low <= 0;
else
    case(state)
    MULT_LOW : cnt_low <= cnt_low + 1'd1;
    default : cnt_low <= 0;
    endcase
end

always@(posedge clk or posedge rst)
begin
 if(rst)
    cnt_high <= 0;
else
    case(state)
    MULT_HIGH : cnt_high <= cnt_high + 1'd1;
    default : cnt_high <= cnt_high;
    endcase
end
*/

always@(posedge clk or posedge rst)
begin
 if(rst)
    A <= 8'd1;
else
    case(state)
    MULT_LOW :  A <= A + 1'd1;
    default : A <= 8'd1;
    endcase
end

always@(posedge clk or posedge rst)
begin
 if(rst)
    B <= 8'd2;
else
    case(state)
    MULT_HIGH :if(B == 8'd9) B <= 0; else B <= B + 1'd1;
    DONE : B <= 8'd0;
    default : B <= B;
    endcase
end

always@(posedge clk or posedge rst)
begin
 if(rst)
    step <= 8'd0;
else
    case(state)
    MULT_LOW :if(A == 8'd3 && B == 8'd2) step <= 8'd2; else step <= step;
    MULT_HIGH : step <= step + 1'd1;
    default : step <= step;
    endcase
end

always@(posedge clk or posedge rst)
begin
 if(rst)
    done <= 1'd0;
else
    case(state)
    MULT_HIGH :if(A == 9 && B == 9) done <= 1'd1; else done <= 1'd0;
    default : done <= 1'd0;
    endcase
end

endmodule
