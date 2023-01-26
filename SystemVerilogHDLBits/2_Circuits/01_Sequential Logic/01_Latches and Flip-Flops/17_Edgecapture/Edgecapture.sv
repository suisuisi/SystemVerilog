module top_module (
    input logic clk,
    input logic reset,
    input logic [31:0] in,
    output logic [31:0] out
);
    
    var logic [31:0] capture , in_reg ;

    always_ff@(posedge clk) begin
        if(reset) out <= '0;
        else
                  out <= capture ;
    end
    
    always_ff@(posedge clk) begin
           in_reg <= in ;
    end
    
    assign capture = ~in & in_reg | out;
endmodule
