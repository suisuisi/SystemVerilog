module top_module(
    input logic clk,
    input logic areset,    // Freshly brainwashed Lemmings walk left.
    input logic bump_left,
    input logic bump_right,
    output logic walk_left,
    output logic walk_right);  

    //define state
    typedef enum logic{ left = 1'b0 , right = 1'b1 } state_def ;
    state_def state, next_state;
    
    // State transition logic
    always_comb begin
        case(state)
            left:  begin
                if(bump_left)   next_state = right ;
                else            next_state = left  ;
            end
            right: begin
                if(bump_right)  next_state = left  ;  
                else            next_state = right ;
            end
        endcase
    end
    
    
    // State flip-flops with asynchronous reset
    always @(posedge clk, posedge areset) begin
        if(areset)    state <= left ;
        else          state <= next_state ;
    end

    // Output logic
    assign walk_left = (state == left );
    assign walk_right = (state == right );

endmodule
