module sync_fifo #(
parameter width = 4,
parameter depth = 16,
parameter log2depth = 4
)
(
	input [width - 1:0] data_in,
	input clk, reset, rd_en, wr_en,
	output reg [width - 1:0] data_out,
	output full, empty
);

reg [width - 1 : 0] mem[depth - 1 : 0];
reg [log2depth : 0] tail, head;

always@(posedge clk) begin
	if (reset) tail <= 0;
	else begin
		if (wr_en == 1 && full == 0) begin
		mem[tail[log2depth - 1:0]] <= data_in;
		tail <= tail + 1;
		end
	end
end

always@(posedge clk) begin
	if (reset) head <= 0;
	else if (rd_en == 1 && empty == 0) begin
		data_out <= mem[head[log2depth - 1:0]];
		head <= head + 1;
	end
end

assign empty = (tail == head) ? 1:0;
assign full = (tail[log2depth]!=head[log2depth] && head[log2depth - 1:0] == tail[log2depth - 1:0]) ? 1:0;

endmodule
