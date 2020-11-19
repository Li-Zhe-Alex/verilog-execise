module fudan17_tb;

reg clk, reset_n, in;
wire out;

fudan17 test(
.clk(clk),
.reset_n(reset_n),
.in(in),
.out(out)
);

initial begin
	clk = 0;
	reset_n = 0;
	#20;
	reset_n = 1;
	in = 1;
	#30;
	in = 0;
	#10;
	in = 1;
	#60;
	in = 0;
	#40;
	in = 1;
	#80;
	in = 0;
	#40;
	in = 1;
	#150;
	in = 0;
	#50;
	in = 1;
	#210;
	in = 0;
	#70;
	in = 1;
	#270;
	in = 0;
	#80;
	in = 1;
	#350;
	in = 0;
	
end
always #5 clk=~clk;
endmodule