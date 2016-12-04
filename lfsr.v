module lfsr (reset, seed, Clock, Q);
	input Clock, reset;
	input [8:0] seed;
	output reg [8:0] Q;
	
	assign feedback = Q[8] ^ Q[4];
	
	initial begin
		Q <= seed;
	end
	
	always@(posedge Clock) begin
			if(reset)
				Q <= seed;
			else
				Q[8:0] <= {feedback, Q[8:1]};
	end
endmodule