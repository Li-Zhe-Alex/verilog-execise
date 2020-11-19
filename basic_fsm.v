module basic_fsm (
	input clk, reset, start,step1, step2, step3,
	output reg [2:0] out
);

reg [1:0] state, state_next;
parameter state0 = 0, state1 = 2'b01, state2 = 2'b10, state3 = 2'b11;

always@(posedge clk or posedge reset) begin
	if (reset) state <= state0;
	else state <= state_next;
end

always@(*) begin
	case (state)
		state0: begin
			if (start)
				state_next = state1;
			else
				state_next = state0;
		end
		state1: begin
			if (step1)
				state_next = state2;
			else
				state_next = state1;
		end
		state2: begin
			if (step2)
				state_next = state3;
			else
				state_next = state2;
		end
		state3: begin
			if (step3)
				state_next = state1;
			else
				state_next = state3;
		end
		default: state_next = state0;
	endcase
end

always@(*) begin
	case(state)
		state0: out = 3'b000;
		state1: out = 3'b001;
		state2: out = 3'b010;
		state3: out = 3'b100;
		default: out = 3'b000;
	endcase
end
endmodule