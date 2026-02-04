module voting_machine(
    input clk, reset, mode, cand1_button, cand2_button, cand3_button, cand4_button,
	output [7:0] LEDs);
	
	wire valid_vote_1, valid_vote_2, valid_vote_3, valid_vote_4;
	wire [7:0] cand1_vote_rcvd, cand2_vote_rcvd, cand3_vote_rcvd, cand4_vote_rcvd;
	wire any_valid_vote;
	
	button_control_VALIDITY bc1(
	     .clk(clk), .reset(reset),
		 .button(cand1_button),
		 .valid_vote(valid_vote_1)
		 );
	
	button_control_VALIDITY bc2(
	     .clk(clk), .reset(reset),
		 .button(cand2_button),
		 .valid_vote(valid_vote_2)
		 );
	
	button_control_VALIDITY bc3(
	     .clk(clk), .reset(reset),
		 .button(cand3_button),
		 .valid_vote(valid_vote_3)
		 );
		 
	button_control_VALIDITY bc4(
	     .clk(clk), .reset(reset),
		 .button(cand4_button),
		 .valid_vote(valid_vote_4)
		 );
		 
	assign any_valid_vote = valid_vote_1 | valid_vote_2 | valid_vote_3 | valid_vote_4;
		 
	
	vote_logger VL(
	     .clk(clk), .reset(reset), .mode(mode),
	     .cand1_vote_valid(valid_vote_1),
		 .cand2_vote_valid(valid_vote_2),
   		 .cand3_vote_valid(valid_vote_3),
         .cand4_vote_valid(valid_vote_4),
         .cand1_vote_rcvd(cand1_vote_rcvd),
  		 .cand2_vote_rcvd(cand2_vote_rcvd),
		 .cand3_vote_rcvd(cand3_vote_rcvd), 
		 .cand4_vote_rcvd(cand4_vote_rcvd)
		 );
		 
    led_ctrl LC(
    .clk(clk), .reset(reset), .mode(mode),
	.valid_vote_casted(any_valid_vote),
	.cand1_vote(cand1_vote_rcvd),
	.cand2_vote(cand2_vote_rcvd),
	.cand3_vote(cand3_vote_rcvd),
	.cand4_vote(cand4_vote_rcvd),
	.cand1_button_press(valid_vote_1),
	.cand2_button_press(valid_vote_2),
	.cand3_button_press(valid_vote_3),
	.cand4_button_press(valid_vote_4),
	.LEDs(LEDs)
	);
endmodule


         	

	
	  
	   