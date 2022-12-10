----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 06:44:01 PM
-- Design Name: 
-- Module Name: full_adder_2bit_tb - dataflow_2bit
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
use IEEE.STD_LOGIC_1164.ALL;    -- library declaration

entity full_adder_2bit_tb is
end full_adder_2bit_tb; --the entity is empty

architecture dataflow_2bit of full_adder_2bit_tb is

component full_adder_2bit
      Port ( A : in STD_LOGIC_VECTOR (1 downto 0);  --input type = vector | MSB = 1, LSB = 0
             B : in STD_LOGIC_VECTOR (1 downto 0);
             Cin : in STD_LOGIC;
             Result : out STD_LOGIC_VECTOR (1 downto 0);    --output type = vector | MSB = 1, LSB = 0
             Cout : out STD_LOGIC);
  end component;

  --Initialise the signals with zero
  signal A: STD_LOGIC_VECTOR (1 downto 0) := "00" ; --2 bit declaration
  signal B: STD_LOGIC_VECTOR (1 downto 0)  := "00";
  signal Cin: STD_LOGIC := '0';
  signal Result: STD_LOGIC_VECTOR (1 downto 0)  := "00";
  signal Cout: STD_LOGIC := '0';

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: full_adder_2bit port map ( A      => A,
                                  B      => B,
                                  Cin    => Cin,
                                  Result => Result,
                                  Cout   => Cout );

  
   -- Stimulus process
  stimulus: process
  begin
  
   --set the stimulus for every state and wait for the response
    A(0) <= '0';
    A(1) <= '0';
 --   A(2) <= '0';
    B(0) <= '0';
    B(1) <= '0';
 --   B(2) <= '0';
    Cin <= '0';
    wait for 100 ns;
    
    A(0) <= '0';
    A(1) <= '0';
 -- A(2) <= '0';
    B(0) <= '0';
    B(1) <= '0';
--  B(2) <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A(0) <= '1';
    A(1) <= '0';
    --A(2) <= '0';
    B(0) <= '0';
    B(1) <= '0';
    --B(2) <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A(0) <= '1';
    A(1) <= '0';
    --A(2) <= '0';
    B(0) <= '1';
    B(1) <= '0';
    --B(2) <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A(0) <= '0';
    A(1) <= '0';
   --A(2) <= '0';
    B(0) <= '1';
    B(1) <= '1';
    --B(2) <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A(0) <= '1';
    A(1) <= '0';
    --A(2) <= '0';
    B(0) <= '1';
    B(1) <= '1';
    --B(2) <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A(0) <= '0';
    A(1) <= '1';
    --A(2) <= '1';
    B(0) <= '1';
    B(1) <= '1';
    --B(2) <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    A(0) <= '1';
    A(1) <= '1';
    --A(2) <= '1';
    B(0) <= '1';
    B(1) <= '1';
    --B(2) <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    wait;
  end process;


end;