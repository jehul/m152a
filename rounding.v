//Rounding
`timescale 1ns/1ps

module rounding(E, F, exponent, significand, fifth_bit);

  //our output
  output reg [2:0] E;
  output reg [3:0] F;

  //our inputs
  input wire [2:0] exponent;
  input wire [3:0] significand;
  input wire fifth_bit;

  always @* begin //changes to any variables inside our always block will invoke always block

    if (fifth_bit == 1) begin

      //case 1: significand overflow, what is 1111+1, would 10000 be represented in Verilog, and then with that, we do >> to get 1000
      if (significand == 4'b1111) begin //sig will overflow must shift TODO: we have yet to test this case
        F = significand >> 1; //TODO: check with Jehu, but we can't simply shift F by 1, bc 1111 >>1 just gives us 0111, what we want is 1000, so shouldn't we add 1 first and then shift right by 1?
          if (exponent == 3'b111) //from facebook messenger: signifand = 1111, extract = 5, and we'd need to see what happens when significand overflows and if our extract would extract to 6
            E = 3'b111;
          else
            E = exponent + 1; //<- dangerous may overflow exponent
      end

      //case 2: Normal case no overflow
      else begin
        F = significand + 1; //don't we need this line to also be at line 21 above? Check with Jehu tomorrow
        E = exponent; 
      end

    end

    //No rounding sign our fifth_bit is zero, lol, can't we make this as part of the else statement of the if?
    if (fifth_bit == 0) begin
      E = exponent;
      F = significand;
    end

  end //always

//Questions for Mimi:
//Will exponent overflow? ANS: if EXP overflows, we set it back to 7
//

endmodule
