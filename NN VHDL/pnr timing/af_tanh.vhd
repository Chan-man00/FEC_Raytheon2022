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
use work.Common.ALL;

entity af_tanh is
    Port (
        clk      : in STD_LOGIC;
        i_input  : in  SIGNED (REG_WIDTH-1 downto 0);
        i_enable : in  STD_LOGIC;
        o_output : out SIGNED (REG_WIDTH-1 downto 0);
        o_ready  : out STD_LOGIC
    );
end af_tanh;

architecture Behavioral of af_tanh is
    constant CALC_WIDTH : integer := 24; -- reduced register width to improve performance, since the higher bits are unused anyway
    
    -- these values are probably too complicted to create from a generic
    constant RES_BITS : integer := 2; -- LUT sampling resolution, 1/(2^RES_BITS)
    constant LUT_MAX  : integer := 16#63D03#; -- absolute value after which tanh(x) rounds to ±1.0, approx 6.238
    type lut is array(0 to 25) of SIGNED(CALC_WIDTH-1 downto 0);
    constant tanh_lut  : lut := (X"000000", X"003EB3", X"00764D", X"00A299", X"00C2F8", X"00D929", -- tanh(n / 2^RES_BITS), with non-negative integer values of n
                                 X"00E7B8", X"00F0FE", X"00F6CB", X"00FA60", X"00FC93", X"00FDEB",
                                 X"00FEBC", X"00FF3B", X"00FF89", X"00FFB8", X"00FFD4", X"00FFE5",
                                 X"00FFF0", X"00FFF6", X"00FFFA", X"00FFFC", X"00FFFE", X"00FFFF",
                                 X"00FFFF", X"010000");
    constant slope_lut : lut := (X"004000", X"003C29", X"003255", X"00262E", X"001AE1", X"0011F2", -- derivatives of tanh(n / 2^RES_BITS)
                                 X"000B91", X"000749", X"000486", X"0002C8", X"0001B4", X"00010A",
                                 X"0000A2", X"000062", X"00003C", X"000024", X"000016", X"00000D",
                                 X"000008", X"000005", X"000003", X"000002", X"000001", X"000001",
                                 X"000000", X"000000");
    constant ACC_ROUND : SIGNED (CALC_WIDTH*2-1 downto 0) := (FIXED_POINT-1 => '1', others => '0'); -- rounding constant, 1/2 the smallest positive value in REG_WIDTH
    
    -- bit ranges for registers
    subtype INTERP       is natural range FIXED_POINT-RES_BITS-1 downto 0;            -- interpolation t value
    subtype INDEX        is natural range CALC_WIDTH-1 downto FIXED_POINT-RES_BITS;    -- LUT index
    subtype ACC_REG_BITS is natural range REG_WIDTH+FIXED_POINT-1 downto FIXED_POINT; -- single-width FP value within double-width FP value 
    
    signal output : SIGNED (REG_WIDTH-1 downto 0);
    signal ready  : STD_LOGIC := '0';
    
    -- FSM to compute final output in steps
    type STATE_TYPE is (STATE_IDLE, STATE_CALC_0, STATE_CALC_1, STATE_CALC_2, STATE_CALC_3, STATE_READY, STATE_HOLD);
    signal state     : STATE_TYPE := STATE_IDLE;
    signal nextstate : STATE_TYPE := STATE_IDLE;
    
    signal calc_skip : STD_LOGIC := '0';
    signal calc_init : STD_LOGIC := '0';
    
    -- calculation values
    signal sign : STD_LOGIC;                       -- sgn(i_input)
    signal x    : SIGNED (CALC_WIDTH-1 downto 0);   -- abs(i_input)
    signal t    : SIGNED (CALC_WIDTH-1 downto 0);   -- t, interpolation polynomial argument
    signal t2   : SIGNED (CALC_WIDTH-1 downto 0);   -- t^2
    signal t3   : SIGNED (CALC_WIDTH-1 downto 0);   -- t^3
    signal a    : SIGNED (CALC_WIDTH-1 downto 0);   -- t^3 coefficient
    signal a1   : SIGNED (CALC_WIDTH-1 downto 0);   -- t^3 coefficient part
    signal a2   : SIGNED (CALC_WIDTH-1 downto 0);   -- t^3 coefficient part
    signal b    : SIGNED (CALC_WIDTH-1 downto 0);   -- t^2 coefficient
    signal b1   : SIGNED (CALC_WIDTH-1 downto 0);   -- t^2 coefficient part
    signal b2   : SIGNED (CALC_WIDTH-1 downto 0);   -- t^2 coefficient part
    signal c    : SIGNED (CALC_WIDTH-1 downto 0);   -- t^1 coefficient
    --signal d    : SIGNED (CALC_WIDTH-1 downto 0);   -- t^0 coefficient
    signal calc : SIGNED (CALC_WIDTH*2-1 downto 0); -- computed value
    signal calc2 : SIGNED (CALC_WIDTH*2-1 downto 0); -- computed value
begin
    
    process (state, i_enable)
    begin
        if i_enable = '1' then
            case state is
                when STATE_IDLE =>
                    if calc_skip = '1' then
                        nextstate <= STATE_READY;
                    elsif calc_init = '1' then
                        nextstate <= STATE_CALC_0;
                    else
                        nextstate <= STATE_IDLE;
                    end if;
                when STATE_CALC_0 =>
                    nextstate <= STATE_CALC_1;
                when STATE_CALC_1 =>
                    nextstate <= STATE_CALC_2;
                when STATE_CALC_2 =>
                    nextstate <= STATE_CALC_3;
                when STATE_CALC_3 =>
--                    nextstate <= STATE_CALC_4;
--                when STATE_CALC_4 =>
--                    nextstate <= STATE_CALC_5;
--                when STATE_CALC_5 =>
                    nextstate <= STATE_READY;
                when STATE_READY =>
                    nextstate <= STATE_HOLD;
                when STATE_HOLD =>
                    nextstate <= STATE_HOLD;
            end case;
        else
            nextstate <= STATE_IDLE;
        end if;
    end process;
    
    process (clk)
        variable x1  : integer; -- x value of previous LUT entry
        variable x2  : integer; -- x value of next LUT entry
        variable y1  : SIGNED (CALC_WIDTH-1 downto 0); -- LUT value at x1
        variable dy1 : SIGNED (CALC_WIDTH-1 downto 0); -- LUT slope at x1
        variable y2  : SIGNED (CALC_WIDTH-1 downto 0); -- LUT value at x2
        variable dy2 : SIGNED (CALC_WIDTH-1 downto 0); -- LUT slope at x2
        variable tv  : SIGNED (CALC_WIDTH-1 downto 0); -- t, but a variable
    begin
        if rising_edge(clk) then
            if i_enable = '1' then
                case state is
                    when STATE_IDLE =>
                        if i_input = 0 then
                            -- return 0.0 for inputof 0
                            output <= (others => '0');
                            
                            calc_skip <= '1'; -- go directly to output ready state
                            calc_init <= '0';
                        elsif i_input >= LUT_MAX then
                            -- return 1.0 for input greater than max value
                            output <= (FIXED_POINT => '1',
                                       others => '0');
                            
                            calc_skip <= '1'; -- go directly to output ready state
                            calc_init <= '0';
                        elsif i_input <= -LUT_MAX then
                            -- return -1.0 for input less than -max value
                            output <= (REG_WIDTH-1 downto FIXED_POINT => '1',
                                       others => '0');
                            
                            calc_skip <= '1'; -- go directly to output ready state
                            calc_init <= '0';
                        else
                            -- get abs(i_input) and store sign
                            if i_input < 0 then
                                sign <= '1';
                                x <= resize(-i_input, CALC_WIDTH);
                            else
                                sign <= '0';
                                x <= i_input(CALC_WIDTH-1 downto 0);
                            end if;
                            
                            calc_skip <= '0';
                            calc_init <= '1'; -- perform calculation
                        end if;
                        
                    when STATE_CALC_0 =>
                        -- get the LUT indexes before and after x
                        x1 := to_integer(x(INDEX));
                        x2 := x1+1;
                        
                        -- get interpolation argument & calculate its exponents
                        tv(CALC_WIDTH-1 downto FIXED_POINT) := (others => '0'); -- t = (x - x1) / (x2 - x1)
                        tv(FIXED_POINT-1 downto RES_BITS) := x(INTERP);
                        tv(RES_BITS-1 downto 0) := (others => '0'); 
                        
                        -- get LUT values
                        y1  := tanh_lut(x1);
                        dy1 := slope_lut(x1);
                        y2  := tanh_lut(x2);
                        dy2 := slope_lut(x2);
                        
                        -- compute first parts
                        a1 <= y1 - y2;
                        a2 <= dy1 + dy2;
                        b1 <= dy2 - dy1;
                        b2 <= (dy1 sll 1) + dy2;
                        c <= dy1;
                        
                        t  <= tv;
                        t2 <= resize((tv*tv + ACC_ROUND) srl FIXED_POINT, CALC_WIDTH);
                        
                        -- calcd = sign-extend y1 + rounding constant
                        calc(CALC_WIDTH*2-1 downto CALC_WIDTH+FIXED_POINT) <= (others => y1(CALC_WIDTH-1)); -- sign extend
                        calc(CALC_WIDTH+FIXED_POINT-1 downto FIXED_POINT) <= y1; 
                        calc(FIXED_POINT-1) <= '1'; -- add 1/2 minimum precision
                        calc(FIXED_POINT-2 downto 0) <= (others => '0'); -- remaining double-precision bits = 0
                        
                    when STATE_CALC_1 =>
                        t3 <= resize((t*t2 + ACC_ROUND) srl FIXED_POINT, CALC_WIDTH);
                        
                        a <= (a1 sll 1) + a2;
                        b <= resize(3*b1, CALC_WIDTH) - b2;
                        
                        calc <= calc + c*t;
                        
                    when STATE_CALC_2 =>
                        calc2 <= a*t3 + b*t2;
                        
                    when STATE_CALC_3 =>
                        calc <= calc + calc2;
                        
                    when STATE_READY =>
                        if calc_init = '1' then
                            -- restore sign and set output
                            if sign = '1' then
                                output <= -calc(ACC_REG_BITS);
                            else
                                output <= calc(ACC_REG_BITS);
                            end if;
                        end if;
                        ready <= '1';
                    when STATE_HOLD =>
                        -- do nothing
                end case;
            else
                output <= (others => '0');
                calc_skip <= '0';
                calc_init <= '0';
                ready <= '0';
            end if;
            state <= nextstate;
        end if;
    end process;
    
--    process (clk)
--        variable sign : STD_LOGIC;
--        variable x    : SIGNED (REG_WIDTH-1 downto 0);
--        variable x1   : integer;
--        variable x2   : integer; 
--        variable t    : SIGNED (REG_WIDTH-1 downto 0);
--        variable t2   : SIGNED (REG_WIDTH-1 downto 0);
--        variable t3   : SIGNED (REG_WIDTH-1 downto 0);
--        variable a    : SIGNED (REG_WIDTH-1 downto 0);
--        variable b    : SIGNED (REG_WIDTH-1 downto 0);
--        variable c    : SIGNED (REG_WIDTH-1 downto 0);
--        variable d    : SIGNED (REG_WIDTH-1 downto 0);
--        variable calc : SIGNED (REG_WIDTH*2-1 downto 0);
--    begin
--    if rising_edge(clk) then
--        if i_enable = '1' then
--            if i_input = 0 then
--                -- return 0.0 for inputof 0
--                output <= (others => '0');
--            elsif i_input >= LUT_MAX then
--                -- return 1.0 for input greater than max value
--                output <= (FIXED_POINT => '1',
--                           others => '0');
--            elsif i_input <= -LUT_MAX then
--                -- return -1.0 for input less than -max value
--                output <= (REG_WIDTH-1 downto FIXED_POINT => '1',
--                           others => '0');
--            else
--                -- get abs(i_input) and store sign
--                if i_input < 0 then
--                    sign := '1';
--                    x := -i_input;
--                else
--                    sign := '0';
--                    x := i_input;
--                end if;
                
--                -- get the LUT indexes before and after x
--                x1 := to_integer(x(INDEX));
--                x2 := x1+1;
                
--                -- get interpolation argument & calculate its exponents
--                t(REG_WIDTH-1 downto FIXED_POINT) := (others => '0'); -- t = (x - x1) / (x2 - x1)
--                t(FIXED_POINT-1 downto RES_BITS) := x(INTERP);
--                t(RES_BITS-1 downto 0) := (others => '0'); 
--                t2 := resize((t*t + ACC_ROUND) srl FIXED_POINT, 32);
--                t3 := resize((t2*t + ACC_ROUND) srl FIXED_POINT, 32);
                
--                -- calculate polynomial coefficients from LUT
--                a := ((tanh_lut(x1) sll 1) - (tanh_lut(x2) sll 1)) + (slope_lut(x1) + slope_lut(x2));
--                b := (resize(-3*tanh_lut(x1), 32) + resize(3*tanh_lut(x2), 32)) - ((slope_lut(x1) sll 1) - slope_lut(x2));
--                c := slope_lut(x1);
--                d := tanh_lut(x1);
                
--                -- calculate polynomial
--                calc := (a*t3 + b*t2 + c*t) + ((resize(d, REG_WIDTH*2) sll FIXED_POINT) + ACC_ROUND);
                
--                -- restore sign and set output
--                if sign = '1' then
--                    output <= -calc(ACC_REG_BITS);
--                else
--                    output <= calc(ACC_REG_BITS);
--                end if;
--            end if;
--        else
--            output <= (others => '0');
--        end if;
--    end if;
--    end process;
    
    o_output <= output;
    o_ready <= ready;
end Behavioral;
