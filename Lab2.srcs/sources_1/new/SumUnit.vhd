----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 04:59:04 PM
-- Design Name: 
-- Module Name: SumUnit - sumunit_dataflow
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
entity SumUnit is
    Port ( P : in STD_LOGIC_VECTOR (3 downto 0);
           Carry : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0));
end SumUnit;

--Create an architecture
architecture sumunit_dataflow of SumUnit is

begin
Sum(0) <= P(0) xor Cin;
Sum(1) <= P(1) xor Carry(0);
Sum(2) <= P(2) xor Carry(1);
Sum(3) <= P(3) xor Carry(2);

end sumunit_dataflow;
