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

signal loadOut : std_logic_vector (11 downto 0):= Input (24 downto 13) ;
signal preload1 : std_logic_vector (19 downto 0):= "11111111111111111111";
signal preload0 : std_logic_vector (19 downto 0):= "00000000000000000000";

signal splitOut7 : std_logic_vector (6 downto 0):= Input (24 downto 18);


signal splitOut5 : std_logic_vector (4 downto 0):= Input (4 downto 0);
signal buff : std_logic_vector (11 downto 0);

begin
               --preload
               Output (31 downto 12) <= (preload0) when (Input(24) = '0') ELSE
                                        (preload1) when (Input(24) = '1') ;
                                        --ELSE "000000000000";


                 loadOut(11 downto 0) <= Input(24 downto 13);
                 buff(4 downto 0) <= Input(4 downto 0);
                 buff(11 downto 5) <= Input(24 downto 18);
                 
                  with immScr select Output(11 downto 0) <=
                    loadOut WHEN "00",
                    buff WHEN "01",
                    "000000000000" WHEN Others;

end Dataflow;