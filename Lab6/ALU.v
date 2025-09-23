module ALU (
    input clk,
    input [3:0] a, b, c,
    input [2:0] sel,
    output reg [4:0] result
);

always @(posedge clk) begin
    case (sel)
        3'b000: result = (a > b) ? ((a > c) ? a : c) : ((b > c) ? b : c); // max(a, b, c)
        3'b001: result = a + b; // a + b
        3'b010: result = a - b; // a - b
        3'b011: result = (b != 0) ? a / b : 0; // a / b, avoid divide by zero
        3'b100: result = (b != 0) ? a % b : 0; // a % b, avoid modulo by zero
        3'b101: result = a << 1; // a << 1
        3'b110: result = a >> 1; // a >> 1
        3'b111: result = (a > b) ? 1 : 0; // a > b, true or false
        default: result = 0; // default case
    endcase
end

endmodule