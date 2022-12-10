library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- library declaration

entity Stack_tb is
end Stack_tb; -- empty entity

architecture stack_arch_tb of Stack_tb is

component Stack
      Port ( CLK : in STD_LOGIC;
             RST : in STD_LOGIC;
             Push : in STD_LOGIC;
             Pop : in STD_LOGIC;
             NumberIN : in STD_LOGIC_VECTOR (3 downto 0);
             NumberOUT : out STD_LOGIC_VECTOR (3 downto 0);
             Empty : out STD_LOGIC;
             Full : out STD_LOGIC;
             AlmostEmpty : out STD_LOGIC;
             AlmostFull : out STD_LOGIC);
  end component;

  -- Input signals 
  signal CLK: STD_LOGIC := '0';
  signal RST: STD_LOGIC := '0';
  signal Push: STD_LOGIC := '0';
  signal Pop: STD_LOGIC := '0';
  signal NumberIN: STD_LOGIC_VECTOR (3 downto 0) := X"0";
  
  -- Output signals
  signal NumberOUT: STD_LOGIC_VECTOR (3 downto 0);
  signal Empty: STD_LOGIC;
  signal Full: STD_LOGIC;
  signal AlmostEmpty: STD_LOGIC;
  signal AlmostFull: STD_LOGIC;
  
  -- Define clock period time
  constant clock_period: time := 10 ns;

  begin

  uut: Stack port map ( CLK         => CLK, -- mapping
                        RST         => RST,
                        Push        => Push,
                        Pop         => Pop,
                        NumberIN    => NumberIN,
                        NumberOUT   => NumberOUT,
                        Empty       => Empty,
                        Full        => Full,
                        AlmostEmpty => AlmostEmpty,
                        AlmostFull  => AlmostFull );

    -- clock process 
    clock_process: process
    begin
	   CLK <= '0';
	   wait for clock_period/2;
	   CLK <= '1';
	   wait for clock_period/2;
   end process;
  
    stimulus: process
    begin
  
    -- initialisation code here
    RST <= '1';
    wait for 10*clock_period; -- hold reset for 10 cycles
  
    RST <= '0'; -- empty stack
  
    NumberIN <= X"3"; -- push 3
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- almost empty
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"6"; -- push 6
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- almost empty 
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"8"; -- push 8
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- almost empty
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"1"; -- push 1
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- regular
  
    Push <= '0'; 
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"7"; -- push 7
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- regular
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"9"; -- push 9
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- regular
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"5"; -- push 5
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- regular
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"2"; -- push 2
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- almost full 
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"4"; -- push 4
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- almost full
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period;
  
    NumberIN <= X"3"; -- push 3
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- almost full
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    NumberIN <= X"6"; -- push 6
    Push <= '1';
    Pop <= '0';
    wait for clock_period; -- full
  
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period;
  
    Push <= '0'; 
    Pop  <= '1'; -- pop 6
    wait for clock_period; -- almost full
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
 
    Push <= '0'; 
    Pop  <= '1'; -- pop 3
    wait for clock_period; -- almost full
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
 
    Push <= '0'; 
    Pop  <= '1'; -- pop 4
    wait for clock_period; -- regular
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop   
  
    Push <= '0'; 
    Pop  <= '1'; -- pop 2
    wait for clock_period; -- regular
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
  
    Push <= '0'; 
    Pop  <= '1'; -- pop 5
    wait for clock_period; -- regular
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; -- wait for 10 cycles without push or pop
 
    Push <= '0'; 
    Pop  <= '1'; -- pop 9
    wait for clock_period; -- regular
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period; 
  
    Push <= '0'; 
    Pop  <= '1'; -- pop 7
    wait for clock_period; -- almost empty
 
    Push <= '0';
    Pop <= '0';
    wait for 10*clock_period;
  
    wait;
    end process;

end stack_arch_tb;
