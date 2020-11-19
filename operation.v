`define add 0
`define minus 1
`define and 2
`define or 3
`define not 4
`define nand 5
`define nor 6
`define xnor 7

module operation (
	input [3:0] a,b,
	input [2:0] opcode,
	output reg [4:0] result
);

always@(*) begin
	case (opcode)
		`add : result = a + b;
		`minus: result = a - b;
		`and : result = a&b;
		`or : result = a|b;
		`not : result = ~a;
		`nand : result = a * b;
		`nor : result = a ^ b;
		`xnor : result = a~^b;
		default : result = 0;
	endcase
end
endmodule