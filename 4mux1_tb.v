module test;

reg [3:0] a, b, c, d;
reg [1:0] sel;
wire [3:0] out;

mux mux (
.a(a),
.b(b),
.c(c),
.d(d),
.sel(sel),
.out(out)
);

initial begin
a=1;b=2;c=3;d=4;
#20;
sel= 0;
#10;
sel= 1;
#10;
sel= 2;
#10;
sel= 3;
#10;
sel= 0;
a= 5;
#50;

end
endmodule