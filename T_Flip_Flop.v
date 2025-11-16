module T_Flip_Flop(
    input T,
    input Clock,
    input Reset,
    output Q,
    output NotQ
);
    JK_Flip_Flop toggle_jk (
        .J(T),
        .K(T),
        .Clock(Clock),
        .Reset(Reset),
        .Q(Q),
        .NotQ(NotQ)
    );

endmodule