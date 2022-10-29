module top_module( 
    input logic [2:0] a, b,
    input logic cin,
    output logic [2:0] cout,
    output logic [2:0] sum 
    );
    
    
    

    
    full_adder f_adder_u1 (.a(a[0]),
                      .b(b[0]), 
                      .cin(cin),
                      .cout(cout[0]), 
                      .sum(sum[0])
                     ); 
    
    full_adder f_adder_u2 (.a(a[1]),
                          .b(b[1]), 
                          .cin(cout[0]), 
                          .cout(cout[1]), 
                          .sum(sum[1]) 
                         ); 
    
    full_adder f_adder_u3 (.a(a[2]), 
                          .b(b[2]), 
                          .cin(cout[1]), 
                          .cout(cout[2]), 
                          .sum(sum[2]) 
                         ); 

    
endmodule
module full_adder( input logic a, 
                   input logic b, 
                   input logic cin, 
                   output logic cout, 
                   output logic sum
                   ); 
    assign sum = a ^ b ^ cin; 
    assign cout= a & b | cin&(a^b);   
endmodule