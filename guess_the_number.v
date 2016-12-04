module guess_the_number(Clock, Reset, Start_button, Guess_button, switch, led, y0, y1, y2, y3);
	input [9:0] switch;
	input Clock, Reset, Start_button, Guess_button;
	
	output [0:6] y0, y1, y2, y3;
	output [9:0] led;
	
	wire [2:0] state;
	wire [3:0] OUT0, OUT1, OUT2, OUT3;
	wire [3:0] count0, count1;
	wire [3:0] rdm0, rdm1;
	wire neg;
	wire [8:0] negLFSR, rdm0LFSR, rdm1LFSR;
	
	lfsr NEG (~Reset, 9'b11001111, Clock, negLFSR);
	lfsr R0 (~Reset, 9'b110010111, Clock, rdm0LFSR);
	lfsr R1 (~Reset, 9'b010101010, Clock, rdm1LFSR);
	random_BCD BCD0(rdm0LFSR, rdm1LFSR, negLLFSR, rdm0, rdm1, neg, state, Clock);
	
	countGuesses G1 (Reset, Guess_button, count0, count1);
	outputs O1 (state, Clock, neg, rdm0, rdm1, count0, count1, OUT0, OUT1, OUT2, OUT3, led);
	buttonPress B1 (Clock, Reset, switch, Start_button, Guess_button, state, rdm0, rdm1, neg);
	
	
	encoder_7seg ss0 (OUT0, y0);
	encoder_7seg ss1 (OUT1, y1);
	encoder_7seg ss2 (OUT2, y2);
	encoder_7seg ss3 (OUT3, y3);

endmodule //guess_the_number