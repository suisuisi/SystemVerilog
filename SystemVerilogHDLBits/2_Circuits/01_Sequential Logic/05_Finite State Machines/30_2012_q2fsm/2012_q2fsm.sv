module top_module (
    input logic clk,
    input logic reset,  // Synchronous active-high reset
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
            next_state = w ? B : A ;
        end 

        B: begin
            next_state = w ? C : D ;
        end
        
        C: begin
            next_state = w ? E : D ;
        end

        D: begin
            next_state = w ? F : A ;
        end

        E: begin
            next_state = w ? E : D ;
        end

        F: begin
            next_state = w ? C : D ;
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