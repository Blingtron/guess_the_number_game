module countGuesses (Reset, Guess_button, count0, count1);
	input Reset, Guess_button;
	output reg [3:0] count0, count1;
	
	always@(negedge Guess_button, negedge Reset) begin
		if (~Reset) begin
			count0 <= 4'b0000;
			count1 <= 4'b0000;
		end
		else if (~Guess_button) begin
			if (count0 == 4'b1001) begin
				count0 <= 4'b0000;
				if (count1 == 4'b1001) begin
					count1 <= 4'b0000;
				end
				else begin
					count1 <= count1 + 1'b1;
				end
			end
			else begin
				count0 <= count0 + 1'b1;
			end
		end
	end
endmodule