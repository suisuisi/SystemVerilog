module top_module(
    input logic clk,
    input logic load,
    input logic ena,
    input logic [1:0] amount,
    input logic [63:0] data,
    output logic [63:0] q); 
    
    always_ff@(posedge clk) begin
        if(load)           q <= data ;
        else if(ena)
        begin
            case(amount)
                2'b00:     q <= {q[62:0],1'd0} ;
                2'b01:     q <= {q[55:0],8'd0} ;
                2'b10:     q <= {q[63],q[63:1]};
                2'b11:     q <= {{8{q[63]}},q[63:8]};
            endcase
        end
    end

endmodule
