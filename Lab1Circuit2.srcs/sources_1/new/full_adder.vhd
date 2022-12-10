----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 08:15:53 PM
-- Design Name: 
-- Module Name: full_adder - full_dataflow1
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
use IEEE.STD_LOGIC_1164.ALL;     -- library declaration

-- create an entity with required inputs and outputs
entity full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry : out STD_LOGIC);
end full_adder;

architecture full_dataflow1 of full_adder is

--use the half-adder component
component half_adder
port( A: in std_logic;
      B: in std_logic;
      sum: out std_logic;
      carry: out std_logic);
      
end component;

--Signal declaration
signal hs,hc,tc : std_logic;

begin

HA1: half_adder
    port map(    --map the in/out of the component to the entity contents and to the signal 
    A => A,
    B => B,
    sum => hs,
    carry => hc);
    
HA2: half_adder
    port map(
    A => hs,
    B => Cin,
    sum => sum,
    carry => tc);
    
    carry <= tc or hc;
    
end full_dataflow1;
