module multiply #(
parameter size = 3)
(
	input [size:0] a, b,
	output reg [2*size + 1 :0] result
);
integer i;

always@(*) begin
	result = 0;
	for (i= 0; i <= size; i = i + 1) 
		if (b[i]) result = result + (a << (i));
end
endmodule