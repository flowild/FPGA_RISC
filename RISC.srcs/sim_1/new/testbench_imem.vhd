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
signal PC_int : std_logic_vector (31 downto 0):= x"00000000"; 
signal Instr_int : std_logic_vector (31 downto 0); 



begin

DUT : I_mem port map (PC_int, Instr_int );
process
    begin
    
    
    
    
    
end process;
     
process
    begin
    
         PC_int  <= x"00000000";
         wait FOR 50ns; 
         PC_int  <= x"00000004";
         wait FOR 50ns; 
         PC_int  <= x"00000008";
         wait FOR 50ns; 
         PC_int  <= x"0000000C";
         wait FOR 50ns;          
                
        
end process;    
    

end Behavioral;
