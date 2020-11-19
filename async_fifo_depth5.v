module gray(
	input [4:0] code_in,
	output wire [4:0] code_out
);

assign code_out[4] = code_in[4];
assign code_out[3] = code_in[3] ^ code_in[4];
assign code_out[2] = code_in[2] ^ code_in[3];
assign code_out[1] = code_in[1] ^ code_in[2];
assign code_out[0] = code_in[0] ^ code_in[1];

endmodule

module async_fifo_depth5 #(
parameter width = 4,
parameter depth = 13,
parameter log2depth = 4
)(
	input [width - 1:0] data_in,
	input wclk, rclk, reset, rd_en, wr_en,
	output reg [width - 1:0] data_out,
	output full, empty
);

reg [log2depth:0] tail, head, tail1, head1, tail2, head2;
reg [width - 1:0] mem[15:3];
wire [log2depth:0] tail0, head0, headplus2;
reg [log2depth:0] tail_next, head_next, headplus1;

gray g1(.code_in(tail), .code_out(tail0));
gray g2(.code_in(head), .code_out(head0));
gray g3(.code_in(headplus1), .code_out(headplus2));

always@(posedge wclk) begin
	if (reset) begin 
		tail <= 3;
		head1 <= 5'b00010;
		head2 <= 5'b00010;
	end
	else begin
		head1 <= headplus2;
		head2 <= head1;
		if (wr_en == 1 && full == 0) begin
			mem[tail[log2depth - 1:0]] <= data_in;
			tail <= tail_next;
		end
	end
end

always@(posedge rclk) begin
	if (reset) begin 
		head <= 3;
		tail1 <= 5'b00010;
		tail2 <= 5'b00010;
	end
	else begin
		tail1 <= tail0;
		tail2 <= tail1;
		if (rd_en == 1 && empty == 0) begin
			data_out <= mem[head[log2depth - 1:0]];
			head <= head_next;
		end
	end
end

always@(*) begin
	if (head < 16) headplus1 = head - 3;
	else headplus1 = head + 3;
end

always@(*) begin
	if (head == 28) head_next = 3;
	else head_next = head + 1;
end

always@(*) begin
	if (tail == 28) tail_next = 3;
	else tail_next = tail + 1;
end


assign empty = (tail2 == head0)? 1:0;
assign full = (~tail0[log2depth:log2depth-1]==head2[log2depth:log2depth-1] && head2[log2depth - 2:0] == tail0[log2depth - 2:0])? 1:0;

endmodule