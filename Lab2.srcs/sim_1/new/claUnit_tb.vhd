----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 01:19:49 PM
-- Design Name: 
-- Module Name: claUnit_tb - claUnit_tb_dataflow
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

entity claUnit_tb is
end claUnit_tb;

architecture claUnit_tb_dataflow of claUnit_tb is
component CarryLookAheadUnit
      Port ( P : in STD_LOGIC_VECTOR (3 downto 0);
             G : in STD_LOGIC_VECTOR (3 downto 0);
             Cin : in STD_LOGIC;
             Carry : out STD_LOGIC_VECTOR (2 downto 0);
             C3 : out STD_LOGIC
             );
  end component;

  signal P: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal G: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal Cin: STD_LOGIC := '0';
  signal Carry: STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal C3: STD_LOGIC := '0' ;

begin

  uut: CarryLookAheadUnit port map ( P     => P,    -- initialisation code here
                                     G     => G,
                                     Cin   => Cin,
                                     Carry => Carry,
                                     C3    => C3 );

  stimulus: process
  begin
    -- test bench stimulus code here
    
    P(3) <= '0';
    P(2) <= '0';
    P(1) <= '0';
    P(0) <= '0';
    G(3) <= '0';
    G(2) <= '0';
    G(1) <= '0';
    G(0) <= '0';
    Cin <= '0';
    wait for 100 ns;
    
    P(3) <= '0'; -- expecting carry(0) = 1
    P(2) <= '0';
    P(1) <= '0';
    P(0) <= '0';
    G(3) <= '0';
    G(2) <= '0';
    G(1) <= '0';
    G(0) <= '1'; 
    Cin <= '0';
    wait for 100 ns;
      
    P(3) <= '0'; -- expecting carry(0),carry(1) = 1 because P(1)P(0)Cin = 1
    P(2) <= '0';
    P(1) <= '1';
    P(0) <= '1';
    G(3) <= '0';
    G(2) <= '0';
    G(1) <= '0';
    G(0) <= '0'; 
    Cin <= '1'; 
    wait for 100 ns;
    
    P(3) <= '0';
    P(2) <= '1';
    P(1) <= '0';
    P(0) <= '0';
    G(3) <= '0';
    G(2) <= '0';
    G(1) <= '1'; -- expecting carry = 1 because P(2)G(1) = 1
    G(0) <= '0'; 
    Cin <= '0'; 
    wait for 100 ns;
    
    P(3) <= '1';
    P(2) <= '0';
    P(1) <= '0';
    P(0) <= '0';
    G(3) <= '0';
    G(2) <= '1';
    G(1) <= '0';
    G(0) <= '0';  -- expecting carry = 1 because P(3)P(2)P(1)G(0) = 1
    Cin <= '0';
    wait for 100 ns;
        
    P(3) <= '1';
    P(2) <= '1';
    P(1) <= '1';
    P(0) <= '1';
    G(3) <= '1';
    G(2) <= '1';
    G(1) <= '1';
    G(0) <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    wait;
  end process;


end;
  