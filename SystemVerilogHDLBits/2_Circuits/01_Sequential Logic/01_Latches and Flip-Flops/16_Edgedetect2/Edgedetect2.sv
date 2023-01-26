module top_module (
    input logic clk,
    input logic [7:0] in,
    output logic [7:0] anyedge
);

    wire logic [7:0] in_reg,edge_flag ;
    
    always_ff@(posedge clk) begin
        in_reg <= in ;
    end
    
    assign edge_flag = in&~in_reg | ~in&in_reg ;
    
    always_ff@(posedge clk) begin
        anyedge <= edge_flag ;
    end
endmodule
