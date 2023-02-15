----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/15/2023 03:41:37 PM
-- Design Name: 
-- Module Name: af_sigmoid - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Maximum error compared to sigmoid(x) at 16-bit fixed-point is 2/65536
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

entity af_sigmoid is
    Generic (
        REG_WIDTH   : integer;
        FIXED_POINT : integer
    );
    Port (
        i_input  : in  SIGNED (REG_WIDTH-1 downto 0);
        i_enable : in  STD_LOGIC;
        o_output : out SIGNED (REG_WIDTH-1 downto 0)
    );
end af_sigmoid;

architecture Behavioral of af_sigmoid is
    -- these values are probably too complicted to create from a generic
    constant RES_BITS : integer := 1; -- LUT sampling resolution, 1/(2^RES_BITS)
    constant LUT_MAX  : integer := 16#BC894#; -- absolute value after which sigmoid(x) rounds to 0 or 1.0, approx 11.784
    type lut is array(0 to 24) of SIGNED(REG_WIDTH-1 downto 0);
    constant sigm_lut  : lut := (X"00000000",X"00001F59",X"00003B27",X"0000514D",X"0000617C",X"00006C95", -- sigmoid(n / 2^RES_BITS), with non-negative integer values of n
                                 X"000073DC",X"0000787F",X"00007B65",X"00007D30",X"00007E49",X"00007EF5",
                                 X"00007F5E",X"00007F9E",X"00007FC4",X"00007FDC",X"00007FEA",X"00007FF3",
                                 X"00007FF8",X"00007FFB",X"00007FFD",X"00007FFE",X"00007FFF",X"00007FFF",
                                 X"00008000");
    constant slope_lut : lut := (X"00002000",X"00001E15",X"0000192B",X"00001317",X"00000D70",X"000008F9", -- derivatives of sigmoid(n / 2^RES_BITS)
                                 X"000005C8",X"000003A4",X"00000243",X"00000164",X"000000DA",X"00000085",
                                 X"00000051",X"00000031",X"0000001E",X"00000012",X"0000000B",X"00000007",
                                 X"00000004",X"00000002",X"00000001",X"00000001",X"00000001",X"00000000",
                                 X"00000000");
    constant ACC_ROUND : SIGNED (REG_WIDTH*2-1 downto 0) := (FIXED_POINT-1 => '1', others => '0'); -- rounding constant, 1/2 the smallest positive value in REG_WIDTH
    constant ONE_HALF  : SIGNED (REG_WIDTH-1 downto 0)   := (FIXED_POINT-1 => '1', others => '0'); -- 0.5
    
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
                -- return 0.5 for input of 0
                output <= ONE_HALF;
            elsif i_input >= LUT_MAX then
                -- return 1.0 for input greater than max value
                output <= (FIXED_POINT => '1',
                           others => '0');
            elsif i_input <= -LUT_MAX then
                -- return 0.0 for input less than -max value
                output <= (others => '0');
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
                a := (sigm_lut(x1) sll 1) - (sigm_lut(x2) sll 1) + slope_lut(x1) + slope_lut(x2);
                b := resize(-3*sigm_lut(x1), 32) + resize(3*sigm_lut(x2), 32) - (slope_lut(x1) sll 1) - slope_lut(x2);
                c := slope_lut(x1);
                d := sigm_lut(x1);
                
                -- calculate polynomial
                calc := (a*t3 + b*t2 + c*t) + (resize(d, REG_WIDTH*2) sll FIXED_POINT) + ACC_ROUND;
                
                -- restore y offset and set output
                if sign = '1' then
                    output <= ONE_HALF - calc(ACC_REG_BITS);
                else
                    output <= ONE_HALF + calc(ACC_REG_BITS);
                end if;
            end if;
        else
            output <= (others => '0');
        end if;
    end process;
    
    o_output <= output;
end Behavioral;
