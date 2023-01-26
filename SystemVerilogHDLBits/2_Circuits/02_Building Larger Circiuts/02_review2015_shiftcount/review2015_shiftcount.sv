module top_module (
    input logic clk,
    input logic shift_ena,
    input logic count_ena,
    input logic data,
    output logic [3:0] q);

always_ff @( posedge clk ) begin 
    case (1'b1)
        shift_ena: begin
            q <= {q[2:0] , data} ; 
        end 
        count_ena: begin
            q <= q - 4'd1 ;
        end
        default: begin
            q <= q ;
        end 
    endcase
end

endmodule
