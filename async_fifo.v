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

module async_fifo #(
parameter width = 4,
parameter depth = 16,
parameter log2depth = 4
)(
	input [width - 1:0] data_in,
	input wclk, rclk, reset, rd_en, wr_en,
	output reg [width - 1:0] data_out,
	output full, empty
);

reg [log2depth:0] tail, head, tail1, head1, tail2, head2;
reg [width - 1:0] mem[depth - 1:0];
wire [log2depth:0] tail0, head0;

gray g1(.code_in(tail), .code_out(tail0));
gray g2(.code_in(head), .code_out(head0));

always@(posedge wclk) begin
	if (reset) begin 
		tail <= 0;
		head1 <= 0;
		head2 <= 0;
	end
	else begin
		head1 <= head0;
		head2 <= head1;
		if (wr_en == 1 && full == 0) begin
			mem[tail[log2depth - 1:0]] <= data_in;
			tail <= tail + 1;
		end
	end
end

always@(posedge rclk) begin
	if (reset) begin 
		head <= 0;
		tail1 <= 0;
		tail2 <= 0;
	end
	else begin
		tail1 <= tail0;
		tail2 <= tail1;
		if (rd_en == 1 && empty == 0) begin
			data_out <= mem[head[log2depth - 1:0]];
			head <= head + 1;
		end
	end
end

assign empty = (tail2 == head0)? 1:0;
assign full = (~tail0[log2depth:log2depth-1]==head2[log2depth:log2depth-1] && head2[log2depth - 2:0] == tail0[log2depth - 2:0])? 1:0;

endmodule