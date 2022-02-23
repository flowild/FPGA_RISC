LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extender is
    Port (  Input : IN std_logic_vector (23 downto 0);
            ImmExt : OUT std_logic_vector (31 downto 0);
            immScr : IN std_logic_vector (1 downto 0));     
            
end Extender;

architecture Behavioral of Extender is

begin
    process (Input)
        begin 
        --implement immSCR
        --implement immSCR
            CASE Input(23) IS
                when '1' => 
                        ImmExt(31 downto 24) <= "1";
                        ImmExt(23 downto 0) <= Input;
                when '0' => --
                        ImmExt(31 downto 24) <= "0";
                        ImmExt(23 downto 0) <= Input;
                when others => 
                        ImmExt <= "00000000";
                
                

        END CASE;
    end process;
end Behavioral;
