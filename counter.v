module counter (
	input clk, reset,
	output reg [3:0] counter
);

always@(posedge clk or posedge reset) begin
	if (reset) counter <= 4'd0;
	else counter <= counter + 1;
end


endmodule