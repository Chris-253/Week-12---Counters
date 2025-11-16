module top(
    input btnU,
    input btnC,
    output [6:0] led
);

    // Ripple counter outputs
    wire r1;
    wire r2;
    wire r3;

    // Modulo counter outputs
    wire m0;
    wire m1;
    wire m2;
    wire mdiv;

    // Ripple counter
    ripple_counter rc(
        .clk(btnC),
        .reset(btnU),
        .stage1(r1),
        .stage2(r2),
        .stage3(r3)
    );

    // Modulo counter
    modulo_counter mc(
        .clk(btnC),
        .reset(btnU),
        .state0(m0),
        .state1(m1),
        .state2(m2),
        .divided(mdiv)
    );

    // LED assignments
    assign led[0] = r1;
    assign led[1] = r2;
    assign led[2] = r3;
    assign led[3] = m0;
    assign led[4] = m1;
    assign led[5] = m2;
    assign led[6] = mdiv;

endmodule
