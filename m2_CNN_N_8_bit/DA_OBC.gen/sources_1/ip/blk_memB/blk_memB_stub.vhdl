-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Tue Jun 24 17:03:23 2025
-- Host        : CANOPUS637 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Boyang/Desktop/m1_CNN_small_r/DA_OBC.gen/sources_1/ip/blk_memB/blk_memB_stub.vhdl
-- Design      : blk_memB
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcvu29p-fsga2577-2L-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blk_memB is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 6 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 1199 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 1199 downto 0 )
  );

end blk_memB;

architecture stub of blk_memB is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[0:0],addra[6:0],dina[1199:0],douta[1199:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_5,Vivado 2022.2";
begin
end;
