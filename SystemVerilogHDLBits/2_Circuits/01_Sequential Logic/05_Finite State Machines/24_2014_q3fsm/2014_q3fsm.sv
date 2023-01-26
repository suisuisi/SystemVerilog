module top_module (
    input logic clk,
    input logic reset,   // Synchronous reset
    input logic s,
    input logic w,
    output logic z
);

//define state

typedef enum logic { A = 1'd0 , B = 1'd1   } state_def ;

state_def cur_state , next_state ;

//describe state transition use combinational logic 

always_comb begin 
    case (cur_state)
        A: begin
            next_state = s ? B : A ;
        end 

        B: begin
            next_state = B ;
        end

        default: begin
            next_state = A ;
        end
    endcase
end

//describe state sequencer use sequential logic

always_ff @( posedge clk ) begin 
    if (reset) begin
        cur_state <= A ;
    end
    else begin
        cur_state <= next_state ;
    end
end

//define counter use sequential and combinational logic

var logic [1:0] count , count_c;

wire logic resetn ;

assign resetn = (count_c == 2'd3) ? 1'd0 : 1'd1 ;

always_ff @( posedge clk ) begin 
    if(reset) begin
        count <= 2'd0 ;
    end
    else if (!resetn) begin
            if(w == 1'd1) begin
             count <= 2'd1 ;
            end
            else begin
            count <= 2'd0 ;
            end
    end
    else begin
        if (cur_state == B && w == 1'd1) begin
            count <= count + 2'd1 ;
        end
        else begin
            count <= count ;
        end
        
    end
end

always_ff @( posedge clk ) begin 
    if (reset) begin
        count_c <= 2'd0 ;
    end
    else begin
        if (cur_state == B && count_c == 2'd3) begin
        count_c <= 2'd1 ;
        end
        else if (cur_state == B) begin
            count_c <= count_c + 2'd1 ;
        end
        else begin
        count_c <= count_c ;
        end
    end
    
end


//describe output decoder use combinational logic

always_ff@(posedge clk) begin 
    if(reset) begin
        z <= 1'd0 ;
    end
    else begin
      case( 1'd1 )
      (cur_state == B && count_c == 2'd2 && count == 1 && w == 1) : begin
        z <= 1'd1 ;
      end
      (cur_state == B && count_c == 2'd2 && count == 2 && w == 0) : begin
        z <= 1'd1 ;
      end
      default : begin
        z <= 1'd0 ;
      end
      endcase
    end
end

endmodule
