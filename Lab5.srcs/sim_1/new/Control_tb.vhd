library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity Control_tb is
end Control_tb;

architecture cont_arch_tb of Control_tb is
component Control
      Port ( CLK : in std_logic;
             RST : in std_logic;
             Push : in std_logic;
             Pop : in std_logic;
             Empty : out std_logic;
             AlmostEmpty : out std_logic;
             Full : out std_logic;
             AlmostFull : out std_logic;
             memory_address : out std_logic_vector(3 downto 0);
             write_enable: out std_logic );
      end component;

  -- Input signals
  signal CLK: std_logic := '0';
  signal RST: std_logic := '0';
  signal Push: std_logic := '0';
  signal Pop: std_logic := '0';
  
  -- Output signals
  signal Empty: std_logic;
  signal AlmostEmpty: std_logic;
  signal Full: std_logic;
  signal AlmostFull: std_logic;
  signal memory_address: std_logic_vector(3 downto 0);
  signal write_enable: std_logic;

  -- Define clock period time
  constant clock_period: time := 10 ns;
  
begin

  uut: Control port map ( CLK            => CLK,
                          RST            => RST,
                          Push           => Push,
                          Pop            => Pop,
                          Empty          => Empty,
                          AlmostEmpty    => AlmostEmpty,
                          Full           => Full,
                          AlmostFull     => AlmostFull,
                          memory_address => memory_address,
                          write_enable   => write_enable );
  
  -- clock process 
  clock_process: process
  begin
	 clk <= '0';
	 wait for clock_period/2;
	 clk <= '1';
	 wait for clock_period/2;
  end process;
  
  -- stimulus process
  stimulus: process
  begin
  
    RST <= '1';
    wait for 10*clock_period; -- wait for 10 cycles
    RST <= '0'; 
      
    Push <= '1';  -- Push for the 1st time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
 
    Push <= '1';  -- Push for the 2nd time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
    
    Push <= '1';  -- Push for the 3rd time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
      
    Push <= '1';  -- Push for the 4th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
       
    Push <= '1';  -- Push for the 5th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
 
    Push <= '1';  -- Push for the 6th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
 
    Push <= '1';  -- Push for the 7th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
 
    Push <= '1';  -- Push for the 8th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
     
    Push <= '1';  -- Push for the 9th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles

    Push <= '1';  -- Push for the 10th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
    
    Push <= '1';  -- Push for the 11th time
    Pop  <= '0';
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
                    
    Push <= '0'; 
    Pop  <= '1';  -- Pop for the 1st time
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
 
    Push <= '0';
    Pop  <= '1';  -- Pop for the 2nd time
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
    
    Push <= '0';
    Pop  <= '1'; -- Pop for the 3rd time
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles   
 
    Push <= '0';
    Pop  <= '1'; -- Pop for the 4th time
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
 
    Push <= '0';
    Pop  <= '1'; -- Pop for the 5th time
    wait for clock_period; 
    
    Push <= '0';
    Pop  <= '0'; 
    wait for 10*clock_period; -- wait for 10 cycles
                
    wait;
  end process;

end cont_arch_tb;