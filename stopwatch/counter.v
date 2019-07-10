`include "dec_ctr.v"

module counter(sys_clk,count_init,count_enb,reset_n,latch_count,count_out);
   output [11:0]count_out;
   input sys_clk,count_init,reset_n,count_enb,latch_count;
   //wire [11:0]count_out;
   wire [11:0]count_out;
   wire c1,c2,c3;
   reg clk2,clk3;

   reg [11:0]hold_count;
  
 dec_ctr ctr1(sys_clk,1'b1,count_enb,reset_n,1'b0,4'b0000,count_out[3:0],c1);
 dec_ctr ctr2(clk2,1'b1,count_enb,reset_n,1'b0,4'b0000,count_out[7:4],c2);
 dec_ctr ctr3(clk3,1'b1,count_enb,reset_n,1'b0,4'b0000,count_out[11:8],c3);
     initial
     begin
           clk2 =0;
           clk3 =0;	
           end      
 
     always @(posedge c1 or negedge c1) 
     	clk2 = ~clk2;
    
     always @(posedge c2 or negedge c2) 
      clk3 = ~clk3;

  always @(count_init) begin
    hold_count = count_out;
  end
     
    	
    

 
 	
 	
 	
 
endmodule

     
