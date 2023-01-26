module top_module (
    input logic clk,
    input logic resetn,    // active-low synchronous reset
    input logic [3:1] r,   // request
    output logic [3:1] g   // grant
); 

//define state

typedef enum logic [2:0] { A = 3'b000 , B = 3'b001 ,
                           C = 3'b010 , D = 3'b011 
                         } state_def ;

state_def cur_state , next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (cur_state)
        A: begin
           casex (r)
               3'bxx1: begin
                   next_state = B ;
               end
               3'bx10: begin
                   next_state = C ;
               end
               3'b100: begin
                   next_state = D ;
               end
               default: begin
                   next_state = A ;
               end
           endcase
        end 

        B: begin
            case (r[1])
                1'b0: begin
                    next_state = A ;
                end 
                default: begin
                    next_state = B ;
                end
            endcase
        end
        
        C: begin
            case (r[2])
                1'b0: begin
                    next_state = A ;
                end 
                default: begin
                    next_state = C ;
                end
            endcase
        end

        D: begin
            case (r[3])
                1'b0: begin
                    next_state = A ;
                end 
                default: begin
                    next_state = D ;
                end
            endcase
        end

        default: begin
            next_state = A ;
        end
    endcase
end

//describe state sequencer use sequential logic

always_ff @( posedge clk ) begin 
    if (!resetn) begin
        cur_state <= A ;
    end
    else begin
        cur_state <= next_state ;
    end
end


//describe output decoder use combinational logic

assign g[1] = (cur_state == B) ;
assign g[2] = (cur_state == C) ;
assign g[3] = (cur_state == D) ;

endmodule
