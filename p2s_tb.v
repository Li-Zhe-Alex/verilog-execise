module p2s_tb;

reg clk, reset_n, valid;
reg [7:0] data_in;
wire data_out;
wire ack, sync;

p2s test(
.clk(clk),
.reset_n(reset_n),
.valid(valid),
.data_in(data_in),
.data_out(data_out),
.ack(ack),
.sync(sync)
);

initial begin
	clk = 1;
	reset_n = 0;
	#10;
	reset_n = 1;
	valid = 1;
	data_in = 8'b11100111;
	#10;
	valid = 0;
	#70;
	valid = 1;
	data_in = 8'b10000011;
	#10;
	valid = 0;

end
always #5 clk = ~clk;
endmodule