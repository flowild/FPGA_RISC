LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY MPlex IS
    PORT (  Input0: IN std_logic_vector (31 downto 0);
            Input1: IN std_logic_vector (31 downto 0);
            Output: OUT std_logic_vector (31 downto 0);
            Control: IN std_logic);

END MPlex;

architecture Dataflow of MPlex is

signal buff: std_logic_vector (31 downto 0);
--signal Input1: std_logic_vector (31 downto 0);
--signal Output: std_logic_vector (31 downto 0);
--signal Control: std_logic);

begin

Output (31 downto 0) <= Input0 when (Control = '0') ELSE
                        Input1 when (Control = '1') ;

end Dataflow;
