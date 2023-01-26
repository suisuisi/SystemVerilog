module top_module(
    input logic clk,
    input logic load,
    input logic [511:0] data,
    output logic [511:0] q ); 

    
    always_ff@(posedge clk) begin
        if(load)   q <= data ;
        else       q <= {1'b0,q[511:1]} ^ {q[510:0],1'b0} ;
    end
endmodule
