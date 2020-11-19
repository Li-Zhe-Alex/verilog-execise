module test;

reg [6:0] vote;
wire pass;

vote vote_tb (
.vote(vote),
.pass(pass)
);

initial begin
	#10;
	vote= 7'b1001001;
	#10;
	vote= 7'b1011001;
	#10;
	vote= 7'b1110000;
	#10;
	vote= 7'b0000001;
	#10;
	vote= 7'b1011111;
	#10;
	vote= 7'b1001000;
	#10;
	vote= 7'b1111111;
	#40;
end
endmodule