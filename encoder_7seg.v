module encoder_7seg (x,y);
	input [3:0] x;
	output reg [0:6] y;

	always@(x)
	begin
		case(x)
			0: y=7'b0000001; 
			1: y=7'b1001111;
			2: y=7'b0010010;
			3: y=7'b0000110;
			4: y=7'b1001100;
			5: y=7'b0100100;
			6: y=7'b0100000;
			7: y=7'b0001111;
			8: y=7'b0000000;
			9: y=7'b0000100;
			
			10: y=7'b0011000; //P
			11: y=7'b1110001;	//L
			12: y=7'b0001000;	//A
			13: y=7'b1000100;	//Y
			14: y=7'b1001000;	//H
			15: y=7'b1111110;	//-
			default: y=7'b0000001;
		endcase
	end
endmodule