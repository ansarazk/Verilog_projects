module dec_ctr(sys_clk,cfg_cntr_mode,count_enb,reset_n,load_cnt,load_value,count_out,carry_out);
   output [3:0]count_out;
   input [3:0]load_value;
   input sys_clk,cfg_cntr_mode,reset_n,count_enb,load_cnt;
   output carry_out;
   reg [3:0]count_out;
   reg carry_out;
  initial
    begin
      carry_out = 0;
      count_out = 4'h0; 
   end
  always @(posedge sys_clk,negedge reset_n)
  begin
   if (reset_n == 1 )
    begin
     if (load_cnt == 1)
         count_out = load_value;
       else if (count_enb ==1)
         begin
           if (cfg_cntr_mode == 1)
             begin
               if (count_out == 4'b1001)
                 begin
                   count_out = 4'b0000;
                   carry_out = ~carry_out;
                 end
               else
                  count_out = count_out + 4'b0001;
             end
           else
              begin
                if (count_out == 4'b0000)
                  begin
                   count_out = 4'b1001;
                   carry_out = ~carry_out;
                  end
                else
                  count_out = count_out - 4'b0001;
              end
         end
     
    end
   else
    begin
     count_out = 4'b0000;
     carry_out = 0;
    end
  end
endmodule

     
