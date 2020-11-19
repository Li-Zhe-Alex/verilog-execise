module seq_det_tb;

reg clk, reset_n;
reg [1:0] in;
wire [1:0] out;

seq_det test(
.clk(clk),
.reset_n(reset_n),
.in(in),
.out(out)
);

initial begin
	clk = 1;
	reset_n =0;
	#10;
	reset_n = 1;
	in = 2'b10;
	#10;
	in = 2'b00;
	#10;
	in = 2'b10;
	#10;
	in = 2'b10;
	#10;
	in = 2'b11;
	#10;
	in = 2'b00;
	#10;
	in = 2'b01;
	#10;
	in = 2'b11;
	#10;
	in = 2'b10;
	#10;
	in = 2'b00;
	#10;
	in = 2'b01;
	#10;
	in = 2'b11;
	#10;
	in = 2'b10;
	#10;
	in = 2'b00;
	#10;
	in = 2'b10;
	#10;
	in = 2'b11;
	#10;
	in = 2'b01;
	#10;
	in = 2'b00;
	#10;
	in = 2'b10;
	#10;
	in = 2'b11;
	#10;
	in = 2'b01;
	#10;
	in = 2'b00;
	#10;
	in = 2'b01;
	#10;
	in= 2'b11;
	

end
always #5 clk = ~clk;
endmodule