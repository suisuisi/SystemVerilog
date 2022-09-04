module top_module (
    input logic [15:0] scancode,
    output logic left,
    output logic down,
    output logic right,
    output logic up  
    ); 

     always_comb begin
        left = 1'b0;
        down = 1'b0;
        right = 1'b0;
        up = 1'b0;
        unique0 case(scancode)
            16'he06b:left = 1'b1;

            16'he072:down = 1'b1;

            16'he074:right = 1'b1;

            16'he075:up = 1'b1;

            default: ;
        endcase
    end

endmodule
