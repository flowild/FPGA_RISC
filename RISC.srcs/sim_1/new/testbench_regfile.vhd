library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity testbench_regfile is
--  Port ( );
end testbench_regfile;

architecture Behavioral of testbench_regfile is

component regfile is
    Port (  a_adr : IN STD_LOGIC_VECTOR (4 downto 0);
            b_adr : IN STD_LOGIC_VECTOR (4 downto 0);
            c_adr : IN STD_LOGIC_VECTOR (4 downto 0);
            reset : IN STD_LOGIC;
            RegWrite : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            a_data : OUT STD_LOGIC_VECTOR (31 downto 0);
            b_data : OUT STD_LOGIC_VECTOR (31 downto 0);
            c_data : IN STD_LOGIC_VECTOR (31 downto 0) ;
            ProbeRegA : OUT STD_LOGIC_VECTOR (31 downto 0);
            ProbeRegB : OUT STD_LOGIC_VECTOR (31 downto 0);
            ProbeRegC : OUT STD_LOGIC_VECTOR (31 downto 0));
           
end component;

--tb signals
signal clk : STD_LOGIC:='0';
signal reset : STD_LOGIC:='0';
--signal help_out : std_logic_vector (31 downto 0);
--signal help_out_integer : integer ;
--Intern adresses
signal CurrentInstruction: std_logic_vector (31 downto 0):= x"00402083";

signal rs1 : STD_LOGIC_VECTOR (4 downto 0);
signal rs2 : STD_LOGIC_VECTOR (4 downto 0);
signal imm : STD_LOGIC_VECTOR (4 downto 0);
--extender_int : STD_LOGIC_VECTOR (24 downto 0);
--signal instr_int : std_logic_vector (31 downto 0);
--signal newPC_int: STD_LOGIC_VECTOR (31 downto 0);
--Intern Data
--signal DataLineA : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineA1 : STD_LOGIC_VECTOR (31 downto 0);
--signal DataLineA2 : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineB : STD_LOGIC_VECTOR (31 downto 0);
signal DataLineC : STD_LOGIC_VECTOR (31 downto 0);
--Intern control
signal RegWrite_int : std_logic:= '0' ;
--signal MemWrite_int : std_logic:= '0' ;
--signal AluControl_int : STD_LOGIC_VECTOR (2 downto 0):= "000" ;
--signal immScr_int : std_logic_vector (1 downto 0);  
signal ProbeRegA : STD_LOGIC_VECTOR (31 downto 0);
signal ProbeRegB : STD_LOGIC_VECTOR (31 downto 0);
signal ProbeRegC : STD_LOGIC_VECTOR (31 downto 0);

begin
DUT : regfile PORT MAP (CurrentInstruction(19 downto 15), CurrentInstruction(24 downto 20), CurrentInstruction(11 downto 7), reset, RegWrite_int , clk, DataLineA1, DataLineB, DataLineC,ProbeRegA,ProbeRegB, ProbeRegC);
process
    begin
    
    wait for 5ns;
    reset <= '1';
    wait for 5ns;
    reset <= '0';
    Wait for 40ns;
    
    RegWrite_int <= '1';
    CurrentInstruction <= x"00402083";
    wait for 1 ns;
    rs1 <= CurrentInstruction(19 downto 15);
    rs2 <= CurrentInstruction(24 downto 20);
    imm <= CurrentInstruction(11 downto 7);
    wait for 49ns;
    
    DataLineC <= x"0000000A";
    wait for 50ns;
    
    RegWrite_int <= '1';
    CurrentInstruction <= x"00108133";
    wait for 1 ns;
    rs1 <= CurrentInstruction(19 downto 15);
    rs2 <= CurrentInstruction(24 downto 20);
    imm <= CurrentInstruction(11 downto 7);
    wait for 49ns;
    
    DataLineC <= x"00000014";
    
    wait for 50ns;
    
    
    RegWrite_int <= '0';
    CurrentInstruction <= x"00200423";
    wait for 1ns;
    rs1 <= CurrentInstruction(19 downto 15);
    rs2 <= CurrentInstruction(24 downto 20);
    imm <= CurrentInstruction(11 downto 7);
    wait for 99ns;
    
    CurrentInstruction <= x"00000000";
    wait for 1ns;
    rs1 <= CurrentInstruction(19 downto 15);
    rs2 <= CurrentInstruction(24 downto 20);
    imm <= CurrentInstruction(11 downto 7);
    wait for 99ns;
    
    
    
    
end process;
     
process
    begin
        
         wait for 50ns;
         clk <= '1';
         wait FOR 50ns; 
         clk <= '0';   
               
        
end process;    
    

end Behavioral;
