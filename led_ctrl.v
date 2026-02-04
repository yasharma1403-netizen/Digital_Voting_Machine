module led_ctrl(
    input clk, reset, mode, valid_vote_casted,
	input [7:0] cand1_vote, cand2_vote, cand3_vote, cand4_vote,
	input cand1_button_press, cand2_button_press, cand3_button_press, cand4_button_press,
	output reg [7:0] LEDs);
	
	reg [31:0] counter;
	  
	always@(posedge clk)
	begin
	 if(reset)
	  counter<=0;
	 else if(valid_vote_casted)
	  counter<=counter+1;
	 else if(counter!=0 & counter<10)
	 counter<=counter+1;
	 else 
	  counter<=0;
	end
	
	always@(posedge clk)
	begin
	 if(reset)
	  LEDs <= 0;
	 else
	  begin
	   if(mode==0 & counter<10)
	    LEDs <= 8'hFF;
	   else if(mode==0) //voting mode
	    LEDs <= 0;
	   else if(mode==1) //result mode
	    begin
		 if(cand1_button_press)
		  LEDs<=cand1_vote;
	     else if(cand2_button_press)
		  LEDs<=cand2_vote;
		 else if(cand3_button_press)
		  LEDs<=cand3_vote;
		 else if(cand4_button_press)
		  LEDs<=cand4_vote;
		end
	  end
	end
endmodule