module top_module ( 
    input logic do_sub,
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [7:0] out,
    output logic result_is_zero
);

    always_comb begin
        case (do_sub)
          0: out = a+b;
          1: out = a-b;
        endcase

        if (out == 8'd0) begin
            result_is_zero = 1 ;
        end
        else begin
            result_is_zero = 0 ;
        end
            
    end

endmodule
