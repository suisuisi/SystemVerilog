module top_module ( 
    input logic a,b,c,d, 
    output wire logic out1,out2
);
       mod_a m1 (
        out1,
        out2,
        a,
        b,
        c,
        d
    );

endmodule
