module top_module (
    input logic clk,
    input logic [2:0] y, 
    input logic x,
    output logic Y0,
    output logic z
);

//define state

parameter logic [2:0]  S0 = 3'b000 , S1 = 3'b001 ,
                       S2 = 3'b010 , S3 = 3'b011 ,
                       S4 = 3'b100 ;

var logic [2:0]  next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (y)
        S0: begin
            next_state = x ? S1 : S0 ;
        end 

        S1: begin
            next_state = x ? S4 : S1 ;
        end
        
        S2: begin
            next_state = x ? S1 : S2 ;
        end

        S3: begin
            next_state = x ? S2 : S1 ;
        end

        S4: begin
            next_state = x ? S4 : S3 ;
        end

        default: begin
            next_state = S0 ;
        end
    endcase
end


//describe output decoder use combinational logic

assign z = (y == S3) || (y == S4) ;
assign Y0 = (next_state == S1) || (next_state == S3) ;

endmodule
