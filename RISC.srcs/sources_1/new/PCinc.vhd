LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PCinc is
    Port (  Input : IN std_logic_vector (31 downto 0);
            Output : OUT std_logic_vector (31 downto 0));   
            
end PCinc;

architecture Behavioral of PCinc is

begin
    process (Input)
        begin
            Output <= (Input + "00000000000000000000000000000001"); --1 addieren?
            --Output <= (Input + "00000000000000000000000000000100"); --4 addieren
    end process;
end Behavioral;
