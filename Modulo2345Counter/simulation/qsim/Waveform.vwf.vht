-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/11/2024 20:17:48"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          eight_count
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY eight_count_vhd_vec_tst IS
END eight_count_vhd_vec_tst;
ARCHITECTURE eight_count_arch OF eight_count_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Cl : STD_LOGIC;
SIGNAL CLk : STD_LOGIC;
SIGNAL EN : STD_LOGIC;
SIGNAL Pr : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Ud : STD_LOGIC;
COMPONENT eight_count
	PORT (
	Cl : IN STD_LOGIC;
	CLk : IN STD_LOGIC;
	EN : IN STD_LOGIC;
	Pr : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	Ud : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : eight_count
	PORT MAP (
-- list connections between master ports and signals
	Cl => Cl,
	CLk => CLk,
	EN => EN,
	Pr => Pr,
	Q => Q,
	Ud => Ud
	);

-- Cl
t_prcs_Cl: PROCESS
BEGIN
	Cl <= '1';
WAIT;
END PROCESS t_prcs_Cl;

-- CLk
t_prcs_CLk: PROCESS
BEGIN
LOOP
	CLk <= '0';
	WAIT FOR 1000000 ps;
	CLk <= '1';
	WAIT FOR 1000000 ps;
	IF (NOW >= 32000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLk;

-- EN
t_prcs_EN: PROCESS
BEGIN
	EN <= '1';
WAIT;
END PROCESS t_prcs_EN;

-- Pr
t_prcs_Pr: PROCESS
BEGIN
	Pr <= '1';
WAIT;
END PROCESS t_prcs_Pr;

-- Ud
t_prcs_Ud: PROCESS
BEGIN
	Ud <= '0';
WAIT;
END PROCESS t_prcs_Ud;
END eight_count_arch;
