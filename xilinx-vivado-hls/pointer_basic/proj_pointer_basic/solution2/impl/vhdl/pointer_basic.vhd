-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pointer_basic is
generic (
    C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH : INTEGER := 5;
    C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    s_axi_pointer_basic_io_AWVALID : IN STD_LOGIC;
    s_axi_pointer_basic_io_AWREADY : OUT STD_LOGIC;
    s_axi_pointer_basic_io_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH-1 downto 0);
    s_axi_pointer_basic_io_WVALID : IN STD_LOGIC;
    s_axi_pointer_basic_io_WREADY : OUT STD_LOGIC;
    s_axi_pointer_basic_io_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH-1 downto 0);
    s_axi_pointer_basic_io_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH/8-1 downto 0);
    s_axi_pointer_basic_io_ARVALID : IN STD_LOGIC;
    s_axi_pointer_basic_io_ARREADY : OUT STD_LOGIC;
    s_axi_pointer_basic_io_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH-1 downto 0);
    s_axi_pointer_basic_io_RVALID : OUT STD_LOGIC;
    s_axi_pointer_basic_io_RREADY : IN STD_LOGIC;
    s_axi_pointer_basic_io_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH-1 downto 0);
    s_axi_pointer_basic_io_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_pointer_basic_io_BVALID : OUT STD_LOGIC;
    s_axi_pointer_basic_io_BREADY : IN STD_LOGIC;
    s_axi_pointer_basic_io_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of pointer_basic is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "pointer_basic,hls_ip_2018_2,{HLS_INPUT_TYPE=c,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z010clg400-1,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.552000,HLS_SYN_LAT=2,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=211,HLS_SYN_LUT=228,HLS_VERSION=2018_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal d_i : STD_LOGIC_VECTOR (31 downto 0);
    signal d_o_ap_vld : STD_LOGIC;
    signal acc : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    signal d_read_reg_52 : STD_LOGIC_VECTOR (31 downto 0);
    signal acc_assign_fu_41_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal acc_assign_reg_57 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);

    component pointer_basic_pointer_basic_io_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC;
        d_o : IN STD_LOGIC_VECTOR (31 downto 0);
        d_o_ap_vld : IN STD_LOGIC;
        d_i : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    pointer_basic_pointer_basic_io_s_axi_U : component pointer_basic_pointer_basic_io_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_POINTER_BASIC_IO_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_POINTER_BASIC_IO_DATA_WIDTH)
    port map (
        AWVALID => s_axi_pointer_basic_io_AWVALID,
        AWREADY => s_axi_pointer_basic_io_AWREADY,
        AWADDR => s_axi_pointer_basic_io_AWADDR,
        WVALID => s_axi_pointer_basic_io_WVALID,
        WREADY => s_axi_pointer_basic_io_WREADY,
        WDATA => s_axi_pointer_basic_io_WDATA,
        WSTRB => s_axi_pointer_basic_io_WSTRB,
        ARVALID => s_axi_pointer_basic_io_ARVALID,
        ARREADY => s_axi_pointer_basic_io_ARREADY,
        ARADDR => s_axi_pointer_basic_io_ARADDR,
        RVALID => s_axi_pointer_basic_io_RVALID,
        RREADY => s_axi_pointer_basic_io_RREADY,
        RDATA => s_axi_pointer_basic_io_RDATA,
        RRESP => s_axi_pointer_basic_io_RRESP,
        BVALID => s_axi_pointer_basic_io_BVALID,
        BREADY => s_axi_pointer_basic_io_BREADY,
        BRESP => s_axi_pointer_basic_io_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle,
        d_o => acc_assign_reg_57,
        d_o_ap_vld => d_o_ap_vld,
        d_i => d_i);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                acc <= acc_assign_fu_41_p2;
                acc_assign_reg_57 <= acc_assign_fu_41_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                d_read_reg_52 <= d_i;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    acc_assign_fu_41_p2 <= std_logic_vector(unsigned(acc) + unsigned(d_read_reg_52));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_done_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    d_o_ap_vld_assign_proc : process(ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            d_o_ap_vld <= ap_const_logic_1;
        else 
            d_o_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

end behav;