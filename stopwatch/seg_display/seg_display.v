// Verilog model of circuit of Figure 3.35 in Digital Systems 5th ed. 

module seg_display(sys_clk,cfg_cathode_mode,hex_in,reset_n,seg_out);
   
   output [6:0]seg_out;
   input sys_clk,cfg_cathode_mode,reset_n;
   input [3:0]hex_in;
   reg [6:0]a,seg_out;
always @(posedge sys_clk)
begin
case(hex_in)
4'h0:a = 7'b0111111;
4'h1:a = 7'b0000110;
4'h2:a = 7'b1011011;
4'h3:a = 7'b1001111;
4'h4:a = 7'b1100110;
4'h5:a = 7'b1101101;
4'h6:a = 7'b1111101;
4'h7:a = 7'b0000111;
4'h8:a = 7'b1111111;
4'h9:a = 7'b1100111;
4'hA:a = 7'b1110111;
4'hB:a = 7'b1111100;
4'hC:a = 7'b0111001;
4'hD:a = 7'b1011110;
4'hE:a = 7'b1111001;
4'hF:a = 7'b1110001;
endcase
if (reset_n == 1)
  begin
  if (cfg_cathode_mode ==1)
  seg_out = a;
  else
  seg_out =~a;
  end
else
seg_out = 7'b0111111;
end
endmodule

     
