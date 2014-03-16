
library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_ARITH.ALL;
use IEEE.std_logic_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockmodule is
generic(
    sysNclk : natural;
    mdppmNclk : natural;
	 mdpimNclk : natural;
	 mppmNclk : natural;
	 ser2parmppmNclk : natural;
    ser2parmdppmNclk : natural;
    ser2parmdpimNclk : natural;
    samplingNclk : natural 
	 ); 
port (
        sysclock : in  std_logic;
        cmodreset : in  std_logic;
		  cmodsysNclock : out std_logic;
        cmodmdppmclock: out std_logic;
		  cmodmdpimclock: out std_logic;
		  cmodmppmclock : out std_logic;
		  cmodser2parmdppmclock : out std_logic;
		  cmodser2parmdpimclock : out std_logic;
		  cmodser2parmppmclock : out std_logic;
		  cmodsamplingclock : out std_logic
    );
end clockmodule;

architecture Behavioral of clockmodule is

------------------------------------------------------------------------------------ 
--------------------------Temporary Clock Output------------------------------------ 
------------------------------------------------------------------------------------ 
shared variable mppmtempclkop: std_logic :='0';
shared variable mppmtempclkopR: std_logic_vector ( mppmNclk - 1 downto 0):= (others=>'0');
shared variable mppmtempclkopF: std_logic_vector ( mppmNclk -1 downto 0) :=(others=>'0');

signal mdppmtempclkop: std_logic :='0';
signal mdpimtempclkop: std_logic :='0';

signal ser2parmppmtempclkop: std_logic :='0';
signal ser2parmdpimtempclkop: std_logic :='0';
signal ser2parmdppmtempclkop: std_logic :='0';

signal sysNtempclkop : std_logic := '0';

signal samplingtempclkop :std_logic := '0';
 
begin

------------------------------------------------------------------------------------ 
--------------------------PRBS/OOK Clock-------------------------------------------- 
------------------------------------------------------------------------------------ 	 

process (cmodreset, sysclock) 
variable sysNclockcounter : natural range 1 to sysNclk;
begin
  
     if (cmodreset = '1') then
            sysNtempclkop <= '0';
            sysNclockcounter := 1;
     elsif rising_edge(sysclock) then
            if (sysNclockcounter = (sysNclk / 2)) then
                sysNtempclkop <= NOT(sysNtempclkop);
                sysNclockcounter := sysNclockcounter + 1;
				elsif (sysNclockcounter = sysNclk) then
                sysNtempclkop <= NOT(sysNtempclkop);
                sysNclockcounter := 1;				
            else
                sysNclockcounter := sysNclockcounter + 1;
            end if;
			cmodsysNclock <= sysNtempclkop;
	  end if;	
	 end process;

------------------------------------------------------------------------------------ 
--------------------------PPM Modulator Clock--------------------------------------- 
------------------------------------------------------------------------------------ 

process (cmodreset, sysclock) 
variable mppmclockcounter : natural range 1 to mppmNclk;
begin
   if mppmNclk mod 2 = 0 then
        if (cmodreset = '1') then
            mppmtempclkop := '0';
            mppmclockcounter := 1;
        elsif rising_edge(sysclock) then
            if (mppmclockcounter = (mppmNclk / 2)) then
                mppmtempclkop := NOT(mppmtempclkop);
                mppmclockcounter := mppmclockcounter + 1;
				elsif (mppmclockcounter = mppmNclk ) then
                mppmtempclkop := NOT(mppmtempclkop);
                mppmclockcounter := 1;				
            else
                mppmclockcounter := mppmclockcounter + 1;
            end if;
			  --cmodmppmclock <= mppmtempclkop;     
	    end if;
	else	
        if (cmodreset = '1') then
            mppmtempclkopR := (others=>'0');
        elsif rising_edge(sysclock) then
           if (mppmtempclkopR = conv_std_logic_vector((mppmNclk - 1),mppmNclk)) then
               mppmtempclkopR := (others=>'0');
           else
			      mppmtempclkopR := mppmtempclkopR + '1';
			  end if;	
		  end if; 	
	end if;
   		
	end process;

process (cmodreset, sysclock) 
begin
   if mppmNclk mod 2 /= 0 then
        if (cmodreset = '1') then
            mppmtempclkopF := (others=>'0'); 
        elsif falling_edge(sysclock) then
             if (mppmtempclkopF = conv_std_logic_vector((mppmNclk - 1),mppmNclk)) then
                mppmtempclkopF := (others=>'0');
				 else
                mppmtempclkopF := mppmtempclkopF + '1';
				 end if;	      
	     end if;
	end if; 
	end process; 


--  cmodmppmclock <= '1' when mppmNclk mod 2 /= 0 and  mppmtempclkopR /= conv_std_logic_vector(((mppmNclk + 1)/ 2),mppmNclk) and mppmtempclkopF /= conv_std_logic_vector(((mppmNclk + 1)/ 2),mppmNclk) else  mppmtempclkop; 
--  cmodmppmclock <= mppmtempclkop xor mppmtempclkop when mppmNclk mod 2 /=0 else mppmtempclkop ;
process (cmodreset, sysclock) 
begin
	if mppmNclk mod 2 /= 0 then
	  --if mppmtempclkopR /= conv_std_logic_vector(((mppmNclk + 1)/ 2),mppmNclk) and mppmtempclkopF /= conv_std_logic_vector(((mppmNclk + 1)/ 2),mppmNclk) then
     	if mppmtempclkopR > conv_std_logic_vector((((mppmNclk -1)/ 2)-1),mppmNclk) and mppmtempclkopF /= conv_std_logic_vector(mppmNclk - 1,mppmNclk) then     	
		cmodmppmclock <= '1';
	  else
	   cmodmppmclock <= '0';
	  end if;
	else
     cmodmppmclock <= mppmtempclkop;
	end if;
end process;

------------------------------------------------------------------------------------ 
--------------------------DPPM Modulator Clock-------------------------------------- 
------------------------------------------------------------------------------------ 

process (cmodreset, sysclock) 
variable mdppmclockcounter : natural range 0 to mdppmNclk;
begin
  
     if (cmodreset = '1') then
            mdppmtempclkop <= '0';
            mdppmclockcounter := 1;
     elsif rising_edge(sysclock) then
            if (mdppmclockcounter = (mdppmNclk / 2)) then
                mdppmtempclkop <= NOT(mdppmtempclkop);
                mdppmclockcounter := mdppmclockcounter + 1;
				elsif (mdppmclockcounter = mdppmNclk) then
                mdppmtempclkop <= NOT(mdppmtempclkop);
                mdppmclockcounter := 1;				
            else
                mdppmclockcounter := mdppmclockcounter + 1;
            end if;
			cmodmdppmclock <= mdppmtempclkop;
	  end if;	
	 end process;
	 
------------------------------------------------------------------------------------ 
--------------------------DPIM Modulator Clock-------------------------------------- 
------------------------------------------------------------------------------------ 
	 
process (cmodreset, sysclock) 
variable mdpimclockcounter : natural range 1 to mdpimNclk;
begin
  
     if (cmodreset = '1') then
            mdpimtempclkop <= '0';
            mdpimclockcounter := 1;
     elsif rising_edge(sysclock) then
            if (mdpimclockcounter = (mdpimNclk / 2)) then
                mdpimtempclkop <= NOT(mdpimtempclkop);
                mdpimclockcounter := mdpimclockcounter + 1;
				elsif (mdpimclockcounter = mdpimNclk ) then
                mdpimtempclkop <= NOT(mdpimtempclkop);
                mdpimclockcounter := 1;				
            else
                mdpimclockcounter := mdpimclockcounter + 1;
            end if;
			cmodmdpimclock <= mdpimtempclkop;
	  end if;	
	 end process;

------------------------------------------------------------------------------------ 
-------------------Serial to Parallel Block PPM Modulator Clock--------------------- 
------------------------------------------------------------------------------------ 	 

process (cmodreset, sysclock) 
variable ser2parmppmclockcounter : natural range 1 to ser2parmppmNclk;
begin
  
     if (cmodreset = '1') then
            ser2parmppmtempclkop <= '0';
            ser2parmppmclockcounter := 1;
     elsif rising_edge(sysclock) then
            if (ser2parmppmclockcounter = (ser2parmppmNclk / 2)) then
                ser2parmppmtempclkop <= NOT(ser2parmppmtempclkop);
                ser2parmppmclockcounter := ser2parmppmclockcounter + 1;
				elsif (ser2parmppmclockcounter = ser2parmppmNclk) then
                ser2parmppmtempclkop <= NOT(ser2parmppmtempclkop);
                ser2parmppmclockcounter := 1;				
            else
                ser2parmppmclockcounter := ser2parmppmclockcounter + 1;
            end if;
			cmodser2parmppmclock <= ser2parmppmtempclkop;
	  end if;	
	 end process;
------------------------------------------------------------------------------------ 
-------------------Serial to Parallel Block DPPM Modulator Clock-------------------- 
------------------------------------------------------------------------------------ 
	 
process (cmodreset, sysclock) 
variable ser2parmdppmclockcounter : natural range 1 to ser2parmdppmNclk;
begin
  
     if (cmodreset = '1') then
            ser2parmdppmtempclkop <= '0';
            ser2parmdppmclockcounter := 1;
     elsif rising_edge(sysclock) then
            if (ser2parmdppmclockcounter = (ser2parmdppmNclk / 2 )) then
                ser2parmdppmtempclkop <= NOT(ser2parmdppmtempclkop);
                ser2parmdppmclockcounter := ser2parmdppmclockcounter + 1;
				elsif (ser2parmdppmclockcounter = ser2parmdppmNclk ) then
                ser2parmdppmtempclkop <= NOT(ser2parmdppmtempclkop);
                ser2parmdppmclockcounter := 1;				
            else
                ser2parmdppmclockcounter := ser2parmdppmclockcounter + 1;
            end if;
			cmodser2parmdppmclock <= ser2parmdppmtempclkop;
	  end if;	
	 end process;

------------------------------------------------------------------------------------ 
-------------------Serial to Parallel Block DPIM Modulator Clock-------------------- 
------------------------------------------------------------------------------------ 

process (cmodreset, sysclock) 
variable ser2parmdpimclockcounter : natural range 1 to ser2parmdpimNclk;
begin
  
     if (cmodreset = '1') then
            ser2parmdpimtempclkop <= '0';
            ser2parmdpimclockcounter := 1;
     elsif rising_edge(sysclock) then
            if (ser2parmdpimclockcounter = (ser2parmdpimNclk / 2 )) then
                ser2parmdpimtempclkop <= NOT(ser2parmdpimtempclkop);
                ser2parmdpimclockcounter := ser2parmdpimclockcounter + 1;
				elsif (ser2parmdpimclockcounter = ser2parmdpimNclk ) then
                ser2parmdpimtempclkop <= NOT(ser2parmdpimtempclkop);
                ser2parmdpimclockcounter := 1;				
            else
                ser2parmdpimclockcounter := ser2parmdpimclockcounter + 1;
            end if;
			cmodser2parmdpimclock <= ser2parmdpimtempclkop;
	  end if;	
	 end process;
------------------------------------------------------------------------------------ 
---------------------------Demodulator Sampling Clock------------------------------- 
------------------------------------------------------------------------------------

process (cmodreset, sysclock) 
variable samplingclockcounter: natural range 1 to samplingNclk ;
begin
    if samplingNclk /= 1 then
 			  if (cmodreset = '1') then
					samplingtempclkop <= '0';
					samplingclockcounter := 1;
			  elsif rising_edge(sysclock) then
					if (samplingclockcounter = (samplingNclk / 2)) then
						 samplingtempclkop <= NOT(samplingtempclkop);
						 samplingclockcounter := samplingclockcounter + 1;
					elsif (samplingclockcounter = samplingNclk) then
						 samplingtempclkop <= NOT(samplingtempclkop);
						 samplingclockcounter := 1;				
					else
						 samplingclockcounter := samplingclockcounter + 1;
					end if;
		    end if;
    end if;	 
end process;

process (cmodreset, sysclock)
begin
  if samplingNclk /= 1 then
	cmodsamplingclock <= samplingtempclkop;
  else
   cmodsamplingclock <= sysclock;
  end if;	
end process;  
  
	    
end Behavioral;

