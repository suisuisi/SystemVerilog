module top_module (
    input logic [6:1] y,
    input logic w,
    output logic Y2,
    output logic Y4);
    
    parameter A = 3'd1, B = 3'd2, C = 3'd3,
              D = 3'd4, E = 3'd5, F = 3'd6;
    
    assign Y2 = ~w & y[A];
    assign Y4 = w & (y[B] | y[C] | y[E] | y[F]);
    

 
endmodule