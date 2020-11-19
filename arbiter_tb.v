module arbiter_tb;

parameter num = 4;
reg clk, reset_n;
reg [num-1:0] req;
wire [num-1:0] gnt;

arbiter arbiter_tb(
.clk(clk),
.reset_n(reset_n),
.req(req),
.gnt(gnt)
);

initial begin
	clk = 1;
	reset_n = 0;
	req = 4'b0000;
	#20;
	reset_n = 1;
	req = 4'b0110;
	#10;
	req = 4'b1011;
	#10;
	req = 4'b1111;
	#10;
	req = 4'b0011;
	#10;
	req = 4'b1100;
	#10;
	req = 4'b0000;
	#10;
	req = 4'b1001;
	#10;
	req = 4'b0100;
	#10;
	req = 4'b0111;
	#10;
	req = 4'b1000;
	#10;
	req = 4'b0001;
	#10;
	req = 4'b0111;
	#10;
	req = 4'b0110;
	
end
always #5 clk = ~clk;
endmodule