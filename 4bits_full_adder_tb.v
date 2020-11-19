module test;

reg [3:0] a, b;
reg c_in;
wire [3:0] sum;
wire c_out;

full_adder adder4 (
.a(a),
.b(b),
.c_in(c_in),
.s(sum),
.c_out(c_out)
);

initial begin
a=0;
b=0;
c_in=0;
#5;
a=2;
b=3;
#5;
a=7;
b=8;
c_in=0;
#5;
c_in=1;
#5;
a=15;
b=15;
c_in=0;
#5;
c_in=1;
end

endmodule