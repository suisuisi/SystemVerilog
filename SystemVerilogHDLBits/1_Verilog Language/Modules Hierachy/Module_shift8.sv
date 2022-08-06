module top_module ( 
    input logic clk, 
    input logic [7:0] d, 
    input logic [1:0] sel, 
    output logic [7:0] q 
);
    
    wire logic [7:0] q1,q2,q3;
    
    my_dff8 d1 (
        .clk(clk),
        .d(d),
        .q(q1)
    );

    my_dff8 d2 (
        .clk(clk),
        .d(q1),
        .q(q2)
    );
    
    my_dff8 d3 (
        .clk(clk),
        .d(q2),
        .q(q3)
    );
    
    always_comb
        begin
            unique case(sel)
                
                2'd0:
                    begin
                        q = d ;
                    end
                2'd1:
                    begin
                        q = q1 ;
                    end
                2'd2:
                    begin
                        q = q2 ;
                    end
                2'd3:
                    begin
                        q = q3 ;
                    end
                default:  ;
            endcase
        end
endmodule
