----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 05:38:56 PM
-- Design Name: 
-- Module Name: CLA_4bit - CLA_4bit_dataflow
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

--Create an entity with the inputs/outputs required
entity CLA_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C3 : out STD_LOGIC);
end CLA_4bit;

--Create an architecture
architecture CLA_4bit_dataflow of CLA_4bit is

--use a component located in another module
component CarryPropagateGenerateUnit
    port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           P : out STD_LOGIC_VECTOR (3 downto 0);
           G : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

--use a component located in another module
component CarryLookAheadUnit
    port ( P : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Carry : out STD_LOGIC_VECTOR (2 downto 0);
           C3 : out STD_LOGIC
           );
end component;

--use a component located in another module
component SumUnit 
    port ( P : in STD_LOGIC_VECTOR (3 downto 0);
           Carry : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--declare signals to connect the units
signal g, p: std_logic_vector(3 downto 0);
signal c: std_logic_vector(2 downto 0);

begin

 --map the in/out of the component to the entity contents and to the signal 
  GPUnit: CarryPropagateGenerateUnit 
    port map ( A => A,
               B => B,
               P => p,
               G => g
              );
  
  CLAunit: CarryLookAheadUnit
    port map ( P => p,
               G => g,
               Cin => Cin,
               Carry => c,
               C3 => C3);
               
   SUnit: SumUnit
    port map ( P => p,
               Carry => c,
               Cin => Cin,
               Sum => S);
               
end CLA_4bit_dataflow;
