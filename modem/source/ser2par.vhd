
library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ser2par is
generic(
    N : natural );
  port(
    datainstatus : in std_logic;
	 ser2parmodclock : in std_logic;
    ser2parclock  : in  std_logic;
    ser2parreset  : in  std_logic;
	 ser2parin : in std_logic;
	 ser2parflag : out std_logic;
    ser2parout : out std_logic_vector (N downto 1)
	 );
	 
end ser2par;

architecture Behavioral of ser2par is



signal parallelout : std_logic_vector (N downto 1) := (others=>'U');
signal tempparallelout : std_logic_vector (N downto 1) := (others=>'U');
signal counter : integer range 1 to N := 1;

begin

process (ser2parclock,ser2parreset)



	begin

	if rising_edge(ser2parclock) and datainstatus = '1' then
   parallelout(N downto 1) <= parallelout(parallelout'left-1 downto parallelout'right) & ser2parin;
	end if;
	
	if rising_edge(ser2parclock) then
	if counter = 1 and parallelout(parallelout'left) /= 'U' then
	tempparallelout <= parallelout;
	counter <= counter + 1;
	elsif counter /= N and parallelout(parallelout'left) /= 'U' then
	counter <= counter + 1;
	elsif counter = N then
	counter <= 1;
	end if;
	end if;
	
	
	if ser2parreset = '1' then
		parallelout <= (others=>'0');
	end if;

end process;

process (ser2parmodclock)
	begin

	if rising_edge(ser2parmodclock) and datainstatus = '1' then
		if tempparallelout(tempparallelout'left) /= 'U' then
		ser2parout <= tempparallelout;
		ser2parflag <= '1';
		else	
		ser2parout <=(others=>'U');
		ser2parflag <= 'U';
	   end if;
	end if;

end process;

end Behavioral;

