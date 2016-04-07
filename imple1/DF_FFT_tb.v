//////////////////////////////////////////////////////////////////////////////////
// Author: Aniruddha Kawade
// San Jose State University, San Jose, CA
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module filter_test;

	// Inputs
	regrst;
	regclk;
	reg signed [15:0] a;
	reg signed [15:0] data[0:199];	
	reg [10:0] count;

	// Outputs
	wire signed [64:0] b;

	// Instantiate the Unit Under Test (UUT)
	filter_demo uut (
		.clk(clk),
      .rst(rst), 		
		.a(a), 
		.b(b)
	);
	
	initial begin
		$monitor($time, " Fir _out = %d",b);
	end
	
	always@(posedgeclk or posedgerst) begin
		if(rst) begin
			a <= 0;
                        count <= 0;
		end else begin
                        a <= count>200 ? 0 : data[count];
                        count <= count+1;
		end
	end	
	
	initial begin
		rst = 0;
		clk = 0;
		//co_eff_start = 0;
		//data_start =0;
		#20 rst = 1;
		#10 rst = 0;
		
		#100000 $finish;
	end

   always
   #5 clk = ~ clk;

   initial begin
	
		$readmemh("sampdata.mif",data);
		end

	
	

endmodule
