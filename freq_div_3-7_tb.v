module freq_div_tb;

reg clk, reset_n;
wire clk_out;

freq_div freq_div_tb(
.clk(clk),
.reset_n(reset_n),
.clk_out(clk_out)
);

initial begin
	clk = 0;
	reset_n = 0;
	#20;
	reset_n = 1;
	
end
always #5 clk = ~clk;
endmodule