`timescale 1ns / 1ps

module stimulus;

    // Inputs
    reg clk;
    reg [3:0] a, b, c;
    reg [2:0] sel;

    // Output
    wire [4:0] result;

    // Instantiate the ALU module
    ALU alu_instance (
        .clk(clk),
        .a(a),
        .b(b),
        .c(c),
        .sel(sel),
        .result(result)
    );

    // Clock generation
    initial begin
        clk = 0;
        a = 4'b0101; b = 4'b0111; c = 4'b0001;
        forever #10 clk = ~clk; // Generate a clock with a period of 20ns
    end

    // Test cases
    initial begin
        // Initialize inputs

        // Apply test cases
        #10; sel = 3'b000; 
        #20; sel = 3'b111; 
        #20; sel = 3'b100; 
        #20; sel = 3'b101; 
        #20; sel = 3'b011; 
        #20; sel = 3'b010; 
        #20; sel = 3'b001; 
        #20; sel = 3'b110; 
        #20; 
        $finish; // End simulation
    end

    // Optional: Monitor for changes and print
    initial begin
        $monitor("Time = %d, a = %d, b = %d, c = %d, sel = %b, result = %d", 
                 $time, a, b, c, sel, result);
    end

endmodule
