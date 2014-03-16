----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:07:55 09/11/2013 
-- Design Name: 
-- Module Name:    dpimdemod - Behavioral 
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

entity dpimdemod is
generic ( N : integer);
port(
    trigdpim : in std_logic;
    mdpimdatain : in std_logic;
    dpimdemodclock  : in  std_logic;
    dpimdemodreset  : in  std_logic;
	 dpimdemodflag : out std_logic;
    pardpimdemodout : out std_logic_vector(N downto 1));
end dpimdemod;

architecture Behavioral of dpimdemod is
 
 begin

process (dpimdemodclock, dpimdemodreset) is
 
variable mdpimdataintvalue : integer range 0 to 2**N - 1;
 
  begin
  
    if rising_edge(dpimdemodclock ) and trigdpim = '1' then
       if mdpimdatain /= '1' then		 
		  mdpimdataintvalue := mdpimdataintvalue + 1;
		  dpimdemodflag <= '0';
		 else
		  dpimdemodflag <= '1';
		  pardpimdemodout <= conv_std_logic_vector(mdpimdataintvalue ,N);
		  mdpimdataintvalue := 0;
		 end if; 
	 end if ;

     
	 if dpimdemodreset ='1' then
				   mdpimdataintvalue := 0;
				   pardpimdemodout <= ( others => '0');
    end if ;
 	 
end process;

end Behavioral;

