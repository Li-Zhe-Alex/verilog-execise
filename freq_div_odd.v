module freq_div_odd #(
	parameter num = 7,
	parameter log_num = 2
)
(
	input clk, reset_n,
	output clk_odd
);
reg clk_odd1, clk_odd2;
reg [log_num : 0] cnt1;

always@(posedge clk or negedge reset_n) begin
	if (!reset_n) begin 
		clk_odd1 <= 0;
		cnt1 <= 0;
	end
	else if (cnt1 == num - 1) begin
		clk_odd1 <= ~clk_odd1;
		cnt1 <= 0;
	end
	else if (cnt1 == num>>1) begin
		clk_odd1 <= ~clk_odd1;
		cnt1 <= cnt1 + 1;
	end
	else cnt1 <= cnt1 + 1;
end

always@(negedge clk or negedge reset_n) begin
	if (!reset_n) begin 
		clk_odd2 <= 0;
	end
	else if (cnt1 == num - 1) begin
		clk_odd2 <= ~clk_odd2;
	end
	else if (cnt1 == num>>1) begin
		clk_odd2 <= ~clk_odd2;
	end
end
assign clk_odd = clk_odd1 | clk_odd2;

endmodule