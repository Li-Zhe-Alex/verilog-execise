module autosell_tb;

reg clk, reset_n, in5, in10;
wire out, refuse, back5;

autosell test(
.clk(clk),
.reset_n(reset_n),
.in5(in5),
.in10(in10),
.out(out),
.refuse(refuse),
.back5(back5)
);

initial begin
	clk = 0;
	reset_n = 0;
	in5 = 0;
	in10 = 0;
	#20;
	reset_n = 1;
	in5 = 1;
	#10;
	in5 = 1;
	#10;
	in5 = 1;
	#10;
	in5 = 1;
	#10;
	in5 = 0;
	in10 = 0;
	#50;
	in10 = 1;
	#10;
	in10 = 1;
	#10;
	in5 = 0;
	in10 = 0;
	#50;
	in10 = 1;
	#10;
	in10 = 0;
	in5 = 1;
	#10;
	in5 = 0;
	in10 = 0;
	#50;
	in5 = 1;
	#10;
	in5 = 1;
	#10;
	in10 = 1;
	in5 = 0;
	#10;
	in5 = 0;
	in10 = 0;
	

end

always #5 clk = ~clk;
endmodule