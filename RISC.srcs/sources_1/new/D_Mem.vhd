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
PROCESS (clk, MemWrite, Adr, WriteData  )
        begin
            IF (unsigned(Adr) < 128) THEN
                IF (MemWrite = '0') THEN --read
                    ReadData <= D_MEM(to_integer(unsigned(Adr)));
                                
                elsif (clk='0' and clk'event) THEN --write
    
                    D_MEM(to_integer(unsigned(Adr))) <= WriteData;

                END IF;
            END IF;
    END PROCESS;
    
Process(clk)
    begin
        IF (clk'event) THEN
            ProbeDmemA <= D_MEM(0);     
            ProbeDmemB <= D_MEM(4);    
            ProbeDmemc <= D_MEM(8);   
        END IF;
    
    
end process;

end Behavioral;
