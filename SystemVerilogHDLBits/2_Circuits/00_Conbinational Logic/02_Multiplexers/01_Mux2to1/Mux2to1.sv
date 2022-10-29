module top_module( 
    input logic a, b, sel,
    output logic out ); 
	
    assign out = sel ? b : a;
    
    
endmodule
