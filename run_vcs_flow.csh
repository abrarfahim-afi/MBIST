# !/bin/csh -f

if($# == 1) then
	echo "Now running -- $1"
else
	echo "USAGE:" 
	echo '	System Verilog - source ~/run_vcs_flow.csh "-sverilog path/source_file.sv path/testbench_file.sv"'
	echo '	Verilog        - source ~/run_vcs_flow.csh "path/source_file.v path/testbench_file.v"'
	echo '	List of Files  - source ~/run_vcs_flow.csh "-file list_of_files.txt"'
	exit
endif

mkdir -p /var/tmp/vps4038_ec6443/
mkdir -p ~/verilog_sim/
cd /var/tmp/vps4038_ec6443/
echo "Starting VCS"
vcs -full64 -kdb $1 -lca -debug_access+all
ln -s /var/tmp/vps4038_ec6443/* ~/verilog_sim/
echo "Do you want to start dump file generation (Y/N)?"
set y = $<
if($y == Y) then
	cd ~/verilog_sim/
	echo "Generating dump file"
	./simv
	echo "Do you want to open Verdi (Y/N)?"
	set y = $<
	if($y == Y) then
		echo "Starting Verdi"
		verdi -dbdir ./simv.daidir/
	else
		echo "Stopping after dump generation"
		cd
		exit
	endif
else
	echo "Stopping after compilation"
	cd
	exit
endif
