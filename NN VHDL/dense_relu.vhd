----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/02/2023 06:59:42 PM
-- Design Name: 
-- Module Name: dense_relu - Behavioral
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

entity dense_relu is
    Generic (
        REG_WIDTH   : integer;
        FIXED_POINT : integer
    );
    Port (
        clk        : in  STD_LOGIC;
        i_initbias : in  STD_LOGIC;
        i_mult     : in  STD_LOGIC;
        i_input    : in  SIGNED (REG_WIDTH-1 downto 0);
        i_weight   : in  SIGNED (REG_WIDTH-1 downto 0);
        o_output   : out SIGNED (REG_WIDTH-1 downto 0);
        o_overflow : out STD_LOGIC
    );
end dense_relu;

architecture Behavioral of dense_relu is
    component af_relu is
        Generic (
            REG_WIDTH   : integer := REG_WIDTH;
            FIXED_POINT : integer := FIXED_POINT
        );
        Port (
            i_input    : in  SIGNED (REG_WIDTH*2-1 downto 0);
            o_output   : out SIGNED (REG_WIDTH-1 downto 0);
            o_overflow : out STD_LOGIC
        );
    end component af_relu;
    
    signal acc       : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0'); -- double-precision as a result of multiplication
    
--Ranges for interacting with register bits:
    subtype ACC_SX_BITS   is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT;     -- sign extend bits
    subtype ACC_OVER_BITS is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT-1;   -- high bits after multiplcation for detecting overflow, includes sign bit of ACC_INT_BITS 
    subtype ACC_REG_BITS  is natural range REG_WIDTH+FIXED_POINT-1 downto FIXED_POINT;     -- bits equivalent to access
begin
    
    process (clk, i_initbias, i_mult, i_input, i_weight, acc)
    begin
        if rising_edge(clk) then
            if i_initbias = '1' then
                acc(ACC_SX_BITS) <= (others => i_input(REG_WIDTH-1)); -- sign-extend accumulator
                acc(ACC_REG_BITS) <= i_input; -- set accumulator value to bias value
                acc(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding 
                acc(FIXED_POINT-2 downto 0) <= (others => '0'); -- set sub-fractional bits to 0
            elsif i_mult = '1' then
                acc <= acc + (i_input * i_weight);
            end if;
        end if;
    end process;
    
    af : af_relu
        Port map (
            i_input    => acc,
            o_output   => o_output,
            o_overflow => o_overflow
        );
    
end Behavioral;
