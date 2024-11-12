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

-- DATE "11/11/2024 20:17:49"

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

ENTITY 	eight_count IS
    PORT (
	EN : IN std_logic;
	Ud : IN std_logic;
	CLk : IN std_logic;
	Cl : IN std_logic;
	Pr : IN std_logic;
	Q : BUFFER std_logic_vector(2 DOWNTO 0)
	);
END eight_count;

-- Design Ports Information
-- Q[0]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[2]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Cl	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- EN	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Pr	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ud	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF eight_count IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_EN : std_logic;
SIGNAL ww_Ud : std_logic;
SIGNAL ww_CLk : std_logic;
SIGNAL ww_Cl : std_logic;
SIGNAL ww_Pr : std_logic;
SIGNAL ww_Q : std_logic_vector(2 DOWNTO 0);
SIGNAL \CLk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \CLk~input_o\ : std_logic;
SIGNAL \CLk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Cl~input_o\ : std_logic;
SIGNAL \Pr~input_o\ : std_logic;
SIGNAL \EN~input_o\ : std_logic;
SIGNAL \stage0|Qt~0_combout\ : std_logic;
SIGNAL \stage0|Qt~q\ : std_logic;
SIGNAL \Ud~input_o\ : std_logic;
SIGNAL \stage1|Qt~0_combout\ : std_logic;
SIGNAL \stage1|Qt~1_combout\ : std_logic;
SIGNAL \stage1|Qt~q\ : std_logic;
SIGNAL \comb~0_combout\ : std_logic;
SIGNAL \stage2|Qt~0_combout\ : std_logic;
SIGNAL \stage2|Qt~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_EN <= EN;
ww_Ud <= Ud;
ww_CLk <= CLk;
ww_Cl <= Cl;
ww_Pr <= Pr;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X1_Y73_N16
\Q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \stage0|Qt~q\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\Q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \stage1|Qt~q\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOOBUF_X0_Y69_N9
\Q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \stage2|Qt~q\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\CLk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLk,
	o => \CLk~input_o\);

-- Location: CLKCTRL_G2
\CLk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y68_N15
\Cl~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Cl,
	o => \Cl~input_o\);

-- Location: IOIBUF_X1_Y73_N8
\Pr~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Pr,
	o => \Pr~input_o\);

-- Location: IOIBUF_X0_Y68_N1
\EN~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_EN,
	o => \EN~input_o\);

-- Location: LCCOMB_X1_Y69_N4
\stage0|Qt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stage0|Qt~0_combout\ = (\Cl~input_o\ & ((\stage0|Qt~q\ $ (\EN~input_o\)) # (!\Pr~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cl~input_o\,
	datab => \Pr~input_o\,
	datac => \stage0|Qt~q\,
	datad => \EN~input_o\,
	combout => \stage0|Qt~0_combout\);

-- Location: FF_X1_Y69_N5
\stage0|Qt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLk~inputclkctrl_outclk\,
	d => \stage0|Qt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage0|Qt~q\);

-- Location: IOIBUF_X0_Y68_N8
\Ud~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ud,
	o => \Ud~input_o\);

-- Location: LCCOMB_X1_Y69_N6
\stage1|Qt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stage1|Qt~0_combout\ = \stage1|Qt~q\ $ (((\EN~input_o\ & (\Ud~input_o\ $ (\stage0|Qt~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ud~input_o\,
	datab => \EN~input_o\,
	datac => \stage0|Qt~q\,
	datad => \stage1|Qt~q\,
	combout => \stage1|Qt~0_combout\);

-- Location: LCCOMB_X1_Y69_N18
\stage1|Qt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \stage1|Qt~1_combout\ = (\Cl~input_o\ & ((\stage1|Qt~0_combout\) # (!\Pr~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Pr~input_o\,
	datac => \Cl~input_o\,
	datad => \stage1|Qt~0_combout\,
	combout => \stage1|Qt~1_combout\);

-- Location: FF_X1_Y69_N19
\stage1|Qt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLk~inputclkctrl_outclk\,
	d => \stage1|Qt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage1|Qt~q\);

-- Location: LCCOMB_X1_Y69_N28
\comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \comb~0_combout\ = (\EN~input_o\ & ((\Ud~input_o\ & (!\stage0|Qt~q\ & !\stage1|Qt~q\)) # (!\Ud~input_o\ & (\stage0|Qt~q\ & \stage1|Qt~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ud~input_o\,
	datab => \EN~input_o\,
	datac => \stage0|Qt~q\,
	datad => \stage1|Qt~q\,
	combout => \comb~0_combout\);

-- Location: LCCOMB_X1_Y69_N16
\stage2|Qt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \stage2|Qt~0_combout\ = (\Cl~input_o\ & ((\stage2|Qt~q\ $ (\comb~0_combout\)) # (!\Pr~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Cl~input_o\,
	datab => \Pr~input_o\,
	datac => \stage2|Qt~q\,
	datad => \comb~0_combout\,
	combout => \stage2|Qt~0_combout\);

-- Location: FF_X1_Y69_N17
\stage2|Qt\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLk~inputclkctrl_outclk\,
	d => \stage2|Qt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \stage2|Qt~q\);

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;
END structure;


