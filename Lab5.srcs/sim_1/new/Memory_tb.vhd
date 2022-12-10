library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Memory_tb is
end Memory_tb;

architecture Behavioral of Memory_tb is

component Memory

  Port ( 
    a : in std_logic_vector(3 DOWNTO 0); -- memory's address
    d : in std_logic_vector(3 DOWNTO 0); -- number in
    clk : in std_logic; -- clock
    we : IN std_logic_vector (0 downto 0); -- write enable
    spo : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- number out
  end component; 

  -- Input signals
  signal a: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  signal d: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  signal clk: STD_LOGIC := '0'; 
  signal we: STD_LOGIC_vector(0 downto 0) := "0";
  
  -- Output signals
  signal spo: STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  -- define clock period time
  constant clk_period: time := 10ns; 

  begin

  uut: Memory port map ( a => a,
                         d => d,
                         clk => clk,
                         we => we,
                         spo => spo );

  -- clock's process
  clk_process: process
  begin
	 clk <= '0';
	 wait for clk_period/2;
	 clk <= '1';
	 wait for clk_period/2;
  end process;
  
  -- stimulus process
  stimulus: process
  begin
  
      wait for 10*10 ns; 
    
      we(0) <= '1'; 
      
      a <= X"0" ; 
      d <= X"2"; 
      wait for 10 ns;
      
      a <= X"2";
      d <= X"3"; 
      wait for 10 ns;
      
      a <= X"3";
      d <= X"7";
      wait for 10 ns;
      
      a <= X"7"; 
      d <= X"9"; 
      wait for 10 ns; 
    wait;
  end process;

end Behavioral;
