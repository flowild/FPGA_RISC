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
       immScr : OUT std_logic_vector (1 downto 0); 
       AluScr : OUT std_logic;
       ResultScr : OUT std_logic);  
                   
end component;
--tb signals
signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC:='0';
--
--signal Instruction_int : std_logic_vector (31 downto 0);
signal ALUControl_int : STD_LOGIC_VECTOR (2 downto 0);
signal MemWrite_int : std_logic ;
signal regWrite_int : std_logic ;
signal OPcode_int : std_logic_vector (6 downto 0) ;
signal immScr_int : std_logic_vector (1 downto 0); 
signal AluScr_int : std_logic ;
signal ResultScr_int : std_logic ;

begin
DUT : Controller PORT MAP (clk, OPcode_int , ALUControl_int ,MemWrite_int ,regWrite_int, immScr_int,AluScr_int ,ResultScr_int   );

process
    begin
    
    OPcode_int <= "0000011"; --load word
    wait for 321 ns;
    OPcode_int <= "0110011"; --add
    wait for 321 ns;
    OPcode_int <= "0100011"; --store word
    wait for 321 ns;
    
end process;
     
process
    begin
    
         wait FOR 50ns; 
         clk <= '1';
         wait FOR 50ns;      
         clk <= '0';
     
                
        
end process;    
    

end Behavioral;
