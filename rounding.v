//Rounding
`timescale 1ns/1ps

module rounding(E, F, exponent, significand, fifth_bit);
  output reg [2:0] E;
  output reg [3:0] F;
  input wire [2:0] exponent;
  input wire [3:0] significand;
  input wire fifth_bit;

  always @* begin

    if (fifth_bit == 1) begin

      //case 1: significand overflow
      if (significand == 4'b1111) begin //sig will overflow must shift
        F = significand >> 1;
		  if (exponent == 3'b111)
				E = 3'b111;
			else
				E = exponent + 1; //<- dangerous may overflow exponent
      end

      //case 2: Normal case no overflow
      else begin
        F = significand + 1;
        E = exponent;
      end

    end

    //No rounding
    if (fifth_bit == 0) begin
      E = exponent;
      F = significand;
    end

  end //always

//Questions for Mimi:
//Will exponent overflow?
//

endmodule
