module freq_divide2 (
	input clk, reset_n,
	output reg clk2
);

always@(posedge clk or negedge reset_n) begin
	if (!reset_n) clk2 <= 0;
	else clk2 <= ~clk2;
end

endmodule