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
