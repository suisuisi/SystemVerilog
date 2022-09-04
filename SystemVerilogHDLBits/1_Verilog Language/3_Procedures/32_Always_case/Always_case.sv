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
            3'd0:out = data0;
            3'd1:out = data1;
            3'd2:out = data2;
            3'd3:out = data3;
            3'd4:out = data4;           
            3'd5:out = data5;
            default:out = 4'd0;
        endcase
    end

endmodule
