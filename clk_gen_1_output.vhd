---------------------------------------------
-- A down counter to generate a low frequency
-- clock for the ee2213 labs. The generic
-- variable n controls the output frequency.
--  - The clock frequency is 50000000/((n-1)*(n1-1)) Hz.
--  - The default frequency is 0.5 Hz.
-----------------------------------------------------------
--  01/11/2017 - Upgraded to work with QUARTUS II - v17.0 
--- E.C.G.-------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity clk_gen_1_output is
  generic( n  : integer := 25000;
           n1 : integer := 2000);  
  port( Clock : in  std_logic;
        c_out : out std_logic );
end clk_gen_1_output;

architecture behavior of clk_gen_1_output is
  signal count: integer := n;
  signal scale: integer := n1; 	
  signal c_val: std_logic := '0';
begin
  process begin
  wait until(rising_edge(Clock));
  if scale = 0 then
    if count = 0 then
      c_val <= not c_val;
      count <= n - 1;
    else
      count <= count-1;
    end if;
    scale <= n1-1;
  else
    scale <= scale - 1;
  end if;
  c_out <= c_val;
  end process;
end behavior;