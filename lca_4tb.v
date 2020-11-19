module lca4tb;

reg [3:0] a,b;
reg cin;
wire cout;
wire [3:0] sum;

lca_4 test(
.a(a),
.b(b),
.cin(cin),
.cout(cout),
.sum(sum)
);

initial begin
	a = 4'b1001;
	b = 4'b0110;
	cin = 0;
	#10;
	cin = 1;
	#10;
	a = 4'b0000;
	b = 4'b1111;
	cin = 0;
	#10;
	cin = 1;
	#10;
	a = 4'b1010;
	b = 4'b1010;
	cin = 0;
	#10;
	cin = 1;
	#10;
	a = 4'b1111;
	b = 4'b1111;
	cin = 0;
	#10;
	cin = 1;

end

endmodule 