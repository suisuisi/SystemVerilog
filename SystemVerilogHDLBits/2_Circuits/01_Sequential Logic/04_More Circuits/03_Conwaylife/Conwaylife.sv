module top_module(
    input logic clk,
    input logic load,
    input logic [255:0] data,
    output logic [255:0] q ); 
    
    //store expanding array 
    var logic [17:0][17:0] q_exp   ;
    
    //other variable
    var integer  neigh_num [255:0] ;
    var logic [255:0] q_next ;
    
    
    
    //expaning array use combinational logic
    var integer i , j ,k , t ;
    always_comb begin
        //expaning array operation
        q_exp[0]  = {q[240],q[255:240],q[255]} ;
        q_exp[17] = {q[0],q[15:0],q[15]} ;
        for(i=1;i<=16;i=i+1) begin
            q_exp[i] = {q[(i-1)*16],q[(i-1)*16 +:16],q[i*16-1]} ;
        end
        
        //calculate neighbours number
        for(j=1;j<=16;j=j+1) begin
            for(k=1;k<=16;k=k+1) begin
                neigh_num[(j-1)*16 + (k-1)] = q_exp[j-1][k-1] + q_exp[j-1][k] + q_exp[j-1][k+1] +
                                              q_exp[j][k-1] + q_exp[j][k+1] + q_exp[j+1][k-1] +
                                              q_exp[j+1][k] + q_exp[j+1][k+1] ;
            end
        end
        
        
        //decide q_next
        for(t=0;t<=255;t=t+1) begin
            case(neigh_num[t])
                32'd2: q_next[t] = q[t] ;
                32'd3: q_next[t] = 1'd1 ;
                default: q_next[t] = 1'd0 ;
            endcase
        end
        
    end   
    
    
    
    //update q value use sequential logic
        
        always_ff@(posedge clk) begin
            if(load)  q <= data ;
            else
                      q <= q_next ;
        end
        
        
        
endmodule
