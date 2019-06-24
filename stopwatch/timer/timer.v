

module timer(sys_clk,reset_n,timer_enb,base_tick);
   output base_tick;
   input sys_clk,reset_n,timer_enb;
   reg [11:0] count101,count102;
   reg [7:0] count50;
   reg base_tick;
     initial
     begin
           base_tick = 0;
           count50 =8'h00;
           count101 =12'h000;
           count102 =12'h000;

      end      
 
     always @(negedge sys_clk) 
     	begin
     		if (reset_n == 1)
     		 begin
     		 	if (timer_enb == 1)
     		 	 begin
     		 	 	if (count102 == 12'h3E8)
     		 	 	 begin
     		 	 	 	count101 = count101 + 12'h001;
     		 	 	 	count102 = 12'h000;
     		 	 	 end
     		 	 	 else begin
     		 	 	 	count102 = count102 + 12'h001;
     		 	 	 end
     		 	 	if (count101 == 12'h3E8)
     		 	 	 begin
     		 	 	  	count50 = count50 + 8'h01;
     		 	 	  	count101 = 12'h000;
     		 	 	  end 
     		 	 	if (count50 == 8'h32) begin
     		 	 		base_tick = ~base_tick;
     		 	 		count50 = 8'h00;
     		 	 	end
     		 	 end
     		 end
     		else begin
     			base_tick = 0;
           count50 =8'h00;
           count101 =12'h000;
           count102 =12'h000;
     		end
     	end
       
   
    	
    

 
 	
 	
 	
 
endmodule

     
