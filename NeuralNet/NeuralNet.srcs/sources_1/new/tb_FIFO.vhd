----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2023 05:00:33 PM
-- Design Name: 
-- Module Name: tb_fifo - Behavioral
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity tb_FIFO is
--  Port ( );
end tb_FIFO;

architecture tb of tb_fifo is
    constant write_clock_period : time := 1ns;  --10 Mhz
    constant read_clock_period : time := 4ns;  --10 Mhz
    -- inputs
    signal rst : STD_LOGIC;
    signal wr_clk :  STD_LOGIC;
    signal rd_clk :  STD_LOGIC;
    signal din : STD_LOGIC_VECTOR(98 DOWNTO 0);
    signal wr_en : STD_LOGIC;
    signal rd_en : STD_LOGIC;
    -- outputs
    signal dout : STD_LOGIC_VECTOR(98 DOWNTO 0);
    signal full : STD_LOGIC;
    signal empty : STD_LOGIC;
   
begin
   
   
   -- connecting testbench signals with half_adder.vhd
    UUT : entity work.inFIFO port map (
    rst => rst,
    wr_clk => wr_clk,
    rd_clk => rd_clk,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty
    );



WriteClock_process: process
    begin
    	wr_clk <= '0';
    	wait for write_clock_period/2;
    	wr_clk <= '1';
    	wait for write_clock_period/2;
    end process;

ReadClock_process: process
begin
    rd_clk <= '1';
    wait for read_clock_period/2;
    rd_clk <= '0';
    wait for read_clock_period/2;
end process;

Stimulus_process: process
begin
    wr_en <= '0'; 
    rd_en <= '0';
    wait for write_clock_period;
    wr_en <= '0';
    wr_en <= '1'; 
    rd_en <= '1';
    din <= std_logic_vector(to_unsigned(1, din'length));

   for i in 1 to 255 loop
        din <= std_logic_vector(to_unsigned(i, din'length));
        wait for 1 ns;
        
    end loop;

end process;      
end tb ;
