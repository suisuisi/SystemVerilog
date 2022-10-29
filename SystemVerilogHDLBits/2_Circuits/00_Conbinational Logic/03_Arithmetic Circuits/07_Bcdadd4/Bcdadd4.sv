module top_module( 
    input logic [15:0] a, b,
    input logic cin,
    output logic cout,
    output logic [15:0] sum );
    
    wire logic [2:0] cout_temp;
    
    bcd_fadd u1_bcd_fadd(
        .a      (a[3:0]		),
        .b      (b[3:0]		),
        .cin	(cin		),
        .cout	(cout_temp[0]	),
        .sum	(sum[3:0]	)
    );
    bcd_fadd u2_bcd_fadd(
        .a      (a[7:4]		),
        .b      (b[7:4]		),
        .cin	(cout_temp[0]	),
        .cout	(cout_temp[1]	),
        .sum	(sum[7:4]	)
    );
    bcd_fadd u3_bcd_fadd(
        .a      (a[11:8]	),
        .b      (b[11:8]	),
        .cin	(cout_temp[1]	),
        .cout	(cout_temp[2]	),
        .sum	(sum[11:8]	)
    );
    bcd_fadd u4_bcd_fadd(
        .a      (a[15:12]	),
        .b      (b[15:12]	),
        .cin	(cout_temp[2]	),
        .cout	(cout		),
        .sum	(sum[15:12]	)
    );


endmodule
