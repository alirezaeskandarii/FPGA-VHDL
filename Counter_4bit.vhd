----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:27:32 01/29/2025 
-- Design Name: 
-- Module Name:    Counter_4bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity Counter_4bit is
    Port ( clk : in  STD_LOGIC;
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
begin
u1 : FA_4Bit port map
(
 a => S1,
 b => "0001",
 S => S2,
 C => open
 
);

rst <= (not S1(0)) and S1(1) and(not S1(2)) and S1(3);

u2 : FDCE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(0),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    CLR => rst,  -- Asynchronous clear input
    D => S2(0)       -- Data input
);
 
u3 : FDCE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(1),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    CLR => rst,  -- Asynchronous clear input
    D => S2(1)       -- Data input
);

u4 : FDCE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(2),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    CLR => rst,  -- Asynchronous clear input
    D => S2(2)       -- Data input
);

u5 : FDCE
generic map (
   INIT => '0') -- Initial value of register ('0' or '1')  
port map (
    Q => S1(3),      -- Data output
    C => clk,      -- Clock input
    CE => '1',    -- Clock enable input
    CLR => rst,  -- Asynchronous clear input
    D => S2(3)       -- Data input
); 

q <= S1;
end Behavioral;

