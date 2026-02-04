module vote_logger(
  input clk, reset, mode, cand1_vote_valid, cand2_vote_valid, cand3_vote_valid, cand4_vote_valid,
  output reg [31:0] cand1_vote_rcvd, cand2_vote_rcvd, cand3_vote_rcvd, cand4_vote_rcvd);
  
 always@(posedge clk)
  begin
   if(reset)
    begin
	 cand1_vote_rcvd<=0;
	 cand2_vote_rcvd<=0;
	 cand3_vote_rcvd<=0;
	 cand4_vote_rcvd<=0;
	end
   else if(mode==0) begin
	 if(cand1_vote_valid)
	  cand1_vote_rcvd<=cand1_vote_rcvd+1;
	 else if(cand2_vote_valid)
	  cand2_vote_rcvd<=cand2_vote_rcvd+1;
	 else if(cand3_vote_valid)
	  cand3_vote_rcvd<=cand3_vote_rcvd+1;
	 else if(cand4_vote_valid)
	  cand4_vote_rcvd<=cand4_vote_rcvd+1;
	end
  end
endmodule