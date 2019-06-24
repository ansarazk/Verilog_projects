// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 

module testbench;
   
   wire [3:0]count_out;
   reg [3:0]load_value;
   reg sys_clk,cfg_cntr_mode,reset_n,count_enb,load_cnt;
   wire carry_out;
   
dec_ctr ctr1(sys_clk,cfg_cntr_mode,count_enb,reset_n,load_cnt,load_value,count_out,carry_out);
initial
 begin
 $dumpfile ("tb_dec_ctr.vcd");
$dumpvars(0,testbench);
$monitor(sys_clk,cfg_cntr_mode,count_enb,reset_n,load_cnt,load_value,count_out,carry_out);
 sys_clk = 0; 
 end   
always #5 sys_clk = ~sys_clk;
initial
 begin 

 cfg_cntr_mode = 1;  //load count check
 reset_n= 1;
 load_cnt =1;
 count_enb =0;
 #10 load_value= 4'b0111;
 #10 load_value = 4'b0101;
 #10 load_value = 4'b0100;

 #10 load_cnt = 0;   //up counter check
     count_enb =1;
 #45
 
 #10 cfg_cntr_mode = 0;  //down_counter check
 #45  
 #10 count_enb = 0;
 #10 count_enb = 0;
 #10 count_enb = 0;
 #10 reset_n =0;
 #10 reset_n =0;




 

 end






 





  
endmodule

     
