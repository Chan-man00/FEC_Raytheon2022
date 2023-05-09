----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2023 12:48:29 PM
-- Design Name: 
-- Module Name: gruv100_tb - Behavioral
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
use std.textio.all;
use work.Common.ALL;


entity gruv4_tb is
--  Port ( );
end gruv4_tb;

Architecture Behavioral of gruv4_tb is
    
    constant CLK_HALF_T : time := 1.25 ns;
    
    constant TEST_COUNT      : integer := 1; -- number of test cases
    constant ITERATION_COUNT : integer := 99; -- how many times the NN runs before resetting
    
    -- NN model layers
    constant INPUT_COUNT  : integer := 1;   -- NN inputs
    constant LAYER1_COUNT : integer := 256; -- gru 256
    constant LAYER2_COUNT : integer := 256; -- gru 256
    constant LAYER3_COUNT : integer := 256; -- gru 256
    constant LAYER4_COUNT : integer := 256; -- gru 256
    constant LAYER5_COUNT : integer := 128; -- gru 128
    constant LAYER6_COUNT : integer := 63;  -- dense 63
    constant OUTPUT_COUNT : integer := 63;  -- NN outputs
    
    
    -- layer weight & bias offsets in mem files
    constant L1_BIAS_OFFS : integer := (INPUT_COUNT + LAYER1_COUNT)*3;  -- GRU has weights for both layer inputs & outputs
    constant L2_BIAS_OFFS : integer := (LAYER1_COUNT + LAYER2_COUNT)*3;
    constant L3_BIAS_OFFS : integer := (LAYER2_COUNT + LAYER3_COUNT)*3;
    constant L4_BIAS_OFFS : integer := (LAYER3_COUNT + LAYER4_COUNT)*3;
    constant L5_BIAS_OFFS : integer := (LAYER4_COUNT + LAYER5_COUNT)*3;
    constant L6_BIAS_OFFS : integer := LAYER5_COUNT;                    -- dense only has weights for inputs
    constant L1_INDEX     : integer := (L1_BIAS_OFFS + 4);              -- GRU has 4 bias values
    constant L2_INDEX     : integer := (L2_BIAS_OFFS + 4);
    constant L3_INDEX     : integer := (L3_BIAS_OFFS + 4);
    constant L4_INDEX     : integer := (L4_BIAS_OFFS + 4);
    constant L5_INDEX     : integer := (L5_BIAS_OFFS + 4);
    constant L6_INDEX     : integer := (L6_BIAS_OFFS + 1);              -- dense has 1 bias value
    constant L1_WEIGHT_CT : integer := L1_INDEX * LAYER1_COUNT;
    constant L2_WEIGHT_CT : integer := L2_INDEX * LAYER2_COUNT;
    constant L3_WEIGHT_CT : integer := L3_INDEX * LAYER3_COUNT;
    constant L4_WEIGHT_CT : integer := L4_INDEX * LAYER4_COUNT;
    constant L5_WEIGHT_CT : integer := L5_INDEX * LAYER5_COUNT;
    constant L6_WEIGHT_CT : integer := L6_INDEX * LAYER6_COUNT;
    
    component dense_relu is
        Port (
            clk        : in  STD_LOGIC;
            i_initbias : in  STD_LOGIC;
            i_mult     : in  STD_LOGIC;
            i_input    : in  SIGNED (REG_WIDTH-1 downto 0);
            i_weight   : in  SIGNED (REG_WIDTH-1 downto 0);
            o_output   : out SIGNED (REG_WIDTH-1 downto 0);
            o_overflow : out STD_LOGIC
        );
    end component dense_relu;
    
    component gru_tanh_relu is
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
    end component gru_tanh_relu;
    
    
    -- array of SIGNED vectors
    type SIGNED_ARRAY is array(natural range <>) of SIGNED;
    
    -- function to read weights from file
    impure function load_array(filename : in STRING; count : in INTEGER) return SIGNED_ARRAY is
        file text_file : text open read_mode is filename;
        variable text_line : line;
        variable line_data : SIGNED (31 downto 0);
        variable data : SIGNED_ARRAY(0 to count-1)(REG_WIDTH-1 downto 0);
    begin
        for i in 0 to count - 1 loop
            readline(text_file, text_line);
            hread(text_line, line_data);
            data(i) := line_data(REG_WIDTH-1 downto 0);
        end loop;
        return data;
    end function;
    
    -- layer weights & test input
    signal L1_weights : SIGNED_ARRAY(0 to L1_WEIGHT_CT-1)(REG_WIDTH-1 downto 0) := load_array("gruv4_1.mem", L1_WEIGHT_CT);
    signal L2_weights : SIGNED_ARRAY(0 to L2_WEIGHT_CT-1)(REG_WIDTH-1 downto 0) := load_array("gruv4_2.mem", L2_WEIGHT_CT);
    signal L3_weights : SIGNED_ARRAY(0 to L3_WEIGHT_CT-1)(REG_WIDTH-1 downto 0) := load_array("gruv4_3.mem", L3_WEIGHT_CT);
    signal L4_weights : SIGNED_ARRAY(0 to L4_WEIGHT_CT-1)(REG_WIDTH-1 downto 0) := load_array("gruv4_4.mem", L4_WEIGHT_CT);
    signal L5_weights : SIGNED_ARRAY(0 to L5_WEIGHT_CT-1)(REG_WIDTH-1 downto 0) := load_array("gruv4_5.mem", L5_WEIGHT_CT);
    signal L6_weights : SIGNED_ARRAY(0 to L6_WEIGHT_CT-1)(REG_WIDTH-1 downto 0) := load_array("gruv4_6.mem", L6_WEIGHT_CT);
    signal inputs     : SIGNED_ARRAY(0 to INPUT_COUNT*ITERATION_COUNT-1)(REG_WIDTH-1 downto 0); -- loaded sequentially
    
    signal enable     : STD_LOGIC := '0';
    signal outputs_1a : SIGNED_ARRAY(0 to LAYER1_COUNT-1)(REG_WIDTH-1 downto 0); -- GRU has two output registers for previous state
    signal outputs_1b : SIGNED_ARRAY(0 to LAYER1_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_2a : SIGNED_ARRAY(0 to LAYER2_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_2b : SIGNED_ARRAY(0 to LAYER2_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_3a : SIGNED_ARRAY(0 to LAYER3_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_3b : SIGNED_ARRAY(0 to LAYER3_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_4a : SIGNED_ARRAY(0 to LAYER4_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_4b : SIGNED_ARRAY(0 to LAYER4_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_5a : SIGNED_ARRAY(0 to LAYER5_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_5b : SIGNED_ARRAY(0 to LAYER5_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_6  : SIGNED_ARRAY(0 to OUTPUT_COUNT-1)(REG_WIDTH-1 downto 0);
    signal overflow   : STD_LOGIC := '0';
    signal ready      : STD_LOGIC := '0';
    
    -- indicates which output array is active for GRU layers
    signal output_sel : STD_LOGIC := '0';
    
    type STATE_TYPE is (STATE_IDLE, STATE_INIT,
                        STATE_BIAS_1, STATE_MULTIN_1, STATE_MULTFB_1, STATE_ACTIVATE_1, STATE_WAIT_1, STATE_DONE_1,
                        STATE_BIAS_2, STATE_MULT_2, STATE_ACTIVATE_2, STATE_DONE_2,
                        STATE_WRITE, STATE_STOP);
    signal state     : STATE_TYPE := STATE_IDLE;
    signal nextstate : STATE_TYPE := STATE_IDLE;
    
    signal iteration     : integer range 0 to ITERATION_COUNT-1 := 0;
    signal input_counter : integer range 0 to LAYER1_COUNT-1 := 0;
    signal input_max     : integer range 0 to LAYER1_COUNT-1 := 0;
    signal feedb_counter : integer range 0 to LAYER1_COUNT-1 := 0;
    signal feedb_max     : integer range 0 to LAYER1_COUNT-1 := 0;
    signal node_counter  : integer range 0 to LAYER1_COUNT-1 := 0;
    signal layer_counter : integer range 0 to 5 := 0;
    
    signal node_input    : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_z         : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_r         : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_h         : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_h2        : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_output    : SIGNED (REG_WIDTH-1 downto 0);
    signal dense_weight  : SIGNED (REG_WIDTH-1 downto 0);
    signal dense_output  : SIGNED (REG_WIDTH-1 downto 0);
    
    signal gru_init      : STD_LOGIC;
    signal gru_multin    : STD_LOGIC;
    signal gru_multfb    : STD_LOGIC;
    signal gru_finish    : STD_LOGIC;
    signal gru_ready     : STD_LOGIC;
    signal gru_of        : STD_LOGIC;
    signal dense_init    : STD_LOGIC;
    signal dense_mult    : STD_LOGIC;
    signal dense_of      : STD_LOGIC;
    
    signal clk : std_logic := '0';
    
    signal input_index   : integer := 0;
    file output_file     : text open write_mode is "gruv4.csv";
    file input_file      : text open read_mode is "gruv4_input.mem";
begin
    -- clock
    clk <= not clk after CLK_HALF_T;
    
    -- simulation control
    sw_stimulus : process
    begin
        enable <= '0';
        wait for 5 ns;
        
        enable <= '1';
        wait for 5000 ms;
        
        enable <= '0';
        wait for 5 ns;
    end process sw_stimulus;
    
    -- update states
    process (enable, state, iteration, input_counter, feedb_counter, node_counter, layer_counter, gru_ready, input_index)
    begin
        if enable = '0' then
            nextstate <= STATE_IDLE; -- idle while not enabled
        else
            case state is
                when STATE_IDLE =>
                    if input_index < TEST_COUNT then
                        nextstate <= STATE_INIT; -- initialize first iteration when enabled
                    else
                        nextstate <= STATE_STOP; -- don't run again after it has already finished
                    end if;
                when STATE_INIT =>
                    nextstate <= STATE_BIAS_1; -- begin layer 1
                
                when STATE_BIAS_1 =>
                    nextstate <= STATE_MULTIN_1; -- begin multiply and add loop
                when STATE_MULTIN_1 =>
                    if input_counter = input_max then
                        nextstate <= STATE_MULTFB_1; -- continue to feedback inputs
                    else
                        nextstate <= STATE_MULTIN_1; -- keep multiplying inputs
                    end if;
                when STATE_MULTFB_1 =>
                    if feedb_counter = feedb_max then
                        nextstate <= STATE_ACTIVATE_1; -- call activation function
                    else
                        nextstate <= STATE_MULTFB_1; -- keep multiplying
                    end if;
                when STATE_ACTIVATE_1 =>
                    nextstate <= STATE_WAIT_1; -- wait for activation function to finish
                when STATE_WAIT_1 =>
                    if gru_ready = '0' then
                        nextstate <= STATE_WAIT_1; -- keep waiting
                    else
                        if node_counter = feedb_max then
                            nextstate <= STATE_DONE_1; -- finish layer
                        else
                            nextstate <= STATE_BIAS_1; -- move to next node
                        end if;
                    end if;
                when STATE_DONE_1 =>
                    if layer_counter = 4 then
                        nextstate <= STATE_BIAS_2; -- move to dense layer
                    else
                        nextstate <= STATE_BIAS_1; -- move to next gru layer
                    end if;
                    
                when STATE_BIAS_2 =>
                    nextstate <= STATE_MULT_2; -- begin multiply and add loop
                when STATE_MULT_2 =>
                    if input_counter = LAYER5_COUNT-1 then
                        nextstate <= STATE_ACTIVATE_2; -- call activation function
                    else
                        nextstate <= STATE_MULT_2; -- keep multiplying
                    end if;
                when STATE_ACTIVATE_2 =>
                    if node_counter = LAYER6_COUNT-1 then
                        nextstate <= STATE_DONE_2; -- finish layer
                    else
                        nextstate <= STATE_BIAS_2; -- move to next node
                    end if;
                when STATE_DONE_2 =>
                    if iteration = ITERATION_COUNT-1 then
                        nextstate <= STATE_WRITE;
                    else
                        nextstate <= STATE_BIAS_1; -- go back to layer 1
                    end if;
                
                when STATE_WRITE =>
                    if input_index < TEST_COUNT then
                        nextstate <= STATE_IDLE; -- reset
                    else
                        nextstate <= STATE_STOP;
                    end if;
                when STATE_STOP =>
                    nextstate <= STATE_STOP; -- loop forever
            end case;
        end if;
    end process;
    
    -- state functions
    --process (clk, state, iteration, input_counter, feedb_counter, node_counter, inputs, L1_weights, L2_weights, output_sel, gru_ready)
    process (clk)
        variable text_line : line;
        variable read_data : SIGNED (REG_WIDTH-1 downto 0);
    begin
        if rising_edge(clk) then
            case state is
                when STATE_IDLE =>
                    ready <= '0';
                    overflow <= '0';
                    gru_init <= '0';
                    gru_multin <= '0';
                    gru_multfb <= '0';
                    gru_finish <= '0';
                    dense_init <= '0';
                    dense_mult <= '0';
                    iteration <= 0;
                    node_counter <= 0;
                    layer_counter <= 0;
                    
                when STATE_INIT =>
                    -- load input data
                    for i in 0 to INPUT_COUNT*ITERATION_COUNT-1 loop
                        readline(input_file, text_line);
                        hread(text_line, read_data);
                        inputs(i) <= read_data(REG_WIDTH-1 downto 0);
                    end loop;
                    -- clear previous state
                    for i in 0 to LAYER1_COUNT-1 loop
                        -- L1, L2, L3, and L4 have 256 units
                        outputs_1b(i) <= (others => '0');
                        outputs_2b(i) <= (others => '0');
                        outputs_3b(i) <= (others => '0');
                        outputs_4b(i) <= (others => '0');
                    end loop;
                    for i in 0 to LAYER5_COUNT-1 loop
                        outputs_5b(i) <= (others => '0');
                    end loop;
                    output_sel <= '0';
                    
                when STATE_BIAS_1 =>
                    input_counter <= 0;
                    feedb_counter <= 0;
                    case layer_counter is
                        when 0 =>
                            gru_z <= L1_weights(node_counter*L1_INDEX + L1_BIAS_OFFS);
                            gru_r <= L1_weights(node_counter*L1_INDEX + L1_BIAS_OFFS+1);
                            gru_h <= L1_weights(node_counter*L1_INDEX + L1_BIAS_OFFS+2);
                            gru_h2 <= L1_weights(node_counter*L1_INDEX + L1_BIAS_OFFS+3);
                            input_max <= INPUT_COUNT-1;
                            feedb_max <= LAYER1_COUNT-1;
                        when 1 =>
                            gru_z <= L2_weights(node_counter*L2_INDEX + L2_BIAS_OFFS);
                            gru_r <= L2_weights(node_counter*L2_INDEX + L2_BIAS_OFFS+1);
                            gru_h <= L2_weights(node_counter*L2_INDEX + L2_BIAS_OFFS+2);
                            gru_h2 <= L2_weights(node_counter*L2_INDEX + L2_BIAS_OFFS+3);
                            input_max <= LAYER1_COUNT-1;
                            feedb_max <= LAYER2_COUNT-1;
                        when 2 =>
                            gru_z <= L3_weights(node_counter*L3_INDEX + L3_BIAS_OFFS);
                            gru_r <= L3_weights(node_counter*L3_INDEX + L3_BIAS_OFFS+1);
                            gru_h <= L3_weights(node_counter*L3_INDEX + L3_BIAS_OFFS+2);
                            gru_h2 <= L3_weights(node_counter*L3_INDEX + L3_BIAS_OFFS+3);
                            input_max <= LAYER2_COUNT-1;
                            feedb_max <= LAYER3_COUNT-1;
                        when 3 =>
                            gru_z <= L4_weights(node_counter*L4_INDEX + L4_BIAS_OFFS);
                            gru_r <= L4_weights(node_counter*L4_INDEX + L4_BIAS_OFFS+1);
                            gru_h <= L4_weights(node_counter*L4_INDEX + L4_BIAS_OFFS+2);
                            gru_h2 <= L4_weights(node_counter*L4_INDEX + L4_BIAS_OFFS+3);
                            input_max <= LAYER3_COUNT-1;
                            feedb_max <= LAYER4_COUNT-1;
                        when 4 =>
                            gru_z <= L5_weights(node_counter*L5_INDEX + L5_BIAS_OFFS);
                            gru_r <= L5_weights(node_counter*L5_INDEX + L5_BIAS_OFFS+1);
                            gru_h <= L5_weights(node_counter*L5_INDEX + L5_BIAS_OFFS+2);
                            gru_h2 <= L5_weights(node_counter*L5_INDEX + L5_BIAS_OFFS+3);
                            input_max <= LAYER4_COUNT-1;
                            feedb_max <= LAYER5_COUNT-1;
                        when others =>
                            gru_z <= (others => 'X');
                            gru_r <= (others => 'X');
                            gru_h <= (others => 'X');
                            gru_h2 <= (others => 'X');
                    end case;
                    gru_init <= '1';
                    gru_multin <= '0';
                    gru_multfb <= '0';
                    gru_finish <= '0';
                when STATE_MULTIN_1 =>
                    case layer_counter is
                        when 0 =>
                            node_input  <= inputs(iteration*INPUT_COUNT + input_counter);
                            gru_z <= L1_weights(node_counter*L1_INDEX + input_counter*3);
                            gru_r <= L1_weights(node_counter*L1_INDEX + input_counter*3+1);
                            gru_h <= L1_weights(node_counter*L1_INDEX + input_counter*3+2);
                        when 1 =>
                            if output_sel = '0' then
                                node_input <= outputs_1a(input_counter);
                            else
                                node_input <= outputs_1b(input_counter);
                            end if;
                            gru_z <= L2_weights(node_counter*L2_INDEX + input_counter*3);
                            gru_r <= L2_weights(node_counter*L2_INDEX + input_counter*3+1);
                            gru_h <= L2_weights(node_counter*L2_INDEX + input_counter*3+2);
                        when 2 =>
                            if output_sel = '0' then
                                node_input <= outputs_2a(input_counter);
                            else
                                node_input <= outputs_2b(input_counter);
                            end if;
                            gru_z <= L3_weights(node_counter*L3_INDEX + input_counter*3);
                            gru_r <= L3_weights(node_counter*L3_INDEX + input_counter*3+1);
                            gru_h <= L3_weights(node_counter*L3_INDEX + input_counter*3+2);
                        when 3 =>
                            if output_sel = '0' then
                                node_input <= outputs_3a(input_counter);
                            else
                                node_input <= outputs_3b(input_counter);
                            end if;
                            gru_z <= L4_weights(node_counter*L4_INDEX + input_counter*3);
                            gru_r <= L4_weights(node_counter*L4_INDEX + input_counter*3+1);
                            gru_h <= L4_weights(node_counter*L4_INDEX + input_counter*3+2);
                        when 4 =>
                            if output_sel = '0' then
                                node_input <= outputs_4a(input_counter);
                            else
                                node_input <= outputs_4b(input_counter);
                            end if;
                            gru_z <= L5_weights(node_counter*L5_INDEX + input_counter*3);
                            gru_r <= L5_weights(node_counter*L5_INDEX + input_counter*3+1);
                            gru_h <= L5_weights(node_counter*L5_INDEX + input_counter*3+2);
                        when others =>
                            node_input <= (others => 'X');
                            gru_z <= (others => 'X');
                            gru_r <= (others => 'X');
                            gru_h <= (others => 'X');
                    end case;
                    gru_init <= '0';
                    gru_multin <= '1';
                    gru_multfb <= '0';
                    gru_finish <= '0';
                    input_counter <= input_counter + 1;
                when STATE_MULTFB_1 =>
                    case layer_counter is
                        when 0 =>
                            if output_sel = '1' then -- opposite output stores previous state
                                node_input <= outputs_1a(feedb_counter);
                            else
                                node_input <= outputs_1b(feedb_counter);
                            end if;
                            gru_z <= L1_weights(node_counter*L1_INDEX + INPUT_COUNT*3 + feedb_counter*3);
                            gru_r <= L1_weights(node_counter*L1_INDEX + INPUT_COUNT*3 + feedb_counter*3+1);
                            gru_h <= L1_weights(node_counter*L1_INDEX + INPUT_COUNT*3 + feedb_counter*3+2);
                        when 1 =>
                            if output_sel = '1' then -- opposite output stores previous state
                                node_input <= outputs_2a(feedb_counter);
                            else
                                node_input <= outputs_2b(feedb_counter);
                            end if;
                            gru_z <= L2_weights(node_counter*L2_INDEX + LAYER1_COUNT*3 + feedb_counter*3);
                            gru_r <= L2_weights(node_counter*L2_INDEX + LAYER1_COUNT*3 + feedb_counter*3+1);
                            gru_h <= L2_weights(node_counter*L2_INDEX + LAYER1_COUNT*3 + feedb_counter*3+2);
                        when 2 =>
                            if output_sel = '1' then -- opposite output stores previous state
                                node_input <= outputs_3a(feedb_counter);
                            else
                                node_input <= outputs_3b(feedb_counter);
                            end if;
                            gru_z <= L3_weights(node_counter*L3_INDEX + LAYER2_COUNT*3 + feedb_counter*3);
                            gru_r <= L3_weights(node_counter*L3_INDEX + LAYER2_COUNT*3 + feedb_counter*3+1);
                            gru_h <= L3_weights(node_counter*L3_INDEX + LAYER2_COUNT*3 + feedb_counter*3+2);
                        when 3 =>
                            if output_sel = '1' then -- opposite output stores previous state
                                node_input <= outputs_4a(feedb_counter);
                            else
                                node_input <= outputs_4b(feedb_counter);
                            end if;
                            gru_z <= L4_weights(node_counter*L4_INDEX + LAYER3_COUNT*3 + feedb_counter*3);
                            gru_r <= L4_weights(node_counter*L4_INDEX + LAYER3_COUNT*3 + feedb_counter*3+1);
                            gru_h <= L4_weights(node_counter*L4_INDEX + LAYER3_COUNT*3 + feedb_counter*3+2);
                        when 4 =>
                            if output_sel = '1' then -- opposite output stores previous state
                                node_input <= outputs_5a(feedb_counter);
                            else
                                node_input <= outputs_5b(feedb_counter);
                            end if;
                            gru_z <= L5_weights(node_counter*L5_INDEX + LAYER4_COUNT*3 + feedb_counter*3);
                            gru_r <= L5_weights(node_counter*L5_INDEX + LAYER4_COUNT*3 + feedb_counter*3+1);
                            gru_h <= L5_weights(node_counter*L5_INDEX + LAYER4_COUNT*3 + feedb_counter*3+2);
                        when others =>
                            node_input <= (others => 'X');
                            gru_z <= (others => 'X');
                            gru_r <= (others => 'X');
                            gru_h <= (others => 'X');
                    end case;
                    gru_init <= '0';
                    gru_multin <= '0';
                    gru_multfb <= '1';
                    gru_finish <= '0';
                    feedb_counter <= feedb_counter + 1;
                when STATE_ACTIVATE_1 =>
                    if output_sel = '1' then -- opposite output stores previous state
                        case layer_counter is
                            when 0 =>
                                node_input <= outputs_1a(node_counter);
                            when 1 =>
                                node_input <= outputs_2a(node_counter);
                            when 2 =>
                                node_input <= outputs_3a(node_counter);
                            when 3 =>
                                node_input <= outputs_4a(node_counter);
                            when 4 =>
                                node_input <= outputs_5a(node_counter);
                            when others =>
                                node_input <= (others => 'X');
                        end case;
                    else
                        case layer_counter is
                            when 0 =>
                                node_input <= outputs_1b(node_counter);
                            when 1 =>
                                node_input <= outputs_2b(node_counter);
                            when 2 =>
                                node_input <= outputs_3b(node_counter);
                            when 3 =>
                                node_input <= outputs_4b(node_counter);
                            when 4 =>
                                node_input <= outputs_5b(node_counter);
                            when others =>
                                node_input <= (others => 'X');
                        end case;
                    end if;
                    gru_init <= '0';
                    gru_multin <= '0';
                    gru_multfb <= '0';
                    gru_finish <= '1';
                when STATE_WAIT_1 =>
                    gru_init <= '0';
                    gru_multin <= '0';
                    gru_multfb <= '0';
                    gru_finish <= '0';
                    if gru_ready = '1' then
                        if output_sel = '0' then
                            case layer_counter is
                                when 0 =>
                                    outputs_1a(node_counter) <= gru_output;
                                when 1 =>
                                    outputs_2a(node_counter) <= gru_output;
                                when 2 =>
                                    outputs_3a(node_counter) <= gru_output;
                                when 3 =>
                                    outputs_4a(node_counter) <= gru_output;
                                when 4 =>
                                    outputs_5a(node_counter) <= gru_output;
                                when others =>
                                    -- nothing
                            end case;
                        else
                            case layer_counter is
                                when 0 =>
                                    outputs_1b(node_counter) <= gru_output;
                                when 1 =>
                                    outputs_2b(node_counter) <= gru_output;
                                when 2 =>
                                    outputs_3b(node_counter) <= gru_output;
                                when 3 =>
                                    outputs_4b(node_counter) <= gru_output;
                                when 4 =>
                                    outputs_5b(node_counter) <= gru_output;
                                when others =>
                                    -- nothing
                            end case;
                        end if;
                        overflow <= overflow or gru_of;
                        node_counter <= node_counter + 1;
                    end if;
                when STATE_DONE_1 =>
                    dense_init <= '0';
                    dense_mult <= '0';
                    node_counter <= 0;
                    layer_counter <= layer_counter + 1;
                    
                when STATE_BIAS_2 =>
                    input_counter <= 0;
                    node_input <= L6_weights(node_counter*L6_INDEX + L6_BIAS_OFFS);
                    dense_init <= '1';
                    dense_mult <= '0';
                when STATE_MULT_2 =>
                    if output_sel = '0' then
                        node_input <= outputs_5a(input_counter);
                    else
                        node_input <= outputs_5b(input_counter);
                    end if;
                    dense_weight <= L6_weights(node_counter*L6_INDEX + input_counter);
                    dense_init <= '0';
                    dense_mult <= '1';
                    input_counter <= input_counter + 1;
                when STATE_ACTIVATE_2 =>
                    dense_init <= '0';
                    dense_mult <= '0';
                    outputs_6(node_counter) <= dense_output;
                    node_counter <= node_counter + 1;
                    
                when STATE_DONE_2 =>
                    
                    write(text_line, iteration);
                    for i in 0 to OUTPUT_COUNT-1 loop
                        write(text_line, ',');
                        write(text_line, to_integer(outputs_6(i)));
                    end loop;
                    writeline(output_file, text_line);
                    
                    node_counter <= 0;
                    overflow <= overflow or dense_of;
                    if iteration = ITERATION_COUNT-1 then
                        ready <= '1';
                    else
                        ready <= '0';
                        output_sel <= not output_sel; -- swap output with previous state
                        iteration <= iteration + 1; -- next iteration
                        layer_counter <= 0; -- back to layer 1
                    end if;
                
                when STATE_WRITE =>
                    --write(text_line, input_index);
                    --for i in 0 to OUTPUT_COUNT-1 loop
                    --    write(text_line, ',');
                    --    write(text_line, to_integer(outputs_6(i)));
                    --end loop;
                    --writeline(output_file, text_line);
                    input_index <= input_index + 1;
                when STATE_STOP =>
                    -- nothing
            end case;
            state <= nextstate;
        end if;
    end process;
    
    -- Components
    gruu : gru_tanh_relu
        Port map (
            clk        => clk,
            i_initbias => gru_init,
            i_multin   => gru_multin,
            i_multfb   => gru_multfb,
            i_finish   => gru_finish,
            i_input    => node_input,
            i_weight_z => gru_z,
            i_weight_r => gru_r,
            i_weight_h => gru_h,
            i_bias_h2  => gru_h2,
            o_output   => gru_output,
            o_ready    => gru_ready,
            o_overflow => gru_of
        );
    dense : dense_relu
        Port map (
            clk        => clk,
            i_initbias => dense_init,
            i_mult     => dense_mult,
            i_input    => node_input,
            i_weight   => dense_weight,
            o_output   => dense_output,
            o_overflow => dense_of
        );
    
end Behavioral;
