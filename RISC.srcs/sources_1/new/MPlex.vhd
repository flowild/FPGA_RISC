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


begin

            with Control select 
                Output(31 downto 0)     <=  Input0 WHEN '0',    
                                            Input1 WHEN '1',     
                                            x"00000000" WHEN Others;

end Dataflow;
