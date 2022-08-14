module top_module (
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] sum
);//
    
    wire logic cout ;
    
    add16 u1_add16 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'd0),
        .sum(sum[15:0]),
        .cout(cout)
                  );

    add16 u2_add16 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout),
        .sum(sum[31:16]),
        .cout()
                  );

endmodule

module add1 ( input logic a, 
              input logic b, 
              input logic cin, 
              output logic sum,
              output logic cout 
            );

// Full adder module here
    assign {cout,sum} = a+b+cin ;
endmodule
