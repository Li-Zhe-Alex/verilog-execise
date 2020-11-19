module range_change(
	input clk, reset, clr, cnt_over, cnt_low,
	output reg [1:0] out,
	output reg c_out
);

reg [5:0] state, state_next;
parameter start_f100k = 6'b000001,
		  cnt_f100k = 6'b000010,
		  start_f10k = 6'b000100,
		  cnt_f10k = 6'b001000,
		  start_f1k = 6'b010000,
		  cnt_f1k = 6'b100000;
		  
always@(posedge clk) begin
	if (reset) state <= start_f10k;
	else state <= state_next;
end

always@(*) begin
	if (clr) state_next <= start_f10k;
	else
		case (state)
			start_f100k: state_next = cnt_f100k;
			cnt_f100k: begin
				if (cnt_low) state_next <= start_f10k;
				else state_next <= cnt_f100k;
			end
			start_f10k: state_next = cnt_f10k;
			cnt_f10k: begin
				if (cnt_over) state_next = start_f100k;
				else if (cnt_low) state_next = start_f1k;
			end
			start_f1k : state_next = cnt_f1k;
			cnt_f1k: begin
				if (cnt_over) state_next = start_f10k;
				else state_next = cnt_f1k;
			end
			default: state_next = start_f10k;
		endcase
end

always@(*) begin
	case (state)
		start_f100k: begin c_out = 1; out = 2'b00; end
		cnt_f100k: begin c_out = 0; out = 2'b00; end
		start_f10k: begin c_out = 1; out = 2'b01; end
		cnt_f10k: begin c_out = 0; out = 2'b01; end
		start_f1k: begin c_out = 1; out = 2'b10; end
		cnt_f1k: begin c_out = 0; out = 2'b10; end
		default: begin c_out = 1; out = 2'b11; end
	endcase
end

endmodule