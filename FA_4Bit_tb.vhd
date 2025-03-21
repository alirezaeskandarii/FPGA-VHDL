--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:07:58 01/27/2025
-- Design Name:   
-- Module Name:   D:/fpga lpcarm/Projects/FA_4bit/FA_4Bit_tb.vhd
-- Project Name:  FA_4bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FA_4Bit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FA_4Bit_tb IS
END FA_4Bit_tb;
 
ARCHITECTURE behavior OF FA_4Bit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FA_4Bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   signal C : std_logic;
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FA_4Bit PORT MAP (
          a => a,
          b => b,
          S => S,
          C => C
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

     a <= "1000"; -- number 8
	  b <= "1100"; -- number 12
	  
	  wait for 100 ns;	

     a <= "0100"; -- number 4
	  b <= "0010"; -- number 2
	  
	  wait for 100 ns;	

     a <= "1111"; -- number 15
	  b <= "1111"; -- number 15

      wait;
   end process;

END;
