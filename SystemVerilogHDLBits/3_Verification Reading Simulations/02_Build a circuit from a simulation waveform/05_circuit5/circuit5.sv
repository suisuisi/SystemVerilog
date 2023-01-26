
module top_module (
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [3:0] c,
    input logic [3:0] d,
    input logic [3:0] e,
    output logic [3:0] q );

always_comb begin
    case(c)
            0:begin
                q = b;
            end
            1:begin
                q = e;
            end
            2:begin
                q = a;
            end
            3:begin
                q = d;
            end
            default:begin
                q = 4'hf;
            end
        endcase
end

endmodule    
