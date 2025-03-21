# 4-bit Counter
--4bit Counter, using USIM Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Counter_4bit is
    Port ( clk : in  STD_LOGIC;
			  pulse : out STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end Counter_4bit;

architecture Behavioral of Counter_4bit is

component FA_4Bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC);
end component;

signal S1,S2:STD_LOGIC_VECTOR (3 downto 0);
signal rst: STD_LOGIC;
signal my_pulse : STD_LOGIC :='0' ;
begin
u1 : FA_4Bit port map
(
 a => S1,
 b => "0001",
 S => S2,
 C => open
 
);

rst <= S1(0) and (not S1(1)) and(not S1(2)) and S1(3); --1001 = 9

my_pulse <= (not my_pulse) when rising_edge(rst);
pulse <= my_pulse;

u2 : FDRSE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(0),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    R => rst,  -- Asynchronous clear input
	 S => '0',
    D => S2(0)       -- Data input
);
 
u3 : FDRSE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(1),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    R => rst,  -- Asynchronous clear input
	 S => '0',
    D => S2(1)       -- Data input
);

u4 : FDRSE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(2),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    R => rst,  -- Asynchronous clear input
	 S => '0',
    D => S2(2)       -- Data input
);

u5 : FDRSE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(3),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    R => rst,  -- Asynchronous clear input
	 S => '0',
    D => S2(3)       -- Data input
); 

q <= S1;
 
end Behavioral;
