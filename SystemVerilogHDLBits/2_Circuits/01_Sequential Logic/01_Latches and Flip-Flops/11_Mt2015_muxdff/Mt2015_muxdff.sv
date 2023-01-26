module top_module (
	input logic clk,
	input logic L,
	input logic r_in,
	input logic q_in,
	output logic Q);

    always_ff@(posedge clk) begin
        if(L) Q <= r_in ;
        else  Q <= q_in ;
    end
endmodule
