library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mdpim is
generic ( N : natural );
port(    mdpimflagstatus : in std_logic;
			mdpimclock : in std_logic;
			mdpimreset : in std_logic;
			mdpimdata: in std_logic_vector (N downto 1);
			mdpimout : out std_logic;
			mdpimtrig : out std_logic

	);
end mdpim;

architecture Behavioral of mdpim is

shared variable mdpimtempoutR : std_logic;
shared variable mdpimtrigR : std_logic;

 
 begin

process (mdpimclock, mdpimreset) is
 
variable mdpiminternalcount : integer range 0 to 2**N - 1 := 0;
variable mdpimdataintvalue : integer range 1 to 2**N - 1 ;
 
  begin
  
    if rising_edge(mdpimclock) and mdpimflagstatus = '1' then
       if mdpimdata(mdpimdata'right) /= 'U' then
		 
		  mdpimdataintvalue := conv_integer(mdpimdata);
		 
					 if mdpiminternalcount = mdpimdataintvalue then
							   
								mdpimtrigR := '1';
								mdpimtempoutR :='0';
								mdpiminternalcount := 0;
					 
					 elsif mdpiminternalcount  = 0 then 
								mdpimtrigR := '0';							
								mdpimtempoutR :='1';
								mdpiminternalcount := mdpiminternalcount + 1 ;
																					 
					 else
							    mdpimtrigR := '0';
								mdpimtempoutR :='0';
								mdpiminternalcount := mdpiminternalcount+1;					 
					 end if ;
		 end if ;

     
	    if mdpimreset='1' then
		         mdpimtrigR := '0';
				   mdpimtempoutR :='0';
				   mdpiminternalcount := 0;
       end if ;
    end if;
	 
end process;

mdpimout <= mdpimtempoutR when mdpimclock = '1' else'0';
mdpimtrig <= mdpimtrigR when mdpimclock = '1' else '0';


end Behavioral;

