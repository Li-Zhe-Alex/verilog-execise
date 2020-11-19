module taskrun (
	input [3:0] a,b,
	input [1:0] opcode,
	output reg [4:0] result 
);

task taskand;
	input [3:0] a,b;
	output [3:0] c;
	integer i;
	for (i=3; i>=0; i= i-1)
		c[i] = a[i] & b[i];
endtask

task taskor;
	input [3:0] a,b;
	output [3:0] c;
	integer i;
	for (i=3; i>=0; i= i-1)
		c[i] = a[i] | b[i];
endtask

always@(*) begin
	case (opcode)
		2'b00: taskand(a,b,result);
		2'b01: result = a&b;
		2'b10: taskor(a,b,result);
		2'b11: result = a|b;
		default: result = 0;
	endcase
end
endmodule