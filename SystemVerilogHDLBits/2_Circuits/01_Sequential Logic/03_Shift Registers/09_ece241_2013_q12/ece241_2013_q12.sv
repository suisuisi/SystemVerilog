module top_module (
    input logic clk,
    input logic enable,
    input logic S,
    input logic A, B, C,
    output logic Z ); 
    
    var logic [7:0] Q ;
    
    always_ff@(posedge clk) begin
        if(enable)  Q <= {Q[6:0],S} ;
    end
    
    always_comb begin
        case({A, B, C})
            3'b000:begin
                Z = Q[0];
            end
            3'b001:begin
                Z = Q[1];
            end
            3'b010:begin
                Z = Q[2];
            end
            3'b011:begin
                Z = Q[3];
            end
            3'b100:begin
                Z = Q[4];
            end
            3'b101:begin
                Z = Q[5];
            end
            3'b110:begin
                Z = Q[6];
            end
            3'b111:begin
                Z = Q[7];
            end
        endcase
    end


endmodule
