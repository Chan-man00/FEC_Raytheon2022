----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 11:29:11 AM
-- Design Name: 
-- Module Name: memTest - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_mem is
--  Port ( );
end tb_mem;

architecture tb of tb_mem is
    constant clock_period : time := 4ns;  --10 Mhz
    signal clka : STD_LOGIC;
    signal ena :  STD_LOGIC;
    signal wea :  STD_LOGIC_VECTOR(0 DOWNTO 0);
    signal addra :  STD_LOGIC_VECTOR(18 DOWNTO 0);
    signal dina :  STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal douta :  STD_LOGIC_VECTOR(31 DOWNTO 0);
   
begin
   
   
   -- connecting testbench signals with mem.vhd
    UUT : entity work.InitMem port map (
    clka => clka,
    ena => ena,
    wea => wea,
    addra => addra,
    dina => dina,
    douta => douta
    );


Clock_process: process
    begin
    	clka <= '0';
    	wait for clock_period/2;
    	clka <= '1';
    	wait for clock_period/2;
    end process;

Stimulus_process: process
begin
    ena <= '0'; 
    wait for clock_period;
    ena <= '1'; 

end process;

end tb ;