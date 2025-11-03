signal clk_count   : unsigned(15 downto 0) := (others => '0');
signal sample_clk  : std_logic := '0';

process(sys_clk)
begin
    if rising_edge(sys_clk) then
        if clk_count = 24 then   -- divide by 25 (50 MHz / 25 = 2 MHz)
            clk_count <= (others => '0');
            sample_clk <= not sample_clk;  -- toggle output
        else
            clk_count <= clk_count + 1;
        end if;
    end if;
end process;
Each toggle happens every 25 cycles → full period = 50 cycles
So:

𝑓
𝑠
𝑎
𝑚
𝑝
𝑙
𝑒
=
𝑓
𝑠
𝑦
𝑠
2
×
25
=
50
𝑀
𝐻
𝑧
50
=
1
𝑀
𝐻
𝑧
f
sample
	​

=
2×25
f
sys
	​

	​

=
50
50MHz
	​

=1MHz
