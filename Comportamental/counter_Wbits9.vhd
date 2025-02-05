LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY counter_Wbits9 IS
GENERIC(W : NATURAL := 4);
PORT (d : IN STD_LOGIC_VECTOR(W-1 DOWNTO 0);-- data input
          clk : IN BIT; -- clock
          clrn: IN BIT; -- clear
          ena : IN BIT; -- enable
          load: IN BIT; -- load
          q : BUFFER STD_LOGIC_VECTOR(W-1 DOWNTO 0));-- data output
END counter_Wbits9;

ARCHITECTURE arch_1 OF counter_Wbits9 IS
    BEGIN
        PROCESS(clk,clrn)
        BEGIN
            IF (clrn='0') THEN
                q <= (OTHERS => '0');
                ELSIF (clk'EVENT AND clk='1') THEN
                    IF (ena='1') THEN
                        IF (load='1') THEN
                          q <= d;
                        ELSIF (q = "1001") THEN
                           q <= "0000";
                        ELSE
                          q <= q+1;
                        END IF;
                    END IF;
            END IF;
    END PROCESS;
END arch_1;
