

module RGB_PWM(input [7:0] brightness, input CLK, input [5:0] RGB_LED_in, output [5:0] RBG_LED_out);

PMW PMW0(.brightness(brightness), .CLK(CLK), .LED_in(RGB_LED_in[0]), .LED_o(RBG_LED_out[0]);

PMW PMW1(.brightness(brightness), .CLK(CLK), .LED_in(RGB_LED_in[1]), .LED_o(RBG_LED_out[1]);

PMW PMW2(.brightness(brightness), .CLK(CLK), .LED_in(RGB_LED_in[2]), .LED_o(RBG_LED_out[2]);

PMW PMW3(.brightness(brightness), .CLK(CLK), .LED_in(RGB_LED_in[3]), .LED_o(RBG_LED_out[3]);

PMW PMW4(.brightness(brightness), .CLK(CLK), .LED_in(RGB_LED_in[4]), .LED_o(RBG_LED_out[4]);

PMW PMW5(.brightness(brightness), .CLK(CLK), .LED_in(RGB_LED_in[5]), .LED_o(RBG_LED_out[5]);


endmodule

module PMW (input [7:0] brightness, input CLK, input LED_in, output LED_o);

reg [7:0] counter, counter_next;
reg LED_s, LED_next;


assign LED_o = LED_s;


always @(posedge CLK) begin
	counter <= counter_next;
	LED_s <= LED_next;
end

always @ (*) begin
	if (counter == 8'hFF) begin
		counter_next = 0;
	end else begin
		counter_next = counter+1;
	end

	if (counter < brightness) begin
		LED_next = LED_in
	end else begin
		LED_next = 1'b0;
	end
end


endmodule