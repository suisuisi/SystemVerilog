module top_module (
    input logic clock,
    input logic a,
    output logic p,
    output logic q );
    

    assign p = clock ? a : p ;
    
    always_ff @(negedge clock)begin
        q <= p;
    end
 
endmodule