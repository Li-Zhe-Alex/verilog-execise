module glitch (
	input clka, clkb, rst_n, en,
	output clk_out
);

reg clka1, clkb1;
wire outa, outb;

always@(negedge clka or negedge rst_n) begin
	if (!rst_n) clka1 <= 1'b0;
	else clka1 <= en & ~clkb1;
end

always@(negedge clkb or negedge rst_n) begin
	if (!rst_n) clkb1 <= 1'b0;
	else clkb1 <= ~en & ~clka1;
end
assign outa = clka&clka1;
assign outb = clkb&clkb1;
assign clk_out = outa | outb;

endmodule