library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopLevel is
    Port (
        Clk : in STD_LOGIC;
        Cl : in STD_LOGIC;
        UD : in STD_LOGIC;      -- Up/Down control
		  Load : in STD_LOGIC;
		  Load_Value : in STD_LOGIC_VECTOR(12 downto 0);
        Switch : in STD_LOGIC;  -- Select base (0 for base 8, 1 for base 14)
        SevenSeg0, SevenSeg1, SevenSeg2 : out STD_LOGIC_VECTOR(6 downto 0) -- Three 7-segment displays
    );
end TopLevel;

architecture logic of TopLevel is
    signal CounterOutput : STD_LOGIC_VECTOR(12 downto 0); -- Counter output
    signal Digits : STD_LOGIC_VECTOR(11 downto 0);

	component UpDownCounter
		 Port (
			  Clk : in STD_LOGIC;
			  Cl : in STD_LOGIC;
			  UD : in STD_LOGIC;
			  Load : in STD_LOGIC;
			  Load_Value : in STD_LOGIC_VECTOR(12 downto 0);
			  Q : out STD_LOGIC_VECTOR(12 downto 0)
		 );
	end component;
	
	component BaseConverter
		 Port (
			  binaryInput : in STD_LOGIC_VECTOR(12 downto 0);
			  base_switch : in STD_LOGIC;
			  digits : out STD_LOGIC_VECTOR(11 downto 0)
		 );
	end component;
	
	component sevenSegment is
	port(
		A, B, C, D : in std_logic; --input
		fa, fb, fc, fd, fe, ff, fg : out std_logic --output
		);
	end component;
	
	
begin
    -- Up/Down Counter
    U_Counter : UpDownCounter
        Port map (
            Clk => Clk,
            Cl => Cl,
            UD => UD,
            Load => Load,
            Load_Value => Load_Value,
            Q => CounterOutput
        );

    -- Base Converter
    U_BaseConverter : BaseConverter
        Port map (
            binaryInput => CounterOutput,
            base_switch => Switch,
            digits => Digits
        );

    -- Seven-Segment Display for least significant digit
    U_SevenSeg0 : sevenSegment
        Port map (
            A => Digits(3),
            B => Digits(2),
            C => Digits(1),
            D => Digits(0),
            fa => SevenSeg0(0),
            fb => SevenSeg0(1),
            fc => SevenSeg0(2),
            fd => SevenSeg0(3),
            fe => SevenSeg0(4),
            ff => SevenSeg0(5),
            fg => SevenSeg0(6)
        );

    -- Seven-Segment Display for next digit
    U_SevenSeg1 : sevenSegment
        Port map (
            A => Digits(7),
            B => Digits(6),
            C => Digits(5),
            D => Digits(4),
            fa => SevenSeg1(0),
            fb => SevenSeg1(1),
            fc => SevenSeg1(2),
            fd => SevenSeg1(3),
            fe => SevenSeg1(4),
            ff => SevenSeg1(5),
            fg => SevenSeg1(6)
        );

    -- Seven-Segment Display for next digit
    U_SevenSeg2 : sevenSegment
        Port map (
            A => Digits(11),
            B => Digits(10),
            C => Digits(9),
            D => Digits(8),
            fa => SevenSeg2(0),
            fb => SevenSeg2(1),
            fc => SevenSeg2(2),
            fd => SevenSeg2(3),
            fe => SevenSeg2(4),
            ff => SevenSeg2(5),
            fg => SevenSeg2(6)
        );

end logic;
