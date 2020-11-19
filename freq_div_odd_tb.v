module freq_div_odd_tb;

reg clk, reset_n;
wire clk_odd;

freq_div_odd freq_div_odd_tb(
.clk(clk),
.reset_n(reset_n),
.clk_odd(clk_odd)
);

initial begin
	clk = 0;
	reset_n = 0;
	#20;
	reset_n = 1;
	
end
always #5 clk = ~clk;
endmodule