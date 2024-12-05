library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Base8Counter is
    Port (
        Clk : in STD_LOGIC;
        Cl : in STD_LOGIC;          
        En : in STD_LOGIC;          
        UD : in STD_LOGIC;          
        Load : in STD_LOGIC;       
        Load_Value : in STD_LOGIC_VECTOR(14 downto 0);
        Q : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Base8Counter;

architecture logic of Base8Counter is
    -- Each digit represents a base-8 value (0 to 7)
    signal digit0, digit1, digit2, digit3, digit4 : INTEGER range 0 to 7;
    signal combined_count : INTEGER range 0 to 32767;
begin


    process(Clk, Cl)
    begin
        if Cl = '0' then
            -- Reset all digits to 0
            digit0 <= 0;
            digit1 <= 0;
            digit2 <= 0;
            digit3 <= 0;
            digit4 <= 0;

        elsif rising_edge(Clk) then
            if Load = '0' then
                digit0 <= to_integer(unsigned(Load_Value(2 downto 0)));
                digit1 <= to_integer(unsigned(Load_Value(5 downto 3)));
                digit2 <= to_integer(unsigned(Load_Value(8 downto 6)));
                digit3 <= to_integer(unsigned(Load_Value(11 downto 9)));
                digit4 <= to_integer(unsigned(Load_Value(14 downto 12)));
            elsif En = '1' then
                if UD = '0' then
                    -- Count up logic
                    if digit0 = 7 then
                        digit0 <= 0;
                        if digit1 = 7 then
                            digit1 <= 0;
                            if digit2 = 7 then
                                digit2 <= 0;
                                if digit3 = 7 then
                                    digit3 <= 0;
                                    if digit4 = 7 then
                                        digit4 <= 0;
                                    else
                                        digit4 <= digit4 + 1;
                                    end if;
                                else
                                    digit3 <= digit3 + 1;
                                end if;
                            else
                                digit2 <= digit2 + 1;
                            end if;
                        else
                            digit1 <= digit1 + 1;
                        end if;
                    else
                        digit0 <= digit0 + 1;
                    end if;

                else
                    -- Count down logic
                    if digit0 = 0 then
                        digit0 <= 7;
                        if digit1 = 0 then
                            digit1 <= 7;
                            if digit2 = 0 then
                                digit2 <= 7;
                                if digit3 = 0 then
                                    digit3 <= 7;
                                    if digit4 = 0 then
                                        digit4 <= 7;
                                    else
                                        digit4 <= digit4 - 1;
                                    end if;
                                else
                                    digit3 <= digit3 - 1;
                                end if;
                            else
                                digit2 <= digit2 - 1;
                            end if;
                        else
                            digit1 <= digit1 - 1;
                        end if;
                    else
                        digit0 <= digit0 - 1;
                    end if;
                end if;
            end if;
        end if;
		  
		  if combined_count = 6137 then
			  -- Reset the counter
			  digit0 <= 0;
			  digit1 <= 0;
			  digit2 <= 0;
			  digit3 <= 0;
			  digit4 <= 0;
	     end if;
		  
		  if combined_count = 0000 and UD = '1' and rising_edge(Clk) and En = '1' then
			  -- Load Max
			  digit0 <= 0;
			  digit1 <= 7;
			  digit2 <= 7;
			  digit3 <= 3;
			  digit4 <= 1;
	     end if;
		  
    end process;
	 
    combined_count <= digit4 * 4096 + digit3 * 512 + digit2 * 64 + digit1 * 8 + digit0;

    Q <= std_logic_vector(to_unsigned(combined_count, 16));

end logic;
