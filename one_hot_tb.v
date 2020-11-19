module one_hot_tb;

reg [7:0] in;
wire out;

one_hot test(
.in(in),
.is_onehot(out)
);

initial begin
	#10;
	in = 8'b00000000;
	#10;
	in = 8'b00000001;
	#10;
	in = 8'b00000010;
	#10;
	in = 8'b00000100;
	#10;
	in = 8'b00001000;
	#10;
	in = 8'b00010000;
	#10;
	in = 8'b00100000;
	#10;
	in = 8'b01000000;
	#10;
	in = 8'b10000000;
	#10;
	in = 8'b01000001;
	#10;
	in = 8'b00011100;
	#10;
	in = 8'b11111111;

end

endmodule