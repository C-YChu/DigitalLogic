// module DFF with synchronous reset
module DFF(q, d, clk, reset);

output q; 
input d, clk, reset;
reg q;

always @(posedge reset or negedge clk)
if (reset)
		q = 1'b0;
else
		q = d;

endmodule

module Shift(q, clk, reset);

output [7:0] q; 
input clk, reset;

// Design program by yourself.
DFF DFF0(q[0], 1'b1, clk, reset);
DFF DFF1(q[1], q[0], clk, reset);
DFF DFF2(q[2], q[1], clk, reset);
DFF DFF3(q[3], q[2], clk, reset);
DFF DFF4(q[4], q[3], clk, reset);
DFF DFF5(q[5], q[4], clk, reset);
DFF DFF6(q[6], q[5], clk, reset);
DFF DFF7(q[7], q[6], clk, reset);






endmodule





