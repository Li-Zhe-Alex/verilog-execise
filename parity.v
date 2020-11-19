module parity_check #(
	parameter width = 6
)(
	input [width-1:0] data_in,
	output even, odd
);

assign odd = ^data_in;
assign even = ~odd;

endmodule