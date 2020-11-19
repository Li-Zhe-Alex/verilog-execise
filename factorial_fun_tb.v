module test;
reg clk,reset;
reg [3:0] n;
wire [31:0] result;

fac factori(
.clk(clk),
.reset(reset),
.n(n),
.result(result)
);

initial begin
	clk= 0;
	reset =1;
	#10;
	reset =0;
	for (n=0;n<=15;n=n+1)
	#20;
end

always #5 clk=~clk;
endmodule