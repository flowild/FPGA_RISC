LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity D_mem is
    Port (  Adr : IN STD_LOGIC_VECTOR (31 downto 0);
            WriteData : IN STD_LOGIC_VECTOR (31 downto 0);
            MemWrite: IN std_logic ;
            clk : IN STD_LOGIC;
            ReadData: OUT STD_LOGIC_VECTOR (31 downto 0);
            ProbeDmemA : Out std_logic_vector (31 downto 0);
            ProbeDmemB : Out std_logic_vector (31 downto 0);
            ProbeDmemC : Out std_logic_vector (31 downto 0));
            
end D_mem ;

architecture Behavioral of D_Mem is

TYPE MEM_TYPE is ARRAY (0 to 127) OF std_logic_vector (31 downto 0);
    SIGNAL D_MEM: MEM_TYPE 
            :=( x"00000002",--0
                x"00000007",--1
                x"00000008",--2
                x"00000009",--3
                x"0000000A",--4
                x"0000000B",--5
                x"0000000C",--6
                x"0000000D",--7
                x"0000000E",--8
                x"0000000F",--9
                OTHERS => x"00000000");
begin
PROCESS (clk, Adr , WriteData, MemWrite ) IS
        begin
        
            IF (clk'event and clk='0') THEN
                case MemWrite is 
                    when '0' => --read
                        ReadData <= D_MEM(to_integer(unsigned(Adr)));    
                    when '1' => --write                        
                        D_MEM(to_integer(unsigned(Adr))) <= WriteData;
                    when others => --error 
                        
                end case;
                
            END IF;
    END PROCESS;
    
Process(clk)
    begin
        IF (clk'event and clk='0') THEN
            ProbeDmemA <= D_MEM(4);     
            ProbeDmemB <= D_MEM(8);    
            ProbeDmemC <= D_MEM(10);    
        END IF;
    
    
end process;

end Behavioral;
