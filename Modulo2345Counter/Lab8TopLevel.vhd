library ieee;
use ieee.std_logic_1164.all;
entity TopLevel is 
	port (
		CLRn, PRn, clk, En : in std_logic;
		Q : out std_logic_vector(3 downto 0);
		F : out std_logic_vector(6 downto 0)
	);
end TopLevel;

architecture logic_func of TopLevel is 
	signal Qt : std_logic_vector(3 downto 0);
	signal clockIn : std_logic;
	component T_FF
		port (
			CLK, T, CL, PR : in std_logic;
			Q, Qn : out std_logic
		);
	end component;
	
	component clk_gen_1_output is
		  generic( n  : integer := 25000;
					  n1 : integer := 2000);  
		  port( Clock : in  std_logic;
				  c_out : out std_logic );
	end component;
	
	component L5_2024 is
		port(
			A, B, C, D : in std_logic; --input
			fa, fb, fc, fd, fe, ff, fg : out std_logic --output
			);
	end component;
	
begin
	stage0 : clk_gen_1_output port map(
		Clock => clk,
		c_out => clockIn
	);
	
	stage1 : T_FF port map (
		CLK => clockIn,
		T => En,
		CL => CLRn,
		PR => PRn,
		Q => Qt(0));
		
	stage2 : T_FF port map (
		CLK => clockIn,
		T => Qt(0) AND En,
		CL => CLRn,
		PR => PRn,
		Q => Qt(1));
		
	stage3 : T_FF port map (
		CLK => clockIn,
		T => Qt(1) AND (Qt(0) AND En),
		CL => CLRn,
		PR => PRn,
		Q => Qt(2));
		
	stage4 : T_FF port map (
		CLK => clockIn,
		T => Qt(2) AND (Qt(1) AND (Qt(0) AND En)),
		CL => CLRn,
		PR => PRn,
		Q => Qt(3));
		
		Q <= Qt;
		
	stage5 : L5_2024 port map (
		A => Qt(0),
		B => Qt(1),
		C => Qt(2),
		D => Qt(3),
		fa => F(0),
		fb => F(1),
		fc => F(2),
		fd => F(3),
		fe => F(4),
		ff => F(5),
		fg => F(6)
	);
end logic_func;