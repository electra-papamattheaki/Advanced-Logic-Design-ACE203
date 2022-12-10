-- Engineers: Ilektra Papamatthaiaki and Theodora Christou

library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- library declaration

entity FSM_Mealy is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           Control : out STD_LOGIC_VECTOR (2 downto 0));
end FSM_Mealy;

architecture Behavioral_Mealy of FSM_Mealy is
    type state is (state0, state1, state2, state3, state4); -- define the states
    signal Mealy_state: state;
begin
    process
    begin
     wait until CLK' event and CLK = '1';
      if RST = '1' then
        Mealy_state <= state0;    --initial state 
      else 
        case Mealy_state is
            when state0 =>
                if ((A = '0' and B = '0') or (A = '1' and B = '1')) then
                    Mealy_state <= state0;
                elsif A = '1' and B = '0' then
                    Mealy_state <= state1;
                elsif A = '0' and B = '1' then
                    Mealy_state <= state4;
                end if;
            when state1 =>
                if ((A = '0' and B = '0') or (A = '1' and B = '1')) then
                    Mealy_state <= state1;
                elsif A = '1' and B = '0' then
                    Mealy_state <= state2;
                elsif A = '0' and B = '1' then
                    Mealy_state <= state0;
                end if;
            when state2 =>
                if ((A = '0' and B = '0') or (A = '1' and B = '1')) then
                    Mealy_state <= state2;
                elsif A = '1' and B = '0' then
                    Mealy_state <= state3;
                elsif A = '0' and B = '1' then
                    Mealy_state <= state1;
                end if;
            when state3 =>
                if ((A = '0' and B = '0') or (A = '1' and B = '1')) then
                    Mealy_state <= state3;
                elsif A = '1' and B = '0' then
                    Mealy_state <= state4;
                elsif A = '0' and B = '1' then
                    Mealy_state <= state2;
                end if;
            when state4 =>
                if ((A = '0' and B = '0') or (A = '1' and B = '1')) then
                    Mealy_state <= state4;
                elsif A = '1' and B = '0' then
                    Mealy_state <= state0;
                elsif A = '0' and B = '1' then
                    Mealy_state <= state3;
                end if;
            when others => 
					Mealy_state <= state0;
        end case;
        end if;
        end process;

-- output declaration

   Control(0) <= '1' when ( (Mealy_state = state0 and (A = '1' and B = '0')) or (Mealy_state = state1 and ((A = '0' and B = '0') or (A = '1' and B = '1'))) or (Mealy_state = state2 and (A = '1' and B = '0')) or (Mealy_state = state2 and (A = '0' and B = '1')) or (Mealy_state = state3 and ((A = '0' and B = '0') or (A = '1' and B = '1'))) or (Mealy_state = state4 and (A = '0' and B = '1')) ) else '0';
   Control(1) <= '1' when ( (Mealy_state = state1 and (A = '1' and B = '0')) or (Mealy_state = state2 and ((A = '0' and B = '0') or (A = '1' and B = '1'))) or (Mealy_state = state3 and (A = '0' and B = '1')) or (Mealy_state = state4 and (A = '1' and B= '0')) ) else '0';  
   Control(2) <= '1' when ( (Mealy_state = state0 and (A = '0' and B = '1')) or (Mealy_state = state3 and (A = '1' and B = '0')) or (Mealy_state = state4 and ((A = '0' and B = '0') or (A = '1' and B = '1'))) ) else '0';  


end Behavioral_Mealy;
