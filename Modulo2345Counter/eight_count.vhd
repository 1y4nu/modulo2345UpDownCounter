library ieee;
use ieee.std_logic_1164.all;


entity eight_count is 
    port (
		  EN, Ud,CLk, Cl, Pr : in std_logic;
		  Q : out std_logic_vector(2 downto 0)
		  
     --   T: in std_logic_vector(2 downto 0);
        --fa, fb, fc, fd, fe, ff, fg : out std_logic --output
    );
end eight_count;

architecture logic_func of eight_count is 
    signal Qout : std_logic_vector(2 downto 0);
	 Signal QoutNot: std_logic_vector(2 downto 0);

	 component T_FF is 
    port (
        UD, CLK, T, CL, PR : in std_logic;
        Q, Qn : out std_logic);
	 end component;
begin
	stage0: T_FF PORT MAP (

		UD => Ud,
		CLK => CLk,
		T => EN,
		CL => Cl, 
		PR => Pr,
		Q => Qout(0),
		Qn => (QoutNot(0)));
		
		
	stage1: T_FF PORT MAP (
		UD => Ud,
		CLK => CLk,
		T =>  EN and Qout(0),
		CL => Cl,
		PR => Pr,
		Q => Qout(1),
		Qn => (QoutNot(1)));
	stage2: T_FF PORT MAP (
		
		UD => Ud,
		CLK => CLk,
		T =>  EN and Qout(0) and Qout(1),
		CL => Cl,
		PR => Pr,
		Q => Qout(2),
		Qn => (QoutNot(2)));
		
		Q <= QoutNot;


end logic_func;