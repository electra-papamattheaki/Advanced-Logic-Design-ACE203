library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- library declaration 
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity Control is
    Port ( CLK : in std_logic;
           RST : in std_logic;
           Push : in std_logic;
           Pop : in std_logic;
           Empty : out std_logic;
           AlmostEmpty : out std_logic;
           Full : out std_logic;
           AlmostFull : out std_logic;
           memory_address : out std_logic_vector(3 downto 0);
           write_enable: out std_logic );
    end Control;

architecture Control_arch of Control is
    type state is (state_empty, state_almostEmpty, state_regular, state_almostFull, state_full); -- define the states
    signal Control_state: state;
    signal temp_address : std_logic_vector(3 downto 0) := X"0";
    
begin
 process
    begin
      wait until CLK' event and CLK = '1';
       if RST = '1' then
            Control_state <= state_empty;
            Empty <= '1';
            AlmostEmpty <= '0'; 
            Full <= '0';
            AlmostFull <= '0';
            write_enable <= '1'; 
            --temp_address <= X"0";
       else
              case Control_state is
                 when state_empty =>
                    if Pop = '0' and Push = '0' then
                        Control_state <= state_empty; 
                        Empty <= '1';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address;
                        write_enable <= '0';
                    elsif Pop = '0' and Push = '1' then
                        Control_state <= state_almostEmpty;
                        Empty <= '0';
                        AlmostEmpty <= '1'; 
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address + 1;
                        write_enable <= '1';  
                    end if; 
                 when state_almostEmpty =>
                    if Pop = '0' and Push = '0' then
                        Control_state <= state_almostEmpty; 
                        Empty <= '0';
                        AlmostEmpty <= '1';
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address;
                        write_enable <= '0';
                    elsif Pop = '0' and Push = '1' and (temp_address = 1 or temp_address = 2) then
                        Control_state <= state_almostEmpty;
                        Empty <= '0';
                        AlmostEmpty <= '1'; 
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address + 1;
                        write_enable <= '1';
                    elsif Pop = '0' and Push = '1' and temp_address = 3 then
                        Control_state <= state_regular;
                        Empty <= '0';
                        AlmostEmpty <= '0'; 
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address + 1;
                        write_enable <= '1';
                    elsif Pop = '1' and Push = '0' and temp_address = 1 then
                        Control_state <= state_empty;
                        Empty <= '1';
                        AlmostEmpty <= '0'; 
                        Full <= '0';
                        AlmostFull <= '0';
                        write_enable <= '1';
                        temp_address <= temp_address - 1;
                        write_enable <= '0';
                    elsif Pop = '1' and Push = '0' and (temp_address = 2 or temp_address = 3) then
                        Control_state <= state_almostEmpty;
                        Empty <= '0';
                        AlmostEmpty <= '1'; 
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address - 1;
                        write_enable <= '0';
                    end if;
                 when state_regular =>
                    if Pop = '0' and Push = '0' then
                        Control_state <= state_regular; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address;
                        write_enable <= '0';
                    elsif Pop = '0' and Push = '1' and (temp_address >= 4 and temp_address < 7) then
                        Control_state <= state_regular; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address + 1; 
                        write_enable <= '1';
                    elsif Pop = '0' and Push = '1' and (temp_address = 7) then
                        Control_state <= state_almostFull; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '1';
                        temp_address <= temp_address + 1; 
                        write_enable <= '1';
                    elsif Pop = '1' and Push = '0' and (temp_address <= 7 and temp_address > 4) then
                        Control_state <= state_regular; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '1';
                        temp_address <= temp_address - 1;
                        write_enable <= '0';
                    elsif Pop = '1' and Push = '0' and temp_address = 4 then
                        Control_state <= state_almostEmpty; 
                        Empty <= '0';
                        AlmostEmpty <= '1';
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address - 1;
                        write_enable <= '0';
                    end if; 
                 when state_almostFull =>
                    if Pop = '0' and Push = '0' then
                        Control_state <= state_almostFull; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '1';
                        temp_address <= temp_address;
                        write_enable <= '0';
                    elsif Pop = '0' and Push = '1' and (temp_address = 8 or temp_address = 9) then
                        Control_state <= state_almostFull; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '1';
                        temp_address <= temp_address + 1;
                        write_enable <= '1';
                    elsif Pop = '0' and Push = '1' and temp_address = 10 then
                        Control_state <= state_full; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '1';
                        AlmostFull <= '0';
                        temp_address <= temp_address + 1;
                        write_enable <= '1';   
                    elsif Pop = '1' and Push = '0' and (temp_address = 9 or temp_address = 10) then
                        Control_state <= state_almostFull; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '1';
                        temp_address <= temp_address - 1;
                        write_enable <= '0';                                             
                    elsif Pop = '1' and Push = '0' and temp_address = 8 then
                        Control_state <= state_regular; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '0';
                        temp_address <= temp_address - 1;
                        write_enable <= '0';
                    end if; 
                when state_full =>
                    if Pop = '0' and Push = '0' then
                        Control_state <= state_full; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '1';
                        AlmostFull <= '0';
                        temp_address <= temp_address;
                        write_enable <= '0';
                    elsif Pop = '1' and Push = '0' and temp_address = 11 then
                        Control_state <= state_almostFull; 
                        Empty <= '0';
                        AlmostEmpty <= '0';
                        Full <= '0';
                        AlmostFull <= '1';
                        temp_address <= temp_address - 1; 
                        write_enable <= '0';
                    end if;
                when others =>
                        Control_state <= state_empty;
                end case; 
                end if;   
                end process; 
                
                memory_address <= temp_address; -- get output 
                                   
end Control_arch;
