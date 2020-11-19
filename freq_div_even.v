module freq_div_even #(
	parameter num = 6,
	parameter log_num = 2
)
(
	input clk, reset_n,
	output reg clk_even
);

reg [log_num : 0] cnt;

always@(posedge clk or negedge reset_n) begin
	if (!reset_n) begin 
		clk_even <= 0;
		cnt <= 0;
	end
	else if (cnt == num/2 - 1) begin
		clk_even <= ~clk_even;
		cnt <= 0;
	end
	else cnt <= cnt + 1;
end

endmodule