module pingpong_tb;

reg clk,reset_n, valid;
reg [7:0] datain;
wire [7:0] dataout;

pingpong test(
.clk(clk),
.valid(valid),
.reset_n(reset_n),
.data_in(datain),
.data_out(dataout)
);

initial begin
	clk = 1;
	reset_n = 0;
	#10;
	reset_n = 1;
	valid = 1;
	datain = 8'b00000001;
	#10;
	datain = 8'b00000010;
	#10;
	datain = 8'b00000011;
	#10;
	datain = 8'b00000100;
	#10;
	datain = 8'b00000101;
	#10;
	datain = 8'b00000110;
	#10;
	valid = 0;
	#30;
	valid = 1;
	datain = 8'b00000111;
	#10;
	datain = 8'b00001000;
	#10;
	datain = 8'b00001001;
	#10;
	datain = 8'b00001010;
	#10;
	reset_n = 0;
	#10;
	reset_n = 1;
	datain = 8'b00000001;
	#10;
	datain = 8'b00000010;
	#10;
	datain = 8'b00000011;
	#10;
	datain = 8'b00000100;
	#10;
	datain = 8'b00000101;
	#10;
	datain = 8'b00000110;
	

end

always #5 clk = ~clk;
endmodule