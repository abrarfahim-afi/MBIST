####################################################################################
#             MAIN SETUP (root attributes & setup variables)                       #
####################################################################################
##############################################################################
## Preset global variables and attributes
##############################################################################

# set the location where the tool has to search for various LIB, LEF and QRC files
set libpath /ALL_PDK/asap7PDK_r1p7/asap7/asap7sc7p5t_28
set lefpath /ALL_PDK/asap7PDK_r1p7/asap7/asap7sc7p5t_28/LEF/scaled
set qrcpath /ALL_PDK/asap7PDK_r1p7/asap7/asap7sc7p5t_28/qrc
#set DESIGN <design name>
set GEN_EFF medium
set MAP_OPT_EFF high
set DATE [clock format [clock seconds] -format "%b%d-%T"] 
set _OUTPUTS_PATH outputs_${DATE}
set _REPORTS_PATH reports_${DATE}
set _LOG_PATH logs_${DATE}
##set MODUS_WORKDIR <MODUS work directory>
set_db / .init_lib_search_path [list $libpath/LIB/CCS $libpath/LIB/NLDM $libpath/techlef_misc $lefpath $qrcpath] 

#set_db / .script_search_path {. <path>} 
# Search for RTL  file in the following pathss, add more paths whenever needed
# right now looks for 3 paths, 
# 1) current directory mentioned by . operator
# 2) home directory mentioned by ~ operator 
# 3) Manual directory I added ~/ genus_mbist

set_db / .init_hdl_search_path [list ~/genus_mbist . ~ ] 

##Uncomment and specify machine names to enable super-threading.
##set_db / .super_thread_servers {<machine names>} 
##For design size of 1.5M - 5M gates, use 8 to 16 CPUs. For designs > 5M gates, use 16 to 32 CPUs
##set_db / .max_cpus_per_server 8

##Default undriven/unconnected setting is 'none'.  
##set_db / .hdl_unconnected_value 0 | 1 | x | none

set_db / .information_level 7 

###############################################################
## Library setup
###############################################################				

#read_libs <libname>

set_db library { 	
asap7sc7p5t_AO_LVT_FF_ccs_211120.lib.gz        asap7sc7p5t_OA_SLVT_FF_ccs_211120.lib.gz
asap7sc7p5t_AO_LVT_FF_ccsa_211120.lib.gz       asap7sc7p5t_OA_SLVT_FF_ccsa_211120.lib.gz
asap7sc7p5t_AO_LVT_FF_ccsn_211120.lib.gz       asap7sc7p5t_OA_SLVT_FF_ccsn_211120.lib.gz
asap7sc7p5t_AO_LVT_SS_ccs_211120.lib.gz        asap7sc7p5t_OA_SLVT_SS_ccs_211120.lib.gz
asap7sc7p5t_AO_LVT_SS_ccsa_211120.lib.gz       asap7sc7p5t_OA_SLVT_SS_ccsa_211120.lib.gz
asap7sc7p5t_AO_LVT_SS_ccsn_211120.lib.gz       asap7sc7p5t_OA_SLVT_SS_ccsn_211120.lib.gz
asap7sc7p5t_AO_LVT_TT_ccs_211120.lib.gz        asap7sc7p5t_OA_SLVT_TT_ccs_211120.lib.gz
asap7sc7p5t_AO_LVT_TT_ccsa_211120.lib.gz       asap7sc7p5t_OA_SLVT_TT_ccsa_211120.lib.gz
asap7sc7p5t_AO_LVT_TT_ccsn_211120.lib.gz       asap7sc7p5t_OA_SLVT_TT_ccsn_211120.lib.gz
asap7sc7p5t_AO_RVT_FF_ccs_211120.lib.gz        asap7sc7p5t_OA_SRAM_FF_ccs_211120.lib.gz
asap7sc7p5t_AO_RVT_FF_ccsa_211120.lib.gz       asap7sc7p5t_OA_SRAM_FF_ccsa_211120.lib.gz
asap7sc7p5t_AO_RVT_FF_ccsn_211120.lib.gz       asap7sc7p5t_OA_SRAM_FF_ccsn_211120.lib.gz
asap7sc7p5t_AO_RVT_SS_ccs_211120.lib.gz        asap7sc7p5t_OA_SRAM_SS_ccs_211120.lib.gz
asap7sc7p5t_AO_RVT_SS_ccsa_211120.lib.gz       asap7sc7p5t_OA_SRAM_SS_ccsa_211120.lib.gz
asap7sc7p5t_AO_RVT_SS_ccsn_211120.lib.gz       asap7sc7p5t_OA_SRAM_SS_ccsn_211120.lib.gz
asap7sc7p5t_AO_RVT_TT_ccs_211120.lib.gz        asap7sc7p5t_OA_SRAM_TT_ccs_211120.lib.gz
asap7sc7p5t_AO_RVT_TT_ccsa_211120.lib.gz       asap7sc7p5t_OA_SRAM_TT_ccsa_211120.lib.gz
asap7sc7p5t_AO_RVT_TT_ccsn_211120.lib.gz       asap7sc7p5t_OA_SRAM_TT_ccsn_211120.lib.gz
asap7sc7p5t_AO_SLVT_FF_ccs_211120.lib.gz       asap7sc7p5t_SEQ_LVT_FF_ccs_220123.lib.gz
asap7sc7p5t_AO_SLVT_FF_ccsa_211120.lib.gz      asap7sc7p5t_SEQ_LVT_FF_ccsa_220123.lib.gz
asap7sc7p5t_AO_SLVT_FF_ccsn_211120.lib.gz      asap7sc7p5t_SEQ_LVT_FF_ccsn_220123.lib.gz
asap7sc7p5t_AO_SLVT_SS_ccs_211120.lib.gz       asap7sc7p5t_SEQ_LVT_SS_ccs_220123.lib.gz
asap7sc7p5t_AO_SLVT_SS_ccsa_211120.lib.gz      asap7sc7p5t_SEQ_LVT_SS_ccsa_220123.lib.gz
asap7sc7p5t_AO_SLVT_SS_ccsn_211120.lib.gz      asap7sc7p5t_SEQ_LVT_SS_ccsn_220123.lib.gz
asap7sc7p5t_AO_SLVT_TT_ccs_211120.lib.gz       asap7sc7p5t_SEQ_LVT_TT_ccs_220123.lib.gz
asap7sc7p5t_AO_SLVT_TT_ccsa_211120.lib.gz      asap7sc7p5t_SEQ_LVT_TT_ccsa_220123.lib.gz
asap7sc7p5t_AO_SLVT_TT_ccsn_211120.lib.gz      asap7sc7p5t_SEQ_LVT_TT_ccsn_220123.lib.gz
asap7sc7p5t_AO_SRAM_FF_ccs_211120.lib.gz       asap7sc7p5t_SEQ_RVT_FF_ccs_220123.lib.gz
asap7sc7p5t_AO_SRAM_FF_ccsa_211120.lib.gz      asap7sc7p5t_SEQ_RVT_FF_ccsa_220123.lib.gz
asap7sc7p5t_AO_SRAM_FF_ccsn_211120.lib.gz      asap7sc7p5t_SEQ_RVT_FF_ccsn_220123.lib.gz
asap7sc7p5t_AO_SRAM_SS_ccs_211120.lib.gz       asap7sc7p5t_SEQ_RVT_SS_ccs_220123.lib.gz
asap7sc7p5t_AO_SRAM_SS_ccsa_211120.lib.gz      asap7sc7p5t_SEQ_RVT_SS_ccsa_220123.lib.gz
asap7sc7p5t_AO_SRAM_SS_ccsn_211120.lib.gz      asap7sc7p5t_SEQ_RVT_SS_ccsn_220123.lib.gz
asap7sc7p5t_AO_SRAM_TT_ccs_211120.lib.gz       asap7sc7p5t_SEQ_RVT_TT_ccs_220123.lib.gz
asap7sc7p5t_AO_SRAM_TT_ccsa_211120.lib.gz      asap7sc7p5t_SEQ_RVT_TT_ccsa_220123.lib.gz
asap7sc7p5t_AO_SRAM_TT_ccsn_211120.lib.gz      asap7sc7p5t_SEQ_RVT_TT_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_FF_ccs_220122.lib.gz    asap7sc7p5t_SEQ_SLVT_FF_ccs_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_FF_ccsa_220122.lib.gz   asap7sc7p5t_SEQ_SLVT_FF_ccsa_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_FF_ccsn_220122.lib.gz   asap7sc7p5t_SEQ_SLVT_FF_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_SS_ccs_220122.lib.gz    asap7sc7p5t_SEQ_SLVT_SS_ccs_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_SS_ccsa_220122.lib.gz   asap7sc7p5t_SEQ_SLVT_SS_ccsa_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_SS_ccsn_220122.lib.gz   asap7sc7p5t_SEQ_SLVT_SS_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_TT_ccs_220122.lib.gz    asap7sc7p5t_SEQ_SLVT_TT_ccs_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_TT_ccsa_220122.lib.gz   asap7sc7p5t_SEQ_SLVT_TT_ccsa_220123.lib.gz
asap7sc7p5t_INVBUF_LVT_TT_ccsn_220122.lib.gz   asap7sc7p5t_SEQ_SLVT_TT_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_FF_ccs_220122.lib.gz    asap7sc7p5t_SEQ_SRAM_FF_ccs_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_FF_ccsa_220122.lib.gz   asap7sc7p5t_SEQ_SRAM_FF_ccsa_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_FF_ccsn_220122.lib.gz   asap7sc7p5t_SEQ_SRAM_FF_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_SS_ccs_220122.lib.gz    asap7sc7p5t_SEQ_SRAM_SS_ccs_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_SS_ccsa_220122.lib.gz   asap7sc7p5t_SEQ_SRAM_SS_ccsa_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_SS_ccsn_220122.lib.gz   asap7sc7p5t_SEQ_SRAM_SS_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_TT_ccs_220122.lib.gz    asap7sc7p5t_SEQ_SRAM_TT_ccs_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_TT_ccsa_220122.lib.gz   asap7sc7p5t_SEQ_SRAM_TT_ccsa_220123.lib.gz
asap7sc7p5t_INVBUF_RVT_TT_ccsn_220122.lib.gz   asap7sc7p5t_SEQ_SRAM_TT_ccsn_220123.lib.gz
asap7sc7p5t_INVBUF_SLVT_FF_ccs_220122.lib.gz   asap7sc7p5t_SIMPLE_LVT_FF_ccs_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_FF_ccsa_220122.lib.gz  asap7sc7p5t_SIMPLE_LVT_FF_ccsa_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_FF_ccsn_220122.lib.gz  asap7sc7p5t_SIMPLE_LVT_FF_ccsn_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_SS_ccs_220122.lib.gz   asap7sc7p5t_SIMPLE_LVT_SS_ccs_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_SS_ccsa_220122.lib.gz  asap7sc7p5t_SIMPLE_LVT_SS_ccsa_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_SS_ccsn_220122.lib.gz  asap7sc7p5t_SIMPLE_LVT_SS_ccsn_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_TT_ccs_220122.lib.gz   asap7sc7p5t_SIMPLE_LVT_TT_ccs_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_TT_ccsa_220122.lib.gz  asap7sc7p5t_SIMPLE_LVT_TT_ccsa_211120.lib.gz
asap7sc7p5t_INVBUF_SLVT_TT_ccsn_220122.lib.gz  asap7sc7p5t_SIMPLE_LVT_TT_ccsn_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_FF_ccs_220122.lib.gz   asap7sc7p5t_SIMPLE_RVT_FF_ccs_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_FF_ccsa_220122.lib.gz  asap7sc7p5t_SIMPLE_RVT_FF_ccsa_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_FF_ccsn_220122.lib.gz  asap7sc7p5t_SIMPLE_RVT_FF_ccsn_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_SS_ccs_220122.lib.gz   asap7sc7p5t_SIMPLE_RVT_SS_ccs_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_SS_ccsa_220122.lib.gz  asap7sc7p5t_SIMPLE_RVT_SS_ccsa_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_SS_ccsn_220122.lib.gz  asap7sc7p5t_SIMPLE_RVT_SS_ccsn_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_TT_ccs_220122.lib.gz   asap7sc7p5t_SIMPLE_RVT_TT_ccs_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_TT_ccsa_220122.lib.gz  asap7sc7p5t_SIMPLE_RVT_TT_ccsa_211120.lib.gz
asap7sc7p5t_INVBUF_SRAM_TT_ccsn_220122.lib.gz  asap7sc7p5t_SIMPLE_RVT_TT_ccsn_211120.lib.gz
asap7sc7p5t_OA_LVT_FF_ccs_211120.lib.gz        asap7sc7p5t_SIMPLE_SLVT_FF_ccs_211120.lib.gz
asap7sc7p5t_OA_LVT_FF_ccsa_211120.lib.gz       asap7sc7p5t_SIMPLE_SLVT_FF_ccsa_211120.lib.gz
asap7sc7p5t_OA_LVT_FF_ccsn_211120.lib.gz       asap7sc7p5t_SIMPLE_SLVT_FF_ccsn_211120.lib.gz
asap7sc7p5t_OA_LVT_SS_ccs_211120.lib.gz        asap7sc7p5t_SIMPLE_SLVT_SS_ccs_211120.lib.gz
asap7sc7p5t_OA_LVT_SS_ccsa_211120.lib.gz       asap7sc7p5t_SIMPLE_SLVT_SS_ccsa_211120.lib.gz
asap7sc7p5t_OA_LVT_SS_ccsn_211120.lib.gz       asap7sc7p5t_SIMPLE_SLVT_SS_ccsn_211120.lib.gz
asap7sc7p5t_OA_LVT_TT_ccs_211120.lib.gz        asap7sc7p5t_SIMPLE_SLVT_TT_ccs_211120.lib.gz
asap7sc7p5t_OA_LVT_TT_ccsa_211120.lib.gz       asap7sc7p5t_SIMPLE_SLVT_TT_ccsa_211120.lib.gz
asap7sc7p5t_OA_LVT_TT_ccsn_211120.lib.gz       asap7sc7p5t_SIMPLE_SLVT_TT_ccsn_211120.lib.gz
asap7sc7p5t_OA_RVT_FF_ccs_211120.lib.gz        asap7sc7p5t_SIMPLE_SRAM_FF_ccs_211120.lib.gz
asap7sc7p5t_OA_RVT_FF_ccsa_211120.lib.gz       asap7sc7p5t_SIMPLE_SRAM_FF_ccsa_211120.lib.gz
asap7sc7p5t_OA_RVT_FF_ccsn_211120.lib.gz       asap7sc7p5t_SIMPLE_SRAM_FF_ccsn_211120.lib.gz
asap7sc7p5t_OA_RVT_SS_ccs_211120.lib.gz        asap7sc7p5t_SIMPLE_SRAM_SS_ccs_211120.lib.gz
asap7sc7p5t_OA_RVT_SS_ccsa_211120.lib.gz       asap7sc7p5t_SIMPLE_SRAM_SS_ccsa_211120.lib.gz
asap7sc7p5t_OA_RVT_SS_ccsn_211120.lib.gz       asap7sc7p5t_SIMPLE_SRAM_SS_ccsn_211120.lib.gz
asap7sc7p5t_OA_RVT_TT_ccs_211120.lib.gz        asap7sc7p5t_SIMPLE_SRAM_TT_ccs_211120.lib.gz
asap7sc7p5t_OA_RVT_TT_ccsa_211120.lib.gz       asap7sc7p5t_SIMPLE_SRAM_TT_ccsa_211120.lib.gz
asap7sc7p5t_OA_RVT_TT_ccsn_211120.lib.gz       asap7sc7p5t_SIMPLE_SRAM_TT_ccsn_211120.lib.gz
			 	}

set_db lef_library {asap7_tech_4x_201209.lef asap7sc7p5t_28_L_4x_220121a.lef  asap7sc7p5t_28_R_4x_220121a.lef  asap7sc7p5t_28_SL_4x_220121a.lef  asap7sc7p5t_28_SRAM_4x_220121a.lef}

set_db qrc_tech_file qrcTechFile_typ03_scaled4xV06

#read_physical -lef <lef file(s)>
## Provide either cap_table_file or the qrc_tech_file
#set_db / .cap_table_file <file> 
#read_qrc <qrcTechFile name>
##generates <signal>_reg[<bit_width>] format
#set_db / .hdl_array_naming_style %s\[%d\] 
## 


set_db / .lp_insert_clock_gating true 


