-- Engineers: Ilektra Papamatthaiaki and Theodora Christou

library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- library declaration

entity FSM_Mealy_tb is -- empty entity 
end FSM_Mealy_tb;

architecture Behavioral_Mealy_tb of FSM_Mealy_tb is

  component FSM_Mealy
      Port ( CLK : in STD_LOGIC;
             RST : in STD_LOGIC;
             A : in STD_LOGIC;
             B : in STD_LOGIC;
             Control : out STD_LOGIC_VECTOR (2 downto 0));
  end component;
  
  -- inputs
  signal CLK: STD_LOGIC := '0';
  signal RST: STD_LOGIC := '0';
  signal A: STD_LOGIC := '0';
  signal B: STD_LOGIC := '0';
  -- output
  signal Control: STD_LOGIC_VECTOR (2 downto 0) := "000";

  constant clk_period: time := 10 ns;

  begin 
  
  uut: FSM_Mealy port map ( CLK     => CLK, -- mapping
                            RST     => RST,
                            A       => A,
                            B       => B,
                            Control => Control );

  -- clock process                                
  clock: process
   begin
		Clk <= '0';
		wait for clk_period/2;
		Clk <= '1';
		wait for clk_period/2;
   end process;
  
  -- stimulus process
  stimulus: process
   begin
    
        RST <= '1'; -- activate reset
        wait for clk_period*10; -- hold reset for (at least) 10 cycles   
   
        RST <= '0'; -- deactivate reset
        
        -- currently on state0
        A <= '0'; 
        B <= '0'; -- still on state0
        wait for clk_period; 
        
        A <= '1'; 
        B <= '0'; -- goes to state1
        wait for clk_period;
        
        -- currently on state1
        A <= '1';
        B <= '0'; -- goes to state2
        wait for clk_period; 
        
        -- currently on state2
        A <= '1';
        B <= '0'; -- goes to state3
        wait for clk_period; 
        
        -- currently on state3
        A <= '1';
        B <= '1'; -- still on state3
        wait for clk_period;
        
        -- currently on state3
        A <= '1';
        B <= '0'; -- goes to state4
        wait for clk_period; 
        
        -- currently on state4
        A <= '1';
        B <= '0'; -- goes to state0
        wait for clk_period; 
        
        -- currently on state0
        A <= '0';
        B <= '1'; -- goes to state4
        wait for clk_period;
        
         -- currently on state4
        A <= '0';
        B <= '1'; -- goes to state3
        wait for clk_period; 
        
        --currently on state3
        A <= '0';
        B <= '0'; -- still on state3
        wait for clk_period; 
        
        -- currently on state3
        A <= '0';
        B <= '1'; -- goes to state2
        wait for clk_period;
        
        -- currently on state2
        A <= '0';
        B <= '1'; -- goes to state1
        wait for clk_period;
        
        -- currently on state1
        A <= '0';
        B <= '1'; -- goes to state0
        wait for clk_period;
	  
    wait;
 end process;
  
end Behavioral_Mealy_tb;
