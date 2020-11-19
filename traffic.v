module traffic (
	input clk, reset,
	output reg [3:0] lampA, lampB
);

reg [5:0] cntA, cntB, cntA_next, cntB_next;

reg [3:0] lampA_next, lampB_next;

always@(posedge clk) begin
	if (reset) begin 
		lampA <= 4'b0010;
		lampB <= 4'b0010;
		cntA  <= 55;
		cntB  <= 27;
		lampA_next <= 4'b0010;
		lampB_next <= 4'b0010;
	end else begin
		lampA <= lampA_next;
		lampB <= lampB_next;
		cntA  <= cntA_next;
		cntB  <= cntB_next;
	end
end

always@(*)begin
	if (cntA == 0)
		cntA_next = 55;
	else
		cntA_next = cntA - 1;
	case (lampA)
		4'b0010: begin
			if (cntA == 52) lampA_next = 4'b0100;
			else if (cntA == 24) lampA_next = 4'b1000;
		end
		4'b0100: begin
			if (cntA == 28) lampA_next = 4'b0010;
		end
		4'b1000: begin
			if (cntA == 16) lampA_next = 4'b0001;
		end
		4'b0001: begin
			if (cntA == 0) lampA_next = 4'b0010;
		end
		default: lampA_next = 4'b0010;
	endcase
end

always@(*)begin
	if (cntB == 0)
		cntB_next = 55;
	else
		cntB_next = cntB - 1;
	case (lampB)
		4'b0010: begin
			if (cntB == 52) lampB_next = 4'b0100;
			else if (cntB == 24) lampB_next = 4'b1000;
		end
		4'b0100: begin
			if (cntB == 28) lampB_next = 4'b0010;
		end
		4'b1000: begin
			if (cntB == 16) lampB_next = 4'b0001;
		end
		4'b0001: begin
			if (cntB == 0) lampB_next = 4'b0010;
		end
		default: lampB_next = 4'b0010;
	endcase
end

endmodule