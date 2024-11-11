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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Standard Edition"

-- DATE "11/11/2024 18:41:05"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	T_FF IS
    PORT (
	En : IN std_logic;
	UD : IN std_logic;
	CLK : IN std_logic;
	T : IN std_logic;
	CL : IN std_logic;
	PR : IN std_logic;
	Q : OUT std_logic;
	Qn : OUT std_logic
	);
END T_FF;

-- Design Ports Information
-- Q	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Qn	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- En	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- UD	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CL	=>  Location: PIN_G3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- T	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PR	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLK	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF T_FF IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_En : std_logic;
SIGNAL ww_UD : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_T : std_logic;
SIGNAL ww_CL : std_logic;
SIGNAL ww_PR : std_logic;
SIGNAL ww_Q : std_logic;
SIGNAL ww_Qn : std_logic;
SIGNAL \Q~output_o\ : std_logic;
SIGNAL \Qn~output_o\ : std_logic;
SIGNAL \En~input_o\ : std_logic;
SIGNAL \UD~input_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \PR~input_o\ : std_logic;
SIGNAL \T~input_o\ : std_logic;
SIGNAL \CL~input_o\ : std_logic;
SIGNAL \Qt~0_combout\ : std_logic;
SIGNAL \Qt~q\ : std_logic;
SIGNAL \Q~0_combout\ : std_logic;
SIGNAL \ALT_INV_Qt~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_En <= En;
ww_UD <= UD;
ww_CLK <= CLK;
ww_T <= T;
ww_CL <= CL;
ww_PR <= PR;
Q <= ww_Q;
Qn <= ww_Qn;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Qt~q\ <= NOT \Qt~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y67_N16
\Q~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Q~0_combout\,
	devoe => ww_devoe,
	o => \Q~output_o\);

-- Location: IOOBUF_X0_Y64_N2
\Qn~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Qt~q\,
	devoe => ww_devoe,
	o => \Qn~output_o\);

-- Location: IOIBUF_X0_Y66_N22
\En~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_En,
	o => \En~input_o\);

-- Location: IOIBUF_X0_Y66_N15
\UD~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_UD,
	o => \UD~input_o\);

-- Location: IOIBUF_X0_Y63_N15
\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

-- Location: IOIBUF_X0_Y62_N22
\PR~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PR,
	o => \PR~input_o\);

-- Location: IOIBUF_X0_Y62_N15
\T~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_T,
	o => \T~input_o\);

-- Location: IOIBUF_X0_Y63_N22
\CL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CL,
	o => \CL~input_o\);

-- Location: LCCOMB_X1_Y63_N16
\Qt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Qt~0_combout\ = (\CL~input_o\ & ((\T~input_o\ $ (\Qt~q\)) # (!\PR~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PR~input_o\,
	datab => \T~input_o\,
	datac => \Qt~q\,
	datad => \CL~input_o\,
	combout => \Qt~0_combout\);

-- Location: FF_X1_Y63_N17
Qt : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \Qt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Qt~q\);

-- Location: LCCOMB_X1_Y66_N0
\Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Q~0_combout\ = (\En~input_o\ & (\UD~input_o\ $ (\Qt~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \En~input_o\,
	datac => \UD~input_o\,
	datad => \Qt~q\,
	combout => \Q~0_combout\);

ww_Q <= \Q~output_o\;

ww_Qn <= \Qn~output_o\;
END structure;


