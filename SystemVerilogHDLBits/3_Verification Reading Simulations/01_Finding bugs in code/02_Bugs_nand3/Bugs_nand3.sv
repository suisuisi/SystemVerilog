module top_module (input logic a, 
                   input logic b, 
                   input logic c, 
                   output logic out
                  );//

    var logic out_temp ;
    andgate inst1 (.out(out_temp) ,
                   .a(a),
                   .b(b), 
                   .c(c),
                   .d(1'd1),
                   .e(1'd1)
                  );

    assign out = ~out_temp ;
endmodule
