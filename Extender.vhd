LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extender is
    Port (  Input : IN std_logic_vector (11 downto 0);
            ImmExt : OUT std_logic_vector (31 downto 0));   
            
end Extender;

architecture Behavioral of Extender is

begin
    process (Input)
        begin
            CASE Input(11) IS
                when '1' => 
                        ImmExt(31 downto 12) <= "1";
                        ImmExt(11 downto 0) <= Input;
                when '0' => --
                        ImmExt(31 downto 12) <= "0";
                        ImmExt(11 downto 0) <= Input;
                when others => 
                        ImmExt <= "00000000";
                
                

        END CASE;
    end process;
end Behavioral;
