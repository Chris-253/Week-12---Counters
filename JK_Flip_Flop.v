module JK_Flip_Flop(
    input J,
    input K,
    input Clock,
    input Reset,
    output Q,
    output NotQ
);

    wire data;
    assign data = (J & NotQ) | (~K & Q);

    D_Flip_Flop jk_dff (
        .D(data),
        .Clock(Clock),
        .Reset(Reset),
        .Q(Q),
        .NOTQ(NotQ)
    );

endmodule