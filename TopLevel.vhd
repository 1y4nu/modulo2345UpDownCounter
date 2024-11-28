library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopLevel is
    Port (
		  En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Cl : in STD_LOGIC;
        UD : in STD_LOGIC;      -- Up/Down control
		  Load : in STD_LOGIC;
		  Load_Value : in STD_LOGIC_VECTOR(12 downto 0);
		  Load_LED : out STD_LOGIC_VECTOR(12 downto 0);
		  Warning : out STD_LOGIC;
        Switch : in STD_LOGIC;  -- Select base (0 for base 8, 1 for base 14)
        SevenSeg0, SevenSeg1, SevenSeg2, SevenSeg3 : out STD_LOGIC_VECTOR(6 downto 0) -- Four 7-segment displays
    );
end TopLevel;

architecture logic of TopLevel is
    signal CounterOutput : STD_LOGIC_VECTOR(12 downto 0); -- Counter output
    signal Digits : STD_LOGIC_VECTOR(15 downto 0);
	 signal do_not_load : STD_LOGIC;


	component UpDownCounter
		 Port (
			  En : in STD_LOGIC;
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
			  digits : out STD_LOGIC_VECTOR(15 downto 0)
		 );
	end component;
	
	component sevenSegment is
	port(
		A, B, C, D : in std_logic; --input
		fa, fb, fc, fd, fe, ff, fg : out std_logic --output
		);
	end component;
	
	
	
begin


	Load_LED <= Load_Value;

	
	do_not_load <= '1' when (Load_Value > "0100100101000") else Load;
		
	Warning <= '1' when (Load_Value > "0100100101000") else '0';
	
    -- Up/Down Counter
    U_Counter : UpDownCounter
        Port map (
				En => En,
            Clk => Clk,
            Cl => Cl,
            UD => UD,
            Load => do_not_load,
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
            A => Digits(0),
            B => Digits(1),
            C => Digits(2),
            D => Digits(3),
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
            A => Digits(4),
            B => Digits(5),
            C => Digits(6),
            D => Digits(7),
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
            A => Digits(8),
            B => Digits(9),
            C => Digits(10),
            D => Digits(11),
            fa => SevenSeg2(0),
            fb => SevenSeg2(1),
            fc => SevenSeg2(2),
            fd => SevenSeg2(3),
            fe => SevenSeg2(4),
            ff => SevenSeg2(5),
            fg => SevenSeg2(6)
        );
		  
	-- Seven-Segment Display for next digit
    U_SevenSeg3 : sevenSegment
        Port map (
            A => Digits(12),
            B => Digits(13),
            C => Digits(14),
            D => Digits(15),
            fa => SevenSeg3(0),
            fb => SevenSeg3(1),
            fc => SevenSeg3(2),
            fd => SevenSeg3(3),
            fe => SevenSeg3(4),
            ff => SevenSeg3(5),
            fg => SevenSeg3(6)
        );

end logic;
