----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:55:47 09/04/2013 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity topmod is
generic(
    Ntop : natural := 3;
	 div  : natural := 1);
  port(
    clock  : in  std_logic;
    reset  : in  std_logic :='0';
	 ookout : out std_logic;
	 ppmout : out std_logic;
	 dppmout : out std_logic;
	 dpimout : out std_logic;
--	 demodookin : out std_logic;
--	 demodppmin : out std_logic;
--	 demoddppmin : out std_logic;
--	 demoddpimin : out std_logic;
	 demodookout : out std_logic;
	 demodppmout : out std_logic;
	 demoddppmout : out std_logic;
	 demoddpimout : out std_logic	
 );
end topmod;

architecture Behavioral of topmod is

component prbs is
generic (
   N : natural);
 port(
    pclock  : in  std_logic;
    preset  : in  std_logic;
	 prbsstatus : out std_logic;
    prbsout : out std_logic);
end component;

component clockmodule is
generic(
    sysNclk : natural;
    mdppmNclk : natural;
	 mdpimNclk : natural;
	 mppmNclk : natural;
    ser2parmdppmNclk : natural;
	 ser2parmdpimNclk : natural;
	 ser2parmppmNclk : natural;
	 samplingNclk : natural
	 ); --Scaling factor = input clock frequency / desired output clock frequency
port (
        sysclock : in  std_logic;
        cmodreset : in  std_logic;
		  cmodsysNclock : out std_logic;
        cmodmdppmclock: out std_logic;
		  cmodmdpimclock: out std_logic;
		  cmodmppmclock : out std_logic;
		  cmodser2parmppmclock : out std_logic;
        cmodser2parmdppmclock : out std_logic;
		  cmodser2parmdpimclock : out std_logic;
		  cmodsamplingclock : out std_logic
		  );	 
end component;

component ser2par is
generic( N : natural );
  port(
    datainstatus : in std_logic;
	 ser2parmodclock : in std_logic;
    ser2parclock  : in  std_logic;
    ser2parreset  : in  std_logic;
	 ser2parin : in std_logic;
	 ser2parflag : out std_logic;
    ser2parout : out std_logic_vector(N downto 1));
end component;

component mppm is
generic ( N : natural );
port(    mppmflagstatus : in std_logic;
			mppmclock : in std_logic;
			mppmreset : in std_logic;
			mppmdata: in std_logic_vector (N downto 1);
			mppmout : out std_logic 
	);
end component;

component buffmodule is
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
end component;

component mdppm is
generic ( N : natural );
port(    mdppmflagstatus : in std_logic;
			mdppmclock : in std_logic;
			mdppmreset : in std_logic;
			mdppmdata: in std_logic_vector (N downto 1);
			mdppmout : out std_logic
	);
end component;

component mdpim is
generic ( N : natural );
port(    mdpimflagstatus : in std_logic;
			mdpimclock : in std_logic;
			mdpimreset : in std_logic;
			mdpimdata: in std_logic_vector (N downto 1);
			mdpimout : out std_logic;
			mdpimtrig : out std_logic
	);
end component;
--
component clockrecovery is
generic ( maxlength : natural );
port(
    samplingclock  : in std_logic;
    clockrecoveryreset  : in std_logic;
	 mookin : in std_logic;
    mppmin : in std_logic;
	 mdppmin : in std_logic;
	 mdpimin : in std_logic;
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
end component;

component ookdemod is
port(
    trigook : in std_logic;
    mookdatain : in std_logic;
    ookdemodclock  : in  std_logic;
    ookdemodreset  : in  std_logic;
    ookdemodout : out std_logic);
end component;

component ppmdemod is
generic(
    N : natural );
port(
    mppmdatain : in std_logic;
    ppmdemodclock  : in  std_logic;
	 ppmparoutclock : in  std_logic;
    ppmdemodreset  : in  std_logic;
	 ppmdemodflag : out std_logic;
    parppmdemodout : out std_logic_vector(N downto 1));
end component;
--
component dppmdemod is
generic(
    N : natural );
port(
    trigdppm : in std_logic;
    mdppmdatain : in std_logic;
    dppmdemodclock  : in  std_logic;
    dppmdemodreset  : in  std_logic;
	 dppmdemodflag : out std_logic;
    pardppmdemodout : out std_logic_vector(N downto 1));
end component;
--
component dpimdemod is
generic(
    N : natural );
port(
    trigdpim : in std_logic;
    mdpimdatain : in std_logic;
    dpimdemodclock  : in  std_logic;
    dpimdemodreset  : in  std_logic;
	 dpimdemodflag : out std_logic;
    pardpimdemodout : out std_logic_vector(N downto 1));
end component;
--
component par2ser is
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
end component;
------------------------------------------------------------------------------------
-----------------------------PRBS Generated Signals---------------------------------
------------------------------------------------------------------------------------
signal prbstempstatus : std_logic;
signal mooktempout : std_logic;
------------------------------------------------------------------------------------
-----------------------------Temporay Clock Signals---------------------------------
------------------------------------------------------------------------------------
signal tempNsysclk : std_logic;
signal icser2parmdpim : std_logic;
signal icser2parmdppm : std_logic;
signal icser2parmppm : std_logic;
signal icmppm : std_logic;
signal icmdppm : std_logic;
signal icmdpim : std_logic;
------------------------------------------------------------------------------------
------------------Temporay Modulator Parallel Data Signals--------------------------
------------------------------------------------------------------------------------
signal dataparmppm : std_logic_vector(Ntop downto 1);
signal dataparinbuffmdppm : std_logic_vector(Ntop downto 1);
signal dataparinbuffmdpim : std_logic_vector(Ntop downto 1);
signal dataparoutbuffmdppm : std_logic_vector(Ntop downto 1);
signal dataparoutbuffmdpim : std_logic_vector(Ntop downto 1);
------------------------------------------------------------------------------------
---------------------Modulator Synchronisation Signals------------------------------
------------------------------------------------------------------------------------
signal mppmser2parflagtemp : std_logic;
signal mdppmser2parflagtemp : std_logic;
signal mdpimser2parflagtemp : std_logic;
------------------------------------------------------------------------------------
----------------------Temporay Modulated Output Signals-----------------------------
------------------------------------------------------------------------------------
signal mppmtempout : std_logic;
signal mdppmtempout : std_logic;
signal mdpimtempout : std_logic;
------------------------------------------------------------------------------------
----------------------Temporary Modulator Trigger Signals----------------------------
------------------------------------------------------------------------------------
signal mdpimtrigtempout : std_logic;
signal buffreadmdppm :std_logic;
signal buffreadmdpim :std_logic;
------------------------------------------------------------------------------------ 
--------------------------Temporary Recovered Clock-------------------------------- 
------------------------------------------------------------------------------------ 
signal icsampling : std_logic;
signal desystempclockout : std_logic;
--signal demoddesystempclk : std_logic;
--signal demodppmtempclk : std_logic;
--signal demoddpimtempclk : std_logic;

signal demodooktempclk : std_logic;
signal triggerooktemp : std_logic;

signal demodppmtempclk : std_logic;
signal demodpar2serppmclockout : std_logic;
signal ppmdemodflagtemp : std_logic;
signal demodppmtempout : std_logic_vector(Ntop downto  1);

signal triggerdppmtemp : std_logic;
signal demoddppmtempclk : std_logic;
signal dppmdemodflagtemp : std_logic;
signal demodpar2serdppmclockout : std_logic;
signal demoddppmpar2serflagintemp : std_logic;
signal demoddppmpar2serflagouttemp : std_logic := '1';
signal demoddppmtempout : std_logic_vector (Ntop downto  1);
signal dataparoutbuffdemoddppm : std_logic_vector(Ntop downto 1);


signal triggerdpimtemp : std_logic;
signal demoddpimtempclk : std_logic;
signal dpimdemodflagtemp : std_logic;
signal demodpar2serdpimclockout : std_logic;
signal demoddpimpar2serflagintemp : std_logic;
signal demoddpimpar2serflagouttemp : std_logic := '1';
signal demoddpimtempout : std_logic_vector (Ntop downto  1);
signal dataparoutbuffdemoddpim : std_logic_vector(Ntop downto 1);

--signal demodpar2serppmclockout : std_logic;
--signal demodpar2serdppmclockout : std_logic;
--signal demodpar2serdpimclockout : std_logic;
--
--signal triggerooktemp : std_logic;
--signal triggerppmtemp : std_logic;
--signal triggerdpimtemp: std_logic;
--

--signal dpimdemodflagtemp : std_logic;
--
--signal demodppmpar2serflagintemp : std_logic;
--signal demoddppmpar2serflagintemp : std_logic;
--signal demoddpimpar2serflagintemp : std_logic;
--
--signal demodppmpar2serflagouttemp : std_logic;
--signal demoddppmpar2serflagouttemp : std_logic;
--signal demoddpimpar2serflagouttemp : std_logic;
--

--signal dataparoutbuffdemoddpim : std_logic_vector(Ntop downto 1);
--

--signal demoddppmtempout : std_logic_vector (Ntop downto  1);
--signal demoddpimtempout : std_logic_vector (Ntop downto 1);



begin

------------------------------------------------------------------------------------
------------------------------------PRBS--------------------------------------------
------------------------------------------------------------------------------------
prbsinst : prbs
generic map (
   N => Ntop)
port map (
  pclock => tempNsysclk,
  preset => reset,
  prbsstatus => prbstempstatus,
  prbsout => mooktempout  
  ); 
------------------------------------------------------------------------------------
-------------------------Clock Module Instantiation---------------------------------
------------------------------------------------------------------------------------ 
-----sysNclk :ser2parmodNclk : mppmNclk : mdppmNclk = 2^N : N* 2^N : N : 2N---------
------------------------------------------------------------------------------------ 
------------------------------------------------------------------------------------ 
clockmoduleinst : clockmodule
generic map (
   sysNclk => (2 ** Ntop) * div,            --To generate prbs data at A Mhz put X as 100/A --Input Clock frequency is at 100Mhz
	mdppmNclk => 2 * Ntop * div,          --For L=2^N slots modulator clock should run at ( ser2parmodNclk * 2^N) MHz put Y as  (Z / 2^N)
	ser2parmdppmNclk => Ntop * (2 ** Ntop) * div,    --For L=2^N mod scheme this clock will run at (sysNclk / N) - so put Z as (X * N)
	mdpimNclk => 2 * Ntop * div,
	ser2parmdpimNclk => Ntop * (2 ** Ntop) * div,
	mppmNclk => Ntop * div,
	ser2parmppmNclk =>Ntop * (2 ** Ntop) * div,
	samplingNclk => 1 * div
    )
port map (
  sysclock => clock,
  cmodreset => reset,
  cmodsysNclock => tempNsysclk,
  cmodmdppmclock =>icmdppm,
  cmodmdpimclock =>icmdpim,
  cmodmppmclock =>icmppm,
  cmodser2parmdppmclock => icser2parmdppm,
  cmodser2parmdpimclock => icser2parmdpim,
  cmodser2parmppmclock => icser2parmppm,
  cmodsamplingclock => icsampling
  );
------------------------------------------------------------------------------------ 
-------------Serial to Parallel Block PPM Modulator Instantiation------------------- 
------------------------------------------------------------------------------------   
ser2parinstmppm : ser2par
generic map (
   N => Ntop)
port map ( 
  datainstatus => prbstempstatus,
  ser2parmodclock => icser2parmppm,
  ser2parclock => tempNsysclk,
  ser2parreset =>reset,
  ser2parin => mooktempout,
  ser2parflag => mppmser2parflagtemp,
  ser2parout => dataparmppm
  );  
------------------------------------------------------------------------------------ 
--------------------------PPM Modulator Instantiation------------------------------- 
------------------------------------------------------------------------------------   
mppminst : mppm
generic map (
   N => Ntop)
port map (
  mppmflagstatus => mppmser2parflagtemp,
  mppmclock => icmppm,
  mppmreset => reset,
  mppmdata => dataparmppm,
  mppmout => mppmtempout  
  ); 
------------------------------------------------------------------------------------ 
-------------Serial to Parallel Block DPPM Modulator Instantiation------------------ 
------------------------------------------------------------------------------------   
ser2parinstmdppm : ser2par
generic map (
   N => Ntop)
port map (  
  datainstatus => prbstempstatus,
  ser2parmodclock => icser2parmdppm,
  ser2parclock => tempNsysclk,
  ser2parreset =>reset,
  ser2parin => mooktempout,
  ser2parflag => mdppmser2parflagtemp,
  ser2parout => dataparinbuffmdppm
  );
------------------------------------------------------------------------------------ 
------------------Buffer Block DPPM Modulator Instantiation-------------------------
------------------------------------------------------------------------------------ 
buffmoduleinstmdppm:  buffmodule
generic map (
  N => Ntop)
port map (
  
  buffflagstatus => mdppmser2parflagtemp,
  writedata => dataparinbuffmdppm,
  writetrigger => icser2parmdppm,
  reset => reset,
  readtrigger => mdppmtempout,
  dataread => dataparoutbuffmdppm,
  buffstatusout => buffreadmdppm
  
);
------------------------------------------------------------------------------------ 
--------------------------DPPM Modulator Instantiation------------------------------- 
------------------------------------------------------------------------------------ 
mdppminst : mdppm
generic map (
   N => Ntop)
port map (
  mdppmflagstatus => buffreadmdppm,
  mdppmclock => icmdppm,
  mdppmreset => reset,
  mdppmdata => dataparoutbuffmdppm,
  mdppmout => mdppmtempout
  );  
------------------------------------------------------------------------------------ 
-------------Serial to Parallel Block DPIM Modulator Instantiation------------------ 
------------------------------------------------------------------------------------   
ser2parinstmdpim : ser2par
generic map (
   N => Ntop)
port map (  
  datainstatus => prbstempstatus,
  ser2parmodclock => icser2parmdpim,
  ser2parclock => tempNsysclk,
  ser2parreset =>reset,
  ser2parin => mooktempout,
  ser2parflag => mdpimser2parflagtemp,
  ser2parout => dataparinbuffmdpim
  );
------------------------------------------------------------------------------------ 
------------------Buffer Block DPIM Modulator Instantiation-------------------------
------------------------------------------------------------------------------------ 
buffmoduleinstmdpim:  buffmodule
generic map (
  N => Ntop)
port map (
  
  buffflagstatus => mdpimser2parflagtemp,
  writedata => dataparinbuffmdpim,
  writetrigger => icser2parmdpim,
  reset => reset,
  readtrigger => mdpimtrigtempout,
  dataread => dataparoutbuffmdpim,
  buffstatusout => buffreadmdpim
  
);
------------------------------------------------------------------------------------ 
--------------------------DPIM Modulator Instantiation------------------------------ 
------------------------------------------------------------------------------------ 
mdpiminst : mdpim
generic map (
   N => Ntop)
port map (
  mdpimflagstatus => buffreadmdpim,
  mdpimclock => icmdpim,
  mdpimreset => reset,
  mdpimdata => dataparoutbuffmdpim,
  mdpimout => mdpimtempout,
  mdpimtrig => mdpimtrigtempout
  );
------------------------------------------------------------------------------------ 
--------------------------Clock Recovery Instantiation------------------------------ 
------------------------------------------------------------------------------------ 

clockrecoveryinst : clockrecovery
generic map( maxlength => 2 * Ntop  )
port map(
    samplingclock  => icsampling,
    clockrecoveryreset  => reset,
	 mookin =>  mooktempout,
    mppmin =>  mppmtempout,
	 mdppmin => mdppmtempout,
	 mdpimin => mdpimtempout,
	 ookclockout => demodooktempclk,
	 ppmclockout => demodppmtempclk  ,
	 dppmclockout => demoddppmtempclk  ,
	 dpimclockout => demoddpimtempclk ,
	 desysclockout => desystempclockout  ,
--	 ppmclockout => tppmclockout ,
--	 dppmclockout => tdppmclockout ,
--	 dpimclockout => tdpimclockout,
	 triggerook => triggerooktemp,
--  triggerppm => triggerppmtemp,
    triggerdppm => triggerdppmtemp,
    triggerdpim => triggerdpimtemp,
	 par2serppmclockout => demodpar2serppmclockout,
	 par2serdppmclockout => demodpar2serdppmclockout,
	 par2serdpimclockout => demodpar2serdpimclockout
--	 par2serppmclockout => tpar2serppmclockout
--  par2serdppmclockout => tpar2serdppmclockout,
--	 par2serdpimclockout => tpar2serdpimclockout	
    );
--
------------------------------------------------------------------------------------ 
--------------------------OOK Demodulator Instantiation----------------------------
------------------------------------------------------------------------------------ 
ookdemodinst : ookdemod
port map(
    trigook=>  triggerooktemp,
    mookdatain =>  mooktempout  ,
    ookdemodclock  =>  demodooktempclk  ,
    ookdemodreset  => reset   ,
    ookdemodout => demodookout);
------------------------------------------------------------------------------------ 
--------------------------PPM Demodulator Instantiation----------------------------
------------------------------------------------------------------------------------ 

ppmdemodinst : ppmdemod
generic map (
   N => Ntop)
port map(
    mppmdatain =>  mppmtempout  ,
    ppmdemodclock  => demodppmtempclk   ,
    ppmparoutclock => demodpar2serppmclockout,
	 ppmdemodreset  => reset   ,
	 ppmdemodflag => ppmdemodflagtemp,
    parppmdemodout => demodppmtempout);

------------------------------------------------------------------------------------ 
----------------Parallel to Serial PPM Demodulator Instantiation-------------------
------------------------------------------------------------------------------------ 

par2serinstppm : par2ser
generic map (
    N => Ntop)
port map (
    par2serflagin => ppmdemodflagtemp ,
    par2serclock  => desystempclockout,
	 par2sermodclock => demodpar2serppmclockout,
    par2serreset  => reset  ,
	 par2serflagout => open ,
	 par2serin =>  demodppmtempout  ,
    par2serout => demodppmout  
     );
------------------------------------------------------------------------------------ 
--------------------------DPPM Demodulator Instantiation----------------------------
------------------------------------------------------------------------------------ 
dppmdemodinst : dppmdemod
generic map (
   N => Ntop)
port map(
    trigdppm =>  triggerdppmtemp,
    mdppmdatain =>  mdppmtempout  ,
    dppmdemodclock  => demoddppmtempclk   ,
    dppmdemodreset  => reset,
    dppmdemodflag => dppmdemodflagtemp,
    pardppmdemodout => demoddppmtempout);
	 
------------------------------------------------------------------------------------ 
--------------------Buuffer Module DPPM Demodulator Instantiation-------------------
------------------------------------------------------------------------------------ 	 

buffmoduleinstdemoddppm:  buffmodule
generic map (
  N => Ntop)
port map (
  
  buffflagstatus => triggerdppmtemp,
  writedata => demoddppmtempout,
  writetrigger => dppmdemodflagtemp,
  reset => reset,
  readtrigger => demoddppmpar2serflagouttemp,
  dataread => dataparoutbuffdemoddppm,
  buffstatusout => demoddppmpar2serflagintemp
  
);
------------------------------------------------------------------------------------ 
----------------Parallel to Serial DPPM Demodulator Instantiation-------------------
------------------------------------------------------------------------------------ 	 
par2serinstdppm : par2ser
generic map (
    N => Ntop)
port map (
    par2serflagin => demoddppmpar2serflagintemp ,
    par2serclock  => desystempclockout,
	 par2sermodclock => demodpar2serdppmclockout,
    par2serreset  => reset  ,
    par2serflagout => demoddppmpar2serflagouttemp ,
	 par2serin =>  dataparoutbuffdemoddppm  ,
    par2serout => demoddppmout 
     );

------------------------------------------------------------------------------------ 
--------------------------DPIM Demodulator Instantiation----------------------------
------------------------------------------------------------------------------------ 
dpimdemodinst : dpimdemod
generic map (
   N => Ntop)
port map(
    trigdpim =>  triggerdpimtemp,
    mdpimdatain =>  mdpimtempout  ,
    dpimdemodclock  => demoddpimtempclk   ,
    dpimdemodreset  => reset,
    dpimdemodflag => dpimdemodflagtemp,
    pardpimdemodout => demoddpimtempout);
	 
------------------------------------------------------------------------------------ 
--------------------Buuffer Module DPIM Demodulator Instantiation-------------------
------------------------------------------------------------------------------------ 	 

buffmoduleinstdemoddpim:  buffmodule
generic map (
  N => Ntop)
port map (
  
  buffflagstatus => triggerdpimtemp,
  writedata => demoddpimtempout,
  writetrigger => dpimdemodflagtemp,
  reset => reset,
  readtrigger => demoddpimpar2serflagouttemp,
  dataread => dataparoutbuffdemoddpim,
  buffstatusout => demoddpimpar2serflagintemp
  
);
------------------------------------------------------------------------------------ 
----------------Parallel to Serial DPIM Demodulator Instantiation-------------------
------------------------------------------------------------------------------------ 	 
par2serinstdpim : par2ser
generic map (
    N => Ntop)
port map (
    par2serflagin => demoddpimpar2serflagintemp ,
    par2serclock  => desystempclockout,
	 par2sermodclock => demodpar2serdpimclockout,
    par2serreset  => reset  ,
    par2serflagout => demoddpimpar2serflagouttemp ,
	 par2serin =>  dataparoutbuffdemoddpim  ,
    par2serout => demoddpimout 
     );


------------------------------------------------------------------------------------
----------------------------- Output Assignment-------------------------------------
------------------------------------------------------------------------------------
ookout <= mooktempout;
ppmout <= mppmtempout;
dppmout <= mdppmtempout;
dpimout <= mdpimtempout;

end Behavioral;

