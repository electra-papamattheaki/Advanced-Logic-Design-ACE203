-- Engineer: Theodora Christou & Electra Papamatthaiaki
-- 2018030202 | 2018030106

-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity strangecounter_tb is
end strangecounter_tb; -- empty entity

architecture testbench of strangecounter_tb is
component strangecounter

      Port ( Clk : in STD_LOGIC;
             RST : in STD_LOGIC;
             Control : in STD_LOGIC_VECTOR (2 downto 0);
             Count : out STD_LOGIC_VECTOR (7 downto 0);
             Overflow : out STD_LOGIC;
             Underflow : out STD_LOGIC;
             Valid : out STD_LOGIC);
  end component;
  
  -- declaring signals
  signal Clk: STD_LOGIC;
  signal RST: STD_LOGIC;
  signal Control: STD_LOGIC_VECTOR (2 downto 0);
  signal Count: STD_LOGIC_VECTOR (7 downto 0);
  signal Overflow: STD_LOGIC;
  signal Underflow: STD_LOGIC;
  signal Valid: STD_LOGIC;

  -- define clock period time
  constant clock_period: time := 10 ns;

begin

  uut: strangecounter  -- mapping
                         port map ( Clk       => Clk,
                                    RST       => RST,
                                    Control   => Control,
                                    Count     => Count,
                                    Overflow  => Overflow,
                                    Underflow => Underflow,
                                    Valid     => Valid );
   
   -- clock process                                
   clock: process
   begin
		Clk <= '0';
		wait for clock_period/2;
		Clk <= '1';
		wait for clock_period/2;
   end process;

   -- stimulus process here
   stimulus: process
   begin
   -- stimulus code here
    RST <= '1'; 
    wait for clock_period*10; -- hold reset for (at least) 10 cycles 
    
      RST <= '0'; -- deactivate reset
      Control <= "101"; -- control = 5 => count+ = 5
      wait for clock_period*52; -- 5(count step) * 52 = 260 > 255 so it overflows
      RST <= '1'; -- resets the state because of overflow
      wait for clock_period;
      
      RST <= '0'; -- deactivate reset so it starts counting again
   
      Control <= "010"; -- +0 sum = 0
      wait for clock_period;
    
      Control <= "011"; -- +1 sum = 1
      wait for clock_period;

      Control <= "100"; -- +2 sum = 3 
      wait for clock_period;
    
      Control <= "101"; -- +5 sum = 8
      wait for clock_period;
    
      Control <= "110"; -- +6 sum = 14
      wait for clock_period;
   
      Control <= "111"; -- +12 sum = 26
      wait for clock_period;
    
      Control <= "000"; -- -5 sum = 21
      wait for clock_period;
    
      Control <= "001"; -- -2 sum = 19
      wait for clock_period*11; -- -2(count step) * 11 = -22 , 19 - 22 = -3 < 0, so it underflows
      RST <= '1'; -- resets the state because of underflow
 
    wait;
  end process;
    
end;