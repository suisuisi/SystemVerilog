module top_module(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] sum
);

    wire logic [15:0] sum_temp1,sum_temp2;
    var logic cout1;
    add16 d1 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'd0),
        .sum(sum_temp1),
        .cout(cout1)
    );
    
    add16 d2 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(cout1),
        .sum(sum_temp2),
        .cout()
    );
    
    assign sum = {sum_temp2,sum_temp1} ;
endmodule
