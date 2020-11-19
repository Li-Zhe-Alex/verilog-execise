module test;

reg clk, reset;
wire [3:0] count;

counter counter (
.clk(clk),
.reset(reset),
.counter(count)
);

initial begin

clk = 0;
reset = 1;

#20;
reset = 0;

#300;
reset = 1;
#10;
reset = 0;
#300;

$finish;

end

always #5 clk = ~clk;

endmodule
