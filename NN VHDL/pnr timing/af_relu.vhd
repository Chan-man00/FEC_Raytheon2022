----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2023 07:38:42 PM
-- Design Name: 
-- Module Name: af_relu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use work.Common.ALL;

entity af_relu is
    Port (
        i_input    : in  SIGNED (REG_WIDTH*2-1 downto 0);
        o_output   : out SIGNED (REG_WIDTH-1 downto 0);
        o_overflow : out STD_LOGIC
    );
end af_relu;

architecture Behavioral of af_relu is
    subtype ACC_OVER_BITS is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT-1; 
    subtype ACC_REG_BITS  is natural range REG_WIDTH+FIXED_POINT-2 downto FIXED_POINT;
begin
    o_overflow <= or_reduce(std_logic_vector(i_input(ACC_OVER_BITS))) and not i_input(REG_WIDTH*2-1);
    
    o_output(REG_WIDTH-1) <= '0'; -- always positive
    with i_input(REG_WIDTH*2-1) select o_output(REG_WIDTH-2 downto 0) <=
        i_input(ACC_REG_BITS) when '0',
        (others => '0')       when '1',
        (others => 'U')       when others;
end Behavioral;
