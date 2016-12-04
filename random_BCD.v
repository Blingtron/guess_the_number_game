module random_BCD(Q0, Q1, Qneg, rnd0, rnd1, rndneg, state, Clock);
	input [8:0]Q0, Q1, Qneg;
	input [2:0]state;
	input Clock;
	output reg [3:0] rnd0, rnd1;	
	output reg rndneg;
	
	always @(posedge Clock) begin
	if (state == 0) begin
		
		if (Q0[8:5] <= 4'd9) begin 
			rnd0 <= Q0[8:5];
			rndneg <= Q0[0];
		end
		if (Q1[8:5] <= 4'd9) begin
			rnd1 <= Q1[8:5];
			rndneg <= Q1[0];
		end
		
	end
	end
endmodule // random_BCD