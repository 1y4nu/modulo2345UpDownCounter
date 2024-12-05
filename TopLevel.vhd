library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TopLevel is
    Port (
        En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Cl : in STD_LOGIC;
        UD : in STD_LOGIC;
        Load : in STD_LOGIC;
        Load_Value : in STD_LOGIC_VECTOR(14 downto 0);
        Load_LED : out STD_LOGIC_VECTOR(14 downto 0);
        Warning : out STD_LOGIC;
        Switch : in STD_LOGIC;
        SevenSeg0, SevenSeg1, SevenSeg2, SevenSeg3 : out STD_LOGIC_VECTOR(6 downto 0);
        LSB : out STD_LOGIC_VECTOR(3 downto 0)
    );
end TopLevel;

architecture logic of TopLevel is
    signal CounterOutput : STD_LOGIC_VECTOR(15 downto 0);
    signal Digits : STD_LOGIC_VECTOR(15 downto 0);
    signal do_not_load : STD_LOGIC;
    signal clockIn : std_logic;

    component Base8Counter is
        Port (
            Clk : in STD_LOGIC;
            Cl : in STD_LOGIC;
            En : in STD_LOGIC;
            UD : in STD_LOGIC;
            Load : in STD_LOGIC;
            Load_Value : in STD_LOGIC_VECTOR(14 downto 0);
            Q : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component BaseConverter is
        Port (
            binaryInput : in STD_LOGIC_VECTOR(15 downto 0);
            base_switch : in STD_LOGIC;
            digits : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component sevenSegment is
        port (
            A, B, C, D : in std_logic;
            fa, fb, fc, fd, fe, ff, fg : out std_logic
        );
    end component;

    component clk_gen_1_output is
        generic (n : integer := 25000;
                 n1 : integer := 500);
        port (Clock : in std_logic;
              c_out : out std_logic);
    end component;

begin
    LSB <= Digits(3 downto 0);

    Load_LED <= Load_Value(14 downto 0);

    do_not_load <= '1' when (unsigned(Load_Value) > 6136) else Load;
    Warning <= '1' when (unsigned(Load_Value) > 6136) else '0';

    Clock : clk_gen_1_output
        port map (
            Clock => Clk,
            c_out => clockIn
        );

    Counter : Base8Counter
        port map (
            En => En,
            Clk => clockIn,
            Cl => Cl,
            UD => UD,
            Load => do_not_load,
            Load_Value => Load_Value,
            Q => CounterOutput
        );

    U_BaseConverter : BaseConverter
        port map (
            binaryInput => CounterOutput,
            base_switch => Switch,
            digits => Digits
        );

    U_SevenSeg0 : sevenSegment
        port map (
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

    U_SevenSeg1 : sevenSegment
        port map (
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

    U_SevenSeg2 : sevenSegment
        port map (
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

    U_SevenSeg3 : sevenSegment
        port map (
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
