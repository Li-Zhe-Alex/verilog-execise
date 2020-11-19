module handshack_r #(
	parameter width = 4
)(
	input rclk, reset_n, req,
	input [width-1:0] data_in,
	output reg [width-1:0] data_out,
	output reg ack
);

reg req1,req2, ack_next;
reg state, state_next;
parameter idle = 1'b0, get = 1'b1;
reg [width-1:0] data_nexto;

always@(posedge rclk or negedge reset_n) begin
	if (!reset_n) begin
		req1 <= 1'b0;
		req2 <= 1'b0;
		state <= idle;
		ack <= 0;
		data_out <= 0;
		state_next <= idle;
		ack_next <= 0; 
	end
	else begin
		req1 <= req;
		req2 <= req1;
		state <= state_next;
		ack <= ack_next;
		data_out <= data_nexto;
	end
end

always@(*) begin
	case(state)
		idle: begin
			if (req2) begin
				state_next = get;
				ack_next = 1'b1;
				data_nexto = data_in;
			end
		end
		get: begin
			if (!req2) begin
				state_next = idle;
				ack_next = 1'b0;
			end
		end
	endcase
end



endmodule