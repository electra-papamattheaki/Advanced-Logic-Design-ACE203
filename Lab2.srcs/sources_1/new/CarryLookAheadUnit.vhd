----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  Theodora Christou & Ilektra-Despoina Papamatthaiaki
-- 
-- Create Date: 03/09/2020 12:21:01 PM
-- Design Name: 
-- Module Name: CarryLookAheadUnit - look_ahead_dataflow
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
entity CarryLookAheadUnit is
    Port ( P : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Carry : out STD_LOGIC_VECTOR (2 downto 0);
           C3 : out STD_LOGIC
           );
           
end CarryLookAheadUnit;

-- Create an architecture
architecture look_ahead_dataflow of CarryLookAheadUnit is

begin

Carry(0) <= G(0) or (P(0) and Cin);
Carry(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
Carry(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
C3 <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);

end look_ahead_dataflow;
