----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/08/2023 02:54:23 PM
-- Design Name: 
-- Module Name: pnr_combined - Behavioral
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

library unisim;
use unisim.vcomponents.all;

entity pnr_combined is
    Port (
        SYSCLK_P   : in STD_LOGIC;
        SYSCLK_N   : in STD_LOGIC;
        GPIO_LED_0 : out STD_LOGIC;
        GPIO_LED_1 : out STD_LOGIC;
        GPIO_LED_2 : out STD_LOGIC;
        GPIO_LED_3 : out STD_LOGIC
    );
end pnr_combined;

architecture Behavioral of pnr_combined is
    component gru is
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
    end component;
    
    component dense_sigmoid is
        Port (
            clk        : in  STD_LOGIC;
            i_initbias : in  STD_LOGIC;
            i_mult     : in  STD_LOGIC;
            i_finish   : in  STD_LOGIC;
            i_input    : in  SIGNED (REG_WIDTH-1 downto 0);
            i_weight   : in  SIGNED (REG_WIDTH-1 downto 0);
            o_output   : out SIGNED (REG_WIDTH-1 downto 0);
            o_ready    : out STD_LOGIC
        );
    end component dense_sigmoid;
    
    signal CLK : STD_LOGIC;
    
    signal x1 : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal x2 : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    signal w1 : SIGNED (REG_WIDTH-1 downto 0) := x"00468A";
    signal w2 : SIGNED (REG_WIDTH-1 downto 0) := x"012345";
    signal w3 : SIGNED (REG_WIDTH-1 downto 0) := x"FFEDCB";
    signal w4 : SIGNED (REG_WIDTH-1 downto 0) := x"FFA987";
    signal w5 : SIGNED (REG_WIDTH-1 downto 0) := x"018ECD";
    signal y1 : SIGNED (REG_WIDTH-1 downto 0);
    signal y2 : SIGNED (REG_WIDTH-1 downto 0);
    
    signal dense1 : STD_LOGIC := '0';
    signal dense2 : STD_LOGIC := '0';
    signal dense3 : STD_LOGIC := '0';
    signal gru1 : STD_LOGIC := '0';
    signal gru2 : STD_LOGIC := '0';
    signal gru3 : STD_LOGIC := '0';
    signal gru4 : STD_LOGIC := '0';
    
    signal out1 : STD_LOGIC;
    signal out2 : STD_LOGIC;
    signal out3 : STD_LOGIC;
    
    signal state : integer range 0 to 9 := 0;
    signal nextstate : integer range 0 to 9 := 0;
begin
    
    -- use output for something so the whole blocks don't get optimized out
    GPIO_LED_0 <= and_reduce(std_logic_vector(y1)) and and_reduce(std_logic_vector(y2)); 
    GPIO_LED_1 <= or_reduce(std_logic_vector(y1)) or or_reduce(std_logic_vector(y2));
    GPIO_LED_2 <= out1 and out2;
    GPIO_LED_3 <= out3;
    
    -- update states
    process (state)
    begin
        case state is
            when 0 => -- pre-dense
                nextstate <= 1;
            when 1 => -- dense init
                nextstate <= 2;
            when 2 => -- dense multiply
                nextstate <= 3;
            when 3 => -- dense finish
                nextstate <= 4;
            when 4 => -- pre-gru
                if out1 = '1' then
                    nextstate <= 5;
                else
                    nextstate <= 4; -- wait until ready
                end if;
            when 5 => -- gru init
                nextstate <= 6;
            when 6 => -- gru multiply
                nextstate <= 7;
            when 7 => -- gru feedback
                nextstate <= 8;
            when 8 => -- gru finish
                nextstate <= 9;
            when 9 => -- reset
                if out2 = '1' then
                    nextstate <= 0;
                else
                    nextstate <= 9; -- wait until ready
                end if;
        end case;
    end process;
    
    
    -- set inputs, weights & controls
    process (CLK)
    begin
        if rising_edge(CLK) then
            case state is
                when 0 =>
                    dense1 <= '0';
                    dense2 <= '0';
                    dense3 <= '0';
                when 1 =>
                    x1 <= x"008000"; -- bias
                    dense1 <= '1';
                    dense2 <= '0';
                    dense3 <= '0';
                when 2 =>
                    x1 <= y2; -- gru output
                    dense1 <= '0';
                    dense2 <= '1';
                    dense3 <= '0';
                when 3 =>
                    dense1 <= '0';
                    dense2 <= '0';
                    dense3 <= '1';
                when 4 =>
                    dense1 <= '0';
                    dense2 <= '0';
                    dense3 <= '0';
                    gru1 <= '0';
                    gru2 <= '0';
                    gru3 <= '0';
                    gru4 <= '0';
                    
                when 5 =>
                    gru1 <= '1';
                    gru2 <= '0';
                    gru3 <= '0';
                    gru4 <= '0';
                when 6 =>
                    x2 <= y1; -- dense layer output
                    gru1 <= '0';
                    gru2 <= '1';
                    gru3 <= '0';
                    gru4 <= '0';
                when 7 =>
                    x2 <= x1; -- previous output
                    gru1 <= '0';
                    gru2 <= '0';
                    gru3 <= '1';
                    gru4 <= '0';
                when 8 =>
                    gru1 <= '0';
                    gru2 <= '0';
                    gru3 <= '0';
                    gru4 <= '1';
                when 9 =>
                    gru1 <= '0';
                    gru2 <= '0';
                    gru3 <= '0';
                    gru4 <= '0';
            end case;
            state <= nextstate;
        end if;
    end process;
    
    
    dense : dense_sigmoid
        Port map (
            clk        => CLK,
            i_initbias => dense1,
            i_mult     => dense2,
            i_finish   => dense3,
            i_input    => x1,
            i_weight   => w1,
            o_output   => y1,
            o_ready    => out1
        );
    
    gruu : gru
        Port map (
            clk        => CLK,
            i_initbias => gru1,
            i_multin   => gru2,
            i_multfb   => gru3,
            i_finish   => gru4,
            i_input    => x2,
            i_weight_z => w2,
            i_weight_r => w3,
            i_weight_h => w4,
            i_bias_h2  => w5,
            o_output   => y2,
            o_ready    => out2,
            o_overflow => out3
        );
    
    -- differential clock to single clock
    IBUFDS_inst: IBUFDS
--        generic map (
--            DIFF_TERM => FALSE,
--            IBUF_LOW_PWR => TRUE,
--            IOSTANDARD => "DEFAULT"
--        )
        port map (
            O  => CLK,
            I  => SYSCLK_P,
            IB => SYSCLK_N
        );
    
end Behavioral;
