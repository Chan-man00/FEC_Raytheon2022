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


entity gru_tanh_relu is
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
end gru_tanh_relu;

architecture Behavioral of gru_tanh_relu is
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
    signal relu_z    : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal relu_r    : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal tanh_h    : SIGNED (REG_WIDTH-1 downto 0)   := (others => '0');
    signal tanh_h2   : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    
    signal out_z     : SIGNED (REG_WIDTH-1 downto 0);
    signal out_r     : SIGNED (REG_WIDTH-1 downto 0);
    signal out_h     : SIGNED (REG_WIDTH-1 downto 0);
    signal of_z      : STD_LOGIC;
    signal of_r      : STD_LOGIC;
    signal en_tanh   : STD_LOGIC := '0';
    signal en_fsm    : STD_LOGIC := '0';
    signal ready_h   : STD_LOGIC;
    
    signal calc1     : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal calc2     : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal calc2a    : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    
    signal output    : SIGNED (REG_WIDTH*2-1 downto 0) := (others => '0');
    signal ready     : STD_LOGIC := '0';
    signal overflow  : STD_LOGIC := '0';
    
    -- FSM to compute final output in steps
    type STATE_TYPE is (STATE_IDLE, STATE_RELU, STATE_CALC, STATE_TANH, STATE_TANH_WAIT, STATE_CALC_2, STATE_READY, STATE_HOLD);
    signal state     : STATE_TYPE := STATE_IDLE;
    signal nextstate : STATE_TYPE := STATE_IDLE;
begin
    
    --process (clk, i_initbias, i_multin, i_multfb, i_finish, i_input, i_weight_z, i_weight_r, i_weight_h, i_bias_h2, acc_z, acc_r, acc_hin, acc_hfb)
    process (clk)
    begin
        if rising_edge(clk) then
            if i_initbias = '1' then
                -- acculumulator biasing:
                --   high bits get sign-extended
                --   positive values get 1/2 added for rounding
                --   negative values get 1/2 subtracted for rounding (in the form of input - 1 + 1/2)
                --   low bits get set to 0
                
                acc_z(ACC_SX_BITS) <= (others => i_weight_z(REG_WIDTH-1));
                if i_weight_z(REG_WIDTH-1) = '0' then
                    acc_z(ACC_REG_BITS) <= i_weight_z;
                else
                    acc_z(ACC_REG_BITS) <= i_weight_z-1; -- subtract 1 if negative (half gets added back next)
                end if;
                acc_z(FIXED_POINT-1) <= '1'; -- add 1/2 for rounding
                acc_z(FIXED_POINT-2 downto 0) <= (others => '0');
                
                acc_r(ACC_SX_BITS) <= (others => i_weight_r(REG_WIDTH-1));
                if i_weight_r(REG_WIDTH-1) = '0' then
                    acc_r(ACC_REG_BITS) <= i_weight_r;
                else
                    acc_r(ACC_REG_BITS) <= i_weight_r-1;
                end if;
                acc_r(FIXED_POINT-1) <= '1'; 
                acc_r(FIXED_POINT-2 downto 0) <= (others => '0');
                
                acc_hin(ACC_SX_BITS) <= (others => i_weight_h(REG_WIDTH-1));
                if i_weight_h(REG_WIDTH-1) = '0' then
                    acc_hin(ACC_REG_BITS) <= i_weight_h;
                else
                    acc_hin(ACC_REG_BITS) <= i_weight_h-1;
                end if;
                acc_hin(FIXED_POINT-1) <= '1'; 
                acc_hin(FIXED_POINT-2 downto 0) <= (others => '0');
                
                acc_hfb(ACC_SX_BITS) <= (others => i_bias_h2(REG_WIDTH-1));
                if i_bias_h2(REG_WIDTH-1) = '0' then
                    acc_hfb(ACC_REG_BITS) <= i_bias_h2;
                else
                    acc_hfb(ACC_REG_BITS) <= i_bias_h2-1;
                end if;
                acc_hfb(FIXED_POINT-1) <= '1'; 
                acc_hfb(FIXED_POINT-2 downto 0) <= (others => '0');
                hfb_prod <= (others => '0');
                
                en_fsm <= '0';
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
    process (state, en_fsm, ready_h)
    begin
        if en_fsm = '1' then
            case state is
                when STATE_IDLE =>
                    nextstate <= STATE_RELU;
                when STATE_RELU =>
                    nextstate <= STATE_CALC;
                when STATE_CALC =>
                    nextstate <= STATE_TANH;
                when STATE_TANH =>
                    nextstate <= STATE_TANH_WAIT;
                when STATE_TANH_WAIT =>
                    if ready_h = '1' then
                        nextstate <= STATE_CALC_2;
                    else
                        nextstate <= STATE_TANH_WAIT;
                    end if;
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
                    overflow <= '0';
                    
                when STATE_RELU =>
                    relu_z <= acc_z;
                    relu_r <= acc_r;
                    
                when STATE_CALC =>
                    -- TODO: unhandled overflow potential in acc_hfb(ACC_REG_BITS)
                    tanh_h2 <= acc_hin + (out_r * acc_hfb(ACC_REG_BITS));
                    calc1 <= out_z * i_input;
                    calc2a <= ONE - out_z;
                    overflow <= of_r or of_z;
                    
                when STATE_TANH =>
                    if tanh_h2(REG_WIDTH*2-1) = '1' and and_reduce(std_logic_vector(tanh_h2(ACC_OVER_BITS))) = '0' then
                        -- negative value too large for REG_WIDTH, so set to largest negative value (tanh result will still be -1.0)
                        tanh_h <= (REG_WIDTH-1 => '1', others => '0');
                    elsif tanh_h2(REG_WIDTH*2-1) = '0' and or_reduce(std_logic_vector(tanh_h2(ACC_OVER_BITS))) = '1' then
                        -- positive value too large for REG_WIDTH, so set to largest positive value (tanh result will still be 1.0)
                        tanh_h <= (REG_WIDTH-1 => '0', others => '1');
                    else
                        tanh_h <= tanh_h2(ACC_REG_BITS);
                    end if;
                    en_tanh <= '1';
                
                when STATE_TANH_WAIT =>
                    -- nothing
                
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
    o_overflow <= overflow or (or_reduce(std_logic_vector(output(ACC_OVER_BITS))) and not and_reduce(std_logic_vector(output(ACC_OVER_BITS))));
    -- output is valid when:
    --   or_reduce(overflow bits) = '0' (positive number doesn't exceed REG_WIDTH)
    --   and_recude(overflow bits) = '1' (negative number doesn't exceed REG_WIDTH)
    -- therefore, overflow on o_output occurs when both cases are false (implying no valid case is satisfied)
    
    -- Activation functions for each sub-block
    z_af : af_relu
        Port map (
            i_input    => relu_z,
            o_output   => out_z,
            o_overflow => of_z
        );
    r_af : af_relu
        Port map (
            i_input    => relu_r,
            o_output   => out_r,
            o_overflow => of_r
        );
    h_af : af_tanh
        Port map (
            clk        => clk,
            i_input    => tanh_h,
            i_enable   => en_tanh,
            o_output   => out_h,
            o_ready    => ready_h
        );
    
end Behavioral;
