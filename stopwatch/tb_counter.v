// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 

module testbench;
   
   wire [11:0]count_out;
   
   reg sys_clk,count_init,reset_n,count_enb,latch_count;
   wire carry_out;
   
   counter ctra(sys_clk,count_init,count_enb,reset_n,latch_count,count_out);
initial
 begin
 $dumpfile ("tb_counter.vcd");
$dumpvars(0,testbench);
$monitor(sys_clk,count_init,count_enb,reset_n,latch_count,count_out);
 sys_clk = 0; 
 count_enb =1;
 reset_n= 1;
 end   
always #5 sys_clk = ~sys_clk;





 

 






 





  
endmodule

     
