module lca_tb;

reg [15:0] a,b;
reg cin;
wire cout;
wire [15:0] sum;

lca test(
.a(a),
.b(b),
.cin(cin),
.cout(cout),
.sum(sum)
);

initial begin
	a = 16'b1001000010101111;
	b = 16'b0110111110101111;
	cin = 0;
	#10;
	cin = 1;
	#10;
	a = 16'b1010111110010000;
	b = 16'b1010111101101111;
	cin = 0;
	#10;
	cin = 1;
	#10;
	a = 16'b0000000000000010;
	b = 16'b0000000000000110;
	cin = 0;
	#10;
	cin = 1;
	#10;
	a = 16'b0101010101010101;
	b = 16'b1010101010101010;
	cin = 0;
	#10;
	cin = 1;

end

endmodule 