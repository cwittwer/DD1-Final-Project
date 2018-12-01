////////////////////////////////////////////////////////////////////////////////
// Filename:    intxnCtrl.v
// Authors:     Carson, Brian, Luke, Jason, Ben
// Date:        30 November 2018
//
// Description: This is the traffic light intersection controller FSM. This
//              module is responsible for maintaining a green light on the
//              north/south highway until a car is detected on the east/west
//              road. In the event that a car is detected, this FSM will cycle
//              the intersection's traffic lights such that the car on the east/
//              west road may safely cross the highway.
//

//         NOTE: reset is active-low

module intxnCtrl(clock, reset_n, car_detected, lights_out);

   input        clock;        // 50MHz (?) clock
   input        reset_n;      // active-low reset
   input        car_detected; // active-high enable
   output [5:0] lights_out;   // 6-bit output (2 sets of 3 bits - one per LED)

   // xyz etc

endmodule
