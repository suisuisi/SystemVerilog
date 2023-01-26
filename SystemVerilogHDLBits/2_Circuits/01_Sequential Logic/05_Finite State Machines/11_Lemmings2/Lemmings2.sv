module top_module(
    input logic clk,
    input logic areset,    // Freshly brainwashed Lemmings walk left.
    input logic bump_left,
    input logic bump_right,
    input logic ground,
    output logic walk_left,
    output logic walk_right,
    output logic aaah ); 
    
    //define state 
    typedef enum logic [1:0] { left = 2'd0 , right = 2'd1 , fall_left = 2'd2 , fall_right = 2'd3 } state_def ;
    state_def cur_state , next_state ;
    
    //describe state transition use conbinational logic
    always_comb begin
        case(cur_state)
            left: begin
                if(!ground) begin
                    next_state = fall_left ;
                end
                else if(bump_left) begin
                    next_state = right ;
                end
                else begin
                    next_state = left ;
                end
            end
            
            right: begin
                if(!ground) begin
                    next_state = fall_right ;
                end
                else if(bump_right) begin
                    next_state = left ;
                end
                else begin
                    next_state = right ;
                end
            end
            
            fall_left: begin
                if(ground) begin
                    next_state = left ;
                end
                else begin
                    next_state = fall_left ;
                end
            end
            
            fall_right: begin
                if(ground) begin
                    next_state = right ;
                end
                else begin
                    next_state = fall_right ;
                end
            end
        endcase
    end
    
    //describe state sequencer use sequential logic 
    
    always_ff@(posedge clk or posedge areset) begin
        if(areset) begin
            cur_state <= left ;
        end
        else begin
            cur_state <= next_state ;
        end
    end
    
    //describe output decoder use conbinational logic
    
    assign walk_left = (cur_state == left)  ;
    assign walk_right = (cur_state == right);
    assign aaah = (cur_state == fall_left) || (cur_state == fall_right) ;
        

endmodule
