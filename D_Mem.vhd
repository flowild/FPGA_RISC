LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_mem is
    Port (  Adr : IN STD_LOGIC_VECTOR (31 downto 0);
            WriteData : IN STD_LOGIC_VECTOR (31 downto 0);
            MemWrite: IN std_logic ;
            clk : IN STD_LOGIC;
            ReadData: OUT STD_LOGIC_VECTOR (31 downto 0));
            
end D_mem ;

architecture Behavioral of D_Mem is

TYPE MEM_TYPE is ARRAY (0 to 127) OF std_logic_vector (31 downto 0);
    SIGNAL D_MEM: MEM_TYPE 
            :=(x"00000000",x"00000007",OTHERS => x"00000000");
begin
PROCESS (clk, Adr , WriteData, MemWrite ) IS
        begin
        
            IF (clk'event and clk='1') THEN
                case MemWrite is 
                    when '0' => --read
                        ReadData <= D_MEM(to_integer(unsigned(Adr)));    
                    when '1' => --write                        
                        D_MEM(to_integer(unsigned(Adr))) <= WriteData;
                    when others => --error 
                        
                end case;
                
            END IF;
    END PROCESS;
end Behavioral;
