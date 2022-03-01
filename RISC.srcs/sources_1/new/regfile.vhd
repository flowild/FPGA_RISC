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
            c_data : IN STD_LOGIC_VECTOR (31 downto 0) );
end regfile;

architecture Behavioral of regfile is

    TYPE regarray_type is ARRAY (0 to 31) OF std_logic_vector (31 downto 0);
    SIGNAL regarray: regarray_type;
    

begin
    PROCESS (clk, RegWrite, reset) IS
        BEGIN
            IF reset = '1' THEN
                regarray <= (others => x"00000000");
                
            ELSE
                a_data <= regarray(to_integer(unsigned(a_adr)));
                b_data <= regarray(to_integer(unsigned(b_adr)));
                IF (clk'event and clk='1') THEN
                    IF (RegWrite = '1') THEN
                        regarray(to_integer(unsigned(c_adr))) <= c_data;
                    END IF;
                END IF;
            END IF;
    END PROCESS;

end Behavioral;
