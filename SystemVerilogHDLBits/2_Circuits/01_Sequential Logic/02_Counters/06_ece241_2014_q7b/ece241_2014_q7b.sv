module top_module (
    input logic clk,
    input logic reset,
    output logic OneHertz,
    output logic [2:0] c_enable
); //
    wire logic [3:0] unit, ten, hundred;
    
    assign c_enable = {unit == 4'd9 && ten == 4'd9, unit == 4'd9, 1'b1};
    assign OneHertz = (unit == 4'd9 && ten == 4'd9 && hundred == 4'd9);
 
    bcdcount counter0 (clk, reset, c_enable[0], unit);
    bcdcount counter1 (clk, reset, c_enable[1], ten);
    bcdcount counter2 (clk, reset, c_enable[2], hundred);
 
endmodule