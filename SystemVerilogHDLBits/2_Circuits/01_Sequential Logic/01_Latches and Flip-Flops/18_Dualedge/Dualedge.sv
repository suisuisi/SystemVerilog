module top_module (
    input logic clk,
    input logic d,
    output logic q
);
    var logic temp1,temp2 ;
    always_ff@(posedge clk) begin
        temp1 <= d^temp2 ;
    end
    
    always_ff@(negedge clk) begin
        temp2 <= d^temp1 ;
    end
    
    assign q = temp1^temp2 ;

endmodule
