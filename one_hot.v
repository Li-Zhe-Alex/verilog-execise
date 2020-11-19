module one_hot #
(parameter width = 8)(
	input [width-1:0] in,
	output is_onehot
);

reg [width-1:0] parity;
integer i;

always@(*) begin
	parity[0] = in[0];
	for (i = 1; i < width; i = i+1) 
		parity[i] = parity[i-1] ^ in[i];
end  

assign is_onehot = (|in) & (&(~in | parity));

endmodule
	
