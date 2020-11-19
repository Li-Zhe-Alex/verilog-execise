module grant #(
	parameter num = 4
)
(
	input [num-1:0] base, request, 
	output [num-1:0] grant
);

wire [2*num -1:0] double_req, grant_ext;

assign double_req = {request, request};
assign grant_ext = double_req & ~(double_req-base);
assign grant = grant_ext[2*num-1:num]| grant_ext[num-1:0];

endmodule

module arbiter #(
	parameter num =4
)
(
	input clk, reset_n,
	input [num-1:0] req,
	output [num-1:0] gnt
);

reg [num-1:0] pariorty;
reg [num-1:0] pariorty_next;

always@(posedge clk) begin
	if (!reset_n) pariorty <= {{num-1{1'b0}}, 1'b1};
	else pariorty <= pariorty_next;
end

always@(*) begin
	if (|req) pariorty_next= {gnt[num-2:0], gnt[num-1]};
	else pariorty_next = pariorty;
end
grant #(
.num(num)
)
arb (
.base(pariorty),
.request(req),
.grant(gnt)
);

endmodule