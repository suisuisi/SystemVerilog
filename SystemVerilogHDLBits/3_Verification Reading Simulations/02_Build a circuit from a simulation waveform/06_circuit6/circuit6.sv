module top_module (
    input logic [2:0] a,
    output logic [15:0] q ); 
    
    always_comb begin
        case(a)
            0:begin
                q = 16'h1232;
            end
            1:begin
                q = 16'haee0;
            end
            2:begin
                q = 16'h27d4;
            end
            3:begin
                q = 16'h5a0e;
            end
            4:begin
                q = 16'h2066;
            end
            5:begin
                q = 16'h64ce;
            end
            6:begin
                q = 16'hc526;
            end
            7:begin
                q = 16'h2f19;
            end
        endcase
    end
 
endmodule