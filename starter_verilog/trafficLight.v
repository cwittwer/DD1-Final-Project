////////////////////////////////////////////////////////////////////////////////
// Filename:    trafficLight.v
// Authors:     Carson, Brian, Luke, Jason, Ben
// Date:        30 November 2018
//
// Description: This is the logic controller for our final project.
//				It takes an inputs of cars, and a clock. It outputs
//				a 6-bit reg that corresponds to the light options
//

module trafficLight(clk, car, lights);
	input 				clk, car;
	output	reg	[6:0]	lights;
	
	reg					count, reset;
	reg 		[15:0]	Top;
	reg 		[11:0]	Bottom;
	reg			[2:0] 	sec;
	reg			[1:0]	state; // 00: GNS, 01: YNS, 10 GEW, 11 YEW; 

initial begin
	Top = 16'h0000;
	Bottom = 12'h000;
	state = 2'b00;
	sec = 3'b0;
	count = 1'b0;
	reset = 1'b0;
end
	
always @(posedge clk)begin
	case (state)
		3'b00:
			lights_reg <= 6'b100001;
		3'b01:
			lights_reg <= 6'b010001;
		3'b10:
			lights_reg <= 6'b001100;
		3'b11:
			lights_reg <= 6'b001010;
	endcase
end

always @(*)begin

	case(state)
		2'b00: begin
			if (car == 1'b1) begin
				state <= 2'b01;
				count <= 1'b1;
				end
		end
		2'b01: begin
			if (sec >= 3'd1)begin
				state <= 2'b10;
				reset <= 1'b1;
			end
			else
				reset <= 1'b0;
		end
		3'b10: begin
			if(sec >= 3'd5) begin
				state <= 2'b11;
				reset <= 1;
			end
			else
				reset <= 1'b0;
		end
		3'b11: begin
			if(sec >= 3'b1) begin
				state <= 2'b00l
				reset <= 1'b1;
				count <= 1'b0;
			end
			else
				reset <= 1'b0;
		end
	endcase
end 
always @(posedge clk or posedge reset)begin
	
	if(count == 1'b1) begin
		if(reset == 1'b1) begin
			sec <= 3'b000;
			Top <= 16'h0000;
			Bottom <= 12'h000;
		end
		else if (Top == 16'h2FAF && Bottom == 12'h080) begin
			Top <= 16'h0000;
			Bottom <= 12'h000;
			
			s0 <= s0 3'b001;
		end
		else if(Bottom == 12'hFFF)begin
			Bottom <= 12'h000;
			Top <= Top + 16'h0001;
		end
		else
			Bottom <= Bottom + 12'b000000000001;
	end
	else begin
			sec <= 3'b000;
			Top <= 16'h0000;
			Bottom <= 12'h000;
	end
	

end

endmodule
