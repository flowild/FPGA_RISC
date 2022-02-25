LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extender is
    Port (  Input : IN std_logic_vector (24 downto 0);
            Output : OUT std_logic_vector (31 downto 0);
            immScr : IN std_logic_vector (1 downto 0));     
            
end Extender;

architecture Dataflow of Extender is

signal loadOut : std_logic_vector (31 downto 0):= Input (24 downto 13) ;
signal preload0 : std_logic_vector (19 downto 0):= "1111111111111111111";
signal preload1 : std_logic_vector (19 downto 0):= "0000000000000000000";
signal splitOut7 : std_logic_vector (6 downto 0):= Input (24 downto 18);
signal splitOut5 : std_logic_vector (4 downto 0):= Input (4 downto 0);

begin
               --preload
               Output (31 downto 12) <= (preload0) when (Input(24) = '0') ELSE
                                        (preload1) when (Input(24) = '1') ELSE
                                        "0";
               --load word 
               Output (11 downto 0) <= (loadOut) when (immScr = "00");
               --store word
               Output (11 downto 5) <= (splitOut7) when (immScr = "01");
               Output (4 downto 0) <=  (splitOut5) when (immScr = "01");

end Dataflow;
