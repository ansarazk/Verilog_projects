// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 

module testbench;
   
   wire [6:0]seg_out;
   reg sys_clk,cfg_cathode_mode,reset_n;
   reg [3:0]hex_in;
seg_display disp(sys_clk,cfg_cathode_mode,hex_in,reset_n,seg_out);
initial
 begin
 $dumpfile ("tb_seg_display.vcd");
$dumpvars(0,testbench);
$monitor(sys_clk,cfg_cathode_mode,hex_in,reset_n,seg_out);
 cfg_cathode_mode = 1;
 reset_n= 1;
 hex_in = 4'h0;
 sys_clk = 0;
 end   
always #5 sys_clk = ~sys_clk;

always
#10 hex_in  = hex_in + 4'h1;  





  
endmodule

     
