`timescale 1ns/10ps
 
`include "../miner.v"
`include "../sha2/sha256_w_mem.v"
`include "../sha2/sha256_stream.v"
`include "../sha2/sha256_k_constants.v"
`include "../sha2/sha256_core.v"
`include "../sha2/sha256.v"

  
module tb_miner ();


reg           tb_clk;
reg           tb_reset_n;
//output [3:0]   tb_counter_out;
parameter CLK_HALF_PERIOD = 2;
parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;


miner dut(
  .clock(tb_clk),
  .reset(tb_reset_n)
);



always
begin : clk_gen
  #CLK_HALF_PERIOD;
  tb_clk = !tb_clk;
end



initial
begin : tb_miner
  tb_clk = 0;
  tb_reset_n = 1;
  #CLK_PERIOD;
  tb_reset_n = 0;
  $display("   -- Testbench for miner started --");
end



endmodule