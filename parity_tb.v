module parity_tb;
reg [5:0] data;
wire even, odd;

parity_check parity(
.data_in(data),
.even(even),
.odd(odd)
);

initial begin
	#10;
	data = 6'b111000;
	#10;
	data = 6'b111010;
	#10;
	data = 6'b000000;
	#10;
	data = 6'b000111;
	#10;
	data = 6'b111111;
	#10;
	data = 6'b100011;
	#10;
	data = 6'b010101;
	#10;
	data = 6'b110011;
	#10;
	data = 6'b100100;
	#10;
	data = 6'b110001;
	#10;
	data = 6'b010011;
end
endmodule