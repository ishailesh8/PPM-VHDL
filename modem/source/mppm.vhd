 library IEEE;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mppm is
generic ( N : natural );
port(    mppmflagstatus : in std_logic;
			mppmclock : in std_logic;
			mppmreset : in std_logic;
			mppmdata: in std_logic_vector (N downto 1);
			mppmout : out std_logic 
	);
end mppm;

architecture Behavioral of mppm is 

shared variable mppmtempoutR : std_logic;
constant maxvalue : integer range 1 to 2**N := 2**N -1;


begin


process (mppmclock, mppmreset) is

variable mppmdataintvalue : integer range 1 to 2**N  - 1;
variable mppminternalcount : integer range 0 to 2**N - 1 :=0;


  begin
    if rising_edge(mppmclock) and mppmflagstatus = '1' then
      
		mppmdataintvalue := conv_integer(mppmdata);    		
		 
		 
		 if mppmdataintvalue = mppminternalcount then 	
					mppmtempoutR := '1';					
       else
					mppmtempoutR := '0';
					
					               				
		 end if ;
		 
		 if mppminternalcount = maxvalue then
		 mppminternalcount := 0;
		 else 
		 mppminternalcount := mppminternalcount + 1;
		 end if;
		 
		 
		
		if mppmreset='1' then
				   mppmtempoutR :='0';
				   mppminternalcount := 0;
       end if ;
    end if;		


end process;

mppmout <= mppmtempoutR when mppmclock = '1' else '0';


end Behavioral;

