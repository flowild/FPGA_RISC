library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity tb_RISCV_ENTITY is
--  Port ( );
end tb_RISCV_ENTITY;

architecture Behavioral of tb_RISCV_ENTITY is

component RISCV_ENTITY IS
            PORT (  reset: IN STD_LOGIC;
                    clk: IN STD_LOGIC;
                    ProbeDmemA : Out std_logic_vector (31 downto 0);
                    ProbeDmemB : Out std_logic_vector (31 downto 0);
                    ProbeDmemC : Out std_logic_vector (31 downto 0)); 
           
end component;

signal reset : STD_LOGIC := '0';
signal clk : STD_LOGIC := '0';
signal ProbeDmemA : std_logic_vector (31 downto 0);
signal ProbeDmemB : std_logic_vector (31 downto 0);
signal ProbeDmemC : std_logic_vector (31 downto 0);



begin

DUT : RISCV_ENTITY port map (reset, clk, ProbeDmemA, ProbeDmemB ,ProbeDmemC );
process
    begin


end process;
    
process
    begin
    
       clk <= '1';
       wait FOR 50ns; 
       clk <= '0';
       wait FOR 50ns; 
        
end process;

end Behavioral;
