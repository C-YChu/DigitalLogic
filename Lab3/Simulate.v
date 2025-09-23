module Simulate;
  
	reg 	[3:0]	A;
	reg 	[3:0]	B;
	
	wire 		A_gt_B; 
	wire 		A_eq_B; 
	wire 		A_lt_B; 

	Comparator comparator(A, B, A_gt_B, A_eq_B, A_lt_B);

	initial  
	begin
		A = 4'b0000;
		B = 4'b0000;
	
	end

	genvar i;
	for(i= 0; i<16 ;i=i+1 )begin
		A = A+1'b1;
		B = B-1'b1;
	end

	initial
		$dumpvars;


endmodule