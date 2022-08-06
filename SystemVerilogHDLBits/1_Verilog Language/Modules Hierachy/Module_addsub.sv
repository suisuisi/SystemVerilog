module top_module(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic sub,
    output logic [31:0] sum
);

    wire logic cout_1 ;
    wire logic [31:0] b_reverse ;
    assign b_reverse = b^{32{sub}} ;
    
    add16 u1_add16 (
        .a(a[15:0]),
        .b(b_reverse[15:0]),
        .cin(sub),
        .sum(sum[15:0]),
        .cout(cout_1)
    );
    
   
    add16 u2_add16 (
        .a(a[31:16]),
        .b(b_reverse[31:16]),
        .cin(cout_1),
        .sum(sum[31:16]),
        .cout()
    );
endmodule
