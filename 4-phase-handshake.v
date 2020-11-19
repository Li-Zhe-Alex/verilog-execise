module four_phase_handshake #(
	parameter width = 4,
	parameter depth = 16,
	parameter fifo = $clog2(depth)
)(
	input clk, reset_n, valid, ack,
	input [width - 1:0] data_in,
	output reg req, ready,
	output reg [width - 1:0] data_out
);

reg [width-1:0] mem [depth-1:0];
reg [fifo:0] tail, head;
reg [fifo:0] tail_next, head_next;
wire full, empty;
reg [1:0] state_s,state_snext, state_r,state_rnext;
parameter idle = 2'b00, send = 2'b01, receive = 2'b10, finish = 2'b11;

always@(posedge clk) begin
	if (!reset_n) begin
		tail <= 0;
		state_s <= idle;
	end
	else begin
		state_s <= state_snext;
		tail <= tail_next;
	end
end

always@(posedge clk) begin
	if (!reset_n) begin
		head <= 0;
		state_r <= idle;
	end
	else begin
		state_r <= state_rnext;
		head <= head_next;
	end
end
		
assign empty = (tail == head) ? 1:0;
assign full = (tail[fifo]!=head[fifo] && head[fifo - 1:0] == tail[fifo - 1:0]) ? 1:0;

always@(*) begin
	case(state_r)
		idle: begin
			if (valid == 1 && full ==0) begin
				state_rnext = receive;
				tail_next = tail + 1;
				mem[tail[fifo-1:0]] = data_in;
			end
			else begin
				state_rnext = idle;
				tail_next = tail;
			end
		end
		receive: begin
			ready = 1;
			state_rnext = finish;
		end
		finish: begin
			if (valid == 0) begin
				ready = 0;
				state_rnext = idle;
			end
		end
	endcase
end

always@(*) begin
	case(state_s)
		idle: begin
			head_next = head;
			if (ack == 0 && empty ==0) begin
				state_snext = send;
			end
			else begin
				state_snext = idle;
			end
		end
		send: begin
			head_next = head + 1;
			data_out = mem[head[fifo-1:0]];
			req = 1;
			state_snext = finish;
		end
		finish: begin
			if (ack == 1) begin
				req = 0;
				state_snext = idle;
			end
		end
	endcase
end

endmodule