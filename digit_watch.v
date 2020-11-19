module watch (
	input clk, reset, clr, pause,
	output reg [4:0] hour,
	output reg [5:0] minite, second
);

reg [6:0] cnt, cnt_next;
reg [4:0] hour_next;
reg [5:0] minite_next, second_next;

always@(posedge clk) begin
	if (reset) begin
		hour <= 0;
		minite <= 0;
		second <= 0;
		cnt <= 0;
	end 
	else if (!pause) begin
		hour <= hour_next;
		minite <= minite_next;
		second <= second_next;
		cnt <= cnt_next;
		end	
end

always@(*) begin
	if (cnt == 99) begin
		cnt_next = 0;
		if (second == 59) begin
			second_next = 0;
			if (minite == 59) begin
				minite_next = 0;
				if (hour == 23) begin
					hour_next = 0;
				end else begin
					hour_next = hour + 1;
				end
			end
			else begin
				minite_next = minite + 1;
			end
		end
		else begin
			second_next = second + 1;
		end
	end
	else begin
		cnt_next = cnt + 1;
		second_next = second;
		minite_next = minite;
		hour_next = hour;
	end
end

endmodule