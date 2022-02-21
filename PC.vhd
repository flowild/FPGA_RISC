LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY PC IS
    PORT (  clk: IN STD_LOGIC;
            reset: IN STD_LOGIC;
            newPC: OUT std_logic_vector (31 downto 0));

END PC;

architecture Behavioral of PC is

begin

PROCESS (reset, clk)
        
            VARIABLE value: INTEGER RANGE 0 TO 127 :=0;
            BEGIN

            IF (reset = '1') THEN
                value := 0;
                
            ELSIF (clk'EVENT AND clk = '1') THEN
                value := value + 4;  
                newPC <= std_logic_vector(value);
                
            END IF;

        END PROCESS;


end Behavioral;
