----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2020 03:56:04 PM
-- Design Name: 
-- Module Name: full_adder1_tb - full_adder1_dataflow
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

entity full_adder1_tb is
end full_adder1_tb; --empty entity

architecture full_adder1_dataflow of full_adder1_tb is

component full_adder
      Port ( A : in STD_LOGIC;
             B : in STD_LOGIC;
             Cin : in STD_LOGIC;
             sum : out STD_LOGIC;
             carry : out STD_LOGIC);
  end component;

  --Declare signals
  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal Cin: STD_LOGIC;
  signal sum: STD_LOGIC;
  signal carry: STD_LOGIC;
  
begin

-- Instantiate the Unit Under Test (UUT)
uut: full_adder port map 
         ( A     => A,
           B     => B,
           Cin   => Cin,
           sum   => sum,
           carry => carry );

  -- Stimulus process
  stimulus: process
  begin
  
     --set the stimulus for every state and wait for 100 ns to see the response
    A <= '0';
    B <= '0';
    Cin <= '0';
    wait for 100 ns;
    
    A <= '0';
    B <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A <= '0';
    B <= '1';
    Cin <= '0';
    wait for 100 ns;
    
    A <= '0';
    B <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    A <= '1';
    B <= '0';
    Cin <= '0';
    wait for 100 ns;
    
    A <= '1';
    B <= '0';
    Cin <= '1';
    wait for 100 ns;
    
    A <= '1';
    B <= '1';
    Cin <= '0';
    wait for 100 ns;
    
    A <= '1';
    B <= '1';
    Cin <= '0';

    
    A <= '1';
    B <= '1';
    Cin <= '1';
    wait for 100 ns;
    
    wait;
    
  end process;

end;

