module buttonPress(Clock, Reset, guess, Start_button, Guess_button, state, rdm0, rdm1, neg, count0, count1);
	input Clock, Reset, Start_button, Guess_button;
	input [9:0] guess;
	input [3:0] rdm0, rdm1, count0, count1;
	input neg;
	output reg [2:0] state;
	
	always @(posedge Clock) begin
		if (~Reset) begin
			state <= 0;
		end
		else if (~Start_button) begin
			if(count0|count1) begin
				state <= 4;
			end
			else begin
				state <= 1;
			end
		end
		else if (~Guess_button) begin
			if (neg != guess[9]) begin
				if (neg > guess[9]) // random is neg, guess is pos
					state <= 3;
				else state <= 2;  // random is pos, guess is neg
			end // Opposite sign
			
			else if (neg) begin
				if (rdm1 > guess[7:4]) begin
					state <= 3; // high
				end
				else if (rdm1 < guess[7:4]) begin
					state <= 2; // low
				end
				else if (rdm0 > guess[3:0]) begin
					state <= 3; // high
				end
				else if (rdm0 < guess[3:0]) begin
					state <= 2; // low
				end  
				else state <= 4; // equal
			end
			else if (rdm1 > guess[7:4]) begin
				state <= 2; // Low
			end
			else if (rdm1 < guess[7:4]) begin
				state <= 3; // High
			end
			else if (rdm0 > guess[3:0]) begin
				state <= 2; // Low
			end
			else if (rdm0 < guess[3:0]) begin
				state <= 3; // High
			end
			else state <= 4; // equal
		end
	end
endmodule