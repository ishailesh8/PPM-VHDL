--------------------------------------------------------------------------------
-- Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: K.39
--  \   \         Application: netgen
--  /   /         Filename: topmod_synthesis.vhd
-- /___/   /\     Timestamp: Sat Sep 07 00:04:38 2013
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm topmod -w -dir netgen/synthesis -ofmt vhdl -sim topmod.ngc topmod_synthesis.vhd 
-- Device	: xc2vp30-7-ff896
-- Input file	: topmod.ngc
-- Output file	: E:\IIT\modem\netgen\synthesis\topmod_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: topmod
-- Xilinx	: C:\Xilinx\10.1\ISE
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Development System Reference Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity topmod is
  port (
    ppmout : out STD_LOGIC; 
    reset : in STD_LOGIC := 'X'; 
    dppmout : out STD_LOGIC; 
    ookout : out STD_LOGIC; 
    clock : in STD_LOGIC := 'X' 
  );
end topmod;

architecture Structure of topmod is
  signal N11 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N23 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N27 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal buffmoduleinst_Mcount_addressR : STD_LOGIC; 
  signal buffmoduleinst_Mcount_addressR3 : STD_LOGIC; 
  signal buffmoduleinst_Mcount_addressR6 : STD_LOGIC; 
  signal buffmoduleinst_Mcount_addressW : STD_LOGIC; 
  signal buffmoduleinst_Mcount_addressW3 : STD_LOGIC; 
  signal buffmoduleinst_Mcount_addressW6 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_3_f5_25 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_3_f51 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_3_f52 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_4_28 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_41_29 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_42_30 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_4_f5_31 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_4_f51 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_4_f52 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_5_34 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_51_35 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_52_36 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_53_37 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_54_38 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_55_39 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_6_40 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_61_41 : STD_LOGIC; 
  signal buffmoduleinst_Mmux_varindex0000_62_42 : STD_LOGIC; 
  signal buffmoduleinst_addressW_cmp_eq0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_0_1_53 : STD_LOGIC; 
  signal buffmoduleinst_buff_0_2_54 : STD_LOGIC; 
  signal buffmoduleinst_buff_0_3_55 : STD_LOGIC; 
  signal buffmoduleinst_buff_0_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_1_1_57 : STD_LOGIC; 
  signal buffmoduleinst_buff_1_2_58 : STD_LOGIC; 
  signal buffmoduleinst_buff_1_3_59 : STD_LOGIC; 
  signal buffmoduleinst_buff_1_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_2_1_61 : STD_LOGIC; 
  signal buffmoduleinst_buff_2_2_62 : STD_LOGIC; 
  signal buffmoduleinst_buff_2_3_63 : STD_LOGIC; 
  signal buffmoduleinst_buff_2_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_3_1_65 : STD_LOGIC; 
  signal buffmoduleinst_buff_3_2_66 : STD_LOGIC; 
  signal buffmoduleinst_buff_3_3_67 : STD_LOGIC; 
  signal buffmoduleinst_buff_3_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_4_1_69 : STD_LOGIC; 
  signal buffmoduleinst_buff_4_2_70 : STD_LOGIC; 
  signal buffmoduleinst_buff_4_3_71 : STD_LOGIC; 
  signal buffmoduleinst_buff_4_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_5_1_73 : STD_LOGIC; 
  signal buffmoduleinst_buff_5_2_74 : STD_LOGIC; 
  signal buffmoduleinst_buff_5_3_75 : STD_LOGIC; 
  signal buffmoduleinst_buff_5_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_6_1_77 : STD_LOGIC; 
  signal buffmoduleinst_buff_6_2_78 : STD_LOGIC; 
  signal buffmoduleinst_buff_6_3_79 : STD_LOGIC; 
  signal buffmoduleinst_buff_6_and0000 : STD_LOGIC; 
  signal buffmoduleinst_buff_7_1_81 : STD_LOGIC; 
  signal buffmoduleinst_buff_7_2_82 : STD_LOGIC; 
  signal buffmoduleinst_buff_7_3_83 : STD_LOGIC; 
  signal buffmoduleinst_readtrigger_inv : STD_LOGIC; 
  signal buffmoduleinst_writetrigger_inv : STD_LOGIC; 
  signal clock_BUFGP_90 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_mdppmclockcounter : STD_LOGIC; 
  signal clockmoduleinst_Mcount_mdppmclockcounter3 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_mdppmclockcounter6 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_mppmclockcounter : STD_LOGIC; 
  signal clockmoduleinst_Mcount_mppmclockcounter3 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmdppmclockcounter : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmdppmclockcounter12 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmdppmclockcounter3 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmdppmclockcounter6 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmdppmclockcounter9 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmppmclockcounter : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmppmclockcounter12 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmppmclockcounter3 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmppmclockcounter6 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_ser2parmppmclockcounter9 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_sysNclockcounter : STD_LOGIC; 
  signal clockmoduleinst_Mcount_sysNclockcounter3 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_sysNclockcounter6 : STD_LOGIC; 
  signal clockmoduleinst_Mcount_sysNclockcounter9 : STD_LOGIC; 
  signal clockmoduleinst_cmodmdppmclock_112 : STD_LOGIC; 
  signal clockmoduleinst_cmodmppmclock_113 : STD_LOGIC; 
  signal clockmoduleinst_cmodreset_inv : STD_LOGIC; 
  signal clockmoduleinst_cmodser2parmdppmclock_115 : STD_LOGIC; 
  signal clockmoduleinst_cmodser2parmdppmclock1 : STD_LOGIC; 
  signal clockmoduleinst_cmodser2parmppmclock_117 : STD_LOGIC; 
  signal clockmoduleinst_cmodsysNclock_118 : STD_LOGIC; 
  signal clockmoduleinst_mdppmtempclkop_122 : STD_LOGIC; 
  signal clockmoduleinst_mdppmtempclkop_cmp_eq0000 : STD_LOGIC; 
  signal clockmoduleinst_mdppmtempclkop_mux0000 : STD_LOGIC; 
  signal clockmoduleinst_mdppmtempclkop_not0001 : STD_LOGIC; 
  signal clockmoduleinst_mppmtempclkop_128 : STD_LOGIC; 
  signal clockmoduleinst_mppmtempclkop_cmp_eq0000 : STD_LOGIC; 
  signal clockmoduleinst_mppmtempclkop_mux0000 : STD_LOGIC; 
  signal clockmoduleinst_mppmtempclkop_not0001 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmdppmclockcounter_cmp_eq0000_137 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmdppmtempclkop_138 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmdppmtempclkop_mux0000 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmdppmtempclkop_not0001 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmppmclockcounter_cmp_eq0000_146 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmppmtempclkop_147 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmppmtempclkop_mux0000 : STD_LOGIC; 
  signal clockmoduleinst_ser2parmppmtempclkop_not0001 : STD_LOGIC; 
  signal clockmoduleinst_sysNclockcounter_cmp_eq0000 : STD_LOGIC; 
  signal clockmoduleinst_systempNclkop_155 : STD_LOGIC; 
  signal clockmoduleinst_systempNclkop_mux0000 : STD_LOGIC; 
  signal clockmoduleinst_systempNclkop_not0001 : STD_LOGIC; 
  signal dppmout_OBUF_159 : STD_LOGIC; 
  signal mdppminst_mdppminternalcount_cmp_eq0000 : STD_LOGIC; 
  signal mdppminst_mdppmtempoutR_169 : STD_LOGIC; 
  signal mdppminst_mdppmtempoutR_mux0002 : STD_LOGIC; 
  signal mppminst_mppmtempoutR_179 : STD_LOGIC; 
  signal mppminst_mppmtempoutR_mux0002 : STD_LOGIC; 
  signal mppminst_mppmtempoutR_mux000226_181 : STD_LOGIC; 
  signal mppminst_mppmtempoutR_mux000246_182 : STD_LOGIC; 
  signal ppmout_OBUF_185 : STD_LOGIC; 
  signal prbsinst_lfsr_0_186 : STD_LOGIC; 
  signal prbsinst_lfsr_not0000 : STD_LOGIC; 
  signal prbsinst_lfsr_xor0000 : STD_LOGIC; 
  signal reset_IBUF_192 : STD_LOGIC; 
  signal buffmoduleinst_varindex0000 : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal buffmoduleinst_addressR : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal buffmoduleinst_addressW : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal buffmoduleinst_dataread : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal clockmoduleinst_Mcount_ser2parmdppmclockcounter_cy : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal clockmoduleinst_Mcount_ser2parmppmclockcounter_cy : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal clockmoduleinst_mdppmclockcounter : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal clockmoduleinst_mppmclockcounter : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal clockmoduleinst_ser2parmdppmclockcounter : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal clockmoduleinst_ser2parmppmclockcounter : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal clockmoduleinst_sysNclockcounter : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal mdppminst_mdppminternalcount : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal mdppminst_mdppminternalcount_mux0002 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal mppminst_mppminternalcount : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal mppminst_mppminternalcount_mux0002 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal prbsinst_lfsr : STD_LOGIC_VECTOR ( 2 downto 1 ); 
  signal ser2parinstmdppm_parallelout : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal ser2parinstmdppm_ser2parout : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal ser2parinstmppm_ser2parout : STD_LOGIC_VECTOR ( 3 downto 1 ); 
begin
  XST_VCC : VCC
    port map (
      P => N3
    );
  ser2parinstmdppm_ser2parout_3 : FDE
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => N3,
      D => ser2parinstmdppm_parallelout(3),
      Q => ser2parinstmdppm_ser2parout(3)
    );
  ser2parinstmdppm_ser2parout_2 : FDE
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => N3,
      D => ser2parinstmdppm_parallelout(2),
      Q => ser2parinstmdppm_ser2parout(2)
    );
  ser2parinstmdppm_ser2parout_1 : FDE
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => N3,
      D => ser2parinstmdppm_parallelout(1),
      Q => ser2parinstmdppm_ser2parout(1)
    );
  ser2parinstmdppm_parallelout_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodsysNclock_118,
      CE => N3,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_parallelout(2),
      Q => ser2parinstmdppm_parallelout(3)
    );
  ser2parinstmdppm_parallelout_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodsysNclock_118,
      CE => N3,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_parallelout(1),
      Q => ser2parinstmdppm_parallelout(2)
    );
  ser2parinstmdppm_parallelout_1 : FDCE
    port map (
      C => clockmoduleinst_cmodsysNclock_118,
      CE => N3,
      CLR => reset_IBUF_192,
      D => prbsinst_lfsr(2),
      Q => ser2parinstmdppm_parallelout(1)
    );
  ser2parinstmppm_ser2parout_3 : FDE
    port map (
      C => clockmoduleinst_cmodser2parmppmclock_117,
      CE => N3,
      D => ser2parinstmdppm_parallelout(3),
      Q => ser2parinstmppm_ser2parout(3)
    );
  ser2parinstmppm_ser2parout_2 : FDE
    port map (
      C => clockmoduleinst_cmodser2parmppmclock_117,
      CE => N3,
      D => ser2parinstmdppm_parallelout(2),
      Q => ser2parinstmppm_ser2parout(2)
    );
  ser2parinstmppm_ser2parout_1 : FDE
    port map (
      C => clockmoduleinst_cmodser2parmppmclock_117,
      CE => N3,
      D => ser2parinstmdppm_parallelout(1),
      Q => ser2parinstmppm_ser2parout(1)
    );
  mppminst_mppminternalcount_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodmppmclock_113,
      CE => N3,
      D => mppminst_mppminternalcount_mux0002(0),
      Q => mppminst_mppminternalcount(3)
    );
  mppminst_mppminternalcount_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodmppmclock_113,
      CE => N3,
      D => mppminst_mppminternalcount_mux0002(1),
      Q => mppminst_mppminternalcount(2)
    );
  mppminst_mppminternalcount_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodmppmclock_113,
      CE => N3,
      D => mppminst_mppminternalcount_mux0002(2),
      Q => mppminst_mppminternalcount(1)
    );
  mppminst_mppminternalcount_0 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clockmoduleinst_cmodmppmclock_113,
      CE => N3,
      D => mppminst_mppminternalcount_mux0002(3),
      Q => mppminst_mppminternalcount(0)
    );
  mppminst_mppmtempoutR : FDE
    port map (
      C => clockmoduleinst_cmodmppmclock_113,
      CE => N3,
      D => mppminst_mppmtempoutR_mux0002,
      Q => mppminst_mppmtempoutR_179
    );
  mdppminst_mdppmtempoutR : FDE
    port map (
      C => clockmoduleinst_cmodmdppmclock_112,
      CE => N3,
      D => mdppminst_mdppmtempoutR_mux0002,
      Q => mdppminst_mdppmtempoutR_169
    );
  mdppminst_mdppminternalcount_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodmdppmclock_112,
      CE => N3,
      D => mdppminst_mdppminternalcount_mux0002(0),
      Q => mdppminst_mdppminternalcount(3)
    );
  mdppminst_mdppminternalcount_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodmdppmclock_112,
      CE => N3,
      D => mdppminst_mdppminternalcount_mux0002(1),
      Q => mdppminst_mdppminternalcount(2)
    );
  mdppminst_mdppminternalcount_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodmdppmclock_112,
      CE => N3,
      D => mdppminst_mdppminternalcount_mux0002(2),
      Q => mdppminst_mdppminternalcount(1)
    );
  mdppminst_mdppminternalcount_0 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clockmoduleinst_cmodmdppmclock_112,
      CE => N3,
      D => mdppminst_mdppminternalcount_mux0002(3),
      Q => mdppminst_mdppminternalcount(0)
    );
  prbsinst_lfsr_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodsysNclock_118,
      CE => prbsinst_lfsr_not0000,
      CLR => reset_IBUF_192,
      D => prbsinst_lfsr(1),
      Q => prbsinst_lfsr(2)
    );
  prbsinst_lfsr_0 : FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => clockmoduleinst_cmodsysNclock_118,
      CE => prbsinst_lfsr_not0000,
      D => prbsinst_lfsr_xor0000,
      PRE => reset_IBUF_192,
      Q => prbsinst_lfsr_0_186
    );
  prbsinst_lfsr_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clockmoduleinst_cmodsysNclock_118,
      CE => prbsinst_lfsr_not0000,
      CLR => reset_IBUF_192,
      D => prbsinst_lfsr_0_186,
      Q => prbsinst_lfsr(1)
    );
  clockmoduleinst_mppmclockcounter_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_mppmclockcounter3,
      Q => clockmoduleinst_mppmclockcounter(1)
    );
  clockmoduleinst_mppmclockcounter_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clock_BUFGP_90,
      D => clockmoduleinst_Mcount_mppmclockcounter,
      PRE => reset_IBUF_192,
      Q => clockmoduleinst_mppmclockcounter(0)
    );
  clockmoduleinst_sysNclockcounter_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_sysNclockcounter9,
      Q => clockmoduleinst_sysNclockcounter(3)
    );
  clockmoduleinst_sysNclockcounter_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_sysNclockcounter6,
      Q => clockmoduleinst_sysNclockcounter(2)
    );
  clockmoduleinst_sysNclockcounter_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_sysNclockcounter3,
      Q => clockmoduleinst_sysNclockcounter(1)
    );
  clockmoduleinst_sysNclockcounter_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clock_BUFGP_90,
      D => clockmoduleinst_Mcount_sysNclockcounter,
      PRE => reset_IBUF_192,
      Q => clockmoduleinst_sysNclockcounter(0)
    );
  clockmoduleinst_mdppmclockcounter_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_mdppmclockcounter3,
      Q => clockmoduleinst_mdppmclockcounter(1)
    );
  clockmoduleinst_mdppmclockcounter_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clock_BUFGP_90,
      D => clockmoduleinst_Mcount_mdppmclockcounter,
      PRE => reset_IBUF_192,
      Q => clockmoduleinst_mdppmclockcounter(0)
    );
  clockmoduleinst_mdppmclockcounter_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_mdppmclockcounter6,
      Q => clockmoduleinst_mdppmclockcounter(2)
    );
  clockmoduleinst_ser2parmdppmclockcounter_4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmdppmclockcounter12,
      Q => clockmoduleinst_ser2parmdppmclockcounter(4)
    );
  clockmoduleinst_ser2parmdppmclockcounter_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmdppmclockcounter9,
      Q => clockmoduleinst_ser2parmdppmclockcounter(3)
    );
  clockmoduleinst_ser2parmdppmclockcounter_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmdppmclockcounter3,
      Q => clockmoduleinst_ser2parmdppmclockcounter(1)
    );
  clockmoduleinst_ser2parmdppmclockcounter_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clock_BUFGP_90,
      D => clockmoduleinst_Mcount_ser2parmdppmclockcounter,
      PRE => reset_IBUF_192,
      Q => clockmoduleinst_ser2parmdppmclockcounter(0)
    );
  clockmoduleinst_ser2parmdppmclockcounter_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmdppmclockcounter6,
      Q => clockmoduleinst_ser2parmdppmclockcounter(2)
    );
  clockmoduleinst_ser2parmppmclockcounter_4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmppmclockcounter12,
      Q => clockmoduleinst_ser2parmppmclockcounter(4)
    );
  clockmoduleinst_ser2parmppmclockcounter_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmppmclockcounter9,
      Q => clockmoduleinst_ser2parmppmclockcounter(3)
    );
  clockmoduleinst_ser2parmppmclockcounter_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmppmclockcounter3,
      Q => clockmoduleinst_ser2parmppmclockcounter(1)
    );
  clockmoduleinst_ser2parmppmclockcounter_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clock_BUFGP_90,
      D => clockmoduleinst_Mcount_ser2parmppmclockcounter,
      PRE => reset_IBUF_192,
      Q => clockmoduleinst_ser2parmppmclockcounter(0)
    );
  clockmoduleinst_ser2parmppmclockcounter_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_Mcount_ser2parmppmclockcounter6,
      Q => clockmoduleinst_ser2parmppmclockcounter(2)
    );
  clockmoduleinst_cmodsysNclock : FDE
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_cmodreset_inv,
      D => clockmoduleinst_systempNclkop_mux0000,
      Q => clockmoduleinst_cmodsysNclock_118
    );
  clockmoduleinst_ser2parmdppmtempclkop : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_ser2parmdppmclockcounter_cmp_eq0000_137,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_ser2parmdppmtempclkop_not0001,
      Q => clockmoduleinst_ser2parmdppmtempclkop_138
    );
  clockmoduleinst_ser2parmppmtempclkop : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_ser2parmppmclockcounter_cmp_eq0000_146,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_ser2parmppmtempclkop_not0001,
      Q => clockmoduleinst_ser2parmppmtempclkop_147
    );
  clockmoduleinst_mppmtempclkop : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_mppmtempclkop_cmp_eq0000,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_mppmtempclkop_not0001,
      Q => clockmoduleinst_mppmtempclkop_128
    );
  clockmoduleinst_cmodser2parmppmclock : FDE
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_cmodreset_inv,
      D => clockmoduleinst_ser2parmppmtempclkop_mux0000,
      Q => clockmoduleinst_cmodser2parmppmclock_117
    );
  clockmoduleinst_systempNclkop : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_sysNclockcounter_cmp_eq0000,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_systempNclkop_not0001,
      Q => clockmoduleinst_systempNclkop_155
    );
  clockmoduleinst_cmodser2parmdppmclock : FDE
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_cmodreset_inv,
      D => clockmoduleinst_ser2parmdppmtempclkop_mux0000,
      Q => clockmoduleinst_cmodser2parmdppmclock1
    );
  clockmoduleinst_cmodmdppmclock : FDE
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_cmodreset_inv,
      D => clockmoduleinst_mdppmtempclkop_mux0000,
      Q => clockmoduleinst_cmodmdppmclock_112
    );
  clockmoduleinst_mdppmtempclkop : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_mdppmtempclkop_cmp_eq0000,
      CLR => reset_IBUF_192,
      D => clockmoduleinst_mdppmtempclkop_not0001,
      Q => clockmoduleinst_mdppmtempclkop_122
    );
  clockmoduleinst_cmodmppmclock : FDE
    port map (
      C => clock_BUFGP_90,
      CE => clockmoduleinst_cmodreset_inv,
      D => clockmoduleinst_mppmtempclkop_mux0000,
      Q => clockmoduleinst_cmodmppmclock_113
    );
  buffmoduleinst_addressR_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => buffmoduleinst_readtrigger_inv,
      CLR => reset_IBUF_192,
      D => buffmoduleinst_Mcount_addressR6,
      Q => buffmoduleinst_addressR(2)
    );
  buffmoduleinst_addressR_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => buffmoduleinst_readtrigger_inv,
      CLR => reset_IBUF_192,
      D => buffmoduleinst_Mcount_addressR3,
      Q => buffmoduleinst_addressR(1)
    );
  buffmoduleinst_addressR_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => buffmoduleinst_readtrigger_inv,
      CLR => reset_IBUF_192,
      D => buffmoduleinst_Mcount_addressR,
      Q => buffmoduleinst_addressR(0)
    );
  buffmoduleinst_addressW_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => buffmoduleinst_writetrigger_inv,
      CE => N3,
      CLR => reset_IBUF_192,
      D => buffmoduleinst_Mcount_addressW6,
      Q => buffmoduleinst_addressW(2)
    );
  buffmoduleinst_addressW_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => buffmoduleinst_writetrigger_inv,
      CE => N3,
      CLR => reset_IBUF_192,
      D => buffmoduleinst_Mcount_addressW3,
      Q => buffmoduleinst_addressW(1)
    );
  buffmoduleinst_addressW_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => buffmoduleinst_writetrigger_inv,
      CE => N3,
      CLR => reset_IBUF_192,
      D => buffmoduleinst_Mcount_addressW,
      Q => buffmoduleinst_addressW(0)
    );
  buffmoduleinst_dataread_3 : FD_1
    port map (
      C => dppmout_OBUF_159,
      D => buffmoduleinst_varindex0000(3),
      Q => buffmoduleinst_dataread(3)
    );
  buffmoduleinst_dataread_2 : FD_1
    port map (
      C => dppmout_OBUF_159,
      D => buffmoduleinst_varindex0000(2),
      Q => buffmoduleinst_dataread(2)
    );
  buffmoduleinst_dataread_1 : FD_1
    port map (
      C => dppmout_OBUF_159,
      D => buffmoduleinst_varindex0000(1),
      Q => buffmoduleinst_dataread(1)
    );
  buffmoduleinst_buff_7_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_addressW_cmp_eq0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_7_3_83
    );
  buffmoduleinst_buff_7_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_addressW_cmp_eq0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_7_2_82
    );
  buffmoduleinst_buff_7_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_addressW_cmp_eq0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_7_1_81
    );
  buffmoduleinst_buff_6_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_6_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_6_3_79
    );
  buffmoduleinst_buff_6_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_6_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_6_2_78
    );
  buffmoduleinst_buff_6_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_6_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_6_1_77
    );
  buffmoduleinst_buff_4_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_4_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_4_3_71
    );
  buffmoduleinst_buff_4_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_4_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_4_2_70
    );
  buffmoduleinst_buff_4_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_4_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_4_1_69
    );
  buffmoduleinst_buff_3_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_3_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_3_3_67
    );
  buffmoduleinst_buff_3_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_3_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_3_2_66
    );
  buffmoduleinst_buff_3_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_3_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_3_1_65
    );
  buffmoduleinst_buff_5_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_5_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_5_3_75
    );
  buffmoduleinst_buff_5_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_5_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_5_2_74
    );
  buffmoduleinst_buff_5_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_5_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_5_1_73
    );
  buffmoduleinst_buff_1_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_1_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_1_3_59
    );
  buffmoduleinst_buff_1_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_1_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_1_2_58
    );
  buffmoduleinst_buff_1_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_1_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_1_1_57
    );
  buffmoduleinst_buff_0_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_0_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_0_3_55
    );
  buffmoduleinst_buff_0_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_0_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_0_2_54
    );
  buffmoduleinst_buff_0_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_0_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_0_1_53
    );
  buffmoduleinst_buff_2_3 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_2_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(3),
      Q => buffmoduleinst_buff_2_3_63
    );
  buffmoduleinst_buff_2_2 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_2_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(2),
      Q => buffmoduleinst_buff_2_2_62
    );
  buffmoduleinst_buff_2_1 : FDCE_1
    port map (
      C => clockmoduleinst_cmodser2parmdppmclock_115,
      CE => buffmoduleinst_buff_2_and0000,
      CLR => reset_IBUF_192,
      D => ser2parinstmdppm_ser2parout(1),
      Q => buffmoduleinst_buff_2_1_61
    );
  mppminst_mppmout1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => clockmoduleinst_cmodmppmclock_113,
      I1 => mppminst_mppmtempoutR_179,
      O => ppmout_OBUF_185
    );
  mdppminst_mdppmout1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => clockmoduleinst_cmodmdppmclock_112,
      I1 => mdppminst_mdppmtempoutR_169,
      O => dppmout_OBUF_159
    );
  mppminst_mppminternalcount_mux0002_3_1 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => mppminst_mppminternalcount(0),
      I1 => reset_IBUF_192,
      O => mppminst_mppminternalcount_mux0002(3)
    );
  clockmoduleinst_Mcount_mppmclockcounter_xor_0_11 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => clockmoduleinst_mppmclockcounter(0),
      I1 => clockmoduleinst_mppmclockcounter(1),
      O => clockmoduleinst_Mcount_mppmclockcounter
    );
  prbsinst_Mxor_lfsr_xor0000_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => prbsinst_lfsr(2),
      I1 => prbsinst_lfsr(1),
      O => prbsinst_lfsr_xor0000
    );
  clockmoduleinst_Mcount_sysNclockcounter_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => clockmoduleinst_sysNclockcounter(1),
      I1 => clockmoduleinst_sysNclockcounter(0),
      O => clockmoduleinst_Mcount_sysNclockcounter3
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(1),
      I1 => clockmoduleinst_ser2parmppmclockcounter(0),
      O => clockmoduleinst_Mcount_ser2parmppmclockcounter3
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(1),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(0),
      O => clockmoduleinst_Mcount_ser2parmdppmclockcounter3
    );
  clockmoduleinst_Mcount_mppmclockcounter_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => clockmoduleinst_mppmclockcounter(0),
      I1 => clockmoduleinst_mppmclockcounter(1),
      O => clockmoduleinst_Mcount_mppmclockcounter3
    );
  buffmoduleinst_Mcount_addressW_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => buffmoduleinst_addressW(0),
      I1 => buffmoduleinst_addressW(1),
      O => buffmoduleinst_Mcount_addressW3
    );
  buffmoduleinst_Mcount_addressR_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mcount_addressR3
    );
  mppminst_mppminternalcount_mux0002_2_1 : LUT3
    generic map(
      INIT => X"14"
    )
    port map (
      I0 => reset_IBUF_192,
      I1 => mppminst_mppminternalcount(1),
      I2 => mppminst_mppminternalcount(0),
      O => mppminst_mppminternalcount_mux0002(2)
    );
  clockmoduleinst_Mcount_sysNclockcounter_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => clockmoduleinst_sysNclockcounter(2),
      I1 => clockmoduleinst_sysNclockcounter(0),
      I2 => clockmoduleinst_sysNclockcounter(1),
      O => clockmoduleinst_Mcount_sysNclockcounter6
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmppmclockcounter(0),
      I2 => clockmoduleinst_ser2parmppmclockcounter(1),
      O => clockmoduleinst_Mcount_ser2parmppmclockcounter6
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(0),
      I2 => clockmoduleinst_ser2parmdppmclockcounter(1),
      O => clockmoduleinst_Mcount_ser2parmdppmclockcounter6
    );
  buffmoduleinst_Mcount_addressR_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => buffmoduleinst_addressR(2),
      I1 => buffmoduleinst_addressR(1),
      I2 => buffmoduleinst_addressR(0),
      O => buffmoduleinst_Mcount_addressR6
    );
  mppminst_mppminternalcount_mux0002_1_1 : LUT4
    generic map(
      INIT => X"1444"
    )
    port map (
      I0 => reset_IBUF_192,
      I1 => mppminst_mppminternalcount(2),
      I2 => mppminst_mppminternalcount(1),
      I3 => mppminst_mppminternalcount(0),
      O => mppminst_mppminternalcount_mux0002(1)
    );
  clockmoduleinst_Mcount_sysNclockcounter_xor_3_11 : LUT4
    generic map(
      INIT => X"78E0"
    )
    port map (
      I0 => clockmoduleinst_sysNclockcounter(2),
      I1 => clockmoduleinst_sysNclockcounter(1),
      I2 => clockmoduleinst_sysNclockcounter(3),
      I3 => clockmoduleinst_sysNclockcounter(0),
      O => clockmoduleinst_Mcount_sysNclockcounter9
    );
  prbsinst_lfsr_not00001 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => prbsinst_lfsr(1),
      I1 => prbsinst_lfsr_0_186,
      I2 => prbsinst_lfsr(2),
      O => prbsinst_lfsr_not0000
    );
  buffmoduleinst_buff_6_and00001 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => buffmoduleinst_addressW(0),
      I1 => buffmoduleinst_addressW(1),
      I2 => buffmoduleinst_addressW(2),
      O => buffmoduleinst_buff_6_and0000
    );
  buffmoduleinst_buff_5_and00001 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => buffmoduleinst_addressW(1),
      I1 => buffmoduleinst_addressW(0),
      I2 => buffmoduleinst_addressW(2),
      O => buffmoduleinst_buff_5_and0000
    );
  buffmoduleinst_buff_4_and00001 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => buffmoduleinst_addressW(0),
      I1 => buffmoduleinst_addressW(1),
      I2 => buffmoduleinst_addressW(2),
      O => buffmoduleinst_buff_4_and0000
    );
  buffmoduleinst_buff_2_and00001 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => buffmoduleinst_addressW(2),
      I1 => buffmoduleinst_addressW(0),
      I2 => buffmoduleinst_addressW(1),
      O => buffmoduleinst_buff_2_and0000
    );
  buffmoduleinst_buff_1_and00001 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => buffmoduleinst_addressW(2),
      I1 => buffmoduleinst_addressW(1),
      I2 => buffmoduleinst_addressW(0),
      O => buffmoduleinst_buff_1_and0000
    );
  buffmoduleinst_buff_0_and00001 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => buffmoduleinst_addressW(0),
      I1 => buffmoduleinst_addressW(1),
      I2 => buffmoduleinst_addressW(2),
      O => buffmoduleinst_buff_0_and0000
    );
  buffmoduleinst_addressW_cmp_eq00001 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => buffmoduleinst_addressW(2),
      I1 => buffmoduleinst_addressW(0),
      I2 => buffmoduleinst_addressW(1),
      O => buffmoduleinst_addressW_cmp_eq0000
    );
  clockmoduleinst_mppmtempclkop_cmp_eq00001 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => clockmoduleinst_mppmclockcounter(0),
      I1 => clockmoduleinst_mppmclockcounter(1),
      O => clockmoduleinst_mppmtempclkop_cmp_eq0000
    );
  clockmoduleinst_systempNclkop_mux00001 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => clockmoduleinst_systempNclkop_155,
      I1 => clockmoduleinst_sysNclockcounter_cmp_eq0000,
      O => clockmoduleinst_systempNclkop_mux0000
    );
  clockmoduleinst_mdppmtempclkop_cmp_eq00001 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => clockmoduleinst_mdppmclockcounter(0),
      I1 => clockmoduleinst_mdppmclockcounter(1),
      I2 => clockmoduleinst_mdppmclockcounter(2),
      O => clockmoduleinst_mdppmtempclkop_cmp_eq0000
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_cy_2_11 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmppmclockcounter(1),
      I2 => clockmoduleinst_ser2parmppmclockcounter(0),
      O => clockmoduleinst_Mcount_ser2parmppmclockcounter_cy(2)
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_cy_2_11 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(1),
      I2 => clockmoduleinst_ser2parmdppmclockcounter(0),
      O => clockmoduleinst_Mcount_ser2parmdppmclockcounter_cy(2)
    );
  buffmoduleinst_Mcount_addressW_xor_2_121 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => buffmoduleinst_addressW(2),
      I1 => buffmoduleinst_addressW(0),
      I2 => buffmoduleinst_addressW(1),
      O => buffmoduleinst_buff_3_and0000
    );
  clockmoduleinst_sysNclockcounter_cmp_eq00001 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => clockmoduleinst_sysNclockcounter(3),
      I1 => clockmoduleinst_sysNclockcounter(2),
      I2 => clockmoduleinst_sysNclockcounter(0),
      I3 => clockmoduleinst_sysNclockcounter(1),
      O => clockmoduleinst_sysNclockcounter_cmp_eq0000
    );
  mppminst_mppmtempoutR_mux000246 : LUT4
    generic map(
      INIT => X"0009"
    )
    port map (
      I0 => ser2parinstmppm_ser2parout(3),
      I1 => mppminst_mppminternalcount(2),
      I2 => mppminst_mppminternalcount(3),
      I3 => reset_IBUF_192,
      O => mppminst_mppmtempoutR_mux000246_182
    );
  mppminst_mppmtempoutR_mux000247 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => mppminst_mppmtempoutR_mux000226_181,
      I1 => mppminst_mppmtempoutR_mux000246_182,
      O => mppminst_mppmtempoutR_mux0002
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_4_11 : LUT4
    generic map(
      INIT => X"060A"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(4),
      I1 => clockmoduleinst_ser2parmppmclockcounter(3),
      I2 => clockmoduleinst_ser2parmppmclockcounter_cmp_eq0000_146,
      I3 => clockmoduleinst_Mcount_ser2parmppmclockcounter_cy(2),
      O => clockmoduleinst_Mcount_ser2parmppmclockcounter12
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_4_11 : LUT4
    generic map(
      INIT => X"060A"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(4),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(3),
      I2 => clockmoduleinst_ser2parmdppmclockcounter_cmp_eq0000_137,
      I3 => clockmoduleinst_Mcount_ser2parmdppmclockcounter_cy(2),
      O => clockmoduleinst_Mcount_ser2parmdppmclockcounter12
    );
  clockmoduleinst_ser2parmppmclockcounter_cmp_eq0000_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmppmclockcounter(0),
      O => N21
    );
  clockmoduleinst_ser2parmppmclockcounter_cmp_eq0000 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(4),
      I1 => clockmoduleinst_ser2parmppmclockcounter(3),
      I2 => N21,
      I3 => clockmoduleinst_ser2parmppmclockcounter(1),
      O => clockmoduleinst_ser2parmppmclockcounter_cmp_eq0000_146
    );
  clockmoduleinst_ser2parmdppmclockcounter_cmp_eq0000_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(0),
      O => N4
    );
  clockmoduleinst_ser2parmdppmclockcounter_cmp_eq0000 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(4),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(3),
      I2 => N4,
      I3 => clockmoduleinst_ser2parmdppmclockcounter(1),
      O => clockmoduleinst_ser2parmdppmclockcounter_cmp_eq0000_137
    );
  mdppminst_mdppminternalcount_mux0002_1_Q : LUT4
    generic map(
      INIT => X"0009"
    )
    port map (
      I0 => mdppminst_mdppminternalcount(2),
      I1 => N6,
      I2 => mdppminst_mdppminternalcount_cmp_eq0000,
      I3 => reset_IBUF_192,
      O => mdppminst_mdppminternalcount_mux0002(1)
    );
  mdppminst_mdppminternalcount_mux0002_0_Q : LUT4
    generic map(
      INIT => X"0009"
    )
    port map (
      I0 => mdppminst_mdppminternalcount(3),
      I1 => N11,
      I2 => mdppminst_mdppminternalcount_cmp_eq0000,
      I3 => reset_IBUF_192,
      O => mdppminst_mdppminternalcount_mux0002(0)
    );
  mdppminst_mdppminternalcount_cmp_eq00004 : LUT4
    generic map(
      INIT => X"0201"
    )
    port map (
      I0 => buffmoduleinst_dataread(1),
      I1 => mdppminst_mdppminternalcount(3),
      I2 => N45,
      I3 => mdppminst_mdppminternalcount(0),
      O => mdppminst_mdppminternalcount_cmp_eq0000
    );
  reset_IBUF : IBUF
    port map (
      I => reset,
      O => reset_IBUF_192
    );
  ppmout_OBUF : OBUF
    port map (
      I => ppmout_OBUF_185,
      O => ppmout
    );
  dppmout_OBUF : OBUF
    port map (
      I => dppmout_OBUF_159,
      O => dppmout
    );
  ookout_OBUF : OBUF
    port map (
      I => prbsinst_lfsr(2),
      O => ookout
    );
  mdppminst_mdppmtempoutR_mux00021 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => N13,
      I1 => mdppminst_mdppminternalcount(3),
      I2 => reset_IBUF_192,
      I3 => N23,
      O => mdppminst_mdppmtempoutR_mux0002
    );
  mdppminst_mdppminternalcount_mux0002_3_1 : LUT4
    generic map(
      INIT => X"FF10"
    )
    port map (
      I0 => N13,
      I1 => mdppminst_mdppminternalcount(3),
      I2 => buffmoduleinst_dataread(1),
      I3 => N25,
      O => mdppminst_mdppminternalcount_mux0002(3)
    );
  mdppminst_mdppminternalcount_cmp_eq00004_SW3 : LUT4
    generic map(
      INIT => X"EFFB"
    )
    port map (
      I0 => reset_IBUF_192,
      I1 => mdppminst_mdppminternalcount(0),
      I2 => buffmoduleinst_dataread(1),
      I3 => mdppminst_mdppminternalcount(1),
      O => N27
    );
  mdppminst_mdppminternalcount_mux0002_2_1 : LUT4
    generic map(
      INIT => X"3237"
    )
    port map (
      I0 => N13,
      I1 => N28,
      I2 => mdppminst_mdppminternalcount(3),
      I3 => N27,
      O => mdppminst_mdppminternalcount_mux0002(2)
    );
  buffmoduleinst_Mmux_varindex0000_4 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_6_1_77,
      I2 => buffmoduleinst_buff_7_1_81,
      O => buffmoduleinst_Mmux_varindex0000_4_28
    );
  buffmoduleinst_Mmux_varindex0000_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_4_1_69,
      I2 => buffmoduleinst_buff_5_1_73,
      O => buffmoduleinst_Mmux_varindex0000_5_34
    );
  buffmoduleinst_Mmux_varindex0000_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_2_1_61,
      I2 => buffmoduleinst_buff_3_1_65,
      O => buffmoduleinst_Mmux_varindex0000_51_35
    );
  buffmoduleinst_Mmux_varindex0000_6 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_0_1_53,
      I2 => buffmoduleinst_buff_1_1_57,
      O => buffmoduleinst_Mmux_varindex0000_6_40
    );
  buffmoduleinst_Mmux_varindex0000_53 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_2_2_62,
      I2 => buffmoduleinst_buff_3_2_66,
      O => buffmoduleinst_Mmux_varindex0000_53_37
    );
  buffmoduleinst_Mmux_varindex0000_41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_6_2_78,
      I2 => buffmoduleinst_buff_7_2_82,
      O => buffmoduleinst_Mmux_varindex0000_41_29
    );
  buffmoduleinst_Mmux_varindex0000_52 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_4_2_70,
      I2 => buffmoduleinst_buff_5_2_74,
      O => buffmoduleinst_Mmux_varindex0000_52_36
    );
  buffmoduleinst_Mmux_varindex0000_61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_0_2_54,
      I2 => buffmoduleinst_buff_1_2_58,
      O => buffmoduleinst_Mmux_varindex0000_61_41
    );
  buffmoduleinst_Mmux_varindex0000_42 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_6_3_79,
      I2 => buffmoduleinst_buff_7_3_83,
      O => buffmoduleinst_Mmux_varindex0000_42_30
    );
  buffmoduleinst_Mmux_varindex0000_54 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_4_3_71,
      I2 => buffmoduleinst_buff_5_3_75,
      O => buffmoduleinst_Mmux_varindex0000_54_38
    );
  buffmoduleinst_Mmux_varindex0000_55 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_2_3_63,
      I2 => buffmoduleinst_buff_3_3_67,
      O => buffmoduleinst_Mmux_varindex0000_55_39
    );
  buffmoduleinst_Mmux_varindex0000_62 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => buffmoduleinst_addressR(0),
      I1 => buffmoduleinst_buff_0_3_55,
      I2 => buffmoduleinst_buff_1_3_59,
      O => buffmoduleinst_Mmux_varindex0000_62_42
    );
  buffmoduleinst_Mmux_varindex0000_3_f5 : MUXF5
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_5_34,
      I1 => buffmoduleinst_Mmux_varindex0000_4_28,
      S => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mmux_varindex0000_3_f5_25
    );
  buffmoduleinst_Mmux_varindex0000_4_f5 : MUXF5
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_6_40,
      I1 => buffmoduleinst_Mmux_varindex0000_51_35,
      S => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mmux_varindex0000_4_f5_31
    );
  buffmoduleinst_Mmux_varindex0000_3_f5_0 : MUXF5
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_52_36,
      I1 => buffmoduleinst_Mmux_varindex0000_41_29,
      S => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mmux_varindex0000_3_f51
    );
  buffmoduleinst_Mmux_varindex0000_4_f5_0 : MUXF5
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_61_41,
      I1 => buffmoduleinst_Mmux_varindex0000_53_37,
      S => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mmux_varindex0000_4_f51
    );
  buffmoduleinst_Mmux_varindex0000_3_f5_1 : MUXF5
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_54_38,
      I1 => buffmoduleinst_Mmux_varindex0000_42_30,
      S => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mmux_varindex0000_3_f52
    );
  buffmoduleinst_Mmux_varindex0000_4_f5_1 : MUXF5
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_62_42,
      I1 => buffmoduleinst_Mmux_varindex0000_55_39,
      S => buffmoduleinst_addressR(1),
      O => buffmoduleinst_Mmux_varindex0000_4_f52
    );
  buffmoduleinst_Mmux_varindex0000_2_f6 : MUXF6
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_4_f5_31,
      I1 => buffmoduleinst_Mmux_varindex0000_3_f5_25,
      S => buffmoduleinst_addressR(2),
      O => buffmoduleinst_varindex0000(1)
    );
  buffmoduleinst_Mmux_varindex0000_2_f6_0 : MUXF6
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_4_f51,
      I1 => buffmoduleinst_Mmux_varindex0000_3_f51,
      S => buffmoduleinst_addressR(2),
      O => buffmoduleinst_varindex0000(2)
    );
  buffmoduleinst_Mmux_varindex0000_2_f6_1 : MUXF6
    port map (
      I0 => buffmoduleinst_Mmux_varindex0000_4_f52,
      I1 => buffmoduleinst_Mmux_varindex0000_3_f52,
      S => buffmoduleinst_addressR(2),
      O => buffmoduleinst_varindex0000(3)
    );
  buffmoduleinst_Mcount_addressW_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => buffmoduleinst_addressW(2),
      I1 => buffmoduleinst_addressW(0),
      I2 => buffmoduleinst_addressW(1),
      O => buffmoduleinst_Mcount_addressW6
    );
  clockmoduleinst_Mcount_mdppmclockcounter_xor_2_11 : LUT3
    generic map(
      INIT => X"62"
    )
    port map (
      I0 => clockmoduleinst_mdppmclockcounter(2),
      I1 => clockmoduleinst_mdppmclockcounter(1),
      I2 => clockmoduleinst_mdppmclockcounter(0),
      O => clockmoduleinst_Mcount_mdppmclockcounter6
    );
  clockmoduleinst_Mcount_mdppmclockcounter_xor_1_11 : LUT3
    generic map(
      INIT => X"26"
    )
    port map (
      I0 => clockmoduleinst_mdppmclockcounter(0),
      I1 => clockmoduleinst_mdppmclockcounter(1),
      I2 => clockmoduleinst_mdppmclockcounter(2),
      O => clockmoduleinst_Mcount_mdppmclockcounter3
    );
  clockmoduleinst_mppmtempclkop_mux00001 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => clockmoduleinst_mppmtempclkop_128,
      I1 => clockmoduleinst_mppmclockcounter(0),
      I2 => clockmoduleinst_mppmclockcounter(1),
      O => clockmoduleinst_mppmtempclkop_mux0000
    );
  clockmoduleinst_mdppmtempclkop_mux00001 : LUT4
    generic map(
      INIT => X"A6AA"
    )
    port map (
      I0 => clockmoduleinst_mdppmtempclkop_122,
      I1 => clockmoduleinst_mdppmclockcounter(2),
      I2 => clockmoduleinst_mdppmclockcounter(0),
      I3 => clockmoduleinst_mdppmclockcounter(1),
      O => clockmoduleinst_mdppmtempclkop_mux0000
    );
  clockmoduleinst_ser2parmdppmtempclkop_mux00001 : LUT4
    generic map(
      INIT => X"AA9A"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmtempclkop_138,
      I1 => clockmoduleinst_ser2parmdppmclockcounter(0),
      I2 => N30,
      I3 => clockmoduleinst_ser2parmdppmclockcounter(2),
      O => clockmoduleinst_ser2parmdppmtempclkop_mux0000
    );
  clockmoduleinst_ser2parmppmtempclkop_mux00001 : LUT4
    generic map(
      INIT => X"AA9A"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmtempclkop_147,
      I1 => clockmoduleinst_ser2parmppmclockcounter(0),
      I2 => N34,
      I3 => clockmoduleinst_ser2parmppmclockcounter(2),
      O => clockmoduleinst_ser2parmppmtempclkop_mux0000
    );
  buffmoduleinst_readtrigger_inv1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => clockmoduleinst_cmodmdppmclock_112,
      I1 => mdppminst_mdppmtempoutR_169,
      O => buffmoduleinst_readtrigger_inv
    );
  mppminst_mppminternalcount_mux0002_0_Q : MUXF5
    port map (
      I0 => N38,
      I1 => N39,
      S => mppminst_mppminternalcount(1),
      O => mppminst_mppminternalcount_mux0002(0)
    );
  mppminst_mppminternalcount_mux0002_0_F : LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => reset_IBUF_192,
      I1 => mppminst_mppminternalcount(3),
      I2 => mppminst_mppminternalcount(0),
      I3 => mppminst_mppminternalcount(2),
      O => N38
    );
  mppminst_mppminternalcount_mux0002_0_G : LUT4
    generic map(
      INIT => X"1444"
    )
    port map (
      I0 => reset_IBUF_192,
      I1 => mppminst_mppminternalcount(3),
      I2 => mppminst_mppminternalcount(0),
      I3 => mppminst_mppminternalcount(2),
      O => N39
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_3_11 : MUXF5
    port map (
      I0 => N40,
      I1 => N41,
      S => clockmoduleinst_ser2parmdppmclockcounter(4),
      O => clockmoduleinst_Mcount_ser2parmdppmclockcounter9
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_3_11_F : LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(3),
      I2 => clockmoduleinst_ser2parmdppmclockcounter(1),
      I3 => clockmoduleinst_ser2parmdppmclockcounter(0),
      O => N40
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_3_11_G : LUT4
    generic map(
      INIT => X"78E0"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(1),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(0),
      I2 => clockmoduleinst_ser2parmdppmclockcounter(3),
      I3 => clockmoduleinst_ser2parmdppmclockcounter(2),
      O => N41
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_3_11 : MUXF5
    port map (
      I0 => N42,
      I1 => N43,
      S => clockmoduleinst_ser2parmppmclockcounter(4),
      O => clockmoduleinst_Mcount_ser2parmppmclockcounter9
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_3_11_F : LUT4
    generic map(
      INIT => X"6CCC"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(2),
      I1 => clockmoduleinst_ser2parmppmclockcounter(3),
      I2 => clockmoduleinst_ser2parmppmclockcounter(1),
      I3 => clockmoduleinst_ser2parmppmclockcounter(0),
      O => N42
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_3_11_G : LUT4
    generic map(
      INIT => X"78E0"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(1),
      I1 => clockmoduleinst_ser2parmppmclockcounter(0),
      I2 => clockmoduleinst_ser2parmppmclockcounter(3),
      I3 => clockmoduleinst_ser2parmppmclockcounter(2),
      O => N43
    );
  clockmoduleinst_cmodser2parmdppmclock_BUFG : BUFG
    port map (
      I => clockmoduleinst_cmodser2parmdppmclock1,
      O => clockmoduleinst_cmodser2parmdppmclock_115
    );
  clock_BUFGP : BUFGP
    port map (
      I => clock,
      O => clock_BUFGP_90
    );
  buffmoduleinst_writetrigger_inv1_INV_0 : INV
    port map (
      I => clockmoduleinst_cmodser2parmdppmclock_115,
      O => buffmoduleinst_writetrigger_inv
    );
  clockmoduleinst_cmodreset_inv1_INV_0 : INV
    port map (
      I => reset_IBUF_192,
      O => clockmoduleinst_cmodreset_inv
    );
  clockmoduleinst_systempNclkop_not00011_INV_0 : INV
    port map (
      I => clockmoduleinst_systempNclkop_155,
      O => clockmoduleinst_systempNclkop_not0001
    );
  clockmoduleinst_ser2parmppmtempclkop_not00011_INV_0 : INV
    port map (
      I => clockmoduleinst_ser2parmppmtempclkop_147,
      O => clockmoduleinst_ser2parmppmtempclkop_not0001
    );
  clockmoduleinst_ser2parmdppmtempclkop_not00011_INV_0 : INV
    port map (
      I => clockmoduleinst_ser2parmdppmtempclkop_138,
      O => clockmoduleinst_ser2parmdppmtempclkop_not0001
    );
  clockmoduleinst_mppmtempclkop_not00011_INV_0 : INV
    port map (
      I => clockmoduleinst_mppmtempclkop_128,
      O => clockmoduleinst_mppmtempclkop_not0001
    );
  clockmoduleinst_mdppmtempclkop_not00011_INV_0 : INV
    port map (
      I => clockmoduleinst_mdppmtempclkop_122,
      O => clockmoduleinst_mdppmtempclkop_not0001
    );
  clockmoduleinst_Mcount_sysNclockcounter_xor_0_11_INV_0 : INV
    port map (
      I => clockmoduleinst_sysNclockcounter(0),
      O => clockmoduleinst_Mcount_sysNclockcounter
    );
  clockmoduleinst_Mcount_ser2parmppmclockcounter_xor_0_11_INV_0 : INV
    port map (
      I => clockmoduleinst_ser2parmppmclockcounter(0),
      O => clockmoduleinst_Mcount_ser2parmppmclockcounter
    );
  clockmoduleinst_Mcount_ser2parmdppmclockcounter_xor_0_11_INV_0 : INV
    port map (
      I => clockmoduleinst_ser2parmdppmclockcounter(0),
      O => clockmoduleinst_Mcount_ser2parmdppmclockcounter
    );
  clockmoduleinst_Mcount_mdppmclockcounter_xor_0_11_INV_0 : INV
    port map (
      I => clockmoduleinst_mdppmclockcounter(0),
      O => clockmoduleinst_Mcount_mdppmclockcounter
    );
  buffmoduleinst_Mcount_addressW_xor_0_11_INV_0 : INV
    port map (
      I => buffmoduleinst_addressW(0),
      O => buffmoduleinst_Mcount_addressW
    );
  buffmoduleinst_Mcount_addressR_xor_0_11_INV_0 : INV
    port map (
      I => buffmoduleinst_addressR(0),
      O => buffmoduleinst_Mcount_addressR
    );
  mppminst_mppmtempoutR_mux000226 : LUT4_L
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => ser2parinstmppm_ser2parout(1),
      I1 => mppminst_mppminternalcount(0),
      I2 => ser2parinstmppm_ser2parout(2),
      I3 => mppminst_mppminternalcount(1),
      LO => mppminst_mppmtempoutR_mux000226_181
    );
  mdppminst_mdppminternalcount_mux0002_1_SW0 : LUT2_L
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => mdppminst_mdppminternalcount(0),
      I1 => mdppminst_mdppminternalcount(1),
      LO => N6
    );
  mdppminst_mdppminternalcount_mux0002_0_SW0 : LUT3_L
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => mdppminst_mdppminternalcount(0),
      I1 => mdppminst_mdppminternalcount(2),
      I2 => mdppminst_mdppminternalcount(1),
      LO => N11
    );
  mdppminst_mdppminternalcount_cmp_eq00004_SW0 : LUT4_D
    generic map(
      INIT => X"7DBE"
    )
    port map (
      I0 => buffmoduleinst_dataread(3),
      I1 => buffmoduleinst_dataread(2),
      I2 => mdppminst_mdppminternalcount(1),
      I3 => mdppminst_mdppminternalcount(2),
      LO => N45,
      O => N13
    );
  mdppminst_mdppminternalcount_cmp_eq00004_SW1 : LUT2_L
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => mdppminst_mdppminternalcount(0),
      I1 => buffmoduleinst_dataread(1),
      LO => N23
    );
  mdppminst_mdppminternalcount_cmp_eq00004_SW2 : LUT2_L
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => mdppminst_mdppminternalcount(0),
      I1 => reset_IBUF_192,
      LO => N25
    );
  mdppminst_mdppminternalcount_cmp_eq00004_SW4 : LUT3_L
    generic map(
      INIT => X"EB"
    )
    port map (
      I0 => reset_IBUF_192,
      I1 => mdppminst_mdppminternalcount(1),
      I2 => mdppminst_mdppminternalcount(0),
      LO => N28
    );
  clockmoduleinst_ser2parmdppmtempclkop_mux00001_SW0 : LUT3_L
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => clockmoduleinst_ser2parmdppmclockcounter(1),
      I1 => clockmoduleinst_ser2parmdppmclockcounter(3),
      I2 => clockmoduleinst_ser2parmdppmclockcounter(4),
      LO => N30
    );
  clockmoduleinst_ser2parmppmtempclkop_mux00001_SW0 : LUT3_L
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => clockmoduleinst_ser2parmppmclockcounter(1),
      I1 => clockmoduleinst_ser2parmppmclockcounter(3),
      I2 => clockmoduleinst_ser2parmppmclockcounter(4),
      LO => N34
    );

end Structure;

