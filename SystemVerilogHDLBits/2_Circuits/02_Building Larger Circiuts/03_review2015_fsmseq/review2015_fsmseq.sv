module top_module (
    input logic clk,
    input logic reset,      // Synchronous reset
    input logic data,
    output logic start_shifting
    );

//define state

typedef enum logic [2:0] { idle = 3'd1 , S0 = 3'd2 ,
                           S1 = 3'd3 , S2 = 3'd4 , S3 = 3'd5
} state_def ;

state_def cur_state , next_state ;


//describe state transition use combinational logic 

always_comb begin 
    case (cur_state)
        idle: begin
            next_state = data ? S0 : idle ;
        end 

        S0: begin
            next_state = data ? S1 : idle ;
        end

        S1: begin
            next_state = data ? S1 : S2 ;
        end

        S2: begin
            next_state = data ? S3 : idle ;
        end

        S3: begin
            next_state = S3 ;
        end
        default: begin
            next_state = idle ;
        end
    endcase
end


//describe state sequencer use sequential logic

always_ff @( posedge clk ) begin 
    if (reset) begin
        cur_state <= idle ;
    end
    else begin
        cur_state <= next_state ;
    end    
end

//describe output decoder use combinational logic

assign start_shifting = (cur_state == S3) ;

endmodule
