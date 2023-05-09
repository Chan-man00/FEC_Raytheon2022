----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/05/2023 03:53:25 PM
-- Design Name: 
-- Module Name: pnr_dense - Behavioral
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

entity pnr_dense is
    Port (
        CLK : in  STD_LOGIC;
        LED : out STD_LOGIC_VECTOR (15 downto 0)
    );
end pnr_dense;

architecture Behavioral of pnr_dense is
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
    
    signal x1 : SIGNED (REG_WIDTH-1 downto 0) := x"00012345";
    signal x2 : SIGNED (REG_WIDTH-1 downto 0) := x"FFFFEDCB";
    signal y1 : SIGNED (REG_WIDTH-1 downto 0);
    signal y2 : SIGNED (REG_WIDTH-1 downto 0) := (others => '0');
    
    signal sig1 : STD_LOGIC := '0';
    signal sig2 : STD_LOGIC := '0';
    signal sig3 : STD_LOGIC := '0';
    
    signal out1 : STD_LOGIC;
    
    signal state : integer range 0 to 4 := 0;
    signal nextstate : integer range 0 to 4 := 0;
begin
    
    LED(0) <= and_reduce(std_logic_vector(y2));
    
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
            when others =>
                nextstate <= 4;
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
                    y2 <= (others => '0');
                when 1 =>
                    sig1 <= '1';
                    sig2 <= '0';
                    sig3 <= '0';
                    y2 <= (others => '0');
                when 2 =>
                    sig1 <= '0';
                    sig2 <= '1';
                    sig3 <= '0';
                    y2 <= (others => '0');
                when 3 =>
                    sig1 <= '0';
                    sig2 <= '0';
                    sig3 <= '1';
                    y2 <= (others => '0');
                when others =>
                    sig1 <= '0';
                    sig2 <= '0';
                    sig3 <= '0';
                    if out1 = '1' then
                        y2 <= y1;
                    else
                        y2 <= (others => '0');
                    end if;
            end case;
            state <= nextstate;
        end if;
    end process;
    
    dense : dense_sigmoid
        Port map (
            clk        => CLK,
            i_initbias => sig1,
            i_mult     => sig2,
            i_finish   => sig3,
            i_input    => x1,
            i_weight   => x2,
            o_output   => y1,
            o_ready    => out1
        );
    
end Behavioral;
