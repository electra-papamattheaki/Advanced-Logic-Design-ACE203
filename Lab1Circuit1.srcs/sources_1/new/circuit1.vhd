----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2020 02:19:19 PM
-- Design Name: 
-- Module Name: circuit1 - model
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
use IEEE.STD_LOGIC_1164.ALL;    --library declaration

-- create an entity with required inputs and outputs
entity circuit1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C0 : in STD_LOGIC;
           C1 : in STD_LOGIC;
           C2 : in STD_LOGIC;
           C3 : in STD_LOGIC;
           C4 : in STD_LOGIC;
           C5 : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (5 downto 0));
end circuit1;

--create an architecture
architecture model of circuit1 is
begin

--It shows how the system functions
Result(0) <= (A nand B) and C0;
Result(1) <= (A nor B) and C1;
Result(2) <= (A and B) and C2;
Result(3) <= (A xor B) and C3;
Result(4) <= ((A and B) or (not A and not B)) and C4;
Result(5) <= (((not A) and B) xor ((not A) or (not B))) and C5;

end model;
