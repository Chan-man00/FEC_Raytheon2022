----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/18/2023 02:13:58 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: use VHDL 2008
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use std.textio.all;

entity top is
--  Port ( );
end top;

    
architecture Behavioral of top is
    
    constant CLK_HALF_T : time := 1.25 ns;
    -- simulate for at least 1.1 ms at this clock speed
    
    constant REG_WIDTH    : integer := 32; -- total number of bits
    constant FIXED_POINT  : integer := 16; -- number of fractional bits (i.e. (1<<FIXED_POINT) == 1.0)
    
    constant INPUT_COUNT  : integer := 28*28;
    constant LAYER1_COUNT : integer := 512;
    constant LAYER2_COUNT : integer := 10;
    constant OUTPUT_COUNT : integer := 10;
    
    component dense_serial is
        Generic (
            REG_WIDTH   : integer := REG_WIDTH;
            FIXED_POINT : integer := FIXED_POINT
        );
        Port (
            clk        : in  STD_LOGIC;
            i_initbias : in  STD_LOGIC;
            i_mult     : in  STD_LOGIC;
            i_input    : in  SIGNED (REG_WIDTH-1 downto 0);
            i_weight   : in  SIGNED (REG_WIDTH-1 downto 0);
            o_output   : out SIGNED (REG_WIDTH-1 downto 0);
            o_overflow : out STD_LOGIC
        );
    end component dense_serial;
    
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
    
    -- layer weights & test input
    signal L1_weights : SIGNED_ARRAY(0 to LAYER1_COUNT*(INPUT_COUNT+1)-1)(REG_WIDTH-1 downto 0)  := load_array("layer1.mem", LAYER1_COUNT*(INPUT_COUNT+1));
    signal L2_weights : SIGNED_ARRAY(0 to LAYER2_COUNT*(LAYER1_COUNT+1)-1)(REG_WIDTH-1 downto 0) := load_array("layer2.mem", LAYER2_COUNT*(LAYER1_COUNT+1));
    signal inputs     : SIGNED_ARRAY(0 to INPUT_COUNT-1)(REG_WIDTH-1 downto 0) := load_array("test.mem", INPUT_COUNT);
    
    signal enable     : STD_LOGIC := '0';
    signal outputs_1  : SIGNED_ARRAY(0 to LAYER1_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_2  : SIGNED_ARRAY(0 to OUTPUT_COUNT-1)(REG_WIDTH-1 downto 0);
    signal overflow   : STD_LOGIC := '0';
    signal ready      : STD_LOGIC := '0';
    signal selection  : STD_LOGIC_VECTOR(3 downto 0) := "1111";
    
    type STATE_TYPE is (STATE_IDLE, STATE_BIAS_1, STATE_MULT_1, STATE_DONE_1, STATE_BIAS_2, STATE_MULT_2, STATE_DONE_2);
    signal state     : STATE_TYPE := STATE_IDLE;
    signal nextstate : STATE_TYPE := STATE_IDLE;
    
    signal input_counter : integer range 0 to INPUT_COUNT-1 := 0;
    signal node_counter  : integer range 0 to LAYER1_COUNT-1 := 0;
    
    signal node_input  : SIGNED (REG_WIDTH-1 downto 0);
    signal node_weight : SIGNED (REG_WIDTH-1 downto 0);
    signal node_output : SIGNED (REG_WIDTH-1 downto 0);
    signal initbias    : STD_LOGIC;
    signal mult        : STD_LOGIC; 
    signal node_of     : STD_LOGIC;
    
    signal clk : std_logic := '0';
begin
    -- clock
    clk <= not clk after CLK_HALF_T;
    
    -- simulation control
    sw_stimulus : process
    begin
        enable <= '0';
        wait for 5 ns;
        
        enable <= '1';
        wait for 1.1 ms;
        
        enable <= '0';
        wait for 5 ns;
    end process sw_stimulus;
    
    -- get NN output selection
    process (ready, outputs_2, overflow)
        variable max_id  : natural range 0 to 15 := 15;
    begin
        if overflow = '1' then
            max_id := 14; -- error state
        elsif ready = '1' then
            max_id := 0;
            for i in 1 to LAYER2_COUNT-1 loop
                if outputs_2(i) > outputs_2(max_id) then
                    max_id := i;
                end if;
            end loop;
        else
            max_id := 15; -- none / computing
        end if;
        selection <= std_logic_vector(to_unsigned(max_id, 4));
    end process;
    
    
    -- update states
    process (enable, state, input_counter, node_counter)
    begin
        if enable = '0' then
            nextstate <= STATE_IDLE; -- idle while not enabled
        else
            case state is
                when STATE_IDLE =>
                    nextstate <= STATE_BIAS_1; -- begin when enabled
                
                when STATE_BIAS_1 =>
                    nextstate <= STATE_MULT_1;
                when STATE_MULT_1 =>
                    if input_counter = INPUT_COUNT-1 then
                        if node_counter = LAYER1_COUNT-1 then
                            nextstate <= STATE_DONE_1; -- finish layer
                        else
                            nextstate <= STATE_BIAS_1; -- move to next node
                        end if;
                    else
                        nextstate <= STATE_MULT_1; -- keep multiplying
                    end if;
                when STATE_DONE_1 =>
                    nextstate <= STATE_BIAS_2; -- move to layer 2
                    
                when STATE_BIAS_2 =>
                    nextstate <= STATE_MULT_2;
                when STATE_MULT_2 =>
                    if input_counter = LAYER1_COUNT-1 then -- layer1 is layer2 input
                        if node_counter = LAYER2_COUNT-1 then
                            nextstate <= STATE_DONE_2; -- finish layer
                        else
                            nextstate <= STATE_BIAS_2; -- move to next node
                        end if;
                    else
                        nextstate <= STATE_MULT_2; -- keep multiplying
                    end if;
                when STATE_DONE_2 =>
                    nextstate <= STATE_DONE_2; -- loop until disabled
            end case;
        end if;
    end process;
    
    -- state functions
    process (clk, state, input_counter, node_counter, inputs, L1_weights, L2_weights)
    begin
        if rising_edge(clk) then
            case state is
                when STATE_IDLE =>
                    ready <= '0';
                    overflow <= '0';
                    initbias <= '0';
                    mult <= '0';
                    node_counter <= 0;
                    
                when STATE_BIAS_1 =>
                    input_counter <= 0;
                    node_input <= L1_weights(node_counter*(INPUT_COUNT+1) + INPUT_COUNT); -- bias offset
                    initbias <= '1';
                    mult <= '0';
                when STATE_MULT_1 =>
                    node_input  <= inputs(input_counter);
                    node_weight <= L1_weights(node_counter*(INPUT_COUNT+1) + input_counter);
                    initbias <= '0';
                    mult <= '1';
                    overflow <= overflow or node_of;
                    if input_counter = INPUT_COUNT-1 then
                        outputs_1(node_counter) <= node_output;
                        node_counter <= node_counter + 1;
                    end if;
                    input_counter <= input_counter + 1;
                when STATE_DONE_1 =>
                    initbias <= '0';
                    mult <= '0';
                    node_counter <= 0;
                    
                when STATE_BIAS_2 =>
                    input_counter <= 0;
                    node_input <= L2_weights(node_counter*(LAYER1_COUNT+1) + LAYER1_COUNT); -- bias offset
                    initbias <= '1';
                    mult <= '0';
                when STATE_MULT_2 =>
                    node_input  <= outputs_1(input_counter);
                    node_weight <= L2_weights(node_counter*(LAYER1_COUNT+1) + input_counter);
                    initbias <= '0';
                    mult <= '1';
                    overflow <= overflow or node_of;
                    if input_counter = LAYER1_COUNT-1 then
                        outputs_2(node_counter) <= node_output;
                        node_counter <= node_counter + 1;
                    end if;
                    input_counter <= input_counter + 1;
                when STATE_DONE_2 =>
                    initbias <= '0';
                    mult <= '0';
                    ready <= '1';
            end case;
            state <= nextstate;
        end if;
    end process;
    
    node : dense_serial
        Port map (
            clk        => clk,
            i_initbias => initbias,
            i_mult     => mult,
            i_input    => node_input,
            i_weight   => node_weight,
            o_output   => node_output,
            o_overflow => node_of
        );
    
end Behavioral;
