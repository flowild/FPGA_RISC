LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Controller is
Port (         OPcode : IN std_logic_vector (6 downto 0);
               ALUControl : OUT STD_LOGIC_VECTOR (2 downto 0);
               MemWrite : Out STD_LOGIC;
               regWrite : OUT std_logic;
               immScr : OUT std_logic_vector (1 downto 0); 
               AluScr : OUT std_logic;
               ResultScr : OUT std_logic);  

end Controller;

architecture Dataflow of Controller is
    begin
    
                ALUControl  <=  "000" when (OPcode = "0000011") ELSE    --load
                                "000" when (OPcode = "0110011") ELSE    --add
                                "000" when (OPcode = "0100011");        --store
                MemWrite    <=  '0' when (OPcode = "0000011") ELSE      --load
                                '0' when (OPcode = "0110011") ELSE      --add
                                '1' when (OPcode = "0100011");          --store
                regWrite    <=  '1' when (OPcode = "0000011") ELSE      --load
                                '1' when (OPcode = "0110011") ELSE      --add
                                '0' when (OPcode = "0100011");          --store
                immScr      <=  "00" when (OPcode = "0000011") ELSE     --load
                                --"xx" when (OPcode = "0110011") ELSE   --add
                                "01" when (OPcode = "0100011");         --store
                AluScr      <=  '1' when (OPcode = "0000011") ELSE      --load
                                '0' when (OPcode = "0110011") ELSE      --add
                                '1' when (OPcode = "0100011");          --store
                ResultScr   <=  '1' when (OPcode = "0000011") ELSE      --load
                                '0' when (OPcode = "0110011") ;         --add
                                --'x' when (OPcode = "0100011");          --store

end Dataflow ;