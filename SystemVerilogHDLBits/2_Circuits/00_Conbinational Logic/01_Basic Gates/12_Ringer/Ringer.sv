module top_module (
    input logic ring,
    input logic vibrate_mode,
    output logic ringer,       // Make sound
    output logic motor         // Vibrate
);

    assign ringer = ~vibrate_mode & ring;
    assign motor = vibrate_mode & ring;

endmodule
