module pingpong #(
	parameter width = 8
)(
	input clk, reset_n, valid,
	input [width-1:0] data_in,
	output reg [width-1:0] data_out
);

reg [2*width-1:0] buffer;
reg state, state_next;

always@(posedge clk or negedge reset_n) begin
	if (!reset_n) begin
		state = 0;
	end
	else begin
		state = state_next;
	end
end

always@(*) begin
	if(!reset_n) begin 
		buffer = 'b0;
		data_out = 'b0;
		state_next = 1'b0;
	end
	else begin
		state_next = state;
		data_out = 'b0;
		case(state)
			1'b0: begin
				data_out = buffer[2*width-1:width];
				if (valid) begin
					buffer[width-1:0] = data_in;
					state_next = 1'b1;
				end
			end
			1'b1: begin
				data_out = buffer[width-1:0];
				if (valid) begin
					buffer[2*width-1:width] = data_in;
					state_next = 1'b0;
				end
			end
		endcase
	end
end

endmodule