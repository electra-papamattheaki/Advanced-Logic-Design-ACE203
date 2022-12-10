----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/23/2020 01:53:28 PM
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

entity equations_tb is
--  Port ( );
end equations_tb;

architecture dataflow of equations_tb is

component equations
port (
ln0: in std_logic;
ln1: in std_logic;
Btn0: in std_logic;
Btn1: in std_logic;
Btn2: in std_logic;
Btn3: in std_logic;
Led: out std_logic_vector(5 downto 0));
end component;
-- inputs
signal ln0: std_logic := '0';
signal ln1: std_logic := '0';
signal Btn0 : std_logic := '0';
signal Btn1 : std_logic := '0';
signal Btn2 : std_logic := '0';
signal Btn3 : std_logic := '0';

-- outputs

signal Led : std_logic_vector(5 downto 0);


begin
uut: equations Port Map (
    ln0 => ln0,
    ln1 => ln1,
    Btn0 => Btn0,
    Btn1 => Btn0,
    Btn2 => Btn2,
    Btn3 => Btn3,
    Led => Led
    );
    
    stim_proc: process
    begin
    
    ln0 <= '0' ;
    ln1 <= '0' ;
    Btn0 <= '1' ; 
    Btn1 <='1';           
    Btn2 <='1';          
    Btn3 <='1';   

    wait for 100 ns ; 
    
     ln0 <='0';             
     ln1 <='1';           
     Btn0 <='1';           
     Btn1 <='1';           
     Btn2 <='1';           
     Btn3 <='1'; 
     
     wait for 100 ns ;
     
     ln0 <='1'; 
     ln1 <='0'; 
     Btn0 <='1';           
     Btn1 <='1';           
     Btn2 <='1';           
     Btn3 <='1';   
     
     wait for 100 ns; 
     
     ln0 <='1';           
     ln1 <='1';           
     Btn0 <='1';           
     Btn1 <='1';           
     Btn2 <='1';           
     Btn3 <='1'; 
     
     wait;
     -- insert stimulus here
     end process;
    END;

