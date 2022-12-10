----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/09/2020 05:06:46 PM
-- Design Name: 
-- Module Name: sumUnit_tb - sumunit_tb_dataflow
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumUnit_tb is
end sumUnit_tb;

architecture sumunit_tb_dataflow of sumUnit_tb is

component SumUnit
      Port ( P : in STD_LOGIC_VECTOR (3 downto 0);
             Carry : in STD_LOGIC_VECTOR (2 downto 0);
             Cin : in STD_LOGIC;
             Sum : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal P: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal Carry: STD_LOGIC_VECTOR (2 downto 0) := "000";
  signal Cin: STD_LOGIC := '0';
  signal Sum: STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

  uut: SumUnit port map ( P     => P,
                          Carry => Carry,
                          Cin   => Cin,
                          Sum   => Sum );

  stimulus: process
  begin
    -- Initialisation code here
    -- Test bench stimulus code here

    P(3) <= '0';
    P(2) <= '0';
    P(1) <= '0';
    P(0) <= '0';
    Carry(2) <= '0';
    Carry(1) <= '0';
    Carry(0) <= '0';
    Cin <= '0';
    wait for 100 ns;
    
    P(3) <= '0';
    P(2) <= '0';
    P(1) <= '0';
    P(0) <= '0';
    Carry(2) <= '1';
    Carry(1) <= '1';
    Carry(0) <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    P(3) <= '1';
    P(2) <= '1';
    P(1) <= '1';
    P(0) <= '1';
    Carry(2) <= '0';
    Carry(1) <= '0';
    Carry(0) <= '0';
    Cin <= '0';
    wait for 100 ns;
    
    P(3) <= '1';
    P(2) <= '1';
    P(1) <= '1';
    P(0) <= '1';
    Carry(2) <= '1';
    Carry(1) <= '1';
    Carry(0) <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    wait;
  end process;


end;
  
