LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RISCV_ENTITY IS
    PORT (  reset: IN STD_LOGIC;
            clk: IN STD_LOGIC);
            
END RISCV_ENTITY;

ARCHITECTURE Behavioral OF RISCV_ENTITY IS

    COMPONENT datapath1 IS
        PORT (  clk: IN STD_LOGIC;
                reset: IN STD_LOGIC;
                Instr : OUT std_logic_vector (31 downto 0);
                ALUControl : IN STD_LOGIC_VECTOR (2 downto 0);
                MemWrite : IN STD_LOGIC;
                regEnable : IN std_logic ;
                regWrite : in std_logic);  
    END COMPONENT;
    
    COMPONENT Controller is
        Port ( clk : IN STD_LOGIC;
               Instr : IN std_logic_vector (31 downto 0);
               ALUControl : OUT STD_LOGIC_VECTOR (2 downto 0);
               MemWrite : Out STD_LOGIC;
               regEnable : OUT std_logic ;
               regWrite : OUT std_logic);
    END COMPONENT;

signal Instruction_int : std_logic_vector (31 downto 0);
signal ALUControl_int : STD_LOGIC_VECTOR (2 downto 0);
signal MemWrite_int : std_logic ;
signal regEnable_int : std_logic ;
signal regWrite_int : std_logic ;

begin --architecture

X1: datapath1 PORT MAP (clk, reset, Instruction_int, ALUControl_int , MemWrite_int ,regEnable_int ,regWrite_int  );
X2: Controller PORT MAP (clk, Instruction_int, ALUControl_int ,MemWrite_int ,regEnable_int ,regWrite_int );


end Behavioral; --architecture