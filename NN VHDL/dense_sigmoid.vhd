----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 10:33:59 PM
-- Design Name: 
-- Module Name: dense_sigmoid - Behavioral
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

entity dense_sigmoid is
    Generic (
        REG_WIDTH   : integer;
        FIXED_POINT : integer
    );
    Port (
        clk        : in  STD_LOGIC;
        i_initbias : in  STD_LOGIC;
        i_mult     : in  STD_LOGIC;
        i_finish   : in  STD_LOGIC;
        i_input    : in  SIGNED (REG_WIDTH-1 downto 0);
        i_weight   : in  SIGNED (REG_WIDTH-1 downto 0);
        o_output   : out SIGNED (REG_WIDTH-1 downto 0)
    );
end dense_sigmoid;

architecture Behavioral of dense_sigmoid is
    component af_sigmoid is
        Generic (
            REG_WIDTH   : integer := REG_WIDTH;
            FIXED_POINT : integer := FIXED_POINT
        );
        Port (
            i_input    : in  SIGNED (REG_WIDTH-1 downto 0);
            i_enable   : in  STD_LOGIC;
            o_output   : out SIGNED (REG_WIDTH-1 downto 0)
        );
    end component af_sigmoid;
    
    --Ranges for interacting with register bits:
    subtype ACC_SX_BITS   is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT;     -- sign extend bits
    subtype ACC_OVER_BITS is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT-1;   -- high bits after multiplcation for detecting overflow, includes sign bit of ACC_REG_BITS 
    subtype ACC_REG_BITS  is natural range REG_WIDTH+FIXED_POINT-1 downto FIXED_POINT;     -- bits equivalent to access
    
    signal acc       : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0'); -- double-precision as a result of multiplication
    signal sig_in    : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal enable    : STD_LOGIC := '0';
begin
    
    process (clk, i_initbias, i_mult, i_input, i_weight, acc)
    begin
        if rising_edge(clk) then
            if i_initbias = '1' then
                acc(ACC_SX_BITS) <= (others => i_input(REG_WIDTH-1)); -- sign-extend accumulator
                acc(ACC_REG_BITS) <= i_input; -- set accumulator value to bias value
                acc(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding 
                acc(FIXED_POINT-2 downto 0) <= (others => '0'); -- set sub-fractional bits to 0
                enable <= '0';
            elsif i_mult = '1' then
                acc <= acc + (i_input * i_weight);
            elsif i_finish = '1' then
                if acc(REG_WIDTH*2-1) = '1' and and_reduce(std_logic_vector(acc(ACC_OVER_BITS))) = '0' then
                    -- negative value too large for REG_WIDTH, so set to largest negative value (sigmoid result will still be 0)
                    sig_in <= (REG_WIDTH-1 => '1', others => '0');
                elsif acc(REG_WIDTH*2-1) = '0' and or_reduce(std_logic_vector(acc(ACC_OVER_BITS))) = '1' then
                    -- positive value too large for REG_WIDTH, so set to largest positive value (sigmoid result will still be 1.0)
                    sig_in <= (REG_WIDTH-1 => '0', others => '1');
                else
                    sig_in <= acc(ACC_REG_BITS);
                end if;
                enable <= '1';
            end if;
        end if;
    end process;
    
    af : af_sigmoid
        Port map (
            i_input    => sig_in,
            i_enable   => enable,
            o_output   => o_output
        );
    
end Behavioral;
