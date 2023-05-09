----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 06:35:47 PM
-- Design Name: 
-- Module Name: af_tanh_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: tests tanh module with all possible input values (positive and negative) and compares to the approximate value calculated in MATLAB
--              Maximum error compared to tanh(x) at 16-bit fixed-point is 3/65536
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
use std.textio.all;

entity af_tanh_tb is
--  Port ( );
end af_tanh_tb;

architecture Behavioral of af_tanh_tb is
    constant REG_WIDTH    : integer := 32; -- total number of bits
    constant FIXED_POINT  : integer := 16; -- number of fractional bits (i.e. (1<<FIXED_POINT) == 1.0)
    
    component af_tanh is
        Port (
            clk      : in STD_LOGIC;
            i_input  : in  SIGNED (REG_WIDTH-1 downto 0);
            i_enable : in  STD_LOGIC;
            o_output : out SIGNED (REG_WIDTH-1 downto 0);
            o_ready  : out STD_LOGIC
        );
    end component af_tanh;
    
    -- array of SIGNED vectors
    type SIGNED_ARRAY is array(natural range <>) of SIGNED;
    
    -- function to read weights from file
    impure function load_array(filename : in STRING; count : in INTEGER) return SIGNED_ARRAY is
        file text_file : text open read_mode is filename;
        variable text_line : line;
        variable data : SIGNED_ARRAY(0 to count-1)(REG_WIDTH-1 downto 0);
    begin
        for i in 0 to count - 1 loop
            readline(text_file, text_line);
            hread(text_line, data(i));
        end loop;     
        return data;
    end function;
    
    constant test_count : integer := 817673;
    signal counter : integer := 0;
    signal errors : integer := 0;
    
    signal x_list : SIGNED_ARRAY (0 to test_count-1)(REG_WIDTH-1 downto 0) := load_array("tanh_x.mem", test_count);
    signal y_list : SIGNED_ARRAY (0 to test_count-1)(REG_WIDTH-1 downto 0) := load_array("tanh_y_expect.mem", test_count);
    
    signal clk : STD_LOGIC := '0';
    signal x  : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal y  : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal en : STD_LOGIC := '0';
    signal ready : STD_LOGIC;
begin
    
    -- simulation control
    sw_stimulus : process
    begin
        en <= '0';
        counter <= 0;
        errors <= 0;
        wait for 5 ns;
        
        for i in 0 to test_count-1 loop
            x <= x_list(i);
            en <= '1';
            wait for 1 ns;
            
            while ready /= '1' loop
                clk <= not clk;
                wait for 1 ns;
            end loop;
            
            if y /= y_list(i) then
                errors <= errors + 1;
            end if;
            
            en <= '0';
            clk <= not clk;
            wait for 1 ns;
            clk <= not clk;
            wait for 1 ns;
            counter <= counter + 1;
        end loop;
        
        report "Errors compared to expected output: " & integer'image(errors);
        
        wait for 5 ns;
    end process sw_stimulus;
    
    dut : af_tanh
        Port map (
            clk      => clk,
            i_input  => x,
            i_enable => en,
            o_output => y,
            o_ready  => ready
        );
    
end Behavioral;
