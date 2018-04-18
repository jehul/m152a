`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:54:26 04/16/2018 
// Design Name: 
// Module Name:    FPCVT_driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FPCVT(D, E, F, S);
	input wire [11:0] D; //12-bit twos comp
	output wire [2:0] E; //exponent
	output wire [3:0] F; //significand
	output wire S; //sign_bit
	
	
	
	
	wire [11:0] sign_mag_num;
	twos_comp_2_sign_mag convert_2_comp(.D(D), .sign_magnitude(sign_mag_num), .sign_bit(S));
	
	wire [2:0] exponent;
	wire [3:0] significand;
	wire fifth_bit;
	count_leading_zeros_and_extract  block_2(.in(sign_mag_num), .fifth_bit(fifth_bit), .n_exponent_bits(exponent), .significand(significand));
	
	rounding rounded_num(.E(E), .F(F), .exponent(exponent), .significand(significand), .fifth_bit(fifth_bit));
	
	
	
endmodule
