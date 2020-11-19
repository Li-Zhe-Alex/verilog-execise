module test;

reg [3:0] a,b;
reg [1:0] opcode;
wire [3:0] c;

taskrun taskrun(
.a(a),
.b(b),
.opcode(opcode),
.result(c)
);

initial begin
	#10;
	opcode = 0; a= 1000; b=1111;
	#10;
	opcode = 1;
	#10;
	opcode = 2;
	#10;
	opcode = 3;
	#10;
	opcode = 0; a= 0011; b=0110;
	#10;
	opcode = 1;
	#10;
	opcode = 2;
	#10;
	opcode = 3;
	#10;
end
endmodule