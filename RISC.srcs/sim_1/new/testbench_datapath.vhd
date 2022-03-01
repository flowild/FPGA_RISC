library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_datapath is
--  Port ( );
end testbench_datapath;

architecture Behavioral of testbench_datapath is

component datapath IS
            PORT (  clk: IN STD_LOGIC;
                    reset: IN STD_LOGIC;
                    CurrentInstructionOut : OUT std_logic_vector (31 downto 0);
                    ALUControl : IN STD_LOGIC_VECTOR (2 downto 0);
                    MemWrite : IN STD_LOGIC;
                    regWrite : in std_logic;
                    immScr : IN std_logic_vector (1 downto 0));  
           
end component;
--tb signals
signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC:='0';
--
signal Instruction_int : std_logic_vector (31 downto 0);
signal ALUControl_int : STD_LOGIC_VECTOR (2 downto 0);
signal MemWrite_int : std_logic ;
signal regWrite_int : std_logic ;
signal OPcode_int : std_logic_vector (6 downto 0) := Instruction_int(6 downto 0);
signal immScr_int : std_logic_vector (1 downto 0); 


begin
DUT : datapath PORT MAP (clk, reset, Instruction_int, ALUControl_int , MemWrite_int ,regWrite_int, immScr_int );

process
    begin
    
    
    
    
    
end process;
     
process
    begin
    
         --PC_int  <= x"00000000";
         wait FOR 50ns; 
     
                
        
end process;    
    

end Behavioral;
