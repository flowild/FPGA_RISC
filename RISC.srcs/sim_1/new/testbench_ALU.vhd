library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_ALU is
--  Port ( );
end testbench_ALU;

architecture Behavioral of testbench_ALU is

component ALU is
    Port (  ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
            ALUControl : IN STD_LOGIC_VECTOR (2 downto 0);
            ScrA: IN STD_LOGIC_VECTOR (31 downto 0);
            ScrB : IN STD_LOGIC_VECTOR (31 downto 0));
           
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
DUT : ALU PORT MAP (DataLineA ,AluControl_int , DataLineA1, DataLineA2);

process
    begin
    
    AluControl_int <= "000";
    wait for 33ns;
    DataLineA1 <= x"FFFFFFFF";
    
    wait for 22ns;
    DataLineA2 <= x"00000002";
    wait for 50ns;
    AluControl_int <= "010";
    wait for 50ns;
    AluControl_int <= "011";
    wait for 33ns;
    
    
end process;
     
--process
--    begin
    
--         --PC_int  <= x"00000000";
--         --wait FOR 50ns; 
     
                
        
--end process;    
    

end Behavioral;
