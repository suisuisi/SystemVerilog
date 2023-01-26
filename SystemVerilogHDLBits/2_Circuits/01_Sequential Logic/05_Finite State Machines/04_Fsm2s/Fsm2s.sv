module top_module(
    input logic clk,
    input logic reset,    // synchronous reset to state OFF
    input logic j,
    input logic k,
    output logic out);//  

    typedef enum logic { OFF = 1'd0 , ON =1'd1 } state_def ;  
    state_def state, next_state;

    always_comb begin    // This is a combinational always block
        // State transition logic
        case(state)
            OFF: begin
                if(j == 1'd1)  next_state = ON ;
                else           next_state = OFF ;
            end
            
            ON:begin
                if(k == 1'd1)  next_state = OFF ;
                else           next_state = ON ;
            end
        endcase
    end

    always_ff@(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(reset)    state <= OFF ;
        else          state <= next_state ;
    end

    // Output logic
    assign out = (state == OFF)? 1'd0:1'd1;

endmodule
