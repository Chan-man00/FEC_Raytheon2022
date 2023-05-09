----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 03:53:25 PM
-- Design Name: 
-- Module Name: pnr_gru - Behavioral
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

entity pnr_gru is
    Port (
        CLK : in  STD_LOGIC;
        LED : out STD_LOGIC_VECTOR (15 downto 0)
    );
end pnr_gru;

architecture Behavioral of pnr_gru is
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
    
    signal x1 : SIGNED (REG_WIDTH-1 downto 0) := x"00012345";
    signal x2 : SIGNED (REG_WIDTH-1 downto 0) := x"FFFFEDCB";
    signal x3 : SIGNED (REG_WIDTH-1 downto 0) := x"FFFFA987";
    signal x4 : SIGNED (REG_WIDTH-1 downto 0) := x"0000468A";
    signal x5 : SIGNED (REG_WIDTH-1 downto 0) := x"00018ECD";
    signal y1 : SIGNED (REG_WIDTH-1 downto 0);
    signal y2 : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    
    signal sig1 : STD_LOGIC := '0';
    signal sig2 : STD_LOGIC := '0';
    signal sig3 : STD_LOGIC := '0';
    signal sig4 : STD_LOGIC := '0';
    
    signal out1 : STD_LOGIC;
    signal out2 : STD_LOGIC;
    
    signal state : integer range 0 to 5 := 0;
    signal nextstate : integer range 0 to 5 := 0;
begin
    
    LED(0) <= and_reduce(std_logic_vector(y2));
    LED(1) <= out1;
    LED(2) <= out2;
    
    process (state)
    begin
        case state is
            when 0 =>
                nextstate <= 1;
            when 1 =>
                nextstate <= 2;
            when 2 =>
                nextstate <= 3;
            when 3 =>
                nextstate <= 4;
            when 4 =>
                nextstate <= 5;
            when others =>
                nextstate <= 5;
        end case;
    end process;
    
    process (CLK)
    begin
        if rising_edge(CLK) then
            case state is
                when 0 =>
                    sig1 <= '0';
                    sig2 <= '0';
                    sig3 <= '0';
                    sig4 <= '0';
                when 1 =>
                    sig1 <= '1';
                    sig2 <= '0';
                    sig3 <= '0';
                    sig4 <= '0';
                when 2 =>
                    sig1 <= '0';
                    sig2 <= '1';
                    sig3 <= '0';
                    sig4 <= '0';
                when 3 =>
                    sig1 <= '0';
                    sig2 <= '0';
                    sig3 <= '1';
                    sig4 <= '0';
                when 4 =>
                    sig1 <= '0';
                    sig2 <= '0';
                    sig3 <= '0';
                    sig4 <= '1';
                when others =>
                    sig1 <= '0';
                    sig2 <= '0';
                    sig3 <= '0';
                    sig4 <= '0';
                    if out1 = '1' then
                        y2 <= y1;
                    else
                        y2 <= (others => '0');
                    end if;
            end case;
            state <= nextstate;
        end if;
    end process;
    
    gruu : gru
        Port map (
            clk        => CLK,
            i_initbias => sig1,
            i_multin   => sig2,
            i_multfb   => sig3,
            i_finish   => sig4,
            i_input    => x1,
            i_weight_z => x2,
            i_weight_r => x3,
            i_weight_h => x4,
            i_bias_h2  => x5,
            o_output   => y1,
            o_ready    => out1,
            o_overflow => out2
        );
        
end Behavioral;
