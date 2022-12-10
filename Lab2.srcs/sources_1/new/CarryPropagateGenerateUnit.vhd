----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Theodora Christou & Ilektra-Despoina Papamatthaiaki
-- 
-- Create Date: 03/08/2020 09:52:30 PM
-- Design Name: 
-- Module Name: CarryPropagateGenerateUnit - pg_dataflow
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

--Create an entity with the inputs/outputs required
entity CarryPropagateGenerateUnit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           P : out STD_LOGIC_VECTOR (3 downto 0);
           G : out STD_LOGIC_VECTOR (3 downto 0));
end CarryPropagateGenerateUnit;

-- create an architecture
architecture pg_dataflow of CarryPropagateGenerateUnit is

begin
P <= A xor B;
G <= A and B;

end pg_dataflow;
