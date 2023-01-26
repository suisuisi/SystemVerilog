module top_module(
    input logic clk,
    input logic reset,    // synchronous reset to state B
    input logic in,
    output logic out);//  

    typedef enum logic { A = 1'd0 , B =1'd1 } state_def ;  
    state_def state, next_state;

    always_comb begin    // This is a combinational always block
        // State transition logic
        case(state)
            A: begin
                if(in == 1'd1)  next_state = A ;
                else            next_state = B ;
            end
            
            B:begin
                if(in == 1'd1)  next_state = B ;
                else            next_state = A ;
            end
        endcase
    end

    always_ff@(posedge clk) begin    // This is a sequential always block
        // State flip-flops with synchronous reset
        if(reset)    state <= B ;
        else          state <= next_state ;
    end

    // Output logic
    assign out = (state == A)? 1'd0:1'd1;

endmodule
