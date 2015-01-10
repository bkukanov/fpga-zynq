#
# Vivado (TM) v2014.2 (64-bit)
#
# BOARD_NAME_HERE_rocketchip.tcl: Tcl script for re-creating project 'BOARD_NAME_HERE_rocketchip'
#
# Generated by Vivado on Fri Sep 12 16:05:06 PDT 2014
# IP Build 924643 on Fri May 30 09:20:16 MDT 2014
#
# This file contains the Vivado Tcl commands for re-creating the project to the state*
# when this script was generated. In order to re-create the project, please source this
# file in the Vivado Tcl Shell.
#
# * Note that the runs in the created project will be configured the same way as the
#   original project, however they will not be launched automatically. To regenerate the
#   run results please launch the synthesis/implementation runs as needed.

# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/BOARD_NAME_HERE_rocketchip"]"

# Create project
create_project BOARD_NAME_HERE_rocketchip $orig_proj_dir

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [get_projects BOARD_NAME_HERE_rocketchip]
set_property "default_lib" "xil_defaultlib" $obj
set_property "part" "PART_NUMBER_HERE" $obj
# REPLACE FOR OFFICIAL BOARD NAME $obj
set_property "simulator_language" "Mixed" $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset object
set obj [get_filesets sources_1]
set files [list \
 "[file normalize "$origin_dir/src/verilog/clocking.vh"]"\
 "[file normalize "$origin_dir/src/verilog/TopShim.CHISEL_CONFIG_HERE.v"]"\
 "[file normalize "$origin_dir/src/verilog/rocketchip_wrapper.v"]"\
]
add_files -norecurse -fileset $obj $files

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
# None

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property "top" "rocketchip_wrapper" $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/src/constrs/base.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/src/constrs/base.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property "target_constrs_file" "[file normalize "$origin_dir/src/constrs/base.xdc"]" $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property "top" "rocketchip_wrapper" $obj

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
  create_run -name synth_1 -part PART_NUMBER_HERE -flow {Vivado Synthesis 2014} -strategy "Vivado Synthesis Defaults" -constrset constrs_1
}
set obj [get_runs synth_1]
set_property "needs_refresh" "1" $obj
set_property "part" "PART_NUMBER_HERE" $obj

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
  create_run -name impl_1 -part PART_NUMBER_HERE -flow {Vivado Implementation 2014} -strategy "Vivado Implementation Defaults" -constrset constrs_1 -parent_run synth_1
}
set obj [get_runs impl_1]
set_property "needs_refresh" "1" $obj
set_property "part" "PART_NUMBER_HERE" $obj

puts "INFO: Project created:BOARD_NAME_HERE_rocketchip"

puts "INFO: Recreating block diagram from src/tcl/BOARD_NAME_HERE_bd.tcl"
source src/tcl/BOARD_NAME_HERE_bd.tcl

exit
