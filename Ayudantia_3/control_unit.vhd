----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.08.2023 17:03:07
-- Design Name: 
-- Module Name: control_unit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( clk : in STD_LOGIC;
           alu_flag : in STD_LOGIC;
           pc : out std_logic_vector(1 downto 0));
end control_unit;

architecture Behavioral of control_unit is
constant max_count   : integer := 125000000;
signal clk_counter   : integer range 0 to max_count := 0;
signal cont : integer := 0;
signal alu_flag_r : std_logic := '0';

begin

process(clk)
begin

if rising_edge(clk) then
    if ((alu_flag_r /= alu_flag) and (alu_flag = '1') and (alu_flag_r = '0')) then
        cont <= cont + 1;
     else
        cont <= cont;
     end if;
        
    alu_flag_r <= alu_flag;
    
    if (clk_counter < max_count) then
        clk_counter <= clk_counter + 1;
    else
        if cont <= 3 then
            pc <= std_logic_vector(to_unsigned(cont, 2));
        end if;
        clk_counter <= 0;
        
    end if;
       
     
--    if cont <= 3 then
--        pc <= std_logic_vector(to_unsigned(cont, 2));
--    end if;
end if;

end process;    





end Behavioral;
