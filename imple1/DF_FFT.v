`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Aniruddha Kawade
// San Jose State University, San Jose, CA
//////////////////////////////////////////////////////////////////////////////////
module filter_demo(input rst, input clk, input signed [15:0] a, output signed [64:0] b );

reg signed [15:0] a0,a1;
reg signed [15:0] input_1, input_2, input_3;
reg signed [15:0]  input_4, input_5, input_6;
reg signed [15:0] input_7;
reg signed [64:0] mult1, mult2, mult3, mult4, mult5, mult6, mult7, mult8, mult9;
reg signed [64:0] add1, add1_ff;
reg signed [32:0] add2, add2_ff;
reg signed [32:0] add3,add3_ff; 
reg signed [32:0] add4,add4_ff;
reg signed [32:0] add5,add5_ff;
reg signed [32:0] add6,add6_ff ;
reg signed [32:0] add7,add7_ff ;
reg signed [32:0] add8,add8_ff,add9 ;
wire signed [64:0] multi1_w,multi2_w,multi3_w,multi4_w,multi5_w,multi6_w,multi7_w,multi8_w,multi9_w;

always @(posedgeclk or posedgerst)
if (rst)
begin
a0      <= 0;
a1      <= 0;
input_1 <= 0;
input_2 <= 0;
input_3 <= 0;
input_4 <= 0;
input_5 <= 0;
input_6 <= 0;
input_7 <= 0;
mult1 <= 0;
mult2 <= 0;
mult3 <= 0;
mult4 <= 0;
mult5 <= 0;
mult6 <= 0;
mult7 <= 0;
mult8 <= 0;
mult9 <= 0;
end
else
begin
a0      <= a;
//a1      <= a0;
input_1 <= a0;
input_2 <= input_1;
input_3 <= input_2;
input_4 <= input_3;
input_5 <= input_4;
input_6 <= input_5;
input_7 <= input_6;
end

always @(posedgeclk)
begin
//#10;
mult1 = 16'shfe67 * a;
add1 = mult1 + 0;
mult2 = 16'sh0301 * a0;
mult3 = 16'sh22e0 * input_1;
mult4 = 16'sh5f11 * input_2;
mult5 = 16'sh7fff * input_3;
mult6 = 16'sh5f11 * input_4;
mult7 = 16'sh22e0 * input_5;
mult8 = 16'sh0301 * input_6;
mult9 = 16'shfe67 * input_7;

end

assign #0.001 multi1_w = mult1;
assign #0.001 multi2_w = mult2;
assign #0.001 multi3_w = mult3;
assign #0.001 multi4_w = mult4;
assign #0.001 multi5_w = mult5;
assign #0.001 multi6_w = mult6;
assign #0.001 multi7_w = mult7;
assign #0.001 multi8_w = mult8;
assign #0.001 multi9_w = mult9;

//assign b = multi1_w + mult2 + mult3 + mult4 + mult5 + mult6 + mult7 + mult8 + mult9;
assign b = multi1_w + multi2_w + multi3_w + multi4_w + multi5_w + multi6_w + multi7_w + multi8_w + multi9_w;


endmodule
