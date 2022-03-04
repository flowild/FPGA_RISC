library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_Dmem is
--  Port ( );
end testbench_Dmem;

architecture Behavioral of testbench_Dmem is

component D_mem is
    Port (  Adr : IN STD_LOGIC_VECTOR (31 downto 0);
            WriteData : IN STD_LOGIC_VECTOR (31 downto 0);
            MemWrite: IN std_logic ;
            clk : IN STD_LOGIC;
            ReadData: OUT STD_LOGIC_VECTOR (31 downto 0));
           
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
signal DataLineB1 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineC : STD_LOGIC_VECTOR (31 downto 0);
signal ReadData_int : STD_LOGIC_VECTOR (31 downto 0);
--Intern control
signal RegWrite_int : std_logic ;
signal MemWrite_int : std_logic ;
signal AluControl_int : STD_LOGIC_VECTOR (2 downto 0) ;
signal immScr_int : std_logic_vector (1 downto 0);  
signal AluScr_int : std_logic  ;
signal ResultScr_int : std_logic  ;



begin
DUT : D_mem PORT MAP (DataLineA, DataLineB, MemWrite_int, clk, ReadData_int );
--DUT : regfile PORT MAP (rs1, rs2, imm, reset, RegWrite_int , clk, DataLineA1, DataLineB, DataLineC);
process
    begin
    
    DatalineA <= x"00000001";
    wait for 333ns;
    DatalineB <= x"F0F0F0F0";
    wait for 333ns;
    MemWrite_int <= '0';
    wait for 333ns;
    MemWrite_int <= '1';
    wait for 333ns;
    MemWrite_int <= '0';
    wait for 333ns;
    
end process;
     
process
    begin
    
         wait FOR 50ns; 
         clk <= '1';
         wait FOR 50ns;      
         clk <= '0';
                    
        
end process;    
    

end Behavioral;
