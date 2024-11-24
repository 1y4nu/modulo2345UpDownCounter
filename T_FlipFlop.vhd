
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_FlipFlop is
    Port (
        T : in STD_LOGIC;
        clk : in STD_LOGIC;
        cl : in STD_LOGIC;
		  Load : in STD_LOGIC;
        Load_Value : in STD_LOGIC;
        Q : out STD_LOGIC  
    );
end T_FlipFlop;

architecture logic of T_FlipFlop is
    signal Qt : STD_LOGIC;
begin
    process (clk, cl, T, Load, Load_Value)
    begin
        if cl = '0' then
            Qt <= '0';
        elsif rising_edge(clk) then
            if Load = '1' then
                Qt <= Load_Value;
            elsif T = '1' then
                Qt <= not Qt;
            end if;
        end if;
    end process;
    Q <= Qt;
end logic;
