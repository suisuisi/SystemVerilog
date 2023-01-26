module top_module (
    input logic clk,    // Clocks are used in sequential circuits
    input logic d,
    output logic q );//

    // Use a clocked always_ff block
    //   copy d to q at every positive edge of clk
    //   Clocked always_ff blocks should use non-blocking assignments

    always_ff@(posedge clk) begin
        q <= d ;
    end
endmodule
