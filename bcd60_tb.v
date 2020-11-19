module test;

reg clk,reset,load,c_in;
reg [7:0] data;
wire [7:0] q_out;
wire c_out;

bcd60 bcd (
.clk(clk),
.reset(reset),
.load(load),
.c_in(c_in),
.data(data),
.q_out(q_out),
.c_out(c_out)
);

always #5 clk = ~clk;

initial begin
clk = 0;
reset = 1;
c_in = 0;
#20;
reset = 0;
c_in = 1;
#630;
load = 1;
data = 8'h53;
#10;
load = 0;
#150;
reset = 1;
#10;
reset = 0;
#40;


end
endmodule