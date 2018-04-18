`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:53:29 04/16/2018 
// Design Name: 
// Module Name:    twos_comp_2_sign_mag 
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
//COMPLETED DO NOT TOUCH
module twos_comp_2_sign_mag(D, sign_magnitude, sign_bit
    );
	 input wire [11:0] D;
	 output wire [11:0] sign_magnitude;
	 output wire sign_bit;
	 
	 //I don't think we can modify anymore, this looks good,  DON'T CHANGE ANYTHING
	 assign sign_magnitude =  (D == 12'b100000000000) ? (12'b100000000000) :  
											(D[11] == 1'b1) ? (~D + 1'b1) : D ;
	 assign sign_bit = D[11];


endmodule
