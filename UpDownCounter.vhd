library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UpDownCounter is
    Port (
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
	 
begin

	clear <= not(Qt(0) and Qt(3) and Qt(5) and Qt(8) and Qt(11)) and Cl;
	

    stage0 : T_FlipFlop port map (
        T => '1',
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(0),
        Q => Qt(0)
    );
    
    stage1 : T_FlipFlop port map (
        T => (Qt(0) AND NOT UD) OR (NOT Qt(0) AND UD),
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(1),
        Q => Qt(1)
    );
    
    stage2 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(2),
        Q => Qt(2)
    );
    
    stage3 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(3),
        Q => Qt(3)
    );
	 
	 stage4 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(4),
        Q => Qt(4)
    );
	 
	 stage5 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(5),
        Q => Qt(5)
    );
	 
	 stage6 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(6),
        Q => Qt(6)
    );
	 
	 stage7 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(7),
        Q => Qt(7)
    );
	 
	 stage8 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(8),
        Q => Qt(8)
    );
	 
	 stage9 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(9),
        Q => Qt(9)
    );
	 
	 stage10 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND Qt(9) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND NOT(Qt(9)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(10),
        Q => Qt(10)
    );
	 
	 stage11 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND Qt(9) AND Qt(10) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND NOT(Qt(9)) AND NOT(Qt(10)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(11),
        Q => Qt(11)
    );
	 
	 stage12 : T_FlipFlop port map (
        T => (Qt(0) AND Qt(1) AND Qt(2) AND Qt(3) AND Qt(4) AND Qt(5) AND Qt(6) AND Qt(7) AND Qt(8) AND Qt(9) AND Qt(10) AND Qt(11) AND NOT(UD)) OR 
		  (NOT(Qt(0)) AND NOT(Qt(1)) AND NOT(Qt(2)) AND NOT(Qt(3)) AND NOT(Qt(4)) AND NOT(Qt(5)) AND NOT(Qt(6)) AND NOT(Qt(7)) AND NOT(Qt(8)) AND NOT(Qt(9)) AND NOT(Qt(10)) AND NOT(Qt(11)) AND UD),
		  
        clk => Clk,
        cl => clear,
		  Load => Load,
		  Load_Value => Load_Value(12),
        Q => Qt(12)
    );
	 

    Q <= Qt;

end logic;
