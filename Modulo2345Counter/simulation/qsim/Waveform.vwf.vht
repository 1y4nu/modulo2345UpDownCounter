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
-- Generated on "11/11/2024 18:41:04"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          T_FF
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY T_FF_vhd_vec_tst IS
END T_FF_vhd_vec_tst;
ARCHITECTURE T_FF_arch OF T_FF_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CL : STD_LOGIC;
SIGNAL CLK : STD_LOGIC;
SIGNAL En : STD_LOGIC;
SIGNAL PR : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
SIGNAL Qn : STD_LOGIC;
SIGNAL T : STD_LOGIC;
SIGNAL UD : STD_LOGIC;
COMPONENT T_FF
	PORT (
	CL : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	En : IN STD_LOGIC;
	PR : IN STD_LOGIC;
	Q : OUT STD_LOGIC;
	Qn : OUT STD_LOGIC;
	T : IN STD_LOGIC;
	UD : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : T_FF
	PORT MAP (
-- list connections between master ports and signals
	CL => CL,
	CLK => CLK,
	En => En,
	PR => PR,
	Q => Q,
	Qn => Qn,
	T => T,
	UD => UD
	);

-- CL
t_prcs_CL: PROCESS
BEGIN
	CL <= '1';
	WAIT FOR 999000 ps;
	CL <= '0';
WAIT;
END PROCESS t_prcs_CL;

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 1000000 ps;
	CLK <= '1';
	WAIT FOR 1000000 ps;
	IF (NOW >= 32000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- En
t_prcs_En: PROCESS
BEGIN
	En <= '1';
	WAIT FOR 999000 ps;
	En <= '0';
WAIT;
END PROCESS t_prcs_En;

-- PR
t_prcs_PR: PROCESS
BEGIN
	PR <= '1';
	WAIT FOR 999000 ps;
	PR <= '0';
WAIT;
END PROCESS t_prcs_PR;

-- T
t_prcs_T: PROCESS
BEGIN
	T <= '1';
WAIT;
END PROCESS t_prcs_T;

-- UD
t_prcs_UD: PROCESS
BEGIN
	UD <= '0';
WAIT;
END PROCESS t_prcs_UD;
END T_FF_arch;
