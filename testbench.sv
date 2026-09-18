module testbench;
    reg A, B, C;
    wire a, b, c, d, e, f, g;

    // Instantiate the decoder
    seven_segment_decoder uut (
        .A(A), .B(B), .C(C),
        .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
    );

    integer i;

    initial begin
        $display(" A B C | a b c d e f g ");
        $display("----------------------");
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, C} = i;
            #1; // Wait 1 time unit for output to stabilize
            $display(" %b %b %b | %b %b %b %b %b %b %b", A, B, C, a, b, c, d, e, f, g);
        end
        $finish;
    end
endmodule
