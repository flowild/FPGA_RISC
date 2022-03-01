library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_PCinc is
--  Port ( );
end testbench_PCinc;

architecture Behavioral of testbench_PCinc is

component PCinc is
    Port (  Input : IN std_logic_vector (31 downto 0);
            Output : OUT std_logic_vector (31 downto 0));   
           
end component;

--signal reset : STD_LOGIC := '0';
--signal clk : STD_LOGIC := '0';
signal Input : std_logic_vector (31 downto 0):= x"00000000"; 
signal Output : std_logic_vector (31 downto 0); 



begin

DUT : PCinc port map (Input,Output);
process
    begin
    
    
    
    
    
end process;
     
process
    begin
    
--       clk <= '1';
--       wait FOR 50ns; 
--       clk <= '0';
--       wait FOR 50ns; 
        
        
end process;    
    

end Behavioral;
