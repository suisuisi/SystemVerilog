module top_module (
    input  logic [3:0] in,
    output logic [1:0] pos  );

    always_comb begin
        case(1'b1)
            in[0]:begin
                pos = 2'd0;
            end
            in[1]:begin
                pos = 2'd1;
            end
            in[2]:begin
                pos = 2'd2;
            end
            in[3]:begin
                pos = 2'd3;
            end
            default:begin
                pos = 2'd0;
            end
        endcase
    end 

endmodule
