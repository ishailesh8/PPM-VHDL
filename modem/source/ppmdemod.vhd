----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:07:23 09/11/2013 
-- Design Name: 
-- Module Name:    ppmdemod - Behavioral 
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

entity ppmdemod is
generic ( N : integer);
port(
    mppmdatain : in std_logic;
    ppmdemodclock  : in  std_logic;
    ppmdemodreset  : in  std_logic;
	ppmparoutclock : in  std_logic;
	ppmdemodflag : out std_logic;
    parppmdemodout : out std_logic_vector(N downto 1));
end ppmdemod;

architecture Behavioral of ppmdemod is

signal parppmdemodtempout : std_logic_vector(N downto 1);
signal mppmdataintvalue : integer range 0 to 2**N - 1 :=0;

begin

process (ppmdemodclock, ppmdemodreset,mppmdatain) is 
  begin
  
--  if rising_edge(ppmdemodclock ) then      	  
    if falling_edge(ppmdemodclock ) then
		  if mppmdataintvalue /= 2**N -1 then		 
		  mppmdataintvalue <= mppmdataintvalue + 1;
		  else
		  mppmdataintvalue <= 0;
		  end if;	  
	 end if ;

	     
	if rising_edge(mppmdatain) then
		  parppmdemodtempout(N downto 1) <= conv_std_logic_vector(mppmdataintvalue,N);
		  ppmdemodflag <= '1';
   end if;	
     
	 if ppmdemodreset ='1' then
		mppmdataintvalue <= 0;
		--parppmdemodtempout <= ( others => '0');
    end if ;

end process;

process (ppmparoutclock) is
	begin
		if falling_edge(ppmparoutclock) and  parppmdemodtempout(parppmdemodtempout'left) /= 'U' then
		parppmdemodout(N downto 1) <= parppmdemodtempout (N downto 1);
		end if;
	end process;
end Behavioral;

