----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 04:49:14 PM
-- Design Name: 
-- Module Name: af_tanh - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Maximum error compared to tanh(x) at 16-bit fixed-point is 3/65536
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
--use IEEE.STD_LOGIC_ARITH.ALL;

entity af_tanh is
    Generic (
        REG_WIDTH   : integer;
        FIXED_POINT : integer
    );
    Port (
        i_input  : in  SIGNED (REG_WIDTH-1 downto 0);
        i_enable : in  STD_LOGIC;
        o_output : out SIGNED (REG_WIDTH-1 downto 0)
    );
end af_tanh;

architecture Behavioral of af_tanh is
    -- these values are probably too complicted to create from a generic
    constant RES_BITS : integer := 2; -- LUT sampling resolution, 1/(2^RES_BITS)
    constant LUT_MAX  : integer := 16#63D03#; -- absolute value after which tanh(x) rounds to ±1.0, approx 6.238
    type lut is array(0 to 25) of SIGNED(REG_WIDTH-1 downto 0);
    constant tanh_lut  : lut := (X"00000000", X"00003EB3", X"0000764D", X"0000A299", X"0000C2F8", X"0000D929", -- tanh(n / 2^RES_BITS), with non-negative integer values of n
                                 X"0000E7B8", X"0000F0FE", X"0000F6CB", X"0000FA60", X"0000FC93", X"0000FDEB",
                                 X"0000FEBC", X"0000FF3B", X"0000FF89", X"0000FFB8", X"0000FFD4", X"0000FFE5",
                                 X"0000FFF0", X"0000FFF6", X"0000FFFA", X"0000FFFC", X"0000FFFE", X"0000FFFF",
                                 X"0000FFFF", X"00010000");
    constant slope_lut : lut := (X"00004000", X"00003C29", X"00003255", X"0000262E", X"00001AE1", X"000011F2", -- derivatives of tanh(n / 2^RES_BITS)
                                 X"00000B91", X"00000749", X"00000486", X"000002C8", X"000001B4", X"0000010A",
                                 X"000000A2", X"00000062", X"0000003C", X"00000024", X"00000016", X"0000000D",
                                 X"00000008", X"00000005", X"00000003", X"00000002", X"00000001", X"00000001",
                                 X"00000000", X"00000000");
    constant ACC_ROUND : SIGNED (REG_WIDTH*2-1 downto 0) := X"0000000000008000"; -- rounding constant, 1/2 the smallest positive value in REG_WIDTH
    
    -- bit ranges for registers
    subtype INTERP       is natural range FIXED_POINT-RES_BITS-1 downto 0;            -- interpolation t value
    subtype INDEX        is natural range REG_WIDTH-1 downto FIXED_POINT-RES_BITS;    -- LUT index
    subtype ACC_REG_BITS is natural range REG_WIDTH+FIXED_POINT-1 downto FIXED_POINT; -- single-width FP value within double-width FP value 
    
    signal output : SIGNED (REG_WIDTH-1 downto 0);
begin
    
    process (i_input, i_enable)
        variable sign : STD_LOGIC;
        variable x    : SIGNED (REG_WIDTH-1 downto 0);
        variable x1   : integer;
        variable x2   : integer; 
        variable t    : SIGNED (REG_WIDTH-1 downto 0);
        variable t2   : SIGNED (REG_WIDTH-1 downto 0);
        variable t3   : SIGNED (REG_WIDTH-1 downto 0);
        variable a    : SIGNED (REG_WIDTH-1 downto 0);
        variable b    : SIGNED (REG_WIDTH-1 downto 0);
        variable c    : SIGNED (REG_WIDTH-1 downto 0);
        variable d    : SIGNED (REG_WIDTH-1 downto 0);
        variable calc : SIGNED (REG_WIDTH*2-1 downto 0);
    begin
        if i_enable = '1' then
            if i_input = 0 then
                -- return 0.0 for inputof 0
                output <= (others => '0');
            elsif i_input >= LUT_MAX then
                -- return 1.0 for input greater than max value
                output <= (FIXED_POINT => '1',
                           others => '0');
            elsif i_input <= -LUT_MAX then
                -- return -1.0 for input less than -max value
                output <= (REG_WIDTH-1 downto FIXED_POINT => '1',
                           others => '0');
            else
                -- get abs(i_input) and store sign
                if i_input < 0 then
                    sign := '1';
                    x := -i_input;
                else
                    sign := '0';
                    x := i_input;
                end if;
                
                -- get the LUT indexes before and after x
                x1 := to_integer(x(INDEX));
                x2 := x1+1;
                
                -- get interpolation argument & calculate its exponents
                t(REG_WIDTH-1 downto FIXED_POINT) := (others => '0'); -- t = (x - x1) / (x2 - x1)
                t(FIXED_POINT-1 downto RES_BITS) := x(INTERP);
                t(RES_BITS-1 downto 0) := (others => '0'); 
                t2 := resize((t*t + ACC_ROUND) srl FIXED_POINT, 32);
                t3 := resize((t2*t + ACC_ROUND) srl FIXED_POINT, 32);
                
                -- calculate polynomial coefficients from LUT
                a := (tanh_lut(x1) sll 1) - (tanh_lut(x2) sll 1) + slope_lut(x1) + slope_lut(x2);
                b := resize(-3*tanh_lut(x1), 32) + resize(3*tanh_lut(x2), 32) - (slope_lut(x1) sll 1) - slope_lut(x2);
                c := slope_lut(x1);
                d := tanh_lut(x1);
                
                -- calculate polynomial
                calc := (a*t3 + b*t2 + c*t) + (resize(d, REG_WIDTH*2) sll FIXED_POINT) + ACC_ROUND;
                
                -- restore sign and set output
                if sign = '1' then
                    output <= -calc(ACC_REG_BITS);
                else
                    output <= calc(ACC_REG_BITS);
                end if;
            end if;
        else
            output <= (others => '0');
        end if;
    end process;
    
    o_output <= output;
end Behavioral;
