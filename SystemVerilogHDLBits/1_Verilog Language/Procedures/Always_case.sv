module top_module ( 
    input logic [2:0] sel, 
    input logic [3:0] data0,
    input logic [3:0] data1,
    input logic [3:0] data2,
    input logic [3:0] data3,
    input logic [3:0] data4,
    input logic [3:0] data5,
    output logic [3:0] out   
    );

    always_comb begin  // This is a combinational circuit
      
        unique case(sel)
            3'd0:begin
                out = data0;
            end
            3'd1:begin
                out = data1;
            end
            3'd2:begin
                out = data2;
            end
            3'd3:begin
                out = data3;
            end
            3'd4:begin
                out = data4;
            end
            3'd5:begin
                out = data5;
            end
            default:begin
                out = 4'd0;
            end
        endcase
    end

endmodule
