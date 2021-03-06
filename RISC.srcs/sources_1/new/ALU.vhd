LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port (  ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
            ALUControl : IN STD_LOGIC_VECTOR (2 downto 0);
            ScrA: IN STD_LOGIC_VECTOR (31 downto 0);
            ScrB : IN STD_LOGIC_VECTOR (31 downto 0));

end ALU;


architecture Behavioral of ALU is


begin
  
    process (ScrA, ScrB, ALUControl )
        begin
            case ALUControl is
                when "010" => --durchleiten
                    ALUResult <= ScrA;
                when "000" => --add
                     ALUResult <= (ScrA + ScrB);
                when others =>
                     ALUResult <= x"00000000";
        end case;

    end process;

end Behavioral;