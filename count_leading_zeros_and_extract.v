`timescale 1ns/1ps

module count_leading_zeros_and_extract (in, fifth_bit, n_exponent_bits, significand);
  input wire [11:0] in;
  output wire [3:0] significand;
  output wire [2:0] n_exponent_bits;
  output wire fifth_bit;


//assign exponent (3-bit) 3'bxxx
assign n_exponent_bits = (in[11] == 1) ? 3'b111: //0 leading zeros
                  (in[10] == 1) ? 3'b111: //1 leading zeros
                  (in[9] == 1) ? 3'b110:  //... so on
                  (in[8] == 1) ? 3'b101:
                  (in[7] == 1) ? 3'b100:
                  (in[6] == 1) ? 3'b011:
                  (in[5] == 1) ? 3'b010:
                  (in[4] == 1) ? 3'b001:
                  (in[3] == 1) ? 3'b000:
                  (in[2] == 1) ? 3'b000:
                  (in[1] == 1) ? 3'b000:
                  (in[0] == 1) ? 3'b000: 3'b000 ;

//1
//significand we can use the same procedure as exponent
assign significand = (in[11] == 1) ? 4'b1111: //0 leading zeros what should we do Mimi?
                  (in[10] == 1) ? in[10:7]:
                  (in[9] == 1) ? in[9:6]:
                  (in[8] == 1) ? in[8:5]: //3 leading 0's example <-start from here
                  (in[7] == 1) ? in[7:4]:
                  (in[6] == 1) ? in[6:3]:
                  (in[5] == 1) ? in[5:2]:
                  (in[4] == 1) ? in[4:1]:
                  (in[3] == 1) ? in[3:0]:
                  (in[2] == 1) ? in[3:0]:
                  (in[1] == 1) ? in[3:0]:
                  (in[0] == 1) ? in[3:0]: in[3:0] ;

assign fifth_bit = (in[11] == 1) ? 1: //0 leading zeros
                  (in[10] == 1) ? in[6]: //1 leading zeros
                  (in[9] == 1) ? in[5]:  //... so on
                  (in[8] == 1) ? in[4]:
                  (in[7] == 1) ? in[3]:
                  (in[6] == 1) ? in[2]:
                  (in[5] == 1) ? in[1]:
                  (in[4] == 1) ? in[0]:
                  (in[3] == 1) ? in[0]:
                  (in[2] == 1) ? in[0]:
                  (in[1] == 1) ? in[0]:
                  (in[0] == 1) ? in[0]: in[0] ;

endmodule
