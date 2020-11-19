module basic_fsm_tb;

reg clk, reset, start, step1, step2, step3;
wire [2:0] out;

basic_fsm fsm(
.clk(clk),
.reset(reset),
.start(start),
.step1(step1),
.step2(step2),
.step3(step3),
.out(out)
);

initial begin
	clk = 0;
	reset = 1;
	#10;
	reset = 0;
	#10;
	start = 1;
	#20;
	step1 = 1;
	#30;
	step2 = 1;
	#40;
	step3 = 1;
	#20;
	reset = 1;
	#10;
	reset = 0;
	step3 = 1;
	#10;
	step1 = 1;
	#20;
end

always #5 clk=~clk;
endmodule