----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:40 01/26/2025 
-- Design Name: 
-- Module Name:    FA - Behavioral 
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

entity FA is
    Port ( Ai : in  STD_LOGIC;
           Bi : in  STD_LOGIC;
           Ci : in  STD_LOGIC;
           carry : out  STD_LOGIC;
           sum : out  STD_LOGIC);
end FA;

architecture Behavioral of FA is
component HA is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           So : out  STD_LOGIC;
           Co : out  STD_LOGIC);
end component;

signal S1,S2,S3: STD_LOGIC;
begin

u1 : HA port map
(
	a => Ai,
	b => Bi,
	Co => S1,
	So => S2
);

u2 : HA port map
(
	a => S2,
	b => Ci,
	Co => S3,
	So => sum
);

carry <= S1 or S3;

end Behavioral;

