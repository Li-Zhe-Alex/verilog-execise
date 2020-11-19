module bcd60 (
	input [7:0] data,
	input clk,reset,load,c_in,
	output reg [7:0] q_out,
	output c_out
);

always@(posedge clk) begin
	if (reset) q_out <= 1'b0;
	else if (load) q_out <= data;
	else if (c_in) begin
		if (q_out[3:0] == 9) begin 
			q_out[3:0] <= 0; 
			if(q_out[7:4] == 5) q_out <= 0;
			else q_out[7:4] <= q_out[7:4] + 1;
		end else 
			q_out[3:0] <= q_out[3:0] + 1;
	end
end

assign c_out = (q_out == 8'h59 & c_in)?1:0;

endmodule