LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY datapath1 IS
    PORT (  start: IN STD_LOGIC;
            stop: IN STD_LOGIC;
            reset: IN STD_LOGIC;
            clk: IN STD_LOGIC;
            run: OUT STD_LOGIC;
            led : OUT STD_LOGIC_VECTOR (9 downto 0));

            
END datapath1;
ARCHITECTURE Behavioral OF datapath1 IS

    COMPONENT PC IS
        PORT (  clk: IN STD_LOGIC;
                reset: IN STD_LOGIC;
                newPC: OUT std_logic_vector (31 downto 0));
    END COMPONENT;



--signal count1_int: STD_LOGIC;
--signal count2_int: STD_LOGIC;
--signal load1_int: STD_LOGIC;
--signal load2_int: STD_LOGIC;
signal newPC_int: std_logic_vector;


begin --architecture

X1: PC PORT MAP (clk, reset, newPC_int);



end Behavioral; --architecture