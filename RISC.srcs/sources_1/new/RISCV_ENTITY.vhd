LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RISCV_ENTITY IS
    PORT (  reset: IN STD_LOGIC;
            clk: IN STD_LOGIC;
            ProbeInstr : OUT std_logic_vector (31 downto 0);
            ProbeDmemA : Out std_logic_vector (31 downto 0);
            ProbeDmemB : Out std_logic_vector (31 downto 0);
            ProbeDmemC : Out std_logic_vector (31 downto 0);
            ProbeRegA : Out std_logic_vector (31 downto 0);  
            ProbeRegB : Out std_logic_vector (31 downto 0));
            
END RISCV_ENTITY;

ARCHITECTURE dataflow OF RISCV_ENTITY IS

    COMPONENT datapath IS
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
                    ProbeDmemC : Out std_logic_vector (31 downto 0);
                    ProbeRegA : Out std_logic_vector (31 downto 0);
                    ProbeRegB : Out std_logic_vector (31 downto 0));  
                
    END COMPONENT;
    
    COMPONENT Controller is
        Port ( OPcode : IN std_logic_vector (6 downto 0);
               ALUControl : OUT STD_LOGIC_VECTOR (2 downto 0);
               MemWrite : Out STD_LOGIC;
               regWrite : OUT std_logic;
               immScr : OUT std_logic_vector (1 downto 0); 
               AluScr : OUT std_logic;
               ResultScr : OUT std_logic);  
               
    END COMPONENT;

signal Instruction_int : std_logic_vector (31 downto 0);
signal ALUControl_int : STD_LOGIC_VECTOR (2 downto 0);
signal MemWrite_int : std_logic ;
signal regWrite_int : std_logic ;
--signal OPcode_int : std_logic_vector (6 downto 0) := Instruction_int(6 downto 0);
signal immScr_int : std_logic_vector (1 downto 0); 
signal AluScr_int : std_logic ;
signal ResultScr_int : std_logic  ;

--signal dummy : std_logic_vector (31 downto 0);
begin 

--ProbeInstr <= Instruction_int ;


--architecture
X1: datapath PORT MAP (clk, reset, Instruction_int, ALUControl_int , MemWrite_int ,regWrite_int, immScr_int, AluScr_int ,ResultScr_int, ProbeInstr, ProbeDmemA ,ProbeDmemB ,ProbeDmemC, ProbeRegA, ProbeRegB    );
X2: Controller PORT MAP ( Instruction_int(6 downto 0) , ALUControl_int ,MemWrite_int ,regWrite_int, immScr_int, AluScr_int ,ResultScr_int  );


end dataflow; --architecture