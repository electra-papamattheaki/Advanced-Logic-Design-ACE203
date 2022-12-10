library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Stack is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           Push : in STD_LOGIC;
           Pop : in STD_LOGIC;
           NumberIN : in STD_LOGIC_VECTOR (3 downto 0);
           NumberOUT : out STD_LOGIC_VECTOR (3 downto 0);
           Empty : out STD_LOGIC;
           Full : out STD_LOGIC;
           AlmostEmpty : out STD_LOGIC;
           AlmostFull : out STD_LOGIC);
end Stack;

architecture Stack_arch of Stack is

component Memory
port (
    a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;

component Control 
port ( 
           CLK : in std_logic;
           RST : in std_logic;
           Push : in std_logic;
           Pop : in std_logic;
           Empty : out std_logic;
           AlmostEmpty : out std_logic;
           Full : out std_logic;
           AlmostFull : out std_logic;
           memory_address : out std_logic_vector(3 downto 0);
           write_enable: out std_logic );
end component;

signal address : std_logic_vector(3 downto 0); 
signal wenable : std_logic; 

begin

ControlUnit : Control
 port map ( 
            CLK => CLK,
            RST => RST,
            Push => Push,
            Pop => Pop,
            Empty => Empty,
            AlmostEmpty => AlmostEmpty,
            Full => Full,
            AlmostFull => AlmostFull,
            memory_address => address,
            write_enable => wenable
            );
            
MemoryUnit : Memory
 port map (
            a => address,
            d => NumberIN,
            clk => CLK,
            we => wenable,
            spo => NumberOUT
            );
            
end Stack_arch;
