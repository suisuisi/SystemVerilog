module top_module (
    input logic clk,
    input logic reset,
    input logic [3:1] s,
    output logic fr3,
    output logic fr2,
    output logic fr1,
    output logic dfr
); 
    
    //define state
    typedef enum logic [1:0] { empty = 2'd0 , level_1 = 2'd1 ,level_2 = 2'd2 , level_3 = 2'd3 } state_def ;
    state_def cur_state , next_state ;

    //describe  state sequencer use sequential logic
    always_ff @( posedge clk ) begin 
        if(reset)  cur_state <= empty ;
        else       cur_state <= next_state ;
        
    end

   //describe next state decoder use conbinational logic

   always_comb begin 

       unique case (s)
           3'b000: next_state = empty ;
           3'd001: next_state = level_1 ;
           3'b011: next_state = level_2 ;
           3'b111: next_state = level_3 ; 
       endcase
       
   end

   //describe output decoder use conbinational and sequential logic

   // decoder output fr1~fr3
   assign fr3 = (cur_state == empty) ;
   assign fr2 = (cur_state == empty) || (cur_state == level_1) ; 
   assign fr1 = (cur_state == empty) || (cur_state == level_1) || (cur_state == level_2) ;

   // decoder output dfr 

   var logic set_dfr , reset_dfr ;
   assign set_dfr =   ((next_state == empty) && (cur_state != empty)) || 
                      ((next_state == level_1) && (cur_state != level_1) && (cur_state != empty)) ||
                      ((next_state == level_2) && (cur_state == level_3)) ;
   assign reset_dfr = ((next_state == level_3) && (cur_state != level_3)) || 
                      ((next_state == level_2) && (cur_state != level_2) && (cur_state != level_3)) ||
                      ((next_state == level_1) && (cur_state == empty)) ;
                    
   always_ff @( posedge clk ) begin 
         if (reset) begin
             dfr <= 1'd1 ;
         end
         else if (set_dfr) begin
             dfr <= 1'd1 ;
         end
         else if (reset_dfr) begin
             dfr <= 1'd0 ;
         end
         else begin
             dfr <= dfr ;
         end
       
   end


endmodule
