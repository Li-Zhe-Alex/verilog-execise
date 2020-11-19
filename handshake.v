module handshack #(
	parameter width =4
)(
	input rclk, sclk, valid, reset_n,
	input [width-1:0] data_in,
	output [width-1:0] data_out
);

wire ack, req;
wire [width-1:0] data;

handshack_s send(
.sclk(sclk),
.reset_n(reset_n),
.valid(valid),
.data_in(data_in),
.ack(ack),
.data_sout(data),
.req(req)
);

handshack_r get
(
.rclk(rclk),
.reset_n(reset_n),
.req(req),
.data_in(data),
.ack(ack),
.data_out(data_out)
);

endmodule