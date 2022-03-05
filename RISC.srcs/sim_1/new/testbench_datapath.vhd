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
                    immScr : IN std_logic_vector (1 downto 0);
                    AluScr : in std_logic;
                    ResultScr : in std_logic;
                    ProbeInstr : OUT std_logic_vector (31 downto 0);
                    ProbeDmemA : Out std_logic_vector (31 downto 0);
                    ProbeDmemB : Out std_logic_vector (31 downto 0);
                    ProbeDmemC : Out std_logic_vector (31 downto 0));  
           
end component;
--tb signals
signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC:='0';
--Intern adresses
signal CurrentInstruction: std_logic_vector (31 downto 0);
--signal rs1 : STD_LOGIC_VECTOR (4 downto 0):= CurrentInstruction(19 downto 15);
--signal rs2 : STD_LOGIC_VECTOR (4 downto 0):= CurrentInstruction(24 downto 20);
--signal imm : STD_LOGIC_VECTOR (4 downto 0):= CurrentInstruction(11 downto 7);
--signal extender_int : STD_LOGIC_VECTOR (24 downto 0):= CurrentInstruction(31 downto 7);
signal PC_int : std_logic_vector (31 downto 0);
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
signal immScr_int : std_logic_vector (1 downto 0) ;  
signal AluScr_int : std_logic  ;
signal ResultScr_int : std_logic  ;
signal ProbeInstr : std_logic_vector (31 downto 0);
signal ProbeDmemA : std_logic_vector (31 downto 0);
signal ProbeDmemB : std_logic_vector (31 downto 0);
signal ProbeDmemC : std_logic_vector (31 downto 0);

begin
DUT : datapath PORT MAP (clk, reset, CurrentInstruction , ALUControl_int , MemWrite_int ,regWrite_int, immScr_int, AluScr_int ,ResultScr_int, ProbeInstr, ProbeDmemA ,ProbeDmemB ,ProbeDmemC   );


process
    begin
    
    wait for 5 ns;
    reset <= '1';
    wait for 45ns;
    reset <= '0';
    wait for 1000ns;
    
end process;
     
process
    begin
    
       clk <= '1';         
       wait FOR 50ns;         
       clk <= '0';     
       wait FOR 50ns;                 
        
end process;    
    

end Behavioral;
