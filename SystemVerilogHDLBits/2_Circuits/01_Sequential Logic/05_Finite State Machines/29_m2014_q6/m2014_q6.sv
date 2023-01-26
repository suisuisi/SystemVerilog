module top_module (
    input logic clk,
    input logic reset,  // synchronous reset
    input logic w,
    output logic z);



//define state

typedef enum logic [2:0] { A = 3'b000 , B = 3'b001 ,
                           C = 3'b010 , D = 3'b011 ,
                           E = 3'b100 , F = 3'b101 
                         } state_def ;

state_def cur_state , next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (cur_state)
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


//describe state sequencer use sequential logic

always_ff @( posedge clk ) begin 
    if (reset) begin
        cur_state <= A ;
    end
    else begin
        cur_state <= next_state ;
    end
end

//describe output decoder use combinational logic

assign z = (cur_state == E) || (cur_state == F) ;
    
endmodule