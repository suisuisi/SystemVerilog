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
                               dig_left = 3'd4 , dig_right = 3'd5 ,
                               splatter = 3'd6 , aaah_reset =3'd7
                             } state_def ;
    state_def cur_state , next_state ;

    var logic [4:0] cycle_cout ;

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
                    if (cycle_cout == 5'd20) begin
                    next_state = splatter ;
                    end
                    else begin
                    next_state = fall_left ;
                    end
                end
            end

            fall_right: begin
                if (ground) begin
                    next_state = right ;
                end
                else begin
                    if (cycle_cout == 5'd20) begin
                    next_state = splatter ;
                    end
                    else begin
                    next_state = fall_right ;
                    end
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
            splatter:begin
                if(ground) begin
                    next_state = aaah_reset ;
                end
                else begin
                    next_state = splatter;
                end
            end
            aaah_reset: begin
                    next_state = aaah_reset ;
            end
        endcase
    end


    //describe state sequencer use sequential logic

    always_ff @( posedge clk or posedge areset ) begin
        if (areset) begin
            cur_state <= left ;
            cycle_cout <= 5'd0  ;
        end
        else begin
        if ((next_state == fall_left) || (next_state == fall_right)) begin
            cycle_cout <= cycle_cout + 5'd1 ;
            cur_state <= next_state ;
        end
        else begin
            cur_state <= next_state ;
            if(next_state == splatter)begin
                cycle_cout <= cycle_cout + 5'd1 ;
            end
            else begin
                cycle_cout <= 5'd0 ;
            end
        end
        end
        
    end


    //describe ouput decoder use combinational logic

    assign walk_left = (cur_state == left) && (cur_state != splatter) ;
    assign walk_right = (cur_state == right) && (cur_state != splatter) ;
    assign aaah = (cur_state == fall_left) || (cur_state == fall_right) || (cur_state == splatter) ;
    assign digging = (cur_state == dig_left) || (cur_state == dig_right) && (cur_state != splatter) ;

endmodule
