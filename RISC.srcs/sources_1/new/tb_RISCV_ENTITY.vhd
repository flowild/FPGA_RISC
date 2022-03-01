library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity tb_RISCV_ENTITY is
--  Port ( );
end tb_RISCV_ENTITY;

architecture Behavioral of tb_RISCV_ENTITY is

component RISCV_ENTITY IS
            PORT (  reset: IN STD_LOGIC;
                    clk: IN STD_LOGIC);
           
end component;

signal reset : STD_LOGIC := '0';
signal clk : STD_LOGIC := '0';




begin

DUT : RISCV_ENTITY port map (reset, clk);
process
    begin


end process;
    
process
    begin
    
       clk <= '1';
       wait FOR 50ns; 
       clk <= '0';
       wait FOR 50ns; 
        
end process;

end Behavioral;
