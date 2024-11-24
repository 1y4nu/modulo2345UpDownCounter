library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UpDownCounter is
    Port (
		  En : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Cl : in STD_LOGIC;
        UD : in STD_LOGIC;   -- '1' for down, '0' for up
		  Load : in STD_LOGIC;
		  Load_Value : in STD_LOGIC_VECTOR(12 downto 0);
        Q : out STD_LOGIC_VECTOR(12 downto 0)
    );
end UpDownCounter;

architecture logic of UpDownCounter is
    signal Qt : STD_LOGIC_VECTOR(12 downto 0);
	 signal clear : STD_LOGIC; -- Internal clear signal
	 signal load_2344 : STD_LOGIC_VECTOR(12 downto 0);
	 signal load_signal : STD_LOGIC;
	 
	 signal clockIn : std_logic;
	 
	 
    component T_FlipFlop
        Port (
            T : in STD_LOGIC;
				clk : in STD_LOGIC;
				cl : in STD_LOGIC;
				Load : in STD_LOGIC;
				Load_Value : in STD_LOGIC;
				Q : out STD_LOGIC 
        );
    end component;
	 
	 component sevenSegment is
	port(
		A, B, C, D : in std_logic; --input
		fa, fb, fc, fd, fe, ff, fg : out std_logic --output
		);
	end component;
	 
	component clk_gen_1_output is
		  generic( n  : integer := 25000;
					  n1 : integer := 2000);  
		  port( Clock : in  std_logic;
				  c_out : out std_logic );
	end component;
	 
begin
	
	load_2344 <= "0100100101000" when Qt = "0000000000000" and UD = '1' else Load_Value;
	
	
	load_signal <= '1' when (Qt = "0000000000000" and UD = '1') or Load = '1' else '0';
	

	clear <= not(Qt(0) and Qt(3) and Qt(5) and Qt(8) and Qt(11)) and Cl;
	

	
	Clock : clk_gen_1_output port map (
		Clock => Clk,
		c_out => clockIn
	);
	
	
    stage0 : T_FlipFlop port map (
        T => '1' and En,
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(0),
        Q => Qt(0)
    );
    
    stage1 : T_FlipFlop port map (
        T => ((Qt(0) AND NOT UD) OR (NOT Qt(0) AND UD)) and En,
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(1),
        Q => Qt(1)
    );
    
    stage2 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(2),
        Q => Qt(2)
    );
    
    stage3 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(3),
        Q => Qt(3)
    );
	 
	 stage4 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(4),
        Q => Qt(4)
    );
	 
	 stage5 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(5),
        Q => Qt(5)
    );
	 
	 stage6 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(6),
        Q => Qt(6)
    );
	 
	 stage7 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(7),
        Q => Qt(7)
    );
	 
	 stage8 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(8),
        Q => Qt(8)
    );
	 
	 stage9 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(9),
        Q => Qt(9)
    );
	 
	 stage10 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND Qt(9) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND NOT(Qt(9)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(10),
        Q => Qt(10)
    );
	 
	 stage11 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND Qt(9) AND Qt(10) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND NOT(Qt(9)) AND NOT(Qt(10)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(11),
        Q => Qt(11)
    );
	 
	 stage12 : T_FlipFlop port map (
        T => ((Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND Qt(9) AND Qt(10) AND Qt(11) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND NOT(Qt(9)) AND NOT(Qt(10)) AND NOT(Qt(11)) AND UD)) and En,
		  
        clk => Clk,
        cl => clear,
		  Load => load_signal,
		  Load_Value => load_2344(12),
        Q => Qt(12)
    );
	  
	 	 

    Q <= Qt;

end logic;
