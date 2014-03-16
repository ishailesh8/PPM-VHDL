----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:26:36 09/18/2013 
-- Design Name: 
-- Module Name:    ookdemod - Behavioral 
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

entity ookdemod is
    Port ( trigook : in  STD_LOGIC;
           mookdatain : in  STD_LOGIC;
           ookdemodclock : in  STD_LOGIC;
           ookdemodreset : in  STD_LOGIC;
           ookdemodout : out  STD_LOGIC);
end ookdemod;

architecture Behavioral of ookdemod is

begin

process (ookdemodclock, ookdemodreset) is 
 
 begin
  
    if rising_edge(ookdemodclock ) and trigook = '1' then
       ookdemodout <= mookdatain; 
	 end if ;

     
	 if ookdemodreset ='1' then
		 ookdemodout <= '0';
    end if ;
 	 
end process;

end Behavioral;

