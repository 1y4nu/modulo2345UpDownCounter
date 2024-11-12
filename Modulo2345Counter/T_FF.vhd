library ieee;
use ieee.std_logic_1164.all;

entity T_FF is 
    port (
        UD, CLK, T, CL, PR : in std_logic;
        Q, Qn : out std_logic
    );
end T_FF;

architecture logic_func of T_FF is 
    signal Qt : std_logic;
begin
	process(CLK)
		begin
			if rising_edge(CLK) then
				-- Synchronous Clear and Preset
				if (CL = '0') then
                Qt <= '0';  -- Clear
            elsif (PR = '0') then
                Qt <= '1';  -- Preset
            elsif (T = '1') then
                Qt <= NOT(Qt);  -- Toggle
            end if;
			end if;
		
			if (UD = '0') then
				Q <= Qt;
				
			elsif (UD = '1') then
				Q <= not(Qt);
			end if;
    
	 end process;
	 Qn <= Qt;
	 
end logic_func;
