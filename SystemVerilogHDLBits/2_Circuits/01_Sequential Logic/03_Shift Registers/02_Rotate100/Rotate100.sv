module top_module(
    input logic clk,
    input logic load,
    input logic [1:0] ena,
    input logic [99:0] data,
    output logic [99:0] q); 
    
    always_ff@(posedge clk) begin
        if(load)             q <= data ;
        else begin
            case(ena)
                2'b00,2'b11: q <= q ;
                2'b01      : q <= {q[0],q[99:1]} ;
                2'b10      : q <= {q[98:0],q[99]};
            endcase
        end
    end

endmodule
