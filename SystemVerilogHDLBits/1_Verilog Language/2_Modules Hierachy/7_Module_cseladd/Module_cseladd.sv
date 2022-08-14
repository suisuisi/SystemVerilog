module top_module(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] sum
);

    wire logic cout_sel;
    wire logic [15:0] upperbit_sum0,upperbit_sum1 ;
    add16 u0_add16 (
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'd0),
        .sum(sum[15:0]),
        .cout(cout_sel)
    );
    
    add16 u1_add16 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'd0),
        .sum(upperbit_sum0),
        .cout()
    );
    
    add16 u2_add16 (
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'd1),
        .sum(upperbit_sum1),
        .cout()
    );
    
    always_comb
        begin
            unique case(cout_sel)
                
                1'd0:  sum[31:16] = upperbit_sum0 ;
                1'd1:  sum[31:16] = upperbit_sum1 ;
                default: sum[31:16] = upperbit_sum0 ;
            endcase
        end
endmodule
