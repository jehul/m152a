`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:14:51 04/16/2018
// Design Name:   FPCVT_driver
// Module Name:   C:/Users/152/Desktop/FPCVT/FPCV_TB.v
// Project Name:  FPCVT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCVT_driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FPCV_TB;

	// Outputs
	reg [11:0] D;
	wire [2:0] E;
	wire [3:0] F;
	wire  S; //expect 1000000000000
	

	// Instantiate the Unit Under Test (UUT)
	FPCVT_driver uut (
		.D(D), .E(E), .F(F), .S(S)
	);
	
	

	initial begin
		// Initialize Inputs
		D = 12'b000101110000;
		
		
		// Wait 100 ns for global reset to finish
		#200;
        
		// Add stimulus here

	end
      
endmodule

