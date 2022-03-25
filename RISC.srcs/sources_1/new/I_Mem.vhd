LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity I_mem is
    Port (  PC : IN STD_LOGIC_VECTOR (31 downto 0);
            Instr : OUT STD_LOGIC_VECTOR (31 downto 0));

end I_mem ;

    
architecture Dataflow of I_mem is

    TYPE MEM_TYPE is ARRAY (0 to 127) OF std_logic_vector (31 downto 0);
    SIGNAL I_MEM: MEM_TYPE
        :=(x"00000000",x"00402083",x"00108133",x"00200423",OTHERS => x"00000000");

        

begin

                Instr <= I_MEM(to_integer(unsigned(PC)));
                
end Dataflow ;
