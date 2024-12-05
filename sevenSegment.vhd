library ieee;
use ieee.std_logic_1164.all;

entity sevenSegment is
port(
	A, B, C, D : in std_logic; --input
	fa, fb, fc, fd, fe, ff, fg : out std_logic --output
	);
end sevenSegment;


architecture logic_func of sevenSegment is
begin
	fa <= (not(D) and not(C) and not(B) and A) or 
			(not(D) and C and not(B) and not(A)) or 
			(D and not(C) and B and A) or 
			(D and C and not(B) and A);
			
	fb <= (not(D) and C and not(B) and A) or 
			(not(D) and C and B and not(A)) or
			(D and not(C) and B and A) or 
			(D and C and not(B) and not(A)) or 
			(D and C and B and not(A)) or 
			(D and C and B and A);
			
	fc <= (not(D) and not(C) and B and not(A)) or 
			(D and C and not(B) and not(A)) or 
			(D and C and B and not(A)) or 
			(D and C and B and A);
			
	fd <= (not(D) and not(C) and not(B) and A) or 
			(not(D) and C and not(B) and not(A)) or 
			(not(D) and C and B and A) or 
			(D and not(C) and B and not(A)) or 
			(D and C and B and A);
			
	fe <= (not(D) and not(C) and not(B) and A) or 
			(not(D) and not(C) and B and A) or 
			(not(D) and C and not(B) and not(A)) or 
			(not(D) and C and not(B) and A) or 
			(not(D) and C and B and A) or 
			(D and not(C) and not(B) and A);
			
	ff <= (not(D) and not(C) and not(B) and A) or 
			(not(D) and not(C) and B and not(A)) or 
			(not(D) and not(C) and B and A) or 
			(D and C and not(B) and A);
			
	fg <= (not(D) and not(C) and not(B) and not(A)) or 
			(not(D) and not(C) and not(B) and A) or 
			(not(D) and C and B and A) or 
			(D and C and not(B) and not(A));
end logic_func;