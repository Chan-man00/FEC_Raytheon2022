----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 03:42:26 PM
-- Design Name: 
-- Module Name: af_sigmoid_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: tests sigmoid module with all possible input values (positive and negative) and compares to the approximate value calculated in MATLAB
--              Maximum error compared to sigmoid(x) at 16-bit fixed-point is 2/65536
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

entity af_sigmoid_tb is
--  Port ( );
end af_sigmoid_tb;

architecture Behavioral of af_sigmoid_tb is
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
    
    constant test_count : integer := 1544491;
    signal counter : integer := 0;
    signal errors : integer := 0;
    
    signal x_list : SIGNED_ARRAY (0 to test_count-1)(REG_WIDTH-1 downto 0) := load_array("sigmoid_x.mem", test_count);
    signal y_list : SIGNED_ARRAY (0 to test_count-1)(REG_WIDTH-1 downto 0) := load_array("sigmoid_y_expect.mem", test_count);
    
    signal x  : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal y  : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal en : STD_LOGIC := '0';
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
            wait for 1 ns;
            en <= '1';
            wait for 1 ns;
            
            if y /= y_list(i) then
                errors <= errors + 1;
            end if;
            
            en <= '0';
            counter <= counter + 1;
        end loop;
        
        report "Errors compared to expected output: " & integer'image(errors);
        
        wait for 5 ns;
    end process sw_stimulus;
    
    dut : af_sigmoid
        Port map (
            i_input  => x,
            i_enable => en,
            o_output => y
        );
    
end Behavioral;
