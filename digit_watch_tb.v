module watch_tb;

reg clk, reset, clr, pause;
wire [4:0] hour;
wire [5:0] minite, second;

watch test(
.clk(clk),
.reset(reset),
.clr(clr),
.pause(pause),
.hour(hour),
.minite(minite),
.second(second)
);


initial begin
	reset = 1;
	clk = 0;
	pause = 0;
	#20;
	reset = 0;
	#100;
	pause = 1;
	#100;
	pause = 0;
end

always #5 clk = ~clk;

endmodule