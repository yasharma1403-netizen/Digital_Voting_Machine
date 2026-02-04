module tb_voting_machine;

reg clk, reset, mode;
reg cand1_button,cand2_button, cand3_button, cand4_button;
wire [7:0] LEDs;

voting_machine DUT(.clk(clk), ,reset(reset), .mode(mode), 
                            .cand1_button(cand1_button), .cand2_button(cand2_button), .cand3_button(cand3_button), .cand4_button(cand4_button),
							.LEDs(LEDs));
							
initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin
    // Initialize Inputs
    reset = 1; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    // Wait 100 ns for global reset to finish
    #100;

    // Add stimulus here

    #100 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 1; button2 = 0; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;

    #5 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;

    #5 reset = 0; mode = 0; button1 = 0; button2 = 1; button3 = 1; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
	
	#5 reset = 0; mode = 1; button1 = 0; button2 = 1; button3 = 0; button4 = 0;
    #200 reset = 0; mode = 1; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
	
	#5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 1; button4 = 0;
    #200 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #10 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;
    #5 reset = 0; mode = 0; button1 = 0; button2 = 0; button3 = 0; button4 = 0;

$finish;
end
 initial
 $monitor($time, "mode = %b, button1 = %b, button2 = %b, button3 = %b, button4 = %b, led = %d", mode, button1, button2, button3, button4, LEDs);
endmodule