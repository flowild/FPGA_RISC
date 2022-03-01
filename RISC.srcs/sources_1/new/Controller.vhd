LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Controller is
Port ( clk : IN STD_LOGIC;
       OPcode : IN std_logic_vector (6 downto 0);
       ALUControl : OUT std_logic_vector (2 downto 0);
       MemWrite : Out STD_LOGIC;
       regWrite : OUT std_logic;
       immScr : OUT std_logic_vector (1 downto 0)); 

end Controller;

architecture Behavioral of Controller is

    begin
        process (clk)
            begin
            
                case OPcode is
                    when "0000011" => --load
                    
                        ALUControl <= "000";
                        MemWrite <= '0';
                        regWrite <= '1';   
                        immScr <= "00";
                        
                    when "0110011" => --add
                    
                        ALUControl <= "000";
                        MemWrite <= '0';
                        regWrite <= '1';   
                        --immScr <= "xx";
                        
                    when "0100011" => --store
                    
                        ALUControl <= "000";
                        MemWrite <= '1';
                        regWrite <= '0';   
                        immScr <= "01";
                        
                    when others =>
                    
                        ALUControl <= "000";
                        MemWrite <= '0';
                        regWrite <= '0';
                        --immScr <= "xx";
                        
                end case;

        end process;


end Behavioral;
