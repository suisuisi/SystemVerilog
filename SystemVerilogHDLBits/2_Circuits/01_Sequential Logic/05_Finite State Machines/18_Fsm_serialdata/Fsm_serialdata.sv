module top_module(
    input logic clk,
    input logic in,
    input logic reset,    // Synchronous reset
    output [7:0] out_byte,
    output logic done
); 

//define state 
typedef enum logic [3:0] { idle = 4'd0 , start = 4'd1 , 
                           receive_1 = 4'd2, receive_2 = 4'd3,
                           receive_3 = 4'd4, receive_4 = 4'd5,
                           receive_5 = 4'd6, receive_6 = 4'd7,
                           receive_7 = 4'd8, receive_8 = 4'd9,
                           stop = 4'd10 , waite  = 4'd11
} state_def ;

state_def cur_state , next_state ;

var logic [3:0] state_cout ;
//describe state transition logic use combinational logic

always_comb begin 
    case (cur_state)
        idle: begin
            if (!in) begin
                next_state = start ;
            end
            else begin
                next_state = idle  ;
            end
        end 

        start: begin
            next_state = receive_1 ;
        end

        receive_1: begin
            next_state = receive_2 ;
        end

        receive_2: begin
            next_state = receive_3 ;
        end

        receive_3: begin
            next_state = receive_4 ;
        end

        receive_4: begin
            next_state = receive_5 ;
        end

        receive_5: begin
            next_state = receive_6 ;
        end

        receive_6: begin
            next_state = receive_7 ;
        end

        receive_7: begin
            next_state = receive_8 ;
        end

        receive_8: begin
            if (!in) begin
                next_state = waite ;
            end
            else begin
                next_state = stop ;
            end
        end

        stop: begin
            if (!in) begin
                next_state = start ;
            end
            else begin
                next_state =idle ;
            end
        end

        waite: begin
            if (!in) begin
                next_state = waite ;
            end
            else begin
                next_state = idle ;
            end
        end
        default: begin
            next_state = idle ;
        end
    endcase
end

//descibe state sequencer use sequential logic

always_ff @( posedge clk ) begin 
    if (reset) begin
        cur_state <= idle ;
    end    
    else begin
        cur_state <= next_state ;
    end
end


//describe output decoder use combinational logic

assign done = (cur_state == stop) ;
assign out_byte = done ? out_bytes_temp : 8'd0 ;

var logic [7:0] out_bytes_temp ;
always_ff @( posedge clk ) begin 
    if (next_state == receive_1) begin
        out_bytes_temp[0] <= in ;
    end
    else if (next_state == receive_2) begin
        out_bytes_temp[1] <= in ;
    end
    else if (next_state == receive_3) begin
        out_bytes_temp[2] <= in ;
    end
    else if (next_state == receive_4) begin
        out_bytes_temp[3] <= in ;
    end 
    else if (next_state == receive_5) begin
        out_bytes_temp[4] <= in ;
    end
    else if (next_state == receive_6) begin
        out_bytes_temp[5] <= in ;
    end
    else if (next_state == receive_7) begin
        out_bytes_temp[6] <= in ;
    end
    else if (next_state == receive_8) begin
        out_bytes_temp[7] <= in ;
    end
    
end

endmodule
