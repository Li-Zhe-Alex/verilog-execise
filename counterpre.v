module counterpre (
	input clk, reset, load,
	input [3:0] data_in,
	output reg [3:0] count
);

always@(posedge clk) begin
	if (reset) count <= 1'b0;
	else if (load) count <= data_in;
	else	count <= count +1 ;
end
endmodule
