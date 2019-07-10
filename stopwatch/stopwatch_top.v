`include "timer.v"
`include "seg_display.v"
`include "trigger_det.v"
`include "counter.v"

module stopwatch_top(trigger_in,sys_clk,reset_n,seg_out3,seg_out2,seg_out1);

input trigger_in,sys_clk,reset_n;
output [6:0]seg_out1;output [6:0]seg_out2;output [6:0]seg_out3;
wire latch_count,count_enb,count_init;
wire base_tick;
wire [11:0]count_out;

trigger_det trigger1(trigger_in,sys_clk,reset_n,latch_count,count_enb,count_init);
timer timer1(sys_clk,reset_n,count_enb,base_tick);
counter counter1(base_tick,count_init,count_enb,reset_n,latch_count,count_out);
seg_display disp1(sys_clk,1'b0,count_out[11:8],reset_n,seg_out3);
seg_display disp2(sys_clk,1'b0,count_out[7:4],reset_n,seg_out2);
seg_display disp3(sys_clk,1'b0,count_out[3:0],reset_n,seg_out1);

endmodule


