module top_module ( 
    input logic p1a, p1b, p1c, p1d, p1e, p1f,
    output logic p1y,
    input logic p2a, p2b, p2c, p2d,
    output logic p2y );

    var logic [3:0] And_Gate;
    assign And_Gate[0] = p2a & p2b;
    assign And_Gate[1] = p2c & p2d;
    assign And_Gate[2] = p1a & p1b & p1c;
    assign And_Gate[3] = p1d & p1e & p1f;
    
    assign p1y = And_Gate[2] | And_Gate[3];
    assign p2y = And_Gate[0] | And_Gate[1];
    
endmodule
