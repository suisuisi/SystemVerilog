module top_module (
    input logic clk,
    input logic resetn,    // active-low synchronous reset
    input logic x,
    input logic y,
    output logic f,
    output logic g
); 

//define state

typedef enum logic [3:0] { IDLE = 4'd0 ,  F_OUT = 4'd1 ,  S1 = 4'd2 ,   S2 = 4'd3 , 
                           S3 = 4'd4 , S4 = 4'd5 , S5 = 4'd6 , FOREVER_ONE = 4'd7 , 
                           FOREVER_ZERO = 4'd8 } state_def ;
    
state_def	cur_state , next_state ;

//describe state sequecer use sequential logic 

always_ff @(posedge clk)begin
    if(!resetn) begin
        cur_state <= IDLE;
    end
    else begin
        cur_state <= next_state;
    end
end


//describe state transition logic use combinational logic 


always_comb begin
    case(cur_state)
        IDLE:begin
            next_state = F_OUT;
        end

        F_OUT:begin
            next_state = S1;
        end

        S1:begin
            next_state = x ? S2 : S1;
        end

        S2:begin
            next_state = x ? S2 : S3;
        end

        S3:begin
            next_state = x ? S4 : S1;
        end 

        S4:begin
            next_state = y ? FOREVER_ONE : S5;
        end

        S5:begin
            next_state = y ? FOREVER_ONE : FOREVER_ZERO;
        end

        FOREVER_ONE:begin
            next_state = FOREVER_ONE;
        end

        FOREVER_ZERO:begin
            next_state = FOREVER_ZERO;
        end

        default:begin
            next_state = IDLE;
        end

    endcase
end

//describe output decoder use combinational logic

assign f = (cur_state == F_OUT);
assign g = (cur_state == S4 || cur_state == S5 || cur_state == FOREVER_ONE);
                
endmodule