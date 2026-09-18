//Phillip Nguyen
module seven_segment_decoder (
    input wire A, B, C,
    output wire a, b, c, d, e, f, g
);

    // wires and nots
    wire nA, nB, nC;
    not g1(nA, A);
    not g2(nB, B);
    not g3(nC, C);

    // Segment a = A + A'·C'
    wire a1;
    and g4(a1, nA, nC);
    or  g5(a, A, a1);

    // Segment b = A' + B'·C' + A·B·C
    wire b1, b2, b3;
    and g6(b1, nB, nC);
    and g7(b2, A, B, C);
    or  g8(b, nA, b1, b2);

    // Segment c = A'·B' + A·C + A'·C'
    wire c1, c2, c3;
    and g9(c1, nA, nB);
    and g10(c2, A, C);
    and g11(c3, nA, nC);
    or  g12(c, c1, c2, c3);

    // Segment d = B·C' + A'·C + A·B'·C
    wire d1, d2, d3;
    and g13(d1, B, nC);
    and g14(d2, nA, C);
    and g15(d3, A, nB, C);
    or  g16(d, d1, d2, d3);

    // Segment e = C'·B + A'·B'·C'
    wire e1, e2;
    and g17(e1, nC, B);
    and g18(e2, nA, nB, nC);
    or  g19(e, e1, e2);

    // Segment f = A·(B'+C') + A'·B'·C'
    wire f1, f2, f3;
    or  g20(f1, nB, nC);
    and g21(f2, A, f1);
    and g22(f3, nA, nB, nC);
    or  g23(f, f2, f3);

    // Segment g = A'·B + A·C'
    wire g1_temp, g2_temp;
    and g24(g1_temp, nA, B);
    and g25(g2_temp, A, nC);
    or  g26(g, g1_temp, g2_temp);

endmodule
