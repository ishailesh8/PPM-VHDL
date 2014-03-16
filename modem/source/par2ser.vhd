----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:47 09/12/2013 
-- Design Name: 
-- Module Name:    par2ser - Behavioral 
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

entity par2ser is
generic(
    N : natural );
  port(
    par2serflagin : in std_logic;
    par2serclock  : in  std_logic;
	 par2sermodclock : in std_logic;
    par2serreset  : in  std_logic;
	 par2serin : in std_logic_vector(N downto 1);
    par2serflagout : out std_logic;	 
    par2serout : out std_logic
	 );
end par2ser;

architecture Behavioral of par2ser is
   signal serout : std_logic;
	--signal partemp : std_logic_vector ( N downto 1) := (others => '0');
	signal partempR : std_logic_vector ( N downto 1) := (others => '0');
   signal partempF : std_logic_vector ( N downto 1) := (others => '0');
	shared variable loadvalue : integer range 1 to N := 1;
	
begin

process ( par2serclock , par2serreset)

	begin
      if ( par2serreset = '1') then
			--partempR ( N downto 1) <= ( others => '0');
			par2serflagout <= '1';
		end if;
		if rising_edge(par2serclock) and  par2serflagin = '1' and par2serin(par2serin'left) /= 'U' then
				
				if loadvalue = 1 then
				serout <= partempF(N);
				partempR( N downto 1 ) <= partempF( (N - 1) downto 1 ) & '0';
				loadvalue := loadvalue + 1;
				else
				serout <= partempR(N);
				partempR( N downto 1 ) <= partempR( (N - 1) downto 1 ) & '0';
					if loadvalue = N then
					loadvalue := 1;
					else
					loadvalue := loadvalue + 1;
					end if;
				--serout <= partempR(N);
				end if;
		end if;
		
		if par2serflagin = '1'  then    	
				par2serflagout <= par2sermodclock;
		else
		      par2serflagout <= '1';
		end if;				
end process;

process (par2sermodclock)
	begin
	if falling_edge(par2sermodclock) and par2serflagin = '1' and par2serin(par2serin'left) /= 'U' then
	partempF( N downto 1 ) <= par2serin( N downto 1 );
	end if;
end process;

   --partemp <= partempF when par2serclock = '0'  else partempR;
	par2serout <= serout;

end Behavioral;

