module top_module (
    input logic clk,
    input logic reset,      // Synchronous reset
    input logic data,
    output logic shift_ena,
    output logic counting,
    input logic done_counting,
    output logic done,
    input logic ack
    );

//define state

typedef enum logic [2:0] { idle = 3'd1 , S0 = 3'd2 ,S1 = 3'd3 , 
                           S2 = 3'd4 , shif = 3'd5 , count = 3'd6 ,
                           waite = 3'd7
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
            next_state = data ? shif : idle ;
        end

        shif: begin
            next_state = counter < 7'd4 ? shif : count ;
        end

        count: begin
            next_state = done_counting ? waite : count ;
        end

        waite: begin
            next_state = ack ? idle : waite ;
        end

        default: begin
            next_state = idle ;
        end
    endcase
end

//define counter use sequential logic
var logic [6:0] counter ;
always_ff @( posedge clk ) begin 
    if (reset || next_state != shif) begin
        counter <= 7'd0 ;
    end
    else if (next_state == shif) begin
        counter <= counter + 7'd1 ;
    end
    else begin
        counter <= counter ;
    end
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

assign shift_ena = (cur_state == shif) ;
assign counting  = (cur_state == count) ;
assign done = (cur_state == waite) ;

endmodule
