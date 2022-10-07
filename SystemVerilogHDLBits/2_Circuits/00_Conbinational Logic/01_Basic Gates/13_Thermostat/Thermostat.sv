module top_module (
    input logic too_cold,
    input logic too_hot,
    input logic mode,
    input logic fan_on,
    output logic heater,
    output logic aircon,
    output logic fan
); 
    assign heater = too_cold & mode;
    assign aircon = too_hot & ~mode;
    assign fan = fan_on | heater | aircon;
    
endmodule
