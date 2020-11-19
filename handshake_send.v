module handshack_s #(
	parameter width = 4
)(
	input sclk, reset_n, ack, valid,
	input [width-1:0] data_in,
	output reg [width-1:0] data_sout,
	output reg req
);

reg ack1, ack2, req_next;
reg [1:0] state, state_next;
parameter idle = 2'b00, send = 2'b01, get = 2'b10;
reg [width-1:0] data_nexts;

always@(posedge sclk or negedge reset_n) begin
	if (!reset_n) begin
		ack1 <= 0;
		ack2 <= 0;
		state <= idle;
		state_next <= idle;
		req <= 0;
		req_next <= 0;
		data_sout <= 0;
	end
	else begin
		ack1 <= ack;
		ack2 <= ack1;
		state <= state_next;
		req <= req_next;
		data_sout <= data_nexts;
	end
end

always@(*) begin
	case(state)
		idle: begin
			if (valid) begin
				state_next <= send;
				req_next = 1'b1;
				data_nexts = data_in;
			end
		end
		send: begin
			if (ack2) begin
				state_next = get;
				req_next = 1'b0;
				data_nexts = 'd0;
			end
		end
		get: begin
			if (!ack2) begin
				if (valid) begin
					state_next <= send;
					req_next = 1'b1;
					data_nexts = data_in;
				end
				else begin
					state_next <= idle;
				end
			end
		end
	endcase
end



endmodule