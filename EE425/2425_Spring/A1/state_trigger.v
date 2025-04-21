// Adjustable State Trigger Signal Module
// --------------------------------------------
// This module generates a falling edge state
// trigger signal for a traffic light control.
// Please initialize clock to zero while using
// this module.
// --------------------------------------------
// Port and parameter definitions:
// Name         Definition          Type
// -----------  ------------------  -----------
// delay:       Timing delay        parameter
// clk:         Clock signal        input
// rst:         Reset signal        input
// trigger:     Trigger signal      output

module state_trigger
    #(parameter delay = 0)  // Parameter definitions
    (                       // Module port definitions
    input clk,              // Clock signal
    input rst,              // Reset signal
    output trigger          // Trigger signal
    );                      // End port definitions

    reg     [delay+6:0]  c; // Counter definition

    // Falling edge sensitive clock
    always@(negedge clk)
        if(rst) 
            c <= 0;         // Counter reset
        else
            c <= c + 1;     // Counter increment

    // Output assignation
    assign trigger = (c == 35<<delay) ||
                     (c == 40<<delay) ||
                     (c == 58<<delay) ||
                     (c == 63<<delay);
endmodule
