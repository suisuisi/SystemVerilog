module top_module (
    input logic clk,
    input logic aresetn,    // Asynchronous active-low reset
    input logic x,
    output logic z ); 

    //define state
    typedef enum logic [1:0] { idle = 2'd0 , state_1 = 2'd1 , state_2 = 2'd2  } state_def ;

    state_def cur_state , next_state ;

    //describe state sequecer use sequential logic 
    always_ff @( posedge clk or negedge aresetn) begin 
        if (!aresetn) begin
            cur_state <= idle ;
        end
        else begin
            cur_state <= next_state ;
        end
    end

    //describe state transition logic use combinational logic

    always_comb begin 
        case (cur_state)
            idle: begin
                next_state = x ? state_1 : idle ;
            end 

            state_1: begin
                next_state = x ? state_1 : state_2 ;
            end

            state_2: begin
                next_state = x ? state_1 : idle ;
            end
            default: begin
                next_state = idle ;
            end
        endcase
    end

    //describe output decoder use combinational logic
    assign z = (cur_state == state_2) && (x == 1'd1) ;
    
endmodule
