// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 
`timescale 1ns/1ns
module testbench;
   
   wire latch_count,count_enb,count_init;
   reg trigger_in,sys_clk,reset_n;
 trigger_det trigger(trigger_in,sys_clk,reset_n,latch_count,count_enb,count_init);
   
initial
 begin
 $dumpfile ("tb_trigger_det.vcd");
$dumpvars(0,testbench);
$monitor(latch_count,count_enb,count_init,trigger_in,sys_clk,reset_n);
 sys_clk = 0; 
 trigger_in = 0 ;
 reset_n= 1;
 end   
always #20 sys_clk = ~sys_clk;
initial
begin
   #120 trigger_in = 1;
   #40 trigger_in = 0;
   #240 trigger_in =1;
   #40  trigger_in =0;
end




 

 






 





  
endmodule

     
