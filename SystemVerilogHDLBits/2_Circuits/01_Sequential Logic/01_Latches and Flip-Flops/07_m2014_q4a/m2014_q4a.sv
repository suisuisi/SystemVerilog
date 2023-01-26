module top_module (
    input logic d, 
    input logic ena,
    output logic q);

    always_latch begin
        if(ena) q <= d ;
        else
                q <= q ;
    end
endmodule
