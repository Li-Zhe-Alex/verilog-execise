module vote (
	input [6:0] vote,
	output pass
);
integer i;
reg [2:0] result;

always@(*) begin
	result = 0;
	for (i=0; i<7; i=i+1) begin
		if (vote[i])
		result = result + 1;
		else result = result;
	end
end
assign pass = (result[2] == 1)? 1: 0;

endmodule