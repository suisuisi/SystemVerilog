module top_module(
    input logic clk,
    input logic reset,    // Synchronous reset
    input logic in,
    output logic disc,
    output logic flag,
    output logic err
    );

    //define state
    typedef enum logic [2:0] { detect_0 = 3'd0 , receive_1 = 3'd1 ,
                               receive_2 = 3'd2 , receive_3 = 3'd3 ,
                               receive_4 = 3'd4 , receive_5 = 3'd5 ,
                               receive_6 = 3'd6 , receive_7 = 3'd7 
    } state_def ;

    state_def cur_state , next_state ;

    //describe state transition logic use combinational logic
    always_comb begin 
        case (cur_state)
            detect_0: begin
                next_state = in ? receive_1 : detect_0 ;
            end 

            receive_1: begin
                next_state = in ? receive_2 : detect_0 ;
            end

            receive_2: begin
                next_state = in ? receive_3 : detect_0 ;
            end
            
            receive_3: begin
                next_state = in ? receive_4 : detect_0 ;
            end

            receive_4: begin
                next_state = in ? receive_5 : detect_0 ;
            end

            receive_5: begin
                next_state = in ? receive_6 : detect_0 ;
            end

            receive_6: begin
                next_state = in ? receive_7 : detect_0 ;
            end

            receive_7: begin
                next_state = in ? receive_7 : detect_0 ;
            end

            default: begin
                next_state = detect_0 ;
            end
        endcase
    end

    //describe state sequecer use sequential logic 

    always_ff @( posedge clk ) begin 
        if (reset) begin
            cur_state <= detect_0 ;
        end
        else begin
            cur_state <= next_state ;
        end
    end

    //describe output decoder use sequential and combinational logic

    always_ff @( posedge clk ) begin 
        if (reset) begin
            disc <= 1'd0 ;
            flag <= 1'd0 ;
        end
        else begin
            case (1'd1)
                (cur_state == receive_5) && (next_state == detect_0): disc <= 1'd1 ;
                (cur_state == receive_6) && (next_state == detect_0): flag <= 1'd1 ;
                default : begin
                    disc <= 1'd0 ;
                    flag <= 1'd0 ;
                end
            endcase
        end
    end

    assign err  = (cur_state == receive_7) ;

endmodule
