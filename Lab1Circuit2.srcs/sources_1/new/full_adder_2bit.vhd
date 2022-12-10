----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 04:50:58 PM
-- Design Name: 
-- Module Name: full_adder_2bit - full_adder_2bit_dataflow
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

-- create an entity with required inputs and outputs
entity full_adder_2bit is       
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Cin : in STD_LOGIC;
           Result : out STD_LOGIC_VECTOR (1 downto 0);
           Cout : out STD_LOGIC);
end full_adder_2bit;

architecture full_adder_2bit_dataflow of full_adder_2bit is

--use a component locaded in another module
component full_adder 
port ( 

    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    sum : out STD_LOGIC;
    carry : out STD_LOGIC);
    
end component;

--declare a signal to connect the carry out of the 1st FA to carry in of the 2nd FA
signal cAll : std_logic;
-- signal cAll2 : std_logic;

begin
    
    FA1: full_adder
    port map(       --map the in/out of the component to the entity contents and to the signal 
    
        A => A(0),
        B => B(0),
        Cin => Cin,
        sum => Result(0),
        carry => cAll);
        
     FA2: full_adder
     port map (
     
        A => A(1),
        B => B(1),
        Cin => cAll,
        sum => Result(1),
        carry => Cout); 
        
--     FA3: full_adder
--     port map (
     
--        A => A(2),
--        B => B(2),
--        Cin => cAll2,
--        sum => Result(2),
--        carry => Cout); 

end full_adder_2bit_dataflow;
