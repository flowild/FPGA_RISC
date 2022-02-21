LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY datapath1 IS
            PORT (  clk: IN STD_LOGIC;
                reset: IN STD_LOGIC;
                Instr : OUT std_logic_vector (31 downto 0);
                ALUControl : IN STD_LOGIC_VECTOR (2 downto 0);
                MemWrite : IN STD_LOGIC;
                regEnable : IN std_logic ;
                regWrite : in std_logic);
            
END datapath1;


ARCHITECTURE Behavioral OF datapath1 IS

    COMPONENT PC IS
        PORT (  clk: IN STD_LOGIC;
                reset: IN STD_LOGIC;
                newPC: OUT std_logic_vector (31 downto 0));
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
            ReadData: OUT STD_LOGIC_VECTOR (31 downto 0));
       end COMPONENT;    
    
    COMPONENT I_mem is
    Port (  PC : IN STD_LOGIC_VECTOR (6 downto 0);
            Instr : OUT STD_LOGIC_VECTOR (31 downto 0));
    end COMPONENT;   
    
    COMPONENT regfile is
        Port (  a_adr : IN STD_LOGIC_VECTOR (4 downto 0);
                b_adr : IN STD_LOGIC_VECTOR (4 downto 0);
                c_adr : IN STD_LOGIC_VECTOR (4 downto 0);
                reset : IN STD_LOGIC;
                enable: IN std_logic ;
                write : IN STD_LOGIC;
                clk : IN STD_LOGIC;
                a_data : OUT STD_LOGIC_VECTOR (31 downto 0);
                b_data : OUT STD_LOGIC_VECTOR (31 downto 0);
                c_data : IN STD_LOGIC_VECTOR (31 downto 0) );   
     END COMPONENT;
    
    
    

signal newPC_int: std_logic_vector;
signal AluControl_int : STD_LOGIC_VECTOR (2 downto 0);
signal DataLine0 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLine1 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLine2 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLine3 : STD_LOGIC_VECTOR (31 downto 0);

begin --architecture

X1: PC PORT MAP (clk, reset, newPC_int);
--X2: ALU PORT MAP (


end Behavioral; --architecture