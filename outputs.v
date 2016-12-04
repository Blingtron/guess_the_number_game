module outputs (state, Clock, neg, rdm0, rdm1, count0, count1, OUT0, OUT1, OUT2, OUT3, led);
	input [2:0] state;
	input Clock;
	input neg;
	input [3:0] rdm1, rdm0;
	input [3:0] count0, count1;
	output reg [3:0] OUT0, OUT1, OUT2, OUT3;
	output reg [9:0] led;
	
	always @(posedge Clock) begin
		// Idle/Reset
		if (state == 0) begin
			//Blank/Zeros
			OUT0 <= 4'b0;
			OUT1 <= 4'b0;
			OUT2 <= 4'b0;
			OUT3 <= 4'b0;
			led[9:0] = 10'b0;
		end
		else if (state == 1) begin
			//PLAY
			OUT0 <= 4'b1101;
			OUT1 <= 4'b1100;
			OUT2 <= 4'b1011;
			OUT3 <= 4'b1010;
		end
		else if (state == 2) begin
			//LO
			OUT0 <= 4'b1111;
			OUT1 <= 4'b0000;
			OUT2 <= 4'b1011;
			OUT3 <= 4'b1111;
		end
		else if (state == 3) begin
			//HI
			OUT0 <= 4'b1111;
			OUT1 <= 4'b0001;
			OUT2 <= 4'b1110;
			OUT3 <= 4'b1111;
		end
		else if (state == 4) begin
			// : RR## : RR - random, ## - num guesses
			OUT0 <= count0;
			OUT1 <= count1;
			OUT2 <= rdm0;
			OUT3 <= rdm1;
			led[9:0] <= {neg, 1'b0, rdm1[3:0], rdm0[3:0]};
		end
	end
endmodule