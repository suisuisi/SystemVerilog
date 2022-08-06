module top_module ( 
    input logic a, 
    input logic b, 
    input logic c,
    input logic d,
    output wire logic out1,
    output wire logic out2
);
  
    mod_a m1 (
        .out1(out1),
        .out2(out2),
        .in1(a),
        .in2(b),
        .in3(c),
        .in4(d)
    );
endmodule
