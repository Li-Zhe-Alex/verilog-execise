module traffic_tb;

reg clk, reset;
wire [3:0] lampA, lampB;

traffic traffic_tb(
.clk(clk),
.reset(reset),
.lampA(lampA),
.lampB(lampB)
);

initial begin
	clk = 0;
	reset = 1;
	#10;
	reset = 0;
end

always #5 clk = ~clk;

endmodule