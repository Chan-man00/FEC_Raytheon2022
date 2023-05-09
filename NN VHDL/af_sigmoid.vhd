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
use work.Common.ALL;

entity af_sigmoid is
    Port (
        clk      : in STD_LOGIC;
        i_input  : in  SIGNED (REG_WIDTH-1 downto 0);
        i_enable : in  STD_LOGIC;
        o_output : out SIGNED (REG_WIDTH-1 downto 0);
        o_ready  : out STD_LOGIC
    );
end af_sigmoid;

architecture Behavioral of af_sigmoid is
    constant CALC_WIDTH : integer := 24; -- reduced register width to improve performance, since the higher bits are unused anyway
    
    -- these values are probably too complicted to create from a generic
    constant RES_BITS : integer := 1; -- LUT sampling resolution, 1/(2^RES_BITS)
    constant LUT_MAX  : integer := 16#BC894#; -- absolute value after which sigmoid(x) rounds to 0 or 1.0, approx 11.784
    type lut is array(0 to 24) of SIGNED(CALC_WIDTH-1 downto 0);
    constant sigm_lut  : lut := (X"000000",X"001F59",X"003B27",X"00514D",X"00617C",X"006C95", -- sigmoid(n / 2^RES_BITS), with non-negative integer values of n
                                 X"0073DC",X"00787F",X"007B65",X"007D30",X"007E49",X"007EF5",
                                 X"007F5E",X"007F9E",X"007FC4",X"007FDC",X"007FEA",X"007FF3",
                                 X"007FF8",X"007FFB",X"007FFD",X"007FFE",X"007FFF",X"007FFF",
                                 X"008000");
    constant slope_lut : lut := (X"002000",X"001E15",X"00192B",X"001317",X"000D70",X"0008F9", -- derivatives of sigmoid(n / 2^RES_BITS)
                                 X"0005C8",X"0003A4",X"000243",X"000164",X"0000DA",X"000085",
                                 X"000051",X"000031",X"00001E",X"000012",X"00000B",X"000007",
                                 X"000004",X"000002",X"000001",X"000001",X"000001",X"000000",
                                 X"000000");
    constant ACC_ROUND : SIGNED (CALC_WIDTH*2-1 downto 0) := (FIXED_POINT-1 => '1', others => '0'); -- rounding constant, 1/2 the smallest positive value in REG_WIDTH
    constant ONE_HALF  : SIGNED (REG_WIDTH-1 downto 0)    := (FIXED_POINT-1 => '1', others => '0'); -- 0.5
    
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
                            -- return 0.5 for input of 0
                            output <= ONE_HALF;
                            
                            calc_skip <= '1'; -- go directly to output ready state
                            calc_init <= '0';
                        elsif i_input >= LUT_MAX then
                            -- return 1.0 for input greater than max value
                            output <= (FIXED_POINT => '1',
                                       others => '0');
                            
                            calc_skip <= '1'; -- go directly to output ready state
                            calc_init <= '0';
                        elsif i_input <= -LUT_MAX then
                            -- return 0.0 for input less than -max value
                            output <= (others => '0');
                            
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
                        y1  := sigm_lut(x1);
                        dy1 := slope_lut(x1);
                        y2  := sigm_lut(x2);
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
                            -- restore y offset and set output
                            if sign = '1' then
                                output <= ONE_HALF - calc(ACC_REG_BITS);
                            else
                                output <= ONE_HALF + calc(ACC_REG_BITS);
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
    
    o_output <= output;
    o_ready <= ready;
end Behavioral;
