module lca_4 #(
	parameter width = 4
)
(
	input [width-1:0] a,b,
	input cin,
	output [width-1:0] sum,
	output cout
);

wire [width:0] carry;
wire [width-1:0] p,q;

genvar i;
for(i = 0; i<width; i = i+1) begin
	pg_gen pgi(
	.a(a[i]),
	.b(b[i]),
	.p(p[i]),
	.q(q[i])
	);
end

genvar j;
assign carry[0] = cin;
for(j = 1; j<=width; j = j+1) begin
	assign carry[j] = q[j-1]|(carry[j-1]&p[j-1]);
end

genvar k;
for(k = 0; k<width; k = k+1) begin
	assign sum[k] = p[k]^carry[k];
end
assign cout = carry[width];

endmodule
