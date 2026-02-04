module button_control_VALIDITY(
       input clk, reset, button,
	   output reg valid_vote);
	   
//counter for valid_vote//
	  reg [31:0] counter;
	  always@(posedge clk)
	   begin
	    if(reset)
		 counter <= 0;
		else
		 begin
		  if(button & counter < 11)
		   counter <= counter + 1;
		  else if(!button)
		   counter <= 0;
	   end
	  end
	  
//valid vote logic//
	  always@(posedge clk)
	   begin
	    if(reset)
		 valid_vote<=1'b0;
		else
		 begin
		  if(counter==10)
		   valid_vote<=1'b1;
		  else
		   valid_vote<=1'b0;
		 end
	   end
	
endmodule

/*module button_control_VALIDITY(
       input clk, reset, button,
	   output reg btn_prs_success);
	   
	  reg [31:0] counter;
	  always@(posedge clk)
	   begin
	    if(reset)
		 counter <= 0;
		else
		 begin
		  if(button & counter < 11)
		   counter <= counter + 1;
		  else if(!button)
		   counter <= 0;
	     end
	   end
	  
	  always@(posedge clk)
	   begin
	    if(reset)
		 btn_prs_success<=1'b0;
		else
		 begin
		  if(counter==10)
		   btn_prs_success<=1'b1;
		  else
		   btn_prs_success<1'b0;
		 end
	   end
endmodule*/