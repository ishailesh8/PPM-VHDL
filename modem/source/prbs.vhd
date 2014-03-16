library ieee;
use ieee.std_logic_1164.all;

entity prbs is
  generic(
    N : natural );
  port(
    pclock  : in  std_logic;
    preset  : in  std_logic;
	prbsstatus : out std_logic;
    prbsout : out std_logic);
end entity;


library ieee;
use ieee.numeric_std.all;

architecture behavioral of prbs is

  signal lfsr : std_logic_vector(N downto 1) := (1=>'1', others=>'0');  -- Flip-flops with LFSR seed state

  function feedback(slv : std_logic_vector) return std_logic is  -- For maximum length LFSR generation
  begin
    case slv'length is
	    when  2     => return slv(1) xor slv(2);
        when  3     => return slv(2) xor slv(3);
        when  4     => return slv(3) xor slv(4);
		when  5     => return slv(3) xor slv(5);
		when  6     => return slv(5) xor slv(6);
		when  7     => return slv(6) xor slv(7);
        when  8     => return slv(4) xor slv(5) xor slv(6) xor slv(8);
		when  9     => return slv(5) xor slv(9);
		when 10     => return slv(7) xor slv(10);
		when 11     => return slv(9) xor slv(11);
		when 12     => return slv(1) xor slv(4) xor slv(6) xor slv(12);
		when 13     => return slv(1) xor slv(3) xor slv(4) xor slv(13);
		when 14     => return slv(1) xor slv(3) xor slv(5) xor slv(14);
		when 15     => return slv(14) xor slv(15);
        when 16     => return slv(4) xor slv(13) xor slv(15) xor slv(16);
        when 32     => return slv(1) xor slv(2) xor slv(22) xor slv(32);
		when 64     => return slv(60) xor slv(61) xor slv(63) xor slv(64);
		when 128    => return slv(99) xor slv(101) xor slv(126) xor slv(128);		
        when others => report "feedback function not defined for slv'lenght as " & integer'image(slv'length)
                     severity FAILURE;
                     return 'X';
    end case;
  end function;
signal synccounter : integer range 0 to N := 0;
begin

  process (pclock, preset) is
  
  begin
    if rising_edge(pclock) then
      if unsigned(lfsr) /= 0 and synccounter = N then
        lfsr <= lfsr(lfsr'left - 1 downto lfsr'right) & feedback(lfsr);	
        prbsout <= lfsr(N);		  -- Left shift with feedback in
		else
		 synccounter <= synccounter + 1;
		 prbsout <= '1';
		 prbsstatus <= '1';
      end if;	 
    end if;
    if preset = '1' then  -- Asynchronous reset
      lfsr <= (1=>'1', others=>'0');  -- Reset assigns 1 to lfsr signal
		synccounter <= 0;
    end if;  
  end process;  
 -- prbsout <= lfsr(N) when synccounter = N + 1 else '1';  -- Drive output 
end architecture;