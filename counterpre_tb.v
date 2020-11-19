module test;

reg clk,reset,load;
reg [3:0] data_in;
wire [3:0] count;

counterpre counter(
.clk(clk),
.reset(reset),
.load(load),
.data_in(data_in),
.count(count)
);

initial begin
	clk = 0;
	reset = 1;
	load = 0;
	#10;
	reset = 0;
	#60;
	load = 1;
	#30;
	data_in = 10;
	#10;
	load = 0;
	#100;
	load = 1;
	data_in = 13;
	#10;
	load = 0;
	#100;
	reset = 1;
	#50;
end
	always #5 clk=~clk;
endmodule