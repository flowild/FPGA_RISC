LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Controller is
Port ( clk : IN STD_LOGIC;
       Instr : IN std_logic_vector (31 downto 0);
       ALUControl : OUT STD_LOGIC;
       MemWrite : Out STD_LOGIC;
       regEnable : OUT std_logic ;
       regWrite : OUT std_logic);


end Controller;

architecture Behavioral of Controller is

    begin










end Behavioral;
