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

signal start : STD_LOGIC := '0';
signal stop : STD_LOGIC := '0';
signal reset : STD_LOGIC := '0';
signal clock : STD_LOGIC := '0';
signal run : STD_LOGIC := '0';
signal led : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";


begin

DUT : RISCV_ENTITY port map (start, stop, reset, clock, run, led);
process
    begin
    
start<= '1';
wait for 30ms;
start <= '0';
wait for 150ms;
stop <= '1';
wait for 30ms;
stop <= '0';
wait for 100ms;
start<= '1';
wait for 30ms;
start <= '0';
wait for 150ms;
reset <= '1';
wait for 30ms;
reset <= '0';
wait for 150ms;
stop <= '1';
wait for 30ms;
stop <= '0';
wait for 100ms;










--clock <= '1';
--wait for  50 ns;
--clock <= '0';
--wait for  50 ns;
--clock <= '1';
--start <= '1';
--wait for  50 ns;
--clock <= '0';
--wait for  50 ns;
--clock <= '1';
--wait for  50 ns;
--clock <= '0';
--wait for  50 ns;
--clock <= '1';
--wait for  50 ns;
--clock <= '0';
--wait for  50 ns;
--clock <= '1';
--wait for  50 ns;

--    IF (clock = '0') then
--        clock <= '1';
--    ELSE 
--        clock <= '0';
--    END IF;
     
--    WAIT FOR 50ns;
    
--    IF (clock = '0') then
--        clock <= '1';
--    ELSE 
--        clock <= '0';
--    END IF;
     
--    WAIT FOR 50ns;




end process;

end Behavioral;
