----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Theodora Christou & Ilektra-Despoina Papamatthaiaki
-- 
-- Create Date: 03/28/2020 09:44:30 PM
-- Design Name: 
-- Module Name: CLAFull_4bit_tb - cla_4bit_tb
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
use IEEE.STD_LOGIC_1164.ALL; -- library declaration

entity CLAFull_4bit_tb is
end CLAFull_4bit_tb; -- empty entity

--create an architecture
architecture cla_4bit_tb of CLAFull_4bit_tb is

component CLA_4bit
      Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
             B : in STD_LOGIC_VECTOR (3 downto 0);
             Cin : in STD_LOGIC;
             S : out STD_LOGIC_VECTOR (3 downto 0);
             C3 : out STD_LOGIC);
  end component;

  --Initialise the signals with zero
  signal A: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal B: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal Cin: STD_LOGIC := '0';
  signal S: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal C3: STD_LOGIC := '0';

begin

  uut: CLA_4bit port map ( A   => A,
                           B   => B,
                           Cin => Cin,
                           S   => S,
                           C3  => C3 );

  stimulus: process
  begin
  
    --test bench stimulus code

    A(0) <= '0'; 
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    B(0) <= '0';
    B(1) <= '0';
    B(2) <= '0';
    B(3) <= '0';
    Cin  <= '0';
    wait for 100 ns;
    
    A(0) <= '1'; --expecting s(0)=1
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    B(0) <= '0';
    B(1) <= '0';
    B(2) <= '0';
    B(3) <= '0';
    Cin  <= '0';
    wait for 100 ns;
    
    A(0) <= '0'; --expecting s(0),s(1)=1
    A(1) <= '1';
    A(2) <= '0';
    A(3) <= '0';
    B(0) <= '0';
    B(1) <= '0';
    B(2) <= '0';
    B(3) <= '0';
    Cin  <= '1'; 
    wait for 100 ns;
    
    A(0) <= '0'; 
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    B(0) <= '0';
    B(1) <= '0';
    B(2) <= '1'; -- expecting s(2)=1
    B(3) <= '0';
    Cin  <= '0';
    wait for 100 ns;
    
    --expecting s(0),s(1),s(2)=1
    A(0) <= '1'; 
    A(1) <= '1';
    A(2) <= '0';
    A(3) <= '0';
    B(0) <= '1';
    B(1) <= '1';
    B(2) <= '0';
    B(3) <= '0';
    Cin  <= '1'; 
    wait for 100 ns;
    
    A(0) <= '0'; 
    A(1) <= '1';
    A(2) <= '1';
    A(3) <= '0';
    B(0) <= '0';
    B(1) <= '1';
    B(2) <= '0'; -- expecting s(3)=1
    B(3) <= '0';
    Cin  <= '0';
    wait for 100 ns;
    
    --expecting C3=1 (output carry)
    A(0) <= '0'; 
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '1';
    B(0) <= '0';
    B(1) <= '0';
    B(2) <= '0';
    B(3) <= '1';
    Cin  <= '0';
    wait for 100 ns;
    
    --expecting C3=1 (output carry)
    A(0) <= '1'; 
    A(1) <= '0';
    A(2) <= '0';
    A(3) <= '0';
    B(0) <= '1';
    B(1) <= '1';
    B(2) <= '1';
    B(3) <= '1';
    Cin  <= '0';
    wait for 100 ns;
    
    A(0) <= '1'; 
    A(1) <= '1';
    A(2) <= '1';
    A(3) <= '1';
    B(0) <= '1';
    B(1) <= '1';
    B(2) <= '1';
    B(3) <= '1';
    Cin  <= '1';
    wait for 100 ns;
    
    wait;
  end process;


end;
  
