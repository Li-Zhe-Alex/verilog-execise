module s2p #(
	parameter width = 8
)(
	input clk, reset_n, sync, ack,
	input data_in,
	output reg valid,
	output [width-1:0] dataout
);
reg [width-1:0] dout, dout_next;
reg [2:0] cnt, cnt_next;
reg [1:0] state, state_next;
parameter idle = 2'b00, get = 2'b01, wait_ack = 2'b10;
reg valid_next, nload, cnt_rst, din, dou;

always@(posedge clk or negedge reset_n) begin
	if (!reset_n) begin 
		dout <= 0;
		cnt <= 0;
		state <= idle;
		valid <= 0;
	end	
	else begin 
		dout <= dout_next;
		cnt <= cnt_next;
		state <= state_next;
		valid <= valid_next;
	end
end
assign dataout = (dou)? dout:'b0;
always@(*) begin
	if (cnt_rst) dout_next[width-1:1] = 'b0;
	else if (sync) dout_next[0] = data_in; 
	else if(din) begin
		dout_next[width-1:1] = dout[width-2:0];
		dout_next[0] = data_in;
	end
	else dout_next = dout;
end

always@(*) begin
	if (cnt_rst) begin
		cnt_next = 0;
		nload = 0;
	end
	else if (cnt == 7) 
		nload = 1;
	else begin 
		cnt_next = cnt + 1;
		nload = 0;
	end
end

always@(*) begin
	state_next = state;
	cnt_rst = 0;
	dou = 0;
	valid_next = 0;
	case(state)
		idle: begin
			if (sync) begin
				state_next = get;
				cnt_rst = 1;
				valid_next = 0;
				din = 1;
			end
		end
		get: begin
			if (nload) begin
				state_next = wait_ack;
				valid_next = 1;
				din = 0;
			end
			else begin
				state_next = get;
				valid_next = 0;
				din = 1;
			end
		end
		wait_ack: begin
			if (sync) begin
				state_next = get;
				valid_next = 0;
				cnt_rst = 0;
				din = 1;
				dou = 0;
			end
			else if (ack) begin
				state_next = idle;
				valid_next = 0;
				cnt_rst = 0;
				din = 0;
				dou = 1;
			end
		end
	endcase
end

endmodule
	
