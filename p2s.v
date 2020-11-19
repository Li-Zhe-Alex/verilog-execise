module p2s #(
	parameter width = 8
)(
	input clk, reset_n, valid, 
	input [width-1:0] data_in,
	output reg data_out,
	output reg ack, sync
);

reg [2:0] cnt, cnt_next;
reg state, state_next;
parameter idle = 1'b0, data = 1'b1;
reg [width-1:0] data_reg;
 
always@(posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state <= idle;
		cnt <= 1;
	end
	else begin
		state <= state_next;
		cnt <= cnt_next;
	end
end

always@(*) begin
	data_out = 0;
	state_next = state;
	ack = 1;
	cnt_next = cnt;
	case(state)
		idle: begin
			if (valid) begin
				data_out = data_in[width-1];
				data_reg[width-1:0] = data_in[width-1:0];
				state_next = data;
				sync = 1;
				cnt_next = 1;
			end
		end
		data: begin
			if(cnt==7)begin
				cnt_next = 1;
				sync = 0;
				state_next = idle;
				ack = 0;
				data_out = data_reg[0];
			end
			else begin
				cnt_next = cnt + 1;
				sync = 0;
				state_next = data;
				ack = 0;
				data_out = data_reg[width-1-cnt];
			end
		end
	endcase
end	
endmodule