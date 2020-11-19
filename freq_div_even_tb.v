module freq_div_even_tb;

reg clk, reset_n;
wire clk_even;

freq_div_even freq_div_even_tb(
.clk(clk),
.reset_n(reset_n),
.clk_even(clk_even)
);

initial begin
	clk = 0;
	reset_n = 0;
	#20;
	reset_n = 1;
	
end
always #5 clk = ~clk;
endmodule