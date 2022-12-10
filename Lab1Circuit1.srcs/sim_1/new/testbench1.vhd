----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 02:48:59 PM
-- Design Name: 
-- Module Name: circuit1_tb - model_tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
--Library Declarations
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity circuit1_tb is
end; --empty entity

architecture bench of circuit1_tb is

  component circuit1
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             C0 : in STD_LOGIC;
             C1 : in STD_LOGIC;
             C2 : in STD_LOGIC;
             C3 : in STD_LOGIC;
             C4 : in STD_LOGIC;
             C5 : in STD_LOGIC;
             Result : out STD_LOGIC_VECTOR (5 downto 0));   --output type = vector | MSB = 5, LSB = 0
  end component;

  --Initialising the signals with the value 0
  signal A: STD_LOGIC := '0';
  signal B: STD_LOGIC := '0';
  signal C0: STD_LOGIC := '0';
  signal C1: STD_LOGIC := '0';
  signal C2: STD_LOGIC := '0';
  signal C3: STD_LOGIC := '0';
  signal C4: STD_LOGIC := '0';
  signal C5: STD_LOGIC := '0';
  signal Result: STD_LOGIC_VECTOR (5 downto 0);

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: circuit1 port map ( A      => A,
                           B      => B,
                           C0     => C0,
                           C1     => C1,
                           C2     => C2,
                           C3     => C3,
                           C4     => C4,
                           C5     => C5,
                           Result => Result );

  --Stimulus process
  stimulus: process
  begin

    --set the stimulus for every state and wait for the response
    A <= '0';
    B <= '0';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    wait for 100 ns;
    
    A <= '0';
    B <= '1';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    wait for 100 ns;
    
    A <= '1';
    B <= '0';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    wait for 100 ns;
    
    A <= '1';
    B <= '1';
    C0 <= '1';
    C1 <= '1';
    C2 <= '1';
    C3 <= '1';
    C4 <= '1';
    C5 <= '1';
    wait for 100 ns;

    wait;
    
  end process;


end;