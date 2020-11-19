module test;

reg [3:0] a, b;
reg [2:0] opcode;
wire [4:0] result;

operation operation (
.a(a),
.b(b),
.opcode(opcode),
.result(result)
);

initial begin
	a=6; b=9;
	#40;
	opcode = 0;
	#10;
	opcode = 1;
	#10;
	opcode = 2;
	#10;
	opcode = 3;
	#10;
	opcode = 4;
	#10;
	a = 7; b= 8;
	#10;
	opcode = 5;
	#10;
	opcode = 6;
	#10;
	opcode = 7;
	#40;
end
endmodule