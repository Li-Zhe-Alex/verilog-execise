module s2p_tb;
reg clk, reset_n, sync, ack;
reg datain;
wire valid;
wire [7:0] dataout; 

s2p test(
.clk(clk),
.reset_n(reset_n),
.sync(sync),
.ack(ack),
.data_in(datain),
.valid(valid),
.dataout(dataout)
);

initial begin
	clk = 1;
	reset_n = 0;
	#10;
	reset_n = 1;
	#10;
	ack =0;
	sync = 1;
	datain = 1;
	#10;
	ack = 1;
	sync = 0;
	datain = 0;
	#10;
	datain = 1;
	#10;
	datain = 1;
	#10;
	datain = 0;
	#10;
	datain = 0;
	#10;
	datain = 1;
	#10;
	datain = 1;
	#10;
	datain = 1;
	#10;
	datain = 0;
	#10;
	sync = 1;
	datain = 1;
	#10;
	sync = 0;
	datain = 0;
	#10;
	datain = 1;
	#10;
	datain = 1;
	#10;
	datain = 1;
	#10;
	datain = 0;
end
always #5 clk = ~clk;
endmodule