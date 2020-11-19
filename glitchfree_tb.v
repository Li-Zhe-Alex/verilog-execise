module glitch_tb;

reg clka, clkb, rst_n, en;
wire clkout;

glitch test(
.clka(clka),
.clkb(clkb),
.rst_n(rst_n),
.en(en),
.clk_out(clkout)
);

initial begin
	clka = 1;
	clkb = 1;
	rst_n = 0;
	#10;
	rst_n = 1;
	en = 0;
	#55;
	en = 1;
	#50;
	en = 0;

end
always #5 clka = ~clka;
always #12 clkb = ~clkb;
endmodule