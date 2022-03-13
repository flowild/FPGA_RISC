LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity regfile is
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
            
            
--            help_out : Out std_logic_vector (31 downto 0);
--            help_out_integer : Out Integer);
end regfile;

architecture Behavioral of regfile is

    TYPE regarray_type is ARRAY (0 to 31) OF std_logic_vector (31 downto 0);
    SIGNAL regarray: regarray_type;
    

begin
    PROCESS (clk, RegWrite, reset, c_data) IS
        BEGIN
            IF reset = '1' THEN
                --regarray <= (others => x"00000000");
                regarray(0) <= x"00000000";
                regarray(1) <= x"00000000";
                regarray(2) <= x"00000000";
                ProberegA <= x"00000000";     
                ProberegB <= x"00000000";
                ProberegC <= x"00000000";    
                
            ELSE --read
                a_data <= regarray(to_integer(unsigned(a_adr)));
                b_data <= regarray(to_integer(unsigned(b_adr)));
                
--                ProberegA <= regarray(0);     
--                ProberegB <= regarray(1);    
--                ProberegC <= regarray(2);
                        
                --IF (clk'event and clk='0' and RegWrite = '1') THEN --write
                  IF (clk'event and RegWrite = '1') THEN --write  
                        regarray(to_integer(unsigned(c_adr))) <= c_data;
--                        ProberegC <= c_data;     
--                        ProberegB <= regarray(1);    
--                        ProberegC <= regarray(2);

                        
                    
                  END IF;
            END IF;
    END PROCESS;

Process(clk)
    begin
        IF (clk'event) THEN
            
            ProberegA <= regarray(0);     
            ProberegB <= regarray(1);    
            ProberegC <= regarray(2);  
            
        END IF;
    
    
end process;



end Behavioral;
