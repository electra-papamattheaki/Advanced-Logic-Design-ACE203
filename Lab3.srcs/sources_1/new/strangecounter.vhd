---------------------------------------------------------------------------------- 
-- Engineer: Theodora Christou & Electra Papamatthaiaki
-- 2018030202 | 2018030106
-- Create Date: 04/04/2020 09:19:22 PM 
-- Module Name: strangecounter - strangecounter_dataflow

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- The following library declaration is used for
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

-- Entity created  for the counter asked
entity strangecounter is
    
    --In/out declarations
    Port ( Clk : in STD_LOGIC;
           RST : in STD_LOGIC;
           Control : in STD_LOGIC_VECTOR (2 downto 0);
           Count : out STD_LOGIC_VECTOR (7 downto 0);
           Overflow : out STD_LOGIC;
           Underflow : out STD_LOGIC;
           Valid : out STD_LOGIC);
end strangecounter;

architecture strangecounter_dataflow of strangecounter is

--Inbetween signals used for calculating the Overflow, Underflow, Count and Valid values
signal Qtemp: STD_LOGIC_VECTOR(7 downto 0) := "00000000"; 
signal Overflowtemp, Underflowtemp: std_logic := '0';
signal Validtemp: std_logic := '0';
 
begin
-- create a process for the counter
process

begin
    wait until Clk' event and Clk = '1'; -- wait for clock's rising edge
   
   -- checks if the process will freeze or count normally because RST resets the state of the counter
    if RST='1' then
        Qtemp <= "00000000"; -- initialisation
        Underflowtemp <= '0';
        Overflowtemp <= '0';
        Validtemp <= '1';
        
    else
            -- start counting
            -- nested if (Control)
            if Control = 0 then
                if Qtemp < 5 then -- check for underflow
                    Underflowtemp <= '1';
                    Validtemp <= '0'; -- set valid to 0 so the process will freeze
                    end if;
            Qtemp <= Qtemp - 5;
            elsif Control = 1 then
                if Qtemp < 2 then
                Underflowtemp <= '1';
                Validtemp <= '0';
                end if;
            Qtemp <= Qtemp - 2;
            elsif Control = 2 then
                Qtemp <= Qtemp; -- no need to check for overflow/underflow
            elsif Control = 3 then
                if Qtemp > 254 then -- check for overflow
                Overflowtemp <= '1';
                Validtemp <= '0'; --set valid to 0 so the process will freeze
                end if;
            Qtemp <= Qtemp + 1;
            elsif Control = 4 then
                if Qtemp > 253 then
                Overflowtemp <= '1';
                Validtemp <= '0';
                end if;
            Qtemp <= Qtemp + 2;
            elsif Control = 5 then
                if Qtemp > 250 then
                Overflowtemp <= '1';
                Validtemp <= '0';
                end if; 
            Qtemp <= Qtemp + 5;
            elsif Control = 6 then
                if Qtemp > 249 then
                Overflowtemp <= '1';
                Validtemp <= '0';
                end if;
            Qtemp <= Qtemp + 6;
            else 
                if Qtemp > 243 then
                Overflowtemp <= '1';
                Validtemp <= '0';
                end if;
            Qtemp <= Qtemp + 12;
      end if;
  end if;

end process;

-- Assigning the values to the final signals
Count <= Qtemp;
Overflow <= Overflowtemp;
Underflow <= Underflowtemp;
Valid <= Validtemp;

end strangecounter_dataflow;
