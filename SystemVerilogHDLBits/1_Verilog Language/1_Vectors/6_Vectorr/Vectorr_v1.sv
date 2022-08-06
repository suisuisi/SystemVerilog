module top_module( 
    input  logic [7:0] in,
    output logic [7:0] out
);
    parameter count = 'd8; 

    var integer i;

    always_comb begin
        for(i = 0; i < count; i = i + 1)begin
            out[i] = in[count - i - 1];
        end
    end
    
endmodule
