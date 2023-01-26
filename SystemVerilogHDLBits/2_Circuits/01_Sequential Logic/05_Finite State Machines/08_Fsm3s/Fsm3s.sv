module top_module(
    input logic clk,
    input logic in,
    input logic reset,
    output logic out ); 

    // State transition logic
    typedef enum logic [1:0] {A=2'd0, B=2'd1, C=2'd2, D=2'd3} state_def;
    state_def 	current_state , next_state ;
    always_comb begin
            case(current_state)
            A:begin
                next_state = in ? B : A;
            end
            B:begin
                next_state = in ? B : C;
            end
            C:begin
                next_state = in ? D : A;
            end
            D:begin
                next_state = in ? B : C;
            end
        endcase
    end

    // State flip-flops with synchronous reset

    always_ff@(posedge clk) begin
        if(reset)             current_state <= A ;
        else         current_state <= next_state ;
    end
    // Output logic

            assign out = (current_state == D)? 1'd1:1'd0 ;
endmodule
