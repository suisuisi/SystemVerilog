module top_module (
    input logic clk,
    input logic areset,
    input logic x,
    output logic z
); 

//define state

typedef enum logic  { S0 = 1'd0 , S1 = 1'd1  } state_def ;

state_def cur_state , next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (cur_state)
        S0: begin
            next_state = x ? S1 : S0 ;
        end 

        S1: begin
            next_state = S1 ;
        end

        default: begin
            next_state = S0 ;
        end
    endcase
end

//describe state sequencer use sequential logic

always_ff @( posedge clk or posedge areset ) begin 
    if (areset) begin
        cur_state <= S0 ;
    end
    else begin
        cur_state <= next_state ;
    end
end


//describe output decoder use combinational logic

assign z = ((cur_state == S0) && (x == 1'd1)) || ((cur_state == S1 ) && (x == 1'd0));
 
endmodule
