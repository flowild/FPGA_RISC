library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_extender is
--  Port ( );
end testbench_extender;

architecture Behavioral of testbench_extender is

component Extender is
    Port (  Input : IN std_logic_vector (24 downto 0);
            Output : OUT std_logic_vector (31 downto 0);
            immScr : IN std_logic_vector (1 downto 0));     
           
end component;

--tb signals
signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC:='0';
--Intern adresses
signal CurrentInstruction: std_logic_vector (31 downto 0);
signal rs1 : STD_LOGIC_VECTOR (4 downto 0):= CurrentInstruction(19 downto 15);
signal rs2 : STD_LOGIC_VECTOR (4 downto 0):= CurrentInstruction(24 downto 20);
signal imm : STD_LOGIC_VECTOR (4 downto 0):= CurrentInstruction(11 downto 7);
signal extender_int : STD_LOGIC_VECTOR (24 downto 0):= CurrentInstruction(31 downto 7);
signal instr_int : std_logic_vector (31 downto 0);
signal newPC_int: STD_LOGIC_VECTOR (31 downto 0);
--Intern Data
signal DataLineA : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineA1 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineA2 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineB : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineC : STD_LOGIC_VECTOR (31 downto 0);
--Intern control
signal RegWrite_int : std_logic:= '0' ;
signal MemWrite_int : std_logic:= '0' ;
signal AluControl_int : STD_LOGIC_VECTOR (2 downto 0):= "000" ;
signal immScr_int : std_logic_vector (1 downto 0);  



begin
DUT : Extender PORT MAP ( extender_int , DataLineA2, immScr_int );
--DUT : regfile PORT MAP (rs1, rs2, imm, reset, RegWrite_int , clk, DataLineA1, DataLineB, DataLineC);
process
    begin
    
    wait FOR 50ns;
    immScr_int <= "01";
    wait FOR 50ns;
    extender_int  <= "1000000001000000001000001";
    --extender_int  <= "0000000001000000001000001";
    wait FOR 50ns;
    
end process;
     
process
    begin
    
         --PC_int  <= x"00000000";
         wait FOR 50ns; 
     
                
        
end process;    
    

end Behavioral;
