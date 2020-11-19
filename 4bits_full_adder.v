module full_adder (
	input [3:0] a, b,
	input c_in,
	output [3:0] s,
	output c_out
);

assign {c_out, s} = a + b + c_in;

endmodule