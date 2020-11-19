module range_change_tb;

reg clk, reset, clr, cnt_over, cnt_low;
wire [1:0] out;
wire c_out;

range_change test(
.clk(clk),
.reset(reset),
.clr(clr),
.cnt_low(cnt_low),
.cnt_over(cnt_over),
.c_out(c_out),
.out(out)
);

initial begin
	clk = 0;
	reset = 1;
	#10;
	reset = 0;
	#20;
	cnt_low = 1;
	#40;
	cnt_low = 0;
	cnt_over = 1;
	#40;
	cnt_low = 0;
	cnt_over = 1;
	#20;
	clr = 1;
	#40;
	clr = 0;
	cnt_low = 1;
	cnt_over = 0;
	#40;
	cnt_low = 0;
	cnt_over = 1;
	#40;
	cnt_low = 0;
	cnt_over = 1;
	#20;
	reset = 1;
	#20;
	reset = 0;
end

always #5 clk=~clk;
endmodule