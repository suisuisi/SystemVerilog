module top_module( 
    input logic [399:0] a, b,
    input logic cin,
    output logic cout,
    output logic [399:0] sum );

    
    wire logic [99:0] cout_temp;
    
    generate
        genvar i;
        for(i = 0; i <= 99; i = i + 1)begin:BCD_adder
            if(i == 0)begin
                bcd_fadd u1_bcd_fadd(
                    .a		(a[3:0]		),
                    .b		(b[3:0]		),
                    .cin	(cin		),
                    .sum	(sum[3:0]	),
                    .cout	(cout_temp[0]	)
                );
            end
            else begin
                bcd_fadd u2_bcd_fadd(
                    .a		(a[4 * i + 3: 4 * i]	),
                    .b		(b[4 * i + 3: 4 * i]	),
                    .cin	(cout_temp[i - 1]       ),
                    .sum	(sum[4 * i + 3: 4 * i]  ),
                    .cout	(cout_temp[i]           )
                );
            end
        end
        assign cout = cout_temp[99];
    endgenerate
                    

endmodule
