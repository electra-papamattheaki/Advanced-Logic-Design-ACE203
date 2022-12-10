----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2020 09:57:06 PM
-- Design Name: 
-- Module Name: GP_tb - gp_tb_dataflow
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

entity GP_tb is
end GP_tb;

architecture gp_tb_dataflow of GP_tb is
 component CarryPropagateGenerateUnit
      Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
             B : in STD_LOGIC_VECTOR (3 downto 0);
             P : out STD_LOGIC_VECTOR (3 downto 0);
             G : out STD_LOGIC_VECTOR (3 downto 0));
  end component;

  signal A: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal B: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal P: STD_LOGIC_VECTOR (3 downto 0) := "0000";
  signal G: STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

  uut: CarryPropagateGenerateUnit port map ( A => A,
                                             B => B,
                                             P => P,
                                             G => G );

  stimulus: process
  begin
  
    -- Initialisation code here
    A(0) <= '0';
    B(0) <= '0';
    A(1) <= '0';
    B(1) <= '0';
    A(2) <= '0';
    B(2) <= '0';
    A(3) <= '0';
    B(3) <= '0';
    wait for 100 ns;
    
    A(0) <= '1';
    B(0) <= '0';
    A(1) <= '1';
    B(1) <= '0';
    A(2) <= '1';
    B(2) <= '0';
    A(3) <= '1';
    B(3) <= '0';
    wait for 100 ns; 
    
    A(0) <= '0';
    B(0) <= '1'; 
    A(1) <= '0';
    B(1) <= '1';
    A(2) <= '0';
    B(2) <= '1';
    A(3) <= '0';
    B(3) <= '1';
    wait for 100 ns; 
    
    A(0) <= '1';
    B(0) <= '1';
    A(1) <= '1';
    B(1) <= '1';
    A(2) <= '1';
    B(2) <= '1';
    A(3) <= '1';
    B(3) <= '1';
    wait for 100 ns;


    -- test bench stimulus code here

    wait;
  end process;


end;