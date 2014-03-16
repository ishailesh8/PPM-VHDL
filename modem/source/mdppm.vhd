library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mdppm is
generic ( N : natural );
port(    mdppmflagstatus : in std_logic;
			mdppmclock : in std_logic;
			mdppmreset : in std_logic;
			mdppmdata: in std_logic_vector (N downto 1);
			mdppmout : out std_logic

	);
end mdppm;

architecture Behavioral of mdppm is

shared variable mdppmtempoutR : std_logic;
 
 begin

process (mdppmclock, mdppmreset) is
 
variable mdppminternalcount : integer range 0 to 2**N - 1:= 0;
variable mdppmdataintvalue : integer range 1 to 2**N - 1;
 
  begin
  
    if rising_edge(mdppmclock) and mdppmflagstatus = '1' then
       if mdppmdata(mdppmdata'right) /= 'U' then
		 
		  mdppmdataintvalue := conv_integer(mdppmdata);
		 
					 if mdppmdataintvalue = mdppminternalcount then 								
	
								mdppmtempoutR := '1';
								mdppminternalcount := 0;
								
					 else
							
								mdppminternalcount := mdppminternalcount+1;
								mdppmtempoutR := '0' ;
						
					 end if ;
		 end if ;

     
	    if mdppmreset='1' then
				   mdppmtempoutR := '0';
				   mdppminternalcount := 0;
       end if ;
    end if;
	 
end process;

mdppmout <= mdppmtempoutR when mdppmclock = '1' else '0';


end Behavioral;

