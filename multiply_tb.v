module test;

parameter size = 3;
reg [size:0] a,b;
wire [2*size + 1:0] result;

multiply mul (
.a(a), 
.b(b), 
.result(result)
); 

initial begin
	#10;
	a=3; b=5;
	#10;
	a=7; b=7;
	#10;
	a=0; b=4;
	#10;
	a=5; b=-1;
	#20;
	
end
endmodule