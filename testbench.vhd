-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

--DUT
component mips is
port (
	a: in bit_vector(3 downto 0);
    b: in bit_vector(3 downto 0);
    cin: in bit;
    cout: out bit;
    sout: out bit_vector(3 downto 0);
    control: in bit_vector(3 downto 0)
    );
end component;

signal a_in, b_in, sout_out, control_in : bit_vector(3 downto 0);
signal cin_in, cout_out: bit;

begin

  DUT: mips port map(a_in, b_in, cin_in,cout_out, sout_out,control_in);
  
  process 
  begin
  	a_in <= "1001"; -- **BITs vector só aceita aspas duplas**;
    b_in <= "0101"; -- **Bit lógico e std_logic aspas simples**;
    control_in <= "0000";
    wait for 1 ns;
    assert(sout_out="0011") report "Error 1+2 != 3" severity error;
    
    -- Clear inputs
    a_in <= "0000";
    b_in <= "0000";
    control_in <= "0000";

     assert false report "Test done." severity note;
     wait;
	end process;
end tb;