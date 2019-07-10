
module trigger_det (trigger_in,sys_clk,reset_n,latch_count,count_enb,count_init);  
 input trigger_in,sys_clk,reset_n;
 output latch_count,count_enb,count_init;         
 
    reg  trigger_dly,k=0;                         
    
  always @ (posedge sys_clk,negedge reset_n) 
  begin
     trigger_dly <= trigger_in;
     if (trigger_in & ~trigger_dly)
      begin k = ~k; end
  end
  
  assign latch_count = k; 
  assign  count_enb = k;
  assign count_init = k;
   
           
endmodule 
     
