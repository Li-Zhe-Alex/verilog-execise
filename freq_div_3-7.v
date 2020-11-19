module freq_div #(
	parameter N = 7,
	parameter log_N = 2,
	parameter M = 3
)
(
	input clk, reset_n,
	output clk_out
);

reg clk_en;
reg [log_N : 0] cnt;

always@(posedge clk or negedge reset_n) begin
	if (!reset_n) 
		cnt <= 0;
	else if (cnt + M >= N)
		cnt <= cnt+M-N;
	else
		cnt <= cnt+M;
end

always@(*) begin
	if (!clk) begin
		if (cnt == 3'b000 || cnt == 3'b110 || cnt == 3'b101)
			clk_en = 1'b1;
		else
			clk_en = 1'b0;
	end
end

assign clk_out = clk_en & clk;
endmodule