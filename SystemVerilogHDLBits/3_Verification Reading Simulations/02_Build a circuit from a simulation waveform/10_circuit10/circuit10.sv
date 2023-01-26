module top_module (
    input logic clk,
    input logic a,
    input logic b,
    output logic q,
    output logic state  );
        
always_ff @(posedge clk)begin
    if(a ~^ b)begin
        state <= a;
    end
    else begin
        state <= state ;
    end
end
    
assign q = a^b^state ;
    
endmodule