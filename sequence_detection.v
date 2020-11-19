/* Design a finite state machine with two binary inputs and output.
If the input sequence is 00 01 11 10 00 01 11 then output = 10,
IF the input sequence is 00 10 11 01 00 10 11 then output = 11,
else output = 00
*/
module seq_det(
	input clk, reset_n,
	input [1:0] in,
	output reg [1:0] out
);

reg [3:0] state, state_next;
localparam s00= 4'd0, s01=4'd1, s11= 4'd2, s12= 4'd3, s13=4'd4,
s14= 4'd5, s15= 4'd6, s16=4'd7, s21= 4'd8, s22= 4'd9, s23=4'd10,
s24= 4'd11, s25= 4'd12, s26=4'd13;
reg [1:0] out_next;

always@(posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		state <= s00;
		out <= 2'b00;
	end
	else begin
		state <= state_next;
		out <= out_next;
	end
end

always@(*) begin
	out_next = out;
	state_next = 2'b00;
	case(state)
		s00: if (in==2'b00) state_next = s01;
		s01: begin
			if (in==2'b01) state_next = s11;
			else if (in==2'b10) state_next = s21;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s11: begin
			if (in ==2'b11) state_next = s12;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s12: begin
			if (in ==2'b10) state_next = s13;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s13: begin
			if (in ==2'b00) state_next = s14;
			else state_next = s00;
		end
		s14: begin
			if (in ==2'b01) state_next = s15;
			else if (in==2'b00) state_next = s01;
			else if (in==2'b10) state_next = s21;
			else state_next = s00;
		end
		s15: begin
			if (in ==2'b11) begin
				state_next = s16;
				out_next = 2'b10;
			end
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s16: begin
			out_next = 0;
			if (in==2'b10) state_next = s13;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s21: begin
			if (in ==2'b11) state_next = s22;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s22: begin
			if (in ==2'b01) state_next = s23;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s23: begin
			if (in ==2'b00) state_next = s24;
			else state_next = s00;
		end
		s24: begin
			if (in ==2'b10) state_next = s25;
			else if (in==2'b00) state_next = s01;
			else if (in==2'b01) state_next = s11;
			else state_next = s00;
		end
		s25: begin
			if (in ==2'b11) begin
				state_next = s26;
				out_next = 2'b11;
			end
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		s26: begin
			out_next = 0;
			if (in==2'b01) state_next = s23;
			else if (in==2'b00) state_next = s01;
			else state_next = s00;
		end
		default: state_next = s00;
	endcase
end

endmodule