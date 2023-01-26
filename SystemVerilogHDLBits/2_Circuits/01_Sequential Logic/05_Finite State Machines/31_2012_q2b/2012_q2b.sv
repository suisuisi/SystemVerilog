module top_module (
    input logic [5:0] y,
    input logic w,
    output logic Y1,
    output logic Y3
);
 
    parameter A = 3'd0, B = 3'd1, C = 3'd2,
              D = 3'd3, E = 3'd4, F = 3'd5;
    
    assign Y1 = w & y[A];
    assign Y3 = ~w & (y[B] | y[C] | y[E] | y[F]);
 
endmodule