module fudan17 (
	input clk, reset_n, in,
	output reg out
);
reg out_next;
reg [4:0] cnt, cnt_next;
reg [1:0] state, state_next;

parameter idle = 2'b00, counter = 2'b10, finish = 2'b11;


always@(posedge clk) begin
	if(!reset_n) begin
		cnt <= 0;
		state <= idle;
		out <= 0;
	end else begin
		cnt <= cnt_next;
		state <= state_next;
		out <= out_next;
	end
end

always@(*) begin
	case(state)
		idle: begin 
			out_next <= 0;
			if (in) begin
				state_next = counter;
				cnt_next = 1;
				end
			else begin state_next = idle;
				cnt_next = 0;
			end
		end
		counter: begin 
			out_next <= 0;
			if (in) begin
				state_next = counter;
				if (cnt < 24) cnt_next = cnt + 1;
				else cnt_next = cnt;
			end
			else
				state_next = finish;
		end
		finish: begin 
			if (cnt < 4) begin 
				state_next = idle;
				cnt_next = 0;
				out_next = 0;
			end
			else begin
				state_next = finish;
				cnt_next = cnt - 4;
				out_next = 1;
			end
		end
		default: state_next = idle;
	endcase
end


endmodule