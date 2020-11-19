module handsh_tb;

reg rclk, sclk, reset_n, valid;
reg [3:0] datain;
wire [3:0] dataout;


handshack test(
.rclk(rclk),
.sclk(sclk),
.reset_n(reset_n),
.valid(valid),
.data_in(datain),
.data_out(dataout)
);

initial begin
	sclk = 1;
	rclk = 1;
	reset_n = 0;
	#10;
	reset_n = 1;
	valid = 1;
	datain = 4'b1111;
	#70;
	valid = 0;
	#10;
	valid = 1;
	datain = 4'b1001;
	#70;
	valid = 1;
	datain = 4'b0001;
	

end
always #4 sclk= ~sclk;
always #5 rclk= ~rclk;
endmodule