module modulo_counter(
    input clk,
    input reset,
    output state0,
    output state1,
    output state2,
    output divided
);

    // Current state bits
    wire q0;
    wire q1;
    wire q2;

    // Incrementer outputs
    wire sum0;
    wire sum1;
    wire sum2;

    wire c0;
    wire c1;

    // Check for count 5 (binary 101)
    wire at_five;
    assign at_five = (q2 == 1'b1) && (q1 == 1'b0) && (q0 == 1'b1);

    // Next state logic
    wire next0 = at_five ? 1'b0 : sum0;
    wire next1 = at_five ? 1'b0 : sum1;
    wire next2 = at_five ? 1'b0 : sum2;

    // 3-bit incrementer
    full_adder fa0(
        .A(q0),
        .B(1'b1),
        .Cin(1'b0),
        .Y(sum0),
        .Cout(c0)
    );

    full_adder fa1(
        .A(q1),
        .B(1'b0),
        .Cin(c0),
        .Y(sum1),
        .Cout(c1)
    );

    full_adder fa2(
        .A(q2),
        .B(1'b0),
        .Cin(c1),
        .Y(sum2),
        .Cout()
    );

    // State storage with reset
    D_Flip_Flop dff0(
        .D(next0),
        .Clock(clk),
        .Reset(reset),
        .Q(q0),
        .NOTQ()
    );

    D_Flip_Flop dff1(
        .D(next1),
        .Clock(clk),
        .Reset(reset),
        .Q(q1),
        .NOTQ()
    );

    D_Flip_Flop dff2(
        .D(next2),
        .Clock(clk),
        .Reset(reset),
        .Q(q2),
        .NOTQ()
    );

    // Toggle output when at count 5
    T_Flip_Flop div_tff(
        .T(at_five),
        .Clock(clk),
        .Reset(reset),
        .Q(divided),
        .NotQ()
    );

    // Connect state outputs
    assign state0 = q0;
    assign state1 = q1;
    assign state2 = q2;

endmodule
