// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 
`timescale 1ns/1ns
module testbench;
   
   wire base_tick;
   reg sys_clk,reset_n,timer_enb;
   
   timer timer1(sys_clk,reset_n,timer_enb,base_tick);
initial
 begin
 $dumpfile ("tb_timer.vcd");
$dumpvars(0,testbench);
$monitor(sys_clk,reset_n,timer_enb,base_tick);
 sys_clk = 0; 
 timer_enb =1;
 reset_n= 1;
 end   
always #10 sys_clk = ~sys_clk;





 

 






 





  
endmodule

     
