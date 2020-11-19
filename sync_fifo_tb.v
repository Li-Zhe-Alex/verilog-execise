module sync_fifo_tb;

reg clk, reset, rd_en, wr_en;
reg [3:0] data_in;
wire [3:0] data_out;
wire full, empty;

sync_fifo test(
.clk(clk),
.reset(reset),
.rd_en(rd_en),
.wr_en(wr_en),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty)	
);

initial begin
	reset = 1;
	clk = 0;
	rd_en = 0;
	wr_en = 0;
	#20;
	reset = 0;
	#10;
	wr_en = 1;
	data_in = 0;
	#10;
	data_in = 1;
	#10;
	data_in = 2;
	#10;
	data_in = 3;
	#10;
	data_in = 4;
	#10;
	data_in = 5;
	#10;
	data_in = 6;
	#10;
	data_in = 7;
	#10;
	data_in = 8;
	#10;
	data_in = 9;
	#10;
	data_in = 10;
	#40;
	data_in = 4;
	#10;
	data_in = 11;
	#10;
	data_in = 12;
	#10;
	rd_en = 1;
	data_in = 13;
	#10;
	data_in = 14;
	#10;
	data_in = 15;
	rd_en = 0;
	#10;
	data_in = 10;
	#10;
	rd_en = 1;
	data_in = 12;
	#10;
	data_in = 1;
	


end
always #5 clk=~clk;
endmodule