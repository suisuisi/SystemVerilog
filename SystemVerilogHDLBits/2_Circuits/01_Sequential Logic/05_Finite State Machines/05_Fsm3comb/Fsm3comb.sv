module top_module(
    input logic in,
    input logic [1:0] state,
    output logic [1:0] next_state,
    output logic out); //

    parameter logic [1:0] A=2'd0, B=2'd1, C=2'd2, D=2'd3;

    // State transition logic: next_state = f(state, in)

    always_comb begin
      unique case(state)
            A:begin
                if(in == 1'd1)  next_state = B ;
                else            next_state = A ;
            end
            B:begin
                if(in == 1'd1)  next_state = B ;
                else            next_state = C ;
            end
            C:begin
                if(in == 1'd1)  next_state = D ;
                else            next_state = A ;
            end
            D:begin
                if(in == 1'd1)  next_state = B ;
                else            next_state = C ;
            end
        endcase
    end
            
    // Output logic:  out = f(state) for a Moore state machine

    assign out = (state == D)? 1'd1:1'd0 ;
endmodule
