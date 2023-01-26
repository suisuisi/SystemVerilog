module top_module (
    input logic [3:1] y,
    input logic w,
    output logic Y2);



//define state

parameter logic [2:0]  A = 3'b000 , B = 3'b001 ,
                       C = 3'b010 , D = 3'b011 ,
                       E = 3'b100 , F = 3'b101 ;
var logic [2:0] next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (y)
        A: begin
            next_state = w ? A : B ;
        end 

        B: begin
            next_state = w ? D : C ;
        end
        
        C: begin
            next_state = w ? D : E ;
        end

        D: begin
            next_state = w ? A : F ;
        end

        E: begin
            next_state = w ? D : E ;
        end

        F: begin
            next_state = w ? D : C ;
        end

        default: begin
            next_state = A ;
        end
    endcase
end

//describe output decoder use combinational logic

assign Y2 = next_state[1] ;
    
endmodule