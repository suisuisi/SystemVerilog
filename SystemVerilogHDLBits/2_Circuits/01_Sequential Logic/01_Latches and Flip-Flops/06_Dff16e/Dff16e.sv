module top_module (
    input logic clk,
    input logic resetn,
    input logic [1:0] byteena,
    input logic [15:0] d,
    output logic [15:0] q
);

    always_ff@(posedge clk) begin
        if(!resetn) q <= '0 ;
        else begin
            case(byteena)
                2'b01:
                    q <= {q[15:8], d[7:0]};
                2'b10:
                    q <= {d[15:8], q[7:0]};
                2'b11:
                    q <= d;
                2'b00:
                    q <= q;
            endcase
        end
    end
endmodule
