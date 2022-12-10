----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 11:14:51 AM
-- Design Name: 
-- Module Name: equations - dataflow
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

entity equations is
Port (
ln0: in std_logic; -- signal in and out declarations
ln1: in std_logic;
Btn0: in std_logic;
Btn1: in std_logic;
Btn2: in std_logic;
Btn3: in std_logic;
Led: out std_logic_vector(5 downto 0)); --bus Declaration
end equations;

-- Architecture implementation
 architecture dataflow of equations is

begin
LED(0) <= (ln0 NAND ln1) AND Btn0;
LED(1) <= (ln0 XOR ln1) AND Btn1;
LED(2) <= (ln0 OR ln1) AND Btn2;
LED(3) <= (NOT ln0) AND Btn3;
LED(4) <= ln0;
LED(5) <= ln1;

end dataflow;
