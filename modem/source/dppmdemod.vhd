----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:07:55 09/11/2013 
-- Design Name: 
-- Module Name:    dppmdemod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dppmdemod is
generic ( N : integer);
port(
    trigdppm : in std_logic;
    mdppmdatain : in std_logic;
    dppmdemodclock  : in  std_logic;
    dppmdemodreset  : in  std_logic;
	 dppmdemodflag : out std_logic;
    pardppmdemodout : out std_logic_vector(N downto 1));
end dppmdemod;

architecture Behavioral of dppmdemod is
 
 begin

process (dppmdemodclock, dppmdemodreset) is
 
variable mdppmdataintvalue : integer range 0 to 2**N - 1;
 
  begin
  
    if rising_edge(dppmdemodclock ) and trigdppm = '1' then
       if mdppmdatain /= '1' then		 
		  mdppmdataintvalue := mdppmdataintvalue + 1;
		  dppmdemodflag <= '0';
		 else
		  dppmdemodflag <= '1';
		  pardppmdemodout <= conv_std_logic_vector(mdppmdataintvalue ,N);
		  mdppmdataintvalue := 0;
		 end if; 
	 end if ;

     
	 if dppmdemodreset ='1' then
				   mdppmdataintvalue := 0;
				   pardppmdemodout <= ( others => '0');
    end if ;
 	 
end process;

end Behavioral;

