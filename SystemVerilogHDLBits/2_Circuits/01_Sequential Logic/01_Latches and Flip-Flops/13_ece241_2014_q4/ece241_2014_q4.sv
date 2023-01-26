module top_module (
    input logic clk,
    input logic x,
    output logic z
); 
    var logic Q1,Q2,Q3 ,D1,D2,D3 ;
    
    always_comb begin
        D1 = x^Q1  ;
        D2 = x&~Q2 ;
        D3 = x|~Q3 ;
        
        z  = ~(Q1|Q2|Q3) ;
    end
    
    always_ff@(posedge clk) begin
        Q1 <= D1 ;
        Q2 <= D2 ;
        Q3 <= D3 ;
    end

endmodule
