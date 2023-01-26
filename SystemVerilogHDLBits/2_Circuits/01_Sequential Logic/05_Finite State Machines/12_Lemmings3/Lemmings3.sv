module top_module(
    input logic clk,
    input logic areset,    // Freshly brainwashed Lemmings walk left.
    input logic bump_left,
    input logic bump_right,
    input logic ground,
    input logic dig,
    output logic walk_left,
    output logic walk_right,
    output logic aaah,
    output logic digging ); 

    //define state
    typedef enum logic [2:0] { left = 3'd0 , right = 3'd1 , 
                               fall_left = 3'd2 , fall_right = 3'd3 ,
                               dig_left = 3'd4 , dig_right = 3'd5 } state_def ;
    state_def cur_state , next_state ;

    //describe next state transition use combinational logic

    always_comb begin
        case (cur_state)
            left: begin
                if (!ground) begin
                    next_state = fall_left ;
                end
                else if (dig) begin
                    next_state = dig_left ;
                end
                else if (bump_left) begin
                    next_state = right ;
                end 
                else begin
                    next_state = left ;
                end
            end

            right: begin
                if (!ground) begin
                    next_state = fall_right ;
                end
                else if (dig) begin
                    next_state = dig_right ;
                end
                else if (bump_right) begin
                    next_state = left ;
                end
                else begin
                    next_state = right ;
                end
            end     

            fall_left: begin
                if (ground) begin
                    next_state = left ;
                end
                else begin
                    next_state = fall_left ;
                end
            end

            fall_right: begin
                if (ground) begin
                    next_state = right ;
                end
                else begin
                    next_state = fall_right ;
                end
            end

            dig_left: begin
                if (!ground) begin
                    next_state = fall_left ;
                end
                else begin
                    next_state = dig_left ;
                end
            end

            dig_right: begin
                if (!ground) begin
                    next_state = fall_right ;
                end
                else begin
                    next_state = dig_right ;
                end
            end
        endcase
    end


    //describe state sequencer use sequential logic

    always_ff @( posedge clk or posedge areset ) begin
        if (areset) begin
            cur_state <= left ;
        end
        else begin
            cur_state <= next_state ;
        end
    end


    //describe ouput decoder use combinational logic

    assign walk_left = (cur_state == left) ;
    assign walk_right = (cur_state == right) ;
    assign aaah = (cur_state == fall_left) || (cur_state == fall_right) ;
    assign digging = (cur_state == dig_left) || (cur_state == dig_right) ;

endmodule
