module top_module ( input logic clk, 
                    input logic d, 
                    output logic q 
                  );

    wire logic q1,q2;
    
    my_dff f1 (
        .clk(clk),
        .d(d),
        .q(q1)
    );
    
    my_dff f2 (
        .clk(clk),
        .d(q1),
        .q(q2)
    );
    
    my_dff f3 (
        .clk(clk),
        .d(q2),
        .q(q)
    );
    
endmodule
