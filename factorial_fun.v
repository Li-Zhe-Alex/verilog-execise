module fac (
	input clk,reset,
	input [3:0] n,
	output reg [31:0] result
);

always@(posedge clk) begin
	if (reset) result <= 0;
	else
		result <= factorial(n);
end

function [31:0] factorial;
	input [3:0] n;
	integer i;
	begin
		factorial = (n)?1:0;
			for (i = 2; i<=n; i=i+1)
				factorial = i*factorial;
	end
endfunction
endmodule