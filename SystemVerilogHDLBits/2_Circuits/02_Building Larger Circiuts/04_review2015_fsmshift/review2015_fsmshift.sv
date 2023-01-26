module top_module (
    input logic clk,
    input logic reset,      // Synchronous reset
    output logic shift_ena);

//define state
typedef enum logic { S0 = 1'd0 , S1 = 1'd1 } state_def ;
state_def cur_state , next_state ;

//describe state sequencer use sequential logic
always_ff @( posedge clk ) begin 
    if (reset) begin
        cur_state <= S0 ;
    end
    else begin
        cur_state <= next_state ;
    end
end

//describe state transition use combinational logic

always_comb begin 
    case (cur_state)
        S0: begin
            next_state = reset ? S0 : S1 ;
        end

        S1: begin
            next_state = reset ? S0 : S1 ;
        end
        default: begin
            next_state = cur_state ;
        end
    endcase
end

//define counter use sequential logic
var logic [6:0] counter ;
always_ff @( posedge clk ) begin 
    if (reset) begin
        counter <= 7'd0 ;
    end
    else if (next_state == S1) begin
        counter <= counter + 7'd1 ;
    end
    else begin
        counter <= counter ;
    end
end

//describe output decoder use sequential logic

assign shift_ena = (cur_state == S0) || (cur_state == S1 && counter < 7'd4) ;

endmodule
