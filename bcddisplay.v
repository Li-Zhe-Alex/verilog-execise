module bcddisplay (
 input [3:0] in,
 output reg [6:0] display
);

always@(*) begin
	case (in) 
		4'd0: display = 7'b0111111;
		4'd1: display = 7'b0001100;
		4'd2: display = 7'b1110110;
		4'd3: display = 7'b1011110;
		4'd5: display = 7'b1011011;
		4'd6: display = 7'b1111011;
		4'd7: display = 7'b0001110;
		4'd8: display = 7'b1111111;
		4'd9: display = 7'b1011111;
		default: display = 7'b1110011;
	endcase
end
endmodule