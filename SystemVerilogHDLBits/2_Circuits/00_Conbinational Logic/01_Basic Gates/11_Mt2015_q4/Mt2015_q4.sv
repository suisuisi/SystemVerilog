module top_module (input logic x, 
                   input logic y, 
                   output logic z);

    wire logic za;
    wire logic zb;
    
    assign za = (x ^ y) & x;
    assign zb = x ~^ y;
    assign z = (za | zb) ^ (za & zb);

endmodule
