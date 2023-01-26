module top_module(
    input logic d,
    input logic done_counting,
    input logic ack,
    input logic [9:0] state,    // 10-bit one-hot current state
    output logic B3_next,
    output logic S_next,
    output logic S1_next,
    output logic Count_next,
    output logic Wait_next,
    output logic done,
    output logic counting,
    output logic shift_ena
); //
 
    // You may use these parameters to access state bits using e.g., state[B2] instead of state[6].
    parameter logic [3:0] S = 4'd0, S1 = 4'd1 , S11 = 4'd2 , S110= 4'd3 , 
                          B0 = 4'd4 , B1 = 4'd5 , B2 = 4'd6 , B3 = 4'd7 , 
                          Count = 4'd8 , Wait = 4'd9 ;
 
    assign B3_next = state[B2] ;
    assign S_next = ~d & state[S] | ~d & state[S1] | ~d & state[S110] | ack & state[Wait] ;
    assign S1_next = d & state[S] ;
    assign Count_next = state[B3] | ~done_counting & state[Count] ;
    assign Wait_next = done_counting & state[Count] | ~ack & state[Wait] ;
    assign done = state[Wait] ;
    assign counting = state[Count] ;
    assign shift_ena = state[B0] | state[B1] | state[B2] |state[B3] ;
 
endmodule