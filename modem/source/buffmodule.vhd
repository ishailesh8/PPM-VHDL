
library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity buffmodule is
generic ( N : natural);
port (  
			buffflagstatus : in std_logic;
			writedata : in std_logic_vector(N downto 1); 
  			writetrigger : in std_logic;
			reset : in std_logic;
			readtrigger : in std_logic;
         dataread : out std_logic_vector(N downto 1);
			buffstatusout : out std_logic
         			); 
end buffmodule;



architecture Behavioral of buffmodule is

type buffstruct is array ((2**N -1) downto 0) of std_logic_vector(N downto 1);

signal buff : buffstruct ; --:= ((others=> (others=>'0')))


constant maxaddress : integer range 0 to (2**N -1) := (2**N-1);

begin

process (writetrigger,readtrigger,reset)

variable addressR : integer range 0 to (2**N -1) := 0;
variable addressW : integer range 0 to (2**N -1) := 0;

begin

if falling_edge(writetrigger) and buffflagstatus = '1' then

  buff(addressW) <= writedata; -- write
  if addressW = maxaddress then
  addressW := 0;
  else
  addressW := addressW + 1;
  end if; 
  if addressW = 2**(N-1) then 
  buffstatusout <= '1';
  end if;
  
end if;

if falling_edge(readtrigger) then

  dataread <= buff(addressR); -- read
  if addressR = maxaddress then
  addressR := 0;
  else
  addressR := addressR + 1;
  end if;
end if ;

if  readtrigger = 'U' and buffflagstatus = '1' and addressW = (2**(N -1)) then
  dataread <= buff(0);
  addressR := addressR + 1;
  end if;

if reset = '1' then 
	addressW := 0;
	addressR := 0;
	buff <= ((others=> (others=>'0')));
end if;

end process;

end Behavioral;