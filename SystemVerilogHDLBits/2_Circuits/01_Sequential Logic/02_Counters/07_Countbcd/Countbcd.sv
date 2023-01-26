module top_module (
    input logic clk,
    input logic reset,   // Synchronous active-high reset
    output logic [3:1] ena,
    output logic [15:0] q);
    
    reg [3:0]	ones;
    reg [3:0]	tens;
    reg [3:0]	hundreds;
    reg [3:0]	thousands;
    
    always@(posedge clk)begin
        if(reset)               ones <= 4'd0;
        else if(ones == 4'd9)   ones <= 4'd0;
        else                    ones <= ones + 4'd1 ;
    end
    
    always@(posedge clk)begin
        if(reset)               tens <= 4'd0;
            
        else if(tens == 4'd9 && ones == 4'd9)  
                                tens <= 4'd0;
        else if(ones == 4'd9)   tens <= tens + 4'd1;
    end
    
    always@(posedge clk)begin
        if(reset)               hundreds <= 4'd0;
            
        else if(hundreds == 4'd9 && tens == 4'd9 && ones == 4'd9)
                                hundreds <= 4'd0;
        else if(tens == 4'd9 && ones == 4'd9) 
                                hundreds <= hundreds + 4'd1;
    end
    
    always@(posedge clk)begin
        if(reset)               thousands <= 4'd0;
        else if(thousands == 4'd9 && hundreds == 4'd9 && tens == 4'd9 && ones == 4'd9)
                                thousands <= 4'd0;
        else if(hundreds == 4'd9 && tens == 4'd9 && ones == 4'd9) 
                                thousands <= thousands + 4'd1;
    end
    
    assign q = {thousands, hundreds, tens, ones};
    assign ena[1] = (ones == 4'd9) ? 1'b1 : 1'b0;
    assign ena[2] = (tens == 4'd9 && ones == 4'd9) ? 1'b1 : 1'b0;
    assign ena[3] = (hundreds == 4'd9 && tens == 4'd9 && ones == 4'd9) ? 1'b1 : 1'b0;
 
endmodule