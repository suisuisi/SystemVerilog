module top_module ( 
    input clk, 
    input logic [7:0] d, 
    input logic [1:0] sel, 
    output logic [7:0] q 
);
    logic [7:0]q0,q1,q2;
    
    my_dff8 d0 (
        .clk(clk),
        .d(d),
        .q(q0)
    );

    my_dff8 d1 (
        .clk(clk),
        .d(q0),
        .q(q1)
    );

    my_dff8 d2 (
        .clk(clk),
        .d(q1),
        .q(q2)
    );
    
    always_comb begin
        unique	case(sel)
    		2'b00:
                q	=	d;
            2'b01:
                q	=	q0;
            2'b10:
            	q	=	q1;
            2'b11:
            	q	=	q2;
            default:
                q	=	2'bzz;
        endcase
    end
    
    
endmodule
