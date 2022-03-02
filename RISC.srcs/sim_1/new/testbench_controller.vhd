library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_controller is
--  Port ( );
end testbench_controller;

architecture Behavioral of testbench_controller is

component Controller is
Port ( clk : IN STD_LOGIC;
       OPcode : IN std_logic_vector (6 downto 0);
       ALUControl : OUT std_logic_vector (2 downto 0);
       MemWrite : Out STD_LOGIC;
       regWrite : OUT std_logic;
       immScr : OUT std_logic_vector (1 downto 0)); 
           
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
DUT : Controller PORT MAP (clk, OPcode_int , ALUControl_int ,MemWrite_int ,regWrite_int, immScr_int  );

process
    begin
    
    
    
    
    
end process;
     
process
    begin
    
         --PC_int  <= x"00000000";
         wait FOR 50ns; 
     
                
        
end process;    
    

end Behavioral;
