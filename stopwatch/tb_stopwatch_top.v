`timescale 1ns/1ns
module testbench;
 wire [6:0]seg_out3;wire [6:0]seg_out2;wire [6:0]seg_out1;
 reg trigger_in,sys_clk,reset_n;

 stopwatch_top watch(trigger_in,sys_clk,reset_n,seg_out3,seg_out2,seg_out1);
 initial
 begin
 	$dumpfile("tb_stopwatch_top.vcd");
 	$dumpvars(0,testbench);
 	$monitor(trigger_in,sys_clk,reset_n,seg_out3,seg_out2,seg_out1);
 	reset_n= 1;
    sys_clk = 0;
    trigger_in = 0 ;
 end
 always #10 sys_clk = ~sys_clk;
initial
begin
	#120 trigger_in = 1;
   #40 trigger_in = 0;
   
end
endmodule