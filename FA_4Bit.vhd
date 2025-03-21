----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:14 01/27/2025 
-- Design Name: 
-- Module Name:    FA_4Bit - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity FA_4Bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC);
end FA_4Bit;

architecture Behavioral of FA_4Bit is

component FA is
    Port ( Ai : in  STD_LOGIC;
           Bi : in  STD_LOGIC;
           Ci : in  STD_LOGIC;
           carry : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end component;

signal s1,s2,s3 : std_logic;

begin
u1 : FA port map
(
 Ai=> a(0),
 Bi=> b(0),
 Ci=> '0',
 carry=> s1,
 sum=> S(0)
);

u2 : FA port map
(
 Ai=> a(1),
 Bi=> b(1),
 Ci=> s1,
 carry=> s2,
 sum=> S(1)
);

u3 : FA port map
(
 Ai=> a(2),
 Bi=> b(2),
 Ci=> s2,
 carry=> s3,
 sum=> S(2)
);

u4 : FA port map
(
 Ai=> a(3),
 Bi=> b(3),
 Ci=> s3,
 carry=> C,
 sum=> S(3)
);
end Behavioral;

