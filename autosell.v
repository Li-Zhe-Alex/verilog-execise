module autosell(
	input clk, reset_n, in5, in10,
	output reg out, refuse, 
	output reg back5
);
reg out_next, refuse_next, back5_next;
reg [1:0] state, state_next;
parameter idle = 0, enough = 1, finish = 2;

reg [1:0] cnt5, cnt10, cnt5_next, cnt10_next;

always@(posedge clk) begin
	if(!reset_n) begin
		state <= idle;
		cnt5 <= 0;
		cnt10 <= 0;
		out <= 0;
		refuse <= 0;
		back5 <= 0;
		cnt5_next <= 0;
		cnt10_next <= 0;
		back5_next <= 0;
	end else begin
		state <= state_next;
		cnt5 <= cnt5_next;
		cnt10 <= cnt10_next;
		out <= out_next;
		refuse <= refuse_next;
		back5 <= back5_next;
	end
end

always@(*) begin
	if (in5) begin
		if (cnt5 == 3) cnt5_next = 3;
		else cnt5_next = cnt5 + 1;
	end
	else if (in10) begin
		if (cnt10 == 2) cnt10_next = 2;
		else cnt10_next = cnt10 + 1;
	end
	else if (state == finish) begin
		cnt5_next = 0;
		cnt10_next = 0;
	end
end

always@(*) begin
	case(state)
		idle: begin 
			if (cnt10 > 1 || cnt5 > 2 || (cnt10 > 0 && cnt5 > 0)) begin
				state_next = enough;
				refuse_next = 1;
			end
		end
		enough: begin
			out_next = 1;
			state_next = finish;
			if (cnt10 == 2 || (cnt10 == 1 && cnt5 == 2)) 
				back5_next = 1;
		end
		finish: begin
			state_next = idle;
			back5_next = 1'b0;
			refuse_next = 0;
			out_next = 0;
		end
		default: state_next = idle;
	endcase
end


endmodule

