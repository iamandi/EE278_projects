module dff(clk,rst,a,q);

	input clk,rst;
	input signed [63:0] a;
	output signed [63:0] q;
	reg signed [63:0] q;

	always@(posedgeclk or posedgerst) begin
		if(rst) begin
			q <= 0;
		end else begin
			q <= a;
		end	
	end
endmodule
module add(out,a,b);
	output signed [63:0] out;
	input signed [31:0] a;	
	input signed [31:0] b;
	assign out = a + b;		
endmodule
module filter_tree(clk,rst,a,b);
	input clk,rst;
	input signed [15:0] a; 
	output signed [63:0] b; 
	wire signed [63:0] b1,b2,b3,b4,b5,b6,b7,b8,b;
	wire signed [15:0] d1,d2,d3,d4,d5,d6,d7,d8;
	wire signed [63:0] F1,F2,F3,F4,F5,F6,F7,F8,F9,F10; 
	




	
/*	always @ (*)
	begin

        b1 = a * -409 + d1 * 769;
        b2 = d2* 8928 + d3 * 24337;
        b3 = d4* 32767 + d5 * 24337;
        b4 = d6 * 8928 + d7 * 769;
        b6 = F1 + F2;
        b7 = F3 + F4;
        b8 = F6 + F7;
        b  = F9 + F10;
        end */
	
	add a1 (b1,a*-409,d1*769);
	add a2 (b2,d2*8928,d3*24337);
	add a3 (b3,d4*32767,d5*24337);
	add a4 (b4,d6*8928,d7*769);
	add a5 (b6,F1,F2);
	add a6 (b7,F3,F4);
	add a7 (b8,F6,F7);
	add a8 (b,F9,F10);

      assign b5 = d8 * -409;


	dff  f1 (clk,rst,a,d1);
	dff  f2 (clk,rst,d1,d2);
	dff  f3 (clk,rst,d2,d3);
	dff  f4 (clk,rst,d3,d4);
	dff  f5 (clk,rst,d4,d5);
	dff  f6 (clk,rst,d5,d6);
	dff  f7 (clk,rst,d6,d7);
	dff  f8 (clk,rst,d7,d8);
	dff  f9 (clk,rst,b1,F1);
	dff  f10 (clk,rst,b2,F2);
	dff  f11 (clk,rst,b3,F3);
	dff  f12 (clk,rst,b4,F4);
	dff  f13 (clk,rst,b5,F5);
	dff  f14 (clk,rst,b6,F6);
	dff  f15 (clk,rst,b7,F7);
	dff  f16 (clk,rst,F5,F8);
	dff  f17 (clk,rst,b8,F9);
	dff  f18 (clk,rst,F8,F10);
	
endmodule
