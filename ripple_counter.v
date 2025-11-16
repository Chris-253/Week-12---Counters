module ripple_counter(
    input clk,
    input reset,
    output stage1,
    output stage2,
    output stage3
);

    // First stage T flip-flop
    T_Flip_Flop tff1(
        .T(1'b1),
        .Clock(clk),
        .Reset(reset),
        .Q(stage1),
        .NotQ()
    );

    // Second stage T flip-flop
    T_Flip_Flop tff2(
        .T(1'b1),
        .Clock(stage1),
        .Reset(reset),
        .Q(stage2),
        .NotQ()
    );

    // Third stage T flip-flop
    T_Flip_Flop tff3(
        .T(1'b1),
        .Clock(stage2),
        .Reset(reset),
        .Q(stage3),
        .NotQ()
    );

endmodule
