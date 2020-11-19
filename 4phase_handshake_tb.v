module four_phase_handshake_tb;

reg clk, reset_n, valid, ack;
reg [3:0] in;
wire [3:0] out;
wire req, ready;

four_phase_handshake test(
.clk(clk),
.reset_n(reset_n),
.data_in(in),
.valid(valid),
.ack(ack),
.data_out(out),
.req(req),
.ready(ready)
);

initial begin
	clk = 1;
	reset_n = 0;
	# 20;
	reset_n = 1;
	#10;
	in = 4'b1111;
	valid = 1;
	ack = 0;
	#30;
	valid = 0;
	ack = 1;
	#30;
	in = 4'b1010;
	valid = 1;
	ack = 0;
	#30;
	valid = 0;
	ack = 1;
	
	
	
	
	

end
always #5 clk = ~clk;

endmodule