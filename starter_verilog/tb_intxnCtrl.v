////////////////////////////////////////////////////////////////////////////////
// Filename:    tb_intxnCtrl.v
// Authors:     Carson, Brian, Luke, Jason, Ben
// Date:        30 November 2018
//
// Description: This is the test bench for the traffic light intersection
//              controller...
//

// Time Unit = 1 ms (#10 means 10 ms)
// Simulation Precision = 100 ns
`timescale 1ms/100ns

module tb_intxnCtrl();

  // initiate our test bench variables
  reg clk_en, rst_n, car_det;
  wire clk_50MHz;
  wire [5:0] led_out;

  clk C1 (.enable(clk_en),                   // input signal to enable clock
          .clk_out(clk_50MHz));              // output signal of the clock

  intxnCtrl CTRL1 (.clock(clk_50MHz),        // input 50 MHz synth'd clock
                   .reset_n(rst_n),          // input active low system reset
                   .car_detected(car_det),   // input if car arrived east/west
                   .lights_out(led_out));    // output for LED traffic lights

  initial begin
    clk_en = 1'b1;
    rst_n = 1'b1;

    // xyz etc

  end

endmodule
