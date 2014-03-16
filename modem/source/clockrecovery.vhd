----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:00:51 09/11/2013 
-- Design Name: 
-- Module Name:    clockrecovery - Behavioral 
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

entity clockrecovery is
generic ( maxlength : natural );
port(
    samplingclock  : in  std_logic;
    clockrecoveryreset  : in  std_logic;
	 mookin : in std_logic;
    mppmin : in std_logic;
	 mdppmin : in std_logic;
	 mdpimin : in std_logic;
--	 triggerdesys : out std_logic;
	 triggerook : out std_logic;
	 triggerdppm : out std_logic;
	 triggerdpim : out std_logic;
	 desysclockout : out std_logic;
	 ookclockout : out std_logic;
	 ppmclockout : out std_logic;
	 dppmclockout : out std_logic;
	 dpimclockout : out std_logic;
	 par2serppmclockout : out std_logic;
	 par2serdppmclockout : out std_logic;
	 par2serdpimclockout : out std_logic
	 );
end clockrecovery;

architecture Behavioral of clockrecovery is

------------------------------------------------------------------------------------ 
-----------------Temporary Signal PPM Clock Recovery Module-------------------------
------------------------------------------------------------------------------------

signal ppmNclk : integer range 0 to maxlength:= 0;
signal ppmNclkR : integer range 0 to maxlength - 1:= 0;
signal ppmNclkF : integer range 0 to maxlength - 1:= 0;
signal ppmtempclkop: std_logic :='0';
signal ppmtempclkopR: std_logic_vector ( maxlength - 1 downto 0):= (others=>'0');
signal ppmtempclkopF: std_logic_vector ( maxlength -1 downto 0) :=(others=>'0');
signal firsttriggerppm : std_logic :='0';
--signal ppmsynccounter : integer range 1 to maxlength := 0;
signal ppmclockcounter : natural range 1 to maxlength;
------------------------------------------------------------------------------------ 
-----------------Temporary Signal desys Clock Recovery Module-----------------------
------------------------------------------------------------------------------------
signal desysNclk : integer range 0 to maxlength:= 0;
--signal firsttriggerdesys  : std_logic :='0';
------------------------------------------------------------------------------------ 
-----------------Temporary Signal DPPM Clock Recovery Module------------------------
------------------------------------------------------------------------------------
signal dppmNclk : integer range 0 to maxlength := 0;
signal firsttriggerdppm : std_logic :='0';
------------------------------------------------------------------------------------ 
-----------------Temporary Signal DPIM Clock Recovery Module------------------------
------------------------------------------------------------------------------------
signal dpimNclk : integer range 0 to maxlength := 0;
signal firsttriggerdpim : std_logic :='0';

------------------------------------------------------------------------------------ 
-----------------Temporary Signal OOK Clock Recovery Module------------------------
------------------------------------------------------------------------------------
signal ookNclk : integer range 0 to (2 ** maxlength) * maxlength := 0;
signal ookNclkleast : integer range 0 to (2 ** maxlength) := 0;
signal sampledatacount : integer range 0 to (2 ** maxlength) * maxlength := 0;
signal firsttriggerook : std_logic :='0';

begin

------------------------------------------------------------------------------------ 
------------------------PPM Demodulator Recovered Clock----------------------------- 
------------------------------------------------------------------------------------

process (clockrecoveryreset, samplingclock , mppmin) 
begin

   if rising_edge(samplingclock) then
	
	  if mppmin = '1' and firsttriggerppm = '0' then
	  ppmNclkR <= ppmNclkR + 1;
	  end if;
	end if;
	

   if falling_edge(mppmin) then
	  if ppmNclk /= 1 then
	  firsttriggerppm <= '1';
	  end if;
	 end if;	
	 
	if clockrecoveryreset = '1' then
	  firsttriggerppm <= '0';
	  ppmNclkR <= 0;
	end if; 
		 
end process;



process (clockrecoveryreset, samplingclock , mppmin) 
begin

   if falling_edge(samplingclock) then	
	  if mppmin = '1' and firsttriggerppm = '0' then
	  ppmNclkF <= ppmNclkF + 1;
	  end if;
	end if;

	if clockrecoveryreset = '1' then
	  ppmNclkF <= 0;
   end if;	  
end process;

ppmNclk <= ppmNclkR + ppmNclkF;
desysNclk <= ppmNclk;

process (clockrecoveryreset, samplingclock) 
begin
if (clockrecoveryreset = '1') then
            ppmtempclkop <= '0';
            ppmclockcounter <= 1;
				ppmtempclkopR <= (others=>'0');
 elsif rising_edge(samplingclock) then
   if ppmNclk /= 0 and firsttriggerppm = '1' then
       if ppmNclk mod 2 = 0 then
            if ppmclockcounter = ((ppmNclk / 2)) then
                ppmtempclkop <= NOT(ppmtempclkop);
                ppmclockcounter <= ppmclockcounter + 1;
				elsif ppmclockcounter = (ppmNclk) then
                ppmtempclkop <= NOT(ppmtempclkop);
                ppmclockcounter <= 1;					 
				else
                ppmclockcounter <= ppmclockcounter + 1;
            end if;      
	     else	
           if (ppmtempclkopR = conv_std_logic_vector((ppmNclk - 1),maxlength)) then
               ppmtempclkopR <= (others=>'0');
           else
			      ppmtempclkopR <= ppmtempclkopR + '1';
			  end if;	
		  end if; 	
	end if;
 end if;		
end process;

process (clockrecoveryreset,samplingclock) 
begin
        if (clockrecoveryreset = '1') then
            ppmtempclkopF <= (others=>'0');
        elsif falling_edge(samplingclock) then
		     if ppmNclk /= 0 and firsttriggerppm = '1' and ppmNclk mod 2 /= 0 then
             if (ppmtempclkopF = conv_std_logic_vector((ppmNclk - 1),maxlength)) then
                ppmtempclkopF <= (others=>'0');
				 else
                ppmtempclkopF <= ppmtempclkopF + '1';
				 end if;	      
	        end if;
	     end if;
end process; 

-- ppmclockout <= '1' when (((ppmNclk) mod 2) /= 0) and  ppmtempclkopR /= conv_std_logic_vector((((ppmNclk) + 1)/ 2),maxlength) and ppmtempclkopF /= conv_std_logic_vector((((ppmNclk) + 1)/ 2),maxlength) else ppmtempclkop; 

process (clockrecoveryreset, samplingclock)
variable ppmsynccounter : integer range 0 to maxlength; 
begin	
	if ppmNclk mod 2 /= 0 and firsttriggerppm = '1' then
	  --if ppmtempclkopR /= conv_std_logic_vector(((ppmNclk + 1)/ 2),maxlength) and ppmtempclkopF /= conv_std_logic_vector(((ppmNclk + 1)/ 2),maxlength) then 
     	if ppmtempclkopR > conv_std_logic_vector((((ppmNclk -1)/ 2)-1),maxlength) and ppmtempclkopF /= conv_std_logic_vector(ppmNclk - 1,maxlength) then		
		if ppmsynccounter = ((ppmNclk + 1)/ 2) then			
			ppmclockout <= '1';
	    else
			ppmsynccounter := ppmsynccounter + 1;
			ppmclockout <= '0';
		 end if;
		else
		 ppmclockout <= '0';
	  end if;
	elsif ppmNclk mod 2 = 0 and firsttriggerppm = '1' then
     ppmclockout <= ppmtempclkop;
	else
	  ppmclockout <= '0';
	end if;	
end process;

------------------------------------------------------------------------------------ 
------------PPM Demodulator Parallel to Serial Block  Recovered Clock---------------
------------------------------------------------------------------------------------

process (clockrecoveryreset, samplingclock) 
variable par2serppmclockcounter : natural range 1 to ( 2 ** maxlength) * maxlength;
variable par2serppmtempclkop: std_logic :='0';
begin
 
     if (clockrecoveryreset = '1') then
            par2serppmtempclkop := '0';
            par2serppmclockcounter := 1;
     elsif rising_edge(samplingclock) then
	   if ppmNclk /= 0 and firsttriggerppm = '1' then 
            if  par2serppmclockcounter = (2 ** (ppmNclk - 1) * ppmNclk)then
                par2serppmtempclkop := NOT(par2serppmtempclkop);
                par2serppmclockcounter := par2serppmclockcounter + 1;
				elsif par2serppmclockcounter = (2 ** ppmNclk) * ppmNclk then
                par2serppmtempclkop := NOT(par2serppmtempclkop);
                par2serppmclockcounter := 1;						 
            else
                par2serppmclockcounter := par2serppmclockcounter + 1;
            end if;
			par2serppmclockout <= par2serppmtempclkop;
			par2serdppmclockout <= par2serppmtempclkop;
			par2serdpimclockout <= par2serppmtempclkop;
	  end if;
end if;	  
end process;

------------------------------------------------------------------------------------ 
------------------------DPPM Demodulator Recovered Clock----------------------------- 
------------------------------------------------------------------------------------

process (clockrecoveryreset, samplingclock , mdppmin) 
begin

   if rising_edge(samplingclock) then
	
	  if mdppmin = '1' and firsttriggerdppm = '0' then
	  dppmNclk <= dppmNclk + 2;
	  elsif mdppmin = '0' and firsttriggerdppm = '1' then
	  triggerdppm <= '1';
	  end if;
	end if;
	

   if falling_edge(mdppmin) then
	  if dppmNclk /= 0 then
	  firsttriggerdppm <= '1';
	  end if;
	 end if;	
	 
	if clockrecoveryreset = '1' then
	  firsttriggerdppm <= '0';
	  dppmNclk <= 0;
	end if;  
		 
end process;

process (clockrecoveryreset, samplingclock) 
variable dppmclockcounter : natural range 1 to maxlength;
variable dppmtempclkop: std_logic :='0';
begin  
     if (clockrecoveryreset = '1') then
            dppmtempclkop := '0';
            dppmclockcounter := 1;
     elsif rising_edge(samplingclock) then
	    if dppmNclk /= 0 and firsttriggerdppm = '1' then
            if (dppmclockcounter = (dppmNclk / 2)) then
                dppmtempclkop := NOT(dppmtempclkop);
                dppmclockcounter := dppmclockcounter + 1;
				elsif (dppmclockcounter = dppmNclk) then
                dppmtempclkop := NOT(dppmtempclkop);
                dppmclockcounter := 1;						 
            else
                dppmclockcounter := dppmclockcounter + 1;
            end if;
			dppmclockout <= dppmtempclkop;
	      end if;
       end if;	  
end process;

------------------------------------------------------------------------------------ 
------------DPPM Demodulator Parallel to Serial Block  Recovered Clock---------------
------------------------------------------------------------------------------------

--process (clockrecoveryreset, samplingclock) 
--variable par2serdppmclockcounter : natural range 1 to ( 2 ** maxlength) * maxlength;
--variable par2serdppmtempclkop: std_logic :='0';
--begin
-- 
--     if (clockrecoveryreset = '1') then
--            par2serdppmtempclkop := '0';
--            par2serdppmclockcounter := 1;
--     elsif rising_edge(samplingclock) then
--	   if dppmNclk /= 0 and firsttriggerdppm = '1' then 
--            if  par2serdppmclockcounter = (2 ** ((dppmNclk / 2)  - 1) * (dppmNclk / 2) )then
--                par2serdppmtempclkop := NOT(par2serdppmtempclkop);
--                par2serdppmclockcounter := par2serdppmclockcounter + 1;
--				elsif par2serdppmclockcounter = (2 ** (dppmNclk / 2) ) * (dppmNclk / 2)  then
--                par2serdppmtempclkop := NOT(par2serdppmtempclkop);
--                par2serdppmclockcounter := 1;						 
--            else
--                par2serdppmclockcounter := par2serdppmclockcounter + 1;
--            end if;
--			par2serdppmclockout <= par2serdppmtempclkop;
--	  end if;
--end if;	  
--end process;
------------------------------------------------------------------------------------ 
------------------------DPIM Demodulator Recovered Clock---------------------------- 
------------------------------------------------------------------------------------
	 
process (clockrecoveryreset, samplingclock , mdpimin) 
begin

   if rising_edge(samplingclock) then
	
	  if mdpimin = '1' and firsttriggerdpim = '0' then
	  dpimNclk <= dpimNclk + 2;
	  elsif mdpimin = '0' and firsttriggerdpim = '1' then
	  triggerdpim <= '1';
	  end if;
	end if;
	

   if falling_edge(mdpimin) then
	  if dpimNclk /= 0 then
	  firsttriggerdpim <= '1';
	  end if;
	 end if;

	if clockrecoveryreset = '1' then
	  firsttriggerdpim <= '0';
	  dpimNclk <= 0;
	end if; 	 
end process;
	 
process (clockrecoveryreset, samplingclock) 
variable dpimclockcounter : natural range 1 to ( 2 ** maxlength);
variable dpimtempclkop: std_logic :='0';
begin
 
     if (clockrecoveryreset = '1') then
            dpimtempclkop := '0';
            dpimclockcounter := 1;
     elsif rising_edge(samplingclock) then
       if dpimNclk /= 0 and firsttriggerdpim = '1' then          
			if (dpimclockcounter = (dpimNclk / 2)) then
                dpimtempclkop := NOT(dpimtempclkop);
                dpimclockcounter := dpimclockcounter + 1;
				elsif (dpimclockcounter = dpimNclk) then
                dpimtempclkop := NOT(dpimtempclkop);
                dpimclockcounter := 1;					 
            else
                dpimclockcounter := dpimclockcounter + 1;
            end if;
			dpimclockout <= dpimtempclkop;
	      end if;
      end if;	  
end process;

------------------------------------------------------------------------------------ 
------------DPIM Demodulator Parallel to Serial Block  Recovered Clock--------------
------------------------------------------------------------------------------------

--process (clockrecoveryreset, samplingclock) 
--variable par2serdpimclockcounter : natural range 1 to ( 2 ** maxlength) * maxlength;
--variable par2serdpimtempclkop: std_logic :='0';
--begin
-- 
--     if (clockrecoveryreset = '1') then
--            par2serdpimtempclkop := '0';
--            par2serdpimclockcounter := 1;
--     elsif rising_edge(samplingclock) then
--	   if dpimNclk /= 0 and firsttriggerdpim = '1' then 
--            if  par2serdpimclockcounter = (2 ** ((dpimNclk / 2) - 1) * (dpimNclk / 2) )then
--                par2serdpimtempclkop := NOT(par2serdpimtempclkop);
--                par2serdpimclockcounter := par2serdpimclockcounter + 1;
--				elsif par2serdpimclockcounter = (2 ** (dpimNclk / 2) ) * (dpimNclk / 2)  then
--                par2serdpimtempclkop := NOT(par2serdpimtempclkop);
--                par2serdpimclockcounter := 1;						 
--            else
--                par2serdpimclockcounter := par2serdpimclockcounter + 1;
--            end if;
--			par2serdpimclockout <= par2serdpimtempclkop;
--	  end if;
--end if;	  
--end process;	 

------------------------------------------------------------------------------------ 
------------------------Desys Demodulator Recovered Clock---------------------------- 
------------------------------------------------------------------------------------

process (clockrecoveryreset, samplingclock) 
variable desysclockcounter : natural range 1 to 2 ** maxlength;
variable desystempclkop: std_logic :='0';
begin  
     if (clockrecoveryreset = '1') then
            desystempclkop := '0';
            desysclockcounter := 1;
     elsif rising_edge(samplingclock) then
	    if desysNclk /= 0 and firsttriggerppm = '1' then
            if desysclockcounter = 2 ** ( desysNclk - 1) then
                desystempclkop := NOT(desystempclkop);
                desysclockcounter := desysclockcounter + 1;
				elsif desysclockcounter = 2 ** desysNclk  then
                desystempclkop := NOT(desystempclkop);
                desysclockcounter := 1;						 
            else
                desysclockcounter := desysclockcounter + 1;
            end if;
			desysclockout <= desystempclkop;
	      end if;
       end if;	  
end process; 

------------------------------------------------------------------------------------ 
------------------------OOK Demodulator Recovered Clock----------------------------- 
------------------------------------------------------------------------------------

process (clockrecoveryreset, samplingclock , mookin) 
begin

   if rising_edge(samplingclock) then
	  
	  if mookin = '1' and firsttriggerook = '0' then
	  ookNclk <= ookNclk + 1;
	  elsif firsttriggerook = '0' then
	  ookNclk <= 0;
	  end if;
	end if;

   if falling_edge(mookin) then	  
	  if ookNclkleast = 0 then
	  ookNclkleast <= ookNclk;
	  else
		  if sampledatacount /= (2 * maxlength) then
			 if ookNclk < ookNclkleast then
			 ookNclkleast <= ookNclk;
			 else
			 ookNclkleast <= ookNclkleast;
			 end if;
			 sampledatacount <= sampledatacount + 1;	
		  else
		    firsttriggerook <= '1';
	     end if;
	   end if;
    end if;		
	 
	if clockrecoveryreset = '1' then
	  firsttriggerook <= '0';
	  ookNclk <= 0;
	  ookNclkleast <= 0;
	  sampledatacount <= 0;
	end if;  
		 
end process;

process (clockrecoveryreset, samplingclock) 
variable ookclockcounter : natural range 1 to (2 ** maxlength);
variable ooktempclkop: std_logic :='0';
begin  
     if (clockrecoveryreset = '1') then
            ooktempclkop := '0';
            ookclockcounter := 1;
     elsif rising_edge(samplingclock) then
	    if ookNclk /= 0 and firsttriggerook = '1' then
            if (ookclockcounter = (ookNclkleast / 2)) then
                ooktempclkop := NOT(ooktempclkop);
                ookclockcounter := ookclockcounter + 1;
				elsif (ookclockcounter = ookNclkleast) then
                ooktempclkop := NOT(ooktempclkop);
                ookclockcounter := 1;						 
            else
                ookclockcounter := ookclockcounter + 1;
            end if;
			ookclockout <= ooktempclkop;
			triggerook <= firsttriggerook;
	      end if;
       end if;	  
end process;


end Behavioral;

