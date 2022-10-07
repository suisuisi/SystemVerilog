module top_module( 
    input  logic [254:0] in,
    output logic [7:0] out
    );

    var integer i;
    always_comb begin
        out = 8'd0;
        for(i = 0; i <= 253; i = i + 1)begin
            if (i==0)
                out = in[0] + in[1];
            else
                out = out + in[i+1] ;
        end
    end

endmodule
