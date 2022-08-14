module top_module ( input logic a, input logic b, output wire logic out );
    
    mod_a m1 (
        .in1(a),
        .in2(b),
        .out(out)
    );

endmodule
