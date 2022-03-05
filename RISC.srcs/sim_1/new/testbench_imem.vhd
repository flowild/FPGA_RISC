library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_imem is
--  Port ( );
end testbench_imem;

architecture Behavioral of testbench_imem is

component I_mem is
    Port (  PC : IN STD_LOGIC_VECTOR (31 downto 0);
            Instr : OUT STD_LOGIC_VECTOR (31 downto 0));
           
end component;

--signal reset : STD_LOGIC := '0';
--signal clk : STD_LOGIC := '0';
signal PC : std_logic_vector (31 downto 0); 
signal Instr : std_logic_vector (31 downto 0); 



begin

DUT : I_mem port map (PC, Instr );
process
    begin
    
    
    
    
    
end process;
     
process
    begin
    
         PC  <= x"00000000";
         wait FOR 100ns; 
         PC  <= x"00000001";
         wait FOR 100ns; 
         PC  <= x"00000002";
         wait FOR 100ns; 
         PC  <= x"00000003";
         wait FOR 100ns;          
                
        
end process;    
    

end Behavioral;
