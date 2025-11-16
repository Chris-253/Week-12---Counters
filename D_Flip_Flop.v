module D_Flip_Flop(
    input D, 
    input Clock, 
    input Reset,
    output reg Q,
    output NOTQ
    );
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge Clock) begin
        if (Reset) Q <= 0;
        else Q <= D;
     end
        assign NOTQ = ~Q; 
endmodule