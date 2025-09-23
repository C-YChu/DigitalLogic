module Comparator(A, B, A_gt_B, A_eq_B, A_lt_B);

	output 		A_gt_B; 
	output 		A_eq_B; 
	output 		A_lt_B; 
	input [3:0]	A;
	input [3:0]	B;

	assign	A_gt_B = (A > B) ? 1'b1 : 1'b0;
	assign  A_eq_B = (A == B) ? 1'b1 : 1'b0;
	assign  A_lt_B = (A < B) ? 1'b1 : 1'b0;

endmodule



