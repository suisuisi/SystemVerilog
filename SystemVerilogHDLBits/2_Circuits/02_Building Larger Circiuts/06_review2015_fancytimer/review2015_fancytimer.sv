module top_module (
    input logic clk,
    input logic reset,      // Synchronous reset
    input logic data,
    output logic [3:0] count,
    output logic counting,
    output logic done,
    input logic ack
    );

//define state

typedef enum logic [2:0] { idle = 3'd1 , S0 = 3'd2 ,S1 = 3'd3 , 
                           S2 = 3'd4 , shif = 3'd5 , count_t = 3'd6 ,
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
            next_state = counter_shif < 7'd4 ? shif : count_t ;
        end

        count_t: begin
            next_state = (counter == (delay + 1)*1000 - 1) ? waite : count_t ;
        end

        waite: begin
            next_state = ack ? idle : waite ;
        end

        default: begin
            next_state = idle ;
        end
    endcase
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

assign count = (cur_state == count_t) ? (delay - counter_delay) :4'd0 ;
assign counting  = (cur_state == count_t) ;
assign done = (cur_state == waite) ;


//define counter for shift use sequential logic
var logic [6:0] counter_shif ;
always_ff @( posedge clk ) begin 
    if (reset || next_state != shif) begin
        counter_shif <= 7'd0 ;
    end
    else if (next_state == shif) begin
        counter_shif <= counter_shif + 7'd1 ;
    end
    else begin
        counter_shif <= counter_shif ;
    end
end

//define counter for count use sequential logic
var logic [15:0] counter ;
always_ff @( posedge clk ) begin 
    if (reset || next_state != count_t) begin
        counter <= 16'd0 ;
    end
    else if (cur_state == count_t) begin
        counter <= counter + 16'd1 ;
    end
    else begin
        counter <= 16'd0 ;
    end
end

//shift data into delay use sequential logic
var logic [3:0] delay ;
always_ff @( posedge clk ) begin 
    if(reset) begin
        delay <= 4'd0 ;
    end
    else begin
        if (cur_state == shif) begin
            delay <= {delay[2:0] , data} ;
        end
    end
end


//calculate couter_delay use combinational logic
var logic [3:0] counter_delay ;
always@(*)begin
    if(counter <= 999)begin
        counter_delay = 4'd0;
    end
    else if(counter >= 1000 && counter <= 1999)begin
        counter_delay = 4'd1;
    end
    else if(counter >= 2000 && counter <= 2999)begin
        counter_delay = 4'd2;
    end
    else if(counter >= 3000 && counter <= 3999)begin
        counter_delay = 4'd3;
    end
    else if(counter >= 4000 && counter <= 4999)begin
        counter_delay = 4'd4;
    end
    else if(counter >= 5000 && counter <= 5999)begin
        counter_delay = 4'd5;
    end
    else if(counter >= 6000 && counter <= 6999)begin
        counter_delay = 4'd6;
    end
    else if(counter >= 7000 && counter <= 7999)begin
        counter_delay = 4'd7;
    end
    else if(counter >= 8000 && counter <= 8999)begin
        counter_delay = 4'd8;
    end
    else if(counter >= 9000 && counter <= 9999)begin
        counter_delay = 4'd9;
    end
    else if(counter >= 10000 && counter <= 10999)begin
        counter_delay = 4'd10;
    end
    else if(counter >= 11000 && counter <= 11999)begin
        counter_delay = 4'd11;
    end
    else if(counter >= 12000 && counter <= 12999)begin
        counter_delay = 4'd12;
    end
    else if(counter >= 13000 && counter <= 13999)begin
        counter_delay = 4'd13;
    end
    else if(counter >= 14000 && counter <= 14999)begin
        counter_delay = 4'd14;
    end
    else begin
        counter_delay = 4'd15;
    end
end     


endmodule
