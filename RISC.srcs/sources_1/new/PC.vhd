LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PC IS
    PORT (  clk: IN STD_LOGIC;
            reset: IN STD_LOGIC;
            Input: IN std_logic_vector (31 downto 0);
            Output: OUT std_logic_vector (31 downto 0));

END PC;

architecture Behavioral of PC is

begin

PROCESS (reset, clk)
      BEGIN

            IF (reset = '1') THEN
                Output <= x"00000000";
                
            ELSIF (clk'EVENT AND clk = '1') THEN
                Output <= Input;
                
            END IF;

END PROCESS;


end Behavioral;
