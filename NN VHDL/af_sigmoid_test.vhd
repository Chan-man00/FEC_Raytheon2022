----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 03:41:37 PM
-- Design Name: 
-- Module Name: af_sigmoid_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Give sigmoid some input and do something with the output to be able to check the synthesis results
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

entity af_sigmoid_test is
    Port (
        SYSCLK_P   : in  STD_LOGIC;
        GPIO_LED_0 : out STD_LOGIC;
        GPIO_LED_1 : out STD_LOGIC;
        GPIO_LED_2 : out STD_LOGIC;
        GPIO_LED_3 : out STD_LOGIC
    );
end af_sigmoid_test;

architecture Behavioral of af_sigmoid_test is
    constant REG_WIDTH    : integer := 32; -- total number of bits
    constant FIXED_POINT  : integer := 16; -- number of fractional bits (i.e. (1<<FIXED_POINT) == 1.0)
    
    component af_sigmoid is
        Generic (
            REG_WIDTH   : integer := REG_WIDTH;
            FIXED_POINT : integer := FIXED_POINT
        );
        Port (
            i_input  : in  SIGNED (REG_WIDTH-1 downto 0);
            i_enable : in  STD_LOGIC;
            o_output : out SIGNED (REG_WIDTH-1 downto 0)
        );
    end component af_sigmoid;
    
    signal x  : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal y  : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal en : STD_LOGIC := '0';
    
    signal state : STD_LOGIC := '0';
begin
    
    -- output something so it doesn't just optimize out the entire design
    GPIO_LED_0 <= y(REG_WIDTH-1);
    GPIO_LED_1 <= or_reduce(std_logic_vector(y(REG_WIDTH-1 downto FIXED_POINT)));
    GPIO_LED_2 <= or_reduce(std_logic_vector(y(FIXED_POINT-1 downto 0)));
    GPIO_LED_3 <= or_reduce(std_logic_vector(y(REG_WIDTH-1 downto 0)));
    
    -- increment x and toggle enable on and off
    process (SYSCLK_P, state)
    begin
        if rising_edge(SYSCLK_P) then
            if state = '0' then
                en <= '0';
                x <= x + 1;
                state <= '1';
            else
                en <= '1';
                state <= '0';
            end if;
        end if;
    end process;
    
    sigmoid : af_sigmoid
        Port map (
            i_input  => x,
            i_enable => en,
            o_output => y
        );
    
end Behavioral;
