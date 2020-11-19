module lca #(
	parameter width = 16
)(
	input [width-1:0] a,b,
	input cin,
	output [width-1:0] sum,
	output cout
);

wire [width>>2:0] carry;
assign carry[0] = cin;
assign cout = carry[width>>2];

genvar i;
for(i = 0; i < width>>2; i = i+1) begin
	lca_4 lca16(
	.a(a[((i+1)<<2)-1:i<<2]),
	.b(b[((i+1)<<2)-1:i<<2]),
	.cin(carry[i]),
	.sum(sum[((i+1)<<2)-1:i<<2]),
	.cout(carry[i+1])
	);
end


endmodule