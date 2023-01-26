module top_module (
    input logic clk,
    input logic reset,   // Synchronous reset
    input logic x,
    output logic z
);

//define state

typedef enum logic [2:0] { S0 = 3'b000 , S1 = 3'b001 ,
                           S2 = 3'b010 , S3 = 3'b011 ,
                           S4 = 3'b100 
                         } state_def ;

state_def cur_state , next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (cur_state)
        S0: begin
            next_state = x ? S1 : S0 ;
        end 

        S1: begin
            next_state = x ? S4 : S1 ;
        end
        
        S2: begin
            next_state = x ? S1 : S2 ;
        end

        S3: begin
            next_state = x ? S2 : S1 ;
        end

        S4: begin
            next_state = x ? S4 : S3 ;
        end

        default: begin
            next_state = S0 ;
        end
    endcase
end

//describe state sequencer use sequential logic

always_ff @( posedge clk ) begin 
    if (reset) begin
        cur_state <= S0 ;
    end
    else begin
        cur_state <= next_state ;
    end
end


//describe output decoder use combinational logic

assign z = (cur_state == S3) || (cur_state == S4) ;

endmodule
