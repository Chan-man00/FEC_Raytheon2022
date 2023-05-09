----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2023 04:53:17 PM
-- Design Name: 
-- Module Name: gru - Behavioral
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


entity gru is
    Port (
        clk         : in  STD_LOGIC;
        i_initbias  : in  STD_LOGIC; -- initialize internal accumulators and set biases
        i_multin    : in  STD_LOGIC; -- multiply a layer input and weights
        i_multfb    : in  STD_LOGIC; -- multiply a feedback input and weights
        i_finish    : in  STD_LOGIC; -- generate output
        i_input     : in  SIGNED (REG_WIDTH-1 downto 0); -- layer input or feedback input value
        i_weight_z  : in  SIGNED (REG_WIDTH-1 downto 0); -- weight and bias
        i_weight_r  : in  SIGNED (REG_WIDTH-1 downto 0); -- weight and bias
        i_weight_h  : in  SIGNED (REG_WIDTH-1 downto 0); -- weight and h input bias
        i_bias_h2   : in  SIGNED (REG_WIDTH-1 downto 0); -- h feedback bias
        o_output    : out SIGNED (REG_WIDTH-1 downto 0);
        o_ready     : out STD_LOGIC;
        o_overflow  : out STD_LOGIC
    );
end gru;

architecture Behavioral of gru is
    component af_relu is
        Port (
            i_input     : in  SIGNED (REG_WIDTH*2-1 downto 0);
            o_output    : out SIGNED (REG_WIDTH-1 downto 0);
            o_overflow  : out STD_LOGIC
        );
    end component af_relu;
    
    component af_tanh is
        Port (
            clk         : in  STD_LOGIC;
            i_input     : in  SIGNED (REG_WIDTH-1 downto 0);
            i_enable    : in  STD_LOGIC;
            o_output    : out SIGNED (REG_WIDTH-1 downto 0);
            o_ready     : out STD_LOGIC
        );
    end component af_tanh;
    
    constant ONE       : SIGNED (REG_WIDTH-1 downto 0)   := (FIXED_POINT => '1', others => '0');
    constant ACC_ROUND : SIGNED (REG_WIDTH*2-1 downto 0) := (FIXED_POINT-1 => '1', others => '0'); -- rounding constant, 1/2 the smallest positive value in REG_WIDTH
    
    --Ranges for interacting with accumulator register bits:
    subtype ACC_SX_BITS   is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT;     -- sign extend bits
    subtype ACC_OVER_BITS is natural range REG_WIDTH*2-1 downto REG_WIDTH+FIXED_POINT-1;   -- high bits after multiplcation for detecting overflow, includes sign bit of ACC_REG_BITS 
    subtype ACC_REG_BITS  is natural range REG_WIDTH+FIXED_POINT-1 downto FIXED_POINT;     -- bits equivalent to access
    
    signal acc_z     : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0'); -- double-precision as a result of multiplication
    signal acc_r     : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal acc_hin   : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal acc_hfb   : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal hfb_prod  : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal tanh_z    : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal tanh_r    : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal relu_h    : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    
    signal out_z     : SIGNED (REG_WIDTH-1 downto 0);
    signal out_r     : SIGNED (REG_WIDTH-1 downto 0);
    signal out_h     : SIGNED (REG_WIDTH-1 downto 0);
    signal of_h      : STD_LOGIC;
    signal en_tanh   : STD_LOGIC := '0';
    signal en_fsm    : STD_LOGIC := '0';
    signal ready_z   : STD_LOGIC;
    signal ready_r   : STD_LOGIC;
    
    signal calc1     : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal calc2     : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal calc2a    : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    
    signal output    : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal ready     : STD_LOGIC := '0';
    signal overflow  : STD_LOGIC := '0';
    
    -- FSM to compute final output in steps
    type STATE_TYPE is (STATE_IDLE, STATE_TANH, STATE_TANH_WAIT, STATE_CALC, STATE_CALC_2, STATE_READY, STATE_HOLD);
    signal state     : STATE_TYPE := STATE_IDLE;
    signal nextstate : STATE_TYPE := STATE_IDLE;
begin
    
    --process (clk, i_initbias, i_multin, i_multfb, i_finish, i_input, i_weight_z, i_weight_r, i_weight_h, i_bias_h2, acc_z, acc_r, acc_hin, acc_hfb)
    process (clk)
    begin
        if rising_edge(clk) then
            if i_initbias = '1' then
                acc_z(ACC_SX_BITS) <= (others => i_weight_z(REG_WIDTH-1)); -- sign-extend accumulator
                acc_z(ACC_REG_BITS) <= i_weight_z; -- set accumulator value to bias value
                acc_z(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding 
                acc_z(FIXED_POINT-2 downto 0) <= (others => '0'); -- set sub-fractional bits to 0
                
                acc_r(ACC_SX_BITS) <= (others => i_weight_r(REG_WIDTH-1)); -- sign-extend accumulator
                acc_r(ACC_REG_BITS) <= i_weight_r; -- set accumulator value to bias value
                acc_r(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding 
                acc_r(FIXED_POINT-2 downto 0) <= (others => '0'); -- set sub-fractional bits to 0
                
                acc_hin(ACC_SX_BITS) <= (others => i_weight_h(REG_WIDTH-1)); -- sign-extend accumulator
                acc_hin(ACC_REG_BITS) <= i_weight_h; -- set accumulator value to bias value
                acc_hin(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding 
                acc_hin(FIXED_POINT-2 downto 0) <= (others => '0'); -- set sub-fractional bits to 0
                
                acc_hfb(ACC_SX_BITS) <= (others => i_bias_h2(REG_WIDTH-1)); -- sign-extend accumulator
                acc_hfb(ACC_REG_BITS) <= i_bias_h2; -- set accumulator value to bias value
                acc_hfb(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding 
                acc_hfb(FIXED_POINT-2 downto 0) <= (others => '0'); -- set sub-fractional bits to 0
                hfb_prod <= (others => '0');
                
                en_fsm <= '0';
                overflow <= '0';
            elsif i_multin = '1' then
                acc_z <= acc_z + (i_input * i_weight_z);
                acc_r <= acc_r + (i_input * i_weight_r);
                acc_hin <= acc_hin + (i_input * i_weight_h);
            elsif i_multfb = '1' then
                acc_hfb <= acc_hfb + hfb_prod;
                acc_z <= acc_z + (i_input * i_weight_z);
                acc_r <= acc_r + (i_input * i_weight_r);
                hfb_prod <= i_input * i_weight_h;
            elsif i_finish = '1' then
                acc_hfb <= acc_hfb + hfb_prod;
                en_fsm <= '1';
            end if;
        end if;
    end process;
    
    -- update states
    process (state, en_fsm)
    begin
        if en_fsm = '1' then
            case state is
                when STATE_IDLE =>
                    nextstate <= STATE_TANH;
                when STATE_TANH =>
                    nextstate <= STATE_TANH_WAIT;
                when STATE_TANH_WAIT =>
                    if ready_z = '1' and ready_r = '1' then
                        nextstate <= STATE_CALC;
                    else
                        nextstate <= STATE_TANH_WAIT;
                    end if;
                when STATE_CALC =>
                    nextstate <= STATE_CALC_2;
                when STATE_CALC_2 =>
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
    
    -- state functions
    --process (clk, state)
    process (clk)
    begin
        if rising_edge(clk) then
            case state is
                when STATE_IDLE =>
                    en_tanh <= '0';
                    ready <= '0';
                    
                when STATE_TANH =>
                    if acc_z(REG_WIDTH*2-1) = '1' and and_reduce(std_logic_vector(acc_z(ACC_OVER_BITS))) = '0' then
                        -- negative value too large for REG_WIDTH, so set to largest negative value (tanh result will still be -1.0)
                        tanh_z <= (REG_WIDTH-1 => '1', others => '0');
                    elsif acc_z(REG_WIDTH*2-1) = '0' and or_reduce(std_logic_vector(acc_z(ACC_OVER_BITS))) = '1' then
                        -- positive value too large for REG_WIDTH, so set to largest positive value (tanh result will still be 1.0)
                        tanh_z <= (REG_WIDTH-1 => '0', others => '1');
                    else
                        tanh_z <= acc_z(ACC_REG_BITS);
                    end if;
                    if acc_r(REG_WIDTH*2-1) = '1' and and_reduce(std_logic_vector(acc_r(ACC_OVER_BITS))) = '0' then
                        -- negative value too large for REG_WIDTH, so set to largest negative value (tanh result will still be -1.0)
                        tanh_r <= (REG_WIDTH-1 => '1', others => '0');
                    elsif acc_r(REG_WIDTH*2-1) = '0' and or_reduce(std_logic_vector(acc_r(ACC_OVER_BITS))) = '1' then
                        -- positive value too large for REG_WIDTH, so set to largest positive value (tanh result will still be 1.0)
                        tanh_r <= (REG_WIDTH-1 => '0', others => '1');
                    else
                        tanh_r <= acc_r(ACC_REG_BITS);
                    end if;
                    en_tanh <= '1';
                    
                when STATE_TANH_WAIT =>
                    -- nothing
                    
                when STATE_CALC =>
                    -- TODO: unhandled overflow potential in acc_hfb(ACC_REG_BITS)
                    --relu_h <= acc_hin + (out_r * acc_hfb(ACC_REG_BITS));
                    relu_h <= acc_hin + resize(out_r(18 downto 0) * acc_hfb(ACC_REG_BITS), REG_WIDTH*2); -- outr has a maximum range of -65536 to 65536, 19 bits
                    calc1 <= out_z * i_input;
                    calc2a <= ONE - out_z;
                    
                when STATE_CALC_2 =>
                    calc2 <= calc2a * out_h;
                    
                when STATE_READY =>
                    output <= calc1 + calc2;
                
                when STATE_HOLD =>
                    ready <= '1';
                    -- doesn't do anything
            end case;
            state <= nextstate;
        end if;
    end process;
    
    o_ready <= ready;
    o_output <= output(ACC_REG_BITS);
--    o_overflow <= overflow;
    o_overflow <= of_h or (or_reduce(std_logic_vector(output(ACC_OVER_BITS))) and not and_reduce(std_logic_vector(output(ACC_OVER_BITS))));
    -- output is valid when:
    --   or_reduce(overflow bits) = '0' (positive number doesn't exceed REG_WIDTH)
    --   and_recude(overflow bits) = '1' (negative number doesn't exceed REG_WIDTH)
    -- therefore, overflow on o_output occurs when both cases are false (implying no valid case is satisfied)
    
    -- Activation functions for each sub-block
    z_af : af_tanh
        Port map (
            clk        => clk,
            i_input    => tanh_z,
            i_enable   => en_tanh,
            o_output   => out_z,
            o_ready    => ready_z
        );
    r_af : af_tanh
        Port map (
            clk        => clk,
            i_input    => tanh_r,
            i_enable   => en_tanh,
            o_output   => out_r,
            o_ready    => ready_r
        );
    h_af : af_relu
        Port map (
            i_input    => relu_h,
            o_output   => out_h,
            o_overflow => of_h
        );
    
end Behavioral;
