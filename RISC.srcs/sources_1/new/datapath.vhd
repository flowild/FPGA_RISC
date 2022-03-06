LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY datapath IS
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
            
END datapath;


ARCHITECTURE Dataflow OF datapath IS

    COMPONENT PC IS
        PORT (  clk: IN STD_LOGIC;
                reset: IN STD_LOGIC;
                Input: IN std_logic_vector (31 downto 0);
                Output: OUT std_logic_vector (31 downto 0));
    END COMPONENT;
    
    COMPONENT ALU is
        Port (  ALUResult : OUT STD_LOGIC_VECTOR (31 downto 0);
                ALUControl : IN STD_LOGIC_VECTOR (2 downto 0);
                ScrA: IN STD_LOGIC_VECTOR (31 downto 0);
                ScrB : IN STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;    
    
    COMPONENT D_mem is
    Port (  Adr : IN STD_LOGIC_VECTOR (31 downto 0);
            WriteData : IN STD_LOGIC_VECTOR (31 downto 0);
            MemWrite: IN std_logic ;
            clk : IN STD_LOGIC;
            ReadData: OUT STD_LOGIC_VECTOR (31 downto 0);
            ProbeDmemA : Out std_logic_vector (31 downto 0);
            ProbeDmemB : Out std_logic_vector (31 downto 0);
            ProbeDmemC : Out std_logic_vector (31 downto 0));
       end COMPONENT;    
    
    COMPONENT I_mem is
    Port (  PC : IN STD_LOGIC_VECTOR (31 downto 0);
            Instr : OUT STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;   
    
    COMPONENT regfile is
        Port (  a_adr : IN STD_LOGIC_VECTOR (4 downto 0);
                b_adr : IN STD_LOGIC_VECTOR (4 downto 0);
                c_adr : IN STD_LOGIC_VECTOR (4 downto 0);
                reset : IN STD_LOGIC;
                RegWrite : IN STD_LOGIC;
                clk : IN STD_LOGIC;
                a_data : OUT STD_LOGIC_VECTOR (31 downto 0);
                b_data : OUT STD_LOGIC_VECTOR (31 downto 0);
                c_data : IN STD_LOGIC_VECTOR (31 downto 0) ;
                ProberegA : OUT STD_LOGIC_VECTOR (31 downto 0);
                ProberegB :OUT STD_LOGIC_VECTOR (31 downto 0));
     END COMPONENT;
    
    COMPONENT PCinc is
        Port (  Input : IN std_logic_vector (31 downto 0);
                Output : OUT std_logic_vector (31 downto 0));   
            
    end COMPONENT;
    
    COMPONENT Extender is
            Port (  Input : IN std_logic_vector (24 downto 0);
                    Output : OUT std_logic_vector (31 downto 0);
                    immScr : IN std_logic_vector (1 downto 0));     
    end COMPONENT;    
    
 COMPONENT MPlex IS
            PORT (  Input0: IN std_logic_vector (31 downto 0);
                    Input1: IN std_logic_vector (31 downto 0);
                    Output: OUT std_logic_vector (31 downto 0);
                    Control: IN std_logic);
    end COMPONENT;       
    
    
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
--signal RegWrite_int : std_logic:= regWrite ;
--signal MemWrite_int : std_logic:= MemWrite ;
--signal AluControl_int : STD_LOGIC_VECTOR (2 downto 0):=ALUControl ;
--signal immScr_int : std_logic_vector (1 downto 0):= immScr ;  
--signal AluScr_int : std_logic := AluScr ;
--signal ResultScr_int : std_logic := ResultScr  ;



begin

                CurrentInstructionOut <= CurrentInstruction;
                ProbeInstr <= CurrentInstruction  ;
--                rs1 <= CurrentInstruction(19 downto 15);
--                rs2 <= CurrentInstruction(24 downto 20);
--                imm <= CurrentInstruction(11 downto 7);

        
    
    
    
 --architecture    
X1: PC PORT MAP (clk, reset, newPC_int, PC_int );
X2: PCinc PORT MAP (PC_int, newPC_int);
X3: I_mem PORT MAP (PC_int , CurrentInstruction);
X4: regfile PORT MAP (CurrentInstruction(19 downto 15), CurrentInstruction(24 downto 20), CurrentInstruction(11 downto 7), reset, RegWrite , clk, DataLineA1, DataLineB, DataLineC,ProbeRegA,ProbeRegB);
X5: ALU PORT MAP (DataLineA ,AluControl , DataLineA1, DataLineB1);
X6: D_mem PORT MAP (DataLineA, DataLineB, MemWrite, clk, ReadData_int ,ProbeDmemA ,ProbeDmemB ,ProbeDmemC  );
X7: Extender PORT MAP ( CurrentInstruction(31 downto 7) , DataLineA2, immScr );
X8: MPlex PORT MAP (DataLineB , DataLineA2 ,DataLineB1 , AluScr );
X9: MPlex PORT MAP (DataLineA , ReadData_int , DataLineC ,ResultScr );


end Dataflow ;