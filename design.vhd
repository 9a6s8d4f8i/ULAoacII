-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

entity mips is
port (
	a: in bit_vector(3 downto 0);
    b: in bit_vector(3 downto 0);
    cin: in bit;
    cout: out bit;
    sout: out bit_vector(3 downto 0);
    control: in bit_vector(3 downto 0)
    );
end mips;

architecture mips_arch of mips is
begin
	process(control, a, b, cin) is
    variable soma: bit_vector(3 downto 0);
	variable c: bit;
    begin
    	if control = "0000" then
        		c:=cin;
            	for i in 0 to 3 loop
            	soma(i) := a(i) xor b(i) xor c;
            	c := (a(i) and b(i)) or ((a(i) xor b(i)) and c);
            	end loop;
        	cout <= c;
        	sout <= soma;
        elsif control = "0001" then
        		
        end if;
     end process;
end mips_arch;
            
        
    
    
    