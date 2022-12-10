----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 02:58:11 PM
-- Design Name: 
-- Module Name: half_adder_tb - ha_dataflow
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
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;  --empty entity

architecture ha_dataflow of half_adder_tb is

--use the half-adder component
component half_adder
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             sum : out STD_LOGIC;
             carry : out STD_LOGIC);
  end component;

  --Initialise the signals with the value 0
  signal A: STD_LOGIC := '0';
  signal B: STD_LOGIC := '0';
  signal sum: STD_LOGIC := '0';
  signal carry: STD_LOGIC := '0';

begin

   -- Instantiate the Unit Under Test (UUT)
  uut: half_adder port map ( A     => A,
                             B     => B,
                             sum   => sum,
                             carry => carry );

  -- Stimulus process
  stimulus: process
  begin
  
  --set the stimulus for every state and wait for 100 ns to see the response
  A <= '0';
  B <= '0';
  wait for 100 ns;
  
  A <= '0';
  B <= '1';
  wait for 100 ns;
  
  A <= '1';
  B <= '0';
  wait for 100 ns;
  
  A <= '1';
  B <= '1';
  wait for 100 ns;

    wait;
  end process;


end;
