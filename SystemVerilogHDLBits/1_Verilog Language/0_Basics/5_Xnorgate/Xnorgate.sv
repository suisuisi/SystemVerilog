module top_module( 
    input logic a, 
    input logic b, 
    output logic out );
		
    assign out =  ~( a ^ b) ;
    
endmodule
