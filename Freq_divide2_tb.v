module freq_div2_tb;

reg clk, reset_n;
wire clk2;

freq_divide2 freq_div2_tb(
.clk(clk),
.reset_n(reset_n),
.clk2(clk2)
);

initial begin
	clk = 0;
	reset_n = 0;
	#20;
	reset_n = 1;
	
end
always #5 clk = ~clk;
endmodule