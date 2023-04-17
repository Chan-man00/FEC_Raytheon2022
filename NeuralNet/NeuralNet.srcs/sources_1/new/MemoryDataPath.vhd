----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2023 07:17:50 PM
-- Design Name: 
-- Module Name: MemoryDataPath - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_MISC.ALL;



-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity MemoryDataPath is
  Port ( 
        i_wr_clk : in STD_LOGIC;
        i_rd_clk : in STD_LOGIC;
        i_din : in STD_LOGIC_VECTOR(31 DOWNTO 0);
        i_wr_en : in STD_LOGIC
    );
end MemoryDataPath;

architecture Behavioral of MemoryDataPath is
    --constants
    constant REG_WIDTH    : integer := 32; -- total number of bits
    constant FIXED_POINT  : integer := 16; -- number of fractional bits (i.e. (1<<FIXED_POINT) == 1.0)
    constant TEST_COUNT   : integer := 10; -- all 10000 takes a very long time
    constant INPUT_COUNT  : integer := 28;
    constant LAYER1_COUNT : integer := 64;
    constant LAYER2_COUNT : integer := 10;
    constant OUTPUT_COUNT : integer := 10; 
    constant L1_BIAS_OFFS : integer := (INPUT_COUNT + LAYER1_COUNT)*3;
    constant L2_BIAS_OFFS : integer := LAYER1_COUNT;
    constant L1_INDEX     : integer := (L1_BIAS_OFFS + 4);
    constant L2_INDEX     : integer := (LAYER1_COUNT + 1);
    constant L1_WEIGHT_CT : integer := L1_INDEX * LAYER1_COUNT;
    constant L2_WEIGHT_CT : integer := L2_INDEX * LAYER2_COUNT;
    

    --FIFO
    -- signal wr_clk :  STD_LOGIC;
    -- signal rd_clk :  STD_LOGIC;
    -- signal din :  STD_LOGIC_VECTOR(98 DOWNTO 0);
    -- signal wr_en :  STD_LOGIC;
    signal rd_en :  STD_LOGIC;
    signal dout :  STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal full :  STD_LOGIC;
    signal empty :  STD_LOGIC;
    

    --memory 1
    
    signal addrBasic1 :  STD_LOGIC_VECTOR(14 DOWNTO 0);
    signal doutBasic1 :  STD_LOGIC_VECTOR(31 DOWNTO 0);

    --memory 2

    signal addrBasic2 : STD_LOGIC_VECTOR(9 DOWNTO 0);
    signal doutBasic2 : STD_LOGIC_VECTOR(31 DOWNTO 0);

    --gru 
    signal node_input    : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_init      : STD_LOGIC;
    signal gru_multin    : STD_LOGIC;
    signal gru_multfb    : STD_LOGIC;
    signal gru_finish    : STD_LOGIC;
    signal gru_ready     : STD_LOGIC;
    signal gru_of        : STD_LOGIC;
    signal gru_z         : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_r         : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_h         : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_h2        : SIGNED (REG_WIDTH-1 downto 0);
    signal gru_output    : SIGNED (REG_WIDTH-1 downto 0);

    --dense
    signal dense_weight  : SIGNED (REG_WIDTH-1 downto 0);
    signal dense_output  : SIGNED (REG_WIDTH-1 downto 0);
    signal dense_init    : STD_LOGIC;
    signal dense_mult    : STD_LOGIC;
    signal dense_finish  : STD_LOGIC;

    --clock
    signal clk : std_logic := '0';


    --Array type
    type SIGNED_ARRAY is array (natural range <>) of Signed;

    --states

   type STATE_TYPE is (STATE_IDLE, STATE_INIT,
                        STATE_BIAS_1, STATE_MULTIN_1, STATE_MULTFB_1,LOAD_STATE_MULTFB_1,LOAD_STATE_MULTFB_2,LOAD_STATE_MULTFB_3, STATE_ACTIVATE_1, STATE_WAIT_1, STATE_DONE_1,
                        STATE_BIAS_2, STATE_MULT_2, STATE_ACTIVATE_2, STATE_WAIT_2a, STATE_WAIT_2b, STATE_DONE_2,
                        STATE_WRITE, STATE_STOP,STATE_LOAD_INPUT_FROM_FIFO,SAVE_STATE_MULTFB_1,SAVE_STATE_MULTFB_2,SAVE_STATE_MULTFB_3,LOAD_STATE_MULTIN_1,LOAD_STATE_MULTIN_2,LOAD_STATE_MULTIN_3,
                        SAVE_STATE_MULTIN_1,SAVE_STATE_MULTIN_2,SAVE_STATE_MULTIN_3,LOAD_BIAS_0,LOAD_BIAS_1,LOAD_BIAS_2,LOAD_BIAS_3,SAVE_BIAS_0,SAVE_BIAS_1,SAVE_BIAS_2,SAVE_BIAS_3,
                        LOAD_STATE_BIAS_2,LOAD_STATE_MULT_2);


    
    --other

    signal state     : STATE_TYPE := STATE_IDLE;
    signal nextstate : STATE_TYPE := STATE_IDLE;
    
    signal iteration     : integer range 0 to INPUT_COUNT-1 := 0;
    signal input_counter : integer range 0 to INPUT_COUNT-1 := 0;
    signal feedb_counter : integer range 0 to INPUT_COUNT-1 := 0;
    signal node_counter  : integer range 0 to LAYER1_COUNT-1 := 0;
    

     -- layer weights & test input
    signal inputs     : SIGNED_ARRAY(0 to INPUT_COUNT*INPUT_COUNT-1)(REG_WIDTH-1 downto 0);
    
    signal enable     : STD_LOGIC := '0';
    signal outputs_1a : SIGNED_ARRAY(0 to LAYER1_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_1b : SIGNED_ARRAY(0 to LAYER1_COUNT-1)(REG_WIDTH-1 downto 0);
    signal outputs_2  : SIGNED_ARRAY(0 to OUTPUT_COUNT-1)(REG_WIDTH-1 downto 0);
    signal overflow   : STD_LOGIC := '0';
    signal ready      : STD_LOGIC := '0';
    signal selection  : STD_LOGIC_VECTOR(3 downto 0) := "1111";
    
    -- indicates which output array is active for layer 1
    signal output_sel : STD_LOGIC := '0';
    signal input_index   : integer := 0;

    -- calculation registers
    signal value_MULTFB_1 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_MULTFB_2 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_MULTFB_3 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);

    signal value_MULTIN_1 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_MULTIN_2 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_MULTIN_3 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);

    --Bias
    signal value_BIAS_0 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_BIAS_1 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_BIAS_2 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);
    signal value_BIAS_3 : STD_LOGIC_VECTOR (REG_WIDTH-1 downto 0);

    

begin
 
  fifo : entity work.inFIFO 
  port map (
    wr_clk => i_wr_clk,
    rd_clk => i_rd_clk,
    din => i_din,
    wr_en => i_wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty
    );

    mem1 : entity work.basic1MEM 
    port map (
        clka => clk,
        addra => addrBasic1,
        douta => doutBasic1
    );

    mem2 : entity work.basic2MEM 
    port map (
        clka => clk,
        addra => addrBasic2,
        douta => doutBasic2
    );

    gru : entity work.gru 
    generic map  (
            REG_WIDTH   => REG_WIDTH,
            FIXED_POINT => FIXED_POINT
        )
    port map (
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

 dense : entity work.dense_sigmoid 
    generic map (
            REG_WIDTH  => REG_WIDTH,
            FIXED_POINT => FIXED_POINT
        )
    port map (
        clk        => clk,
        i_initbias => dense_init,
        i_mult     => dense_mult,
        i_finish   => dense_finish,
        i_input    => node_input,
        i_weight   => dense_weight,
        o_output   => dense_output
    );
    -- clock
     
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
    process (enable, state, iteration, input_counter, feedb_counter, node_counter, gru_ready, input_index)
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
                    nextstate <= LOAD_BIAS_0;
                    
                when LOAD_BIAS_0 =>
                    nextstate <= SAVE_BIAS_0; -- begin layer 1
                
                when SAVE_BIAS_0 =>
                    nextstate <= LOAD_BIAS_1;

                when LOAD_BIAS_1 =>
                    nextstate <= SAVE_BIAS_1; -- begin layer 1
                
                when SAVE_BIAS_1 =>
                    nextstate <= LOAD_BIAS_2;

                when LOAD_BIAS_2 =>
                    nextstate <= SAVE_BIAS_2; -- begin layer 1
                
                when SAVE_BIAS_2 =>
                    nextstate <= LOAD_BIAS_3;

                when LOAD_BIAS_3 =>
                    nextstate <= SAVE_BIAS_3; -- begin layer 1
                
                when SAVE_BIAS_3 =>
                    nextstate <= STATE_BIAS_1;

                when STATE_BIAS_1 =>
                    nextstate <= STATE_LOAD_INPUT_FROM_FIFO; -- begin multiply and add loop
                when STATE_LOAD_INPUT_FROM_FIFO =>
                    nextstate <= LOAD_STATE_MULTIN_1;

                when LOAD_STATE_MULTIN_1 =>
                    nextstate <= SAVE_STATE_MULTIN_1;

                when SAVE_STATE_MULTIN_1 =>
                    nextstate <= LOAD_STATE_MULTIN_2;
                              
                when LOAD_STATE_MULTIN_2 =>
                    nextstate <= SAVE_STATE_MULTIN_2;

                when SAVE_STATE_MULTIN_2 =>
                    nextstate <= LOAD_STATE_MULTIN_3;
                
                when LOAD_STATE_MULTIN_3 =>
                    nextstate <= SAVE_STATE_MULTIN_3;

                when SAVE_STATE_MULTIN_3 =>
                    nextstate <= STATE_MULTIN_1;

                when STATE_MULTIN_1 =>
                    if input_counter = INPUT_COUNT-1 then
                        nextstate <= LOAD_STATE_MULTFB_1; -- continue to feedback inputs
                    else
                        nextstate <= STATE_LOAD_INPUT_FROM_FIFO; -- keep multiplying inputs
                    end if;
                -- load 3 weight from RAM
                when LOAD_STATE_MULTFB_1 =>
                    nextstate <= SAVE_STATE_MULTFB_1;

                when SAVE_STATE_MULTFB_1 =>
                    nextstate <= LOAD_STATE_MULTFB_2;

                when LOAD_STATE_MULTFB_2 =>
                    nextstate <= SAVE_STATE_MULTFB_2;

                when SAVE_STATE_MULTFB_2 =>
                    nextstate <= LOAD_STATE_MULTFB_3;
                
                when LOAD_STATE_MULTFB_3 =>
                    nextstate <= SAVE_STATE_MULTFB_3;

                when SAVE_STATE_MULTFB_3 =>
                    nextstate <= STATE_MULTFB_1;

                when STATE_MULTFB_1 =>
                    if feedb_counter = LAYER1_COUNT-1 then
                        nextstate <= STATE_ACTIVATE_1; -- call activation function
                    else
                        nextstate <= LOAD_STATE_MULTFB_1; -- keep multiplying
                    end if;
                when STATE_ACTIVATE_1 =>
                    nextstate <= STATE_WAIT_1; -- wait for activation function to finish
                when STATE_WAIT_1 =>
                    if gru_ready = '0' then
                        nextstate <= STATE_WAIT_1; -- keep waiting
                    else
                        if node_counter = LAYER1_COUNT-1 then
                            nextstate <= STATE_DONE_1; -- finish layer
                        else
                            nextstate <= LOAD_BIAS_0; -- move to next node
                        end if;
                    end if;
                when STATE_DONE_1 =>
                    nextstate <= LOAD_STATE_BIAS_2; -- move to layer 2

                when LOAD_STATE_BIAS_2 =>
                    nextstate <= STATE_BIAS_2;
                when LOAD_STATE_MULT_2 =>
                    nextstate <= STATE_MULT_2;
                when STATE_BIAS_2 =>
                    nextstate <= LOAD_STATE_MULT_2; -- begin multiply and add loop
                when STATE_MULT_2 =>
                    if input_counter = LAYER1_COUNT-1 then
                        nextstate <= STATE_ACTIVATE_2; -- call activation function
                    else
                        nextstate <= LOAD_STATE_MULT_2; -- keep multiplying
                    end if;
                when STATE_ACTIVATE_2 =>
                    nextstate <= STATE_WAIT_2a; -- wait for activation function to finish (1st clock)
                when STATE_WAIT_2a =>
                    nextstate <= STATE_WAIT_2b; -- wait for activation function to finish (2nd clock)
                when STATE_WAIT_2b =>
                    if node_counter = LAYER2_COUNT-1 then
                        nextstate <= STATE_DONE_2; -- finish layer
                    else
                        nextstate <= LOAD_STATE_BIAS_2;-- move to next node
                    end if;
                when STATE_DONE_2 =>
                    if iteration = INPUT_COUNT-1 then
                        nextstate <= STATE_WRITE;
                    else
                        nextstate <= LOAD_BIAS_0; -- go back to layer 1
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
    process (clk, state, iteration, input_counter, feedb_counter, node_counter, inputs, output_sel, gru_ready)
        -- variable text_line : line;
        -- variable read_data : SIGNED (REG_WIDTH-1 downto 0);
       


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
                    dense_finish <= '0';
                    iteration <= 0;
                    node_counter <= 0;
                    
                when STATE_INIT =>
                    -- load input data
                    -- for i in 0 to INPUT_COUNT*INPUT_COUNT-1 loop
                    --     readline(input_file, text_line);
                    --     hread(text_line, read_data);
                    --     inputs(i) <= read_data;
                    -- end loop;
                    -- clear previous state
                    -- This memory should be the fifo, is the one recieving data
                    for i in 0 to LAYER1_COUNT-1 loop
                        outputs_1b(i) <= (others => '0');
                    end loop;
                    output_sel <= '0';

                when LOAD_BIAS_0 =>
                    addrBasic1 <= std_logic_vector(to_signed((node_counter*L1_INDEX) + L1_BIAS_OFFS, addrBasic1'length));

                when SAVE_BIAS_0  =>
                    value_BIAS_0 <= doutBasic1;

                when LOAD_BIAS_1 =>
                    addrBasic1 <= std_logic_vector(to_signed((((node_counter*L1_INDEX) + L1_BIAS_OFFS)+1), addrBasic1'length));

                when SAVE_BIAS_1  =>
                    value_BIAS_1 <= doutBasic1;
                
                when LOAD_BIAS_2 =>
                    addrBasic1 <= std_logic_vector(to_signed((((node_counter*L1_INDEX) + L1_BIAS_OFFS)+2), addrBasic1'length));

                when SAVE_BIAS_2  =>
                    value_BIAS_2 <= doutBasic1;

                when LOAD_BIAS_3 =>
                    addrBasic1 <= std_logic_vector(to_signed((((node_counter*L1_INDEX) + L1_BIAS_OFFS)+3), addrBasic1'length));

                when SAVE_BIAS_3  =>
                    value_BIAS_3 <= doutBasic1;

                when STATE_BIAS_1 =>
                -- load L1 weights
                    input_counter <= 0;
                    feedb_counter <= 0;
                    gru_z <= signed(value_BIAS_0);
                    gru_r <= signed(value_BIAS_1);
                    gru_h <= signed(value_BIAS_2);
                    gru_h2 <= signed(value_BIAS_3);
                    gru_init <= '1';
                    gru_multin <= '0';
                    gru_multfb <= '0';
                    gru_finish <= '0';
                
                when STATE_LOAD_INPUT_FROM_FIFO =>
                    rd_en <= '1'; --enable read on fifo
                    -- input_addra <= (iteration*INPUT_COUNT + input_counter);

                when LOAD_STATE_MULTIN_1 =>
                    addrBasic1 <= std_logic_vector(to_signed((node_counter*L1_INDEX + input_counter*3), addrBasic1'length));
                
                when SAVE_STATE_MULTIN_1 =>
                    value_MULTIN_1 <= doutBasic1;
                
                when LOAD_STATE_MULTIN_2 =>
                    addrBasic1 <= std_logic_vector(to_signed(((node_counter*L1_INDEX + input_counter*3) + 1), addrBasic1'length));
                
                when SAVE_STATE_MULTIN_2 =>
                    value_MULTIN_2  <= doutBasic1;
                
                when LOAD_STATE_MULTIN_3 =>
                    addrBasic1 <= std_logic_vector(to_signed(((node_counter*L1_INDEX + input_counter*3) + 2), addrBasic1'length));
                
                when SAVE_STATE_MULTIN_3 =>
                    value_MULTIN_3 <= doutBasic1;

                when STATE_MULTIN_1 =>
                    --load node input, currently RAM loads values in 2 cycles
                    -- FIFO out
                    node_input  <=  signed(dout);
                    
                    -- node_input  <= signed(dout);
                    gru_z <= signed(value_MULTIN_1);
                    gru_r <= signed(value_MULTIN_2);
                    gru_h <= signed(value_MULTIN_3);
                    gru_init <= '0';
                    gru_multin <= '1';
                    gru_multfb <= '0';
                    gru_finish <= '0';
                    input_counter <= input_counter + 1;
                when LOAD_STATE_MULTFB_1 =>
                    addrBasic1 <= std_logic_vector(to_signed((node_counter*L1_INDEX + INPUT_COUNT*3 + feedb_counter*3), addrBasic1'length));
                
                when SAVE_STATE_MULTFB_1 =>
                    value_MULTFB_1 <= doutBasic1;
                
                when LOAD_STATE_MULTFB_2 =>
                    addrBasic1 <= std_logic_vector(to_signed((node_counter*L1_INDEX + INPUT_COUNT*3 + feedb_counter*3 + 1), addrBasic1'length));
                
                when SAVE_STATE_MULTFB_2 =>
                    value_MULTFB_2 <= doutBasic1;
                
                when LOAD_STATE_MULTFB_3 =>
                    addrBasic1 <= std_logic_vector(to_signed((node_counter*L1_INDEX + INPUT_COUNT*3 + feedb_counter*3 + 3), addrBasic1'length));
                
                when SAVE_STATE_MULTFB_3 =>
                    value_MULTFB_3 <= doutBasic1;
                
                when STATE_MULTFB_1 =>
                    if output_sel = '1' then -- opposite output stores previous state
                        node_input <= outputs_1a(feedb_counter);
                    else
                        node_input <= outputs_1b(feedb_counter);
                    end if;
                    gru_z <= signed(value_MULTFB_1);
                    gru_r <= signed(value_MULTFB_2);
                    gru_h <= signed(value_MULTFB_3);
                    gru_init <= '0';
                    gru_multin <= '0';
                    gru_multfb <= '1';
                    gru_finish <= '0';
                    feedb_counter <= feedb_counter + 1;
                when STATE_ACTIVATE_1 =>
                    if output_sel = '1' then
                        node_input <= outputs_1a(node_counter);
                    else
                        node_input <= outputs_1b(node_counter);
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
                            outputs_1a(node_counter) <= gru_output;
                        else
                            outputs_1b(node_counter) <= gru_output;
                        end if;
                        overflow <= overflow or gru_of;
                        node_counter <= node_counter + 1;
                    end if;
                when STATE_DONE_1 =>
                    dense_init <= '0';
                    dense_mult <= '0';
                    dense_finish <= '0';
                    node_counter <= 0;

                when LOAD_STATE_BIAS_2 =>
                    addrBasic2 <=  std_logic_vector(to_signed((node_counter*L2_INDEX + L2_BIAS_OFFS), addrBasic2'length));
                when STATE_BIAS_2 =>
                    input_counter <= 0;
                    node_input <= signed(doutBasic2);
                    dense_init <= '1';
                    dense_mult <= '0';
                    dense_finish <= '0';

                when LOAD_STATE_MULT_2 =>
                    addrBasic2 <= std_logic_vector(to_signed((node_counter*L2_INDEX + input_counter), addrBasic2'length));
                when STATE_MULT_2 =>
                    if output_sel = '0' then
                        node_input <= outputs_1a(input_counter);
                    else
                        node_input <= outputs_1b(input_counter);
                    end if;
                    dense_weight <= signed(doutBasic2);
                    dense_init <= '0';
                    dense_mult <= '1';
                    dense_finish <= '0';
                    input_counter <= input_counter + 1;
                when STATE_ACTIVATE_2 =>
                    dense_init <= '0';
                    dense_mult <= '0';
                    dense_finish <= '1';
                when STATE_WAIT_2a =>
                    dense_init <= '0';
                    dense_mult <= '0';
                    dense_finish <= '0';
                when STATE_WAIT_2b =>
                    outputs_2(node_counter) <= dense_output;
                    node_counter <= node_counter + 1;
                    
                when STATE_DONE_2 =>
                    node_counter <= 0;
                    if iteration = INPUT_COUNT-1 then
                        ready <= '1';
                    else
                        ready <= '0';
                        output_sel <= not output_sel; -- swap output with previous state
                        iteration <= iteration + 1; -- next iteration
                    end if;
                
                when STATE_WRITE =>
                    -- write(text_line, input_index);
                    -- write(text_line, ',');
                    -- write(text_line, to_integer(unsigned(selection)));
                    -- for i in 0 to OUTPUT_COUNT-1 loop
                    --     write(text_line, ',');
                    --     write(text_line, to_integer(outputs_2(i)));
                    -- end loop;
                    -- writeline(output_file, text_line);
                    input_index <= input_index + 1;
                when STATE_STOP =>
                    -- nothing
            end case;
            state <= nextstate;
        end if;
    end process;


end Behavioral;

