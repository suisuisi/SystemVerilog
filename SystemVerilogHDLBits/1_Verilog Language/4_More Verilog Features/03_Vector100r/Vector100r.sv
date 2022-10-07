module top_module( 
    input  logic [99:0] in,
    output logic [99:0] out
);

    var integer i;
    always_comb begin
        for(i = 0; i <= 99; i = i + 1)begin
            out[i] = in[99 - i];
        end
    end

endmodule
