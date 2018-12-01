////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_trafficLightTop.v
// Authors:     Carson, Brian, Luke, Jason, Ben
// Date:        30 November 2018
//
// Description: This is the top-level test bench for our final project.
//              This traffic light controller handles three analog inputs
//              via three separate buttons on our development board and,
//              according to those inputs, it produces some analog output which
//              is visible via six separate LEDs on our development board.
//
//              The three buttons in use handle the reset, eastern car arrival,
//              & western car arrival - KEY[0], KEY[1], and KEY[2] respectively.
//              Resetting of the system is asyncronous. The six LEDs in use
//              act as the traffic lights themselves: two sets of three LEDs
//              each represent the east/west & north/south traffic lights.
//

// Time Unit = 1 ms (#10 means 10 ms)
// Simulation Precision = 100 ns
`timescale 1ms/100ns

module tb_trafficLightTop();

  // initiate our test bench variables
  reg clk_en;
  wire clk_50MHz;
  reg [2:0] keys;
  wire [9:0] leds;

  clk C1 (.enable(clk_en),                   // input signal to enable clock
          .clk_out(clk_50MHz));              // output signal of the clock

  tb_trafficLightTop TOP1 (.CLOCK_50(clk_50MHz),  // input 50 MHz synth'd clock
                           .KEY(keys),            // input of analog key press
                           .LED(leds));           // output of analog LEDs

  initial begin

    #1000           // wait one second

    clk_en = 1'b1;  // initiate 50MHz clock
    #1000

    keys[0] = 1'b0;  // test active-low reset of the system
    #500

    keys[0] = 1'b1;
    #500

    keys[1] = 1'b1;  // car arrives at Western light
    #500

    keys[1] = 1'b0;
    #10000          // wait 10 seconds

    keys[2] = 1'b1;  // car arrives at Eastern light
    #500

    keys[2] = 1'b0;
    #10000          // wait 10 seconds

    keys[0] = 1'b0;  // test reset of the system
    #500

    keys[0] = 1'b1;
    #500

    keys[1] = 1'b1;  // car arrives at Western light
    #500

    keys[1] = 1'b0;
    #2000          // wait 2 seconds

    keys[0] = 1'b0;  // test active-low reset of the system
    #500

    keys[0] = 1'b1;
  end

endmodule
