library ieee;
use ieee.std_logic_1164.all;
entity T_FF is 
	port (
		CLK, T, CL, PR : in std_logic;
		Q, Qn : out std_logic
	);
end T_FF;
architecture logic_func of T_FF is 
	signal Qt : std_logic;
	begin
		process(CLK, T, CL, PR)
			begin
				-- asynchronous clear and preset with XOR Condition
				if (CL = '0') then
					Qt <= '0';
				elsif (PR <= '0') then
					Qt <= '1';
					
				-- Synchronous Toggle on Rising Edge of Clock
				elsif rising_edge(CLK) then
					if (T = '1') then
						Qt <= NOT(Qt);
					end if;
				end if;
		end process;
	Q <= Qt;
	Qn <= NOT(Qt);
end logic_func;