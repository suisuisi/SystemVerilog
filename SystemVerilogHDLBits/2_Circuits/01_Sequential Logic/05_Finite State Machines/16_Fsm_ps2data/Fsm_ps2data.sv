module top_module(
    input logic clk,
    input logic [7:0] in,
    input logic reset,    // Synchronous reset
    output [23:0] out_bytes,
    output logic done);

    typedef enum logic [1:0] {S0 = 2'd0 , S1 = 2'd1 , S2 = 2'd2 , Done = 2'd3} state_def ;
    state_def cur_state , next_state ;
    // State transition logic (combinational)
    always_comb begin 
        case (cur_state)
            S0: begin
                next_state = S1 ;
            end 
            
            S1: begin
                next_state = S2 ;
            end 

            S2: begin
                next_state = in[3] ? S0 : Done ;
            end

            Done: begin
                next_state = in[3] ? S0 : Done ;
            end
            default: begin
                next_state = Done ;
            end
        endcase
        
    end
    // State flip-flops (sequential)
 
    always_ff @( posedge clk ) begin 
        if(reset) begin
            cur_state <= Done ;
        end
        else begin
            cur_state <= next_state ;
        end
        
    end
    // Output logic

    assign done = (cur_state == S2) ;
    assign out_bytes = done ? out_bytes_temp : 24'd24 ;
    var logic [23:0] out_bytes_temp ;
    always_ff @( posedge clk ) begin 
        if (next_state == S0) begin
            out_bytes_temp[23:16] <= in ; 
        end
        else if (next_state == S1) begin
            out_bytes_temp[15:8]  <= in ;
        end
        else if (next_state == S2) begin
            out_bytes_temp[7:0]   <= in ;
        end
        
    end

endmodule
