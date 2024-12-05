library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BaseConverter is
    Port (
        binaryInput : in STD_LOGIC_VECTOR(15 downto 0);
        base_switch : in STD_LOGIC;
        digits : out STD_LOGIC_VECTOR(15 downto 0)
    );
end BaseConverter;

architecture logic of BaseConverter is
begin
    process(binaryInput, base_switch)
        variable decimalValue : INTEGER;
        variable base_variable : INTEGER;
        variable digit0, digit1, digit2, digit3 : INTEGER;
    begin
        decimalValue := to_integer(unsigned(binaryInput));

        if base_switch = '0' then
            base_variable := 8;
        else
            base_variable := 14;
        end if;

        digit0 := decimalValue mod base_variable;
        decimalValue := decimalValue / base_variable;

        digit1 := decimalValue mod base_variable;
        decimalValue := decimalValue / base_variable;

        digit2 := decimalValue mod base_variable;
        decimalValue := decimalValue / base_variable;

        digit3 := decimalValue mod base_variable;

        digits(3 downto 0) <= std_logic_vector(to_unsigned(digit0, 4));
        digits(7 downto 4) <= std_logic_vector(to_unsigned(digit1, 4));
        digits(11 downto 8) <= std_logic_vector(to_unsigned(digit2, 4));
        digits(15 downto 12) <= std_logic_vector(to_unsigned(digit3, 4));
    end process;
end logic;
