#!/bin/sh
set -x
date

#module reset; module purge

# #HOMEhafs=${HOMEhafs:-/work/noaa/hwrf/save/bliu/hafsv1_merge}
# HOMEhafs=${HOMEhafs:-/work2/noaa/aoml-hafs1/lgramer/hafsv1_basin_10x10}
# #HOMEhafs=/work2/noaa/aoml-hafs1/wramstro/basin/HAFS
#HOMEhafs=${HOMEhafs:-/lfs4/HFIP/hur-aoml/Lew.Gramer/src/hafsv1_basin_10x10}
#HOMEhafs=${HOMEhafs:-/scratch2/AOML/aoml-hafs1/Lew.Gramer/hafsv2_basin}
#HOMEhafs=${HOMEhafs:-/scratch2/AOML/aoml-hafs1/role.aoml-hafs1/HAFSV2.0.1M_RT}
#HOMEhafs=${HOMEhafs:-/lfs5/HFIP/hur-aoml/rthr-aoml/HAFSV2.0.1M_2024_RT}
#HOMEhafs=${HOMEhafs:-/lfs5/HFIP/hur-aoml/rthr-aoml/HAFSV2.0.1M_2024_RT_TEST}
HOMEhafs=${HOMEhafs:-/scratch2/AOML/aoml-hafs1/role.aoml-hafs1/HAFSV2.0.1M_2024_RT}

source ${HOMEhafs}/ush/hafs_pre_job.sh.inc

cd ${HOMEhafs}/rocoto
EXPT=$(basename ${HOMEhafs})
# Lew.Gramer@noaa.gov 2023-11-27
# #opts="-f"
opts="-t -f"
#scrubopt="config.scrub_work=no config.scrub_com=no"
scrubopt="config.scrub_work=yes config.scrub_com=yes"

if [ 0 == 1 ]; then
 # LEAVE atm*nc FILES for Bill: Nadine 15L, Oscar 16L, Kristy 12E
 ./run_hafs.py ${opts} -M L,E 2024100600 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 config.scrub_work=no config.scrub_com=no \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi


########################################
########## REALTIME (backup) EXPERIMENT
########################################
if [ 1 ]; then
 # Sara 19L
 ./run_hafs.py ${opts} -M L,E 2024111218-2024111812 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # Lane 13E, Patty 17L, Rafael 18L
 ./run_hafs.py ${opts} -M L,E 2024110212-2024111112 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # Nadine 15L, Oscar 16L, Kristy 12E
 ./run_hafs.py ${opts} -M L,E 2024101812-2024102412 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # Various INVESTs resulting in Nadine and Oscar (above): manually halted at 2024101418
 ./run_hafs.py ${opts} -M L,E 2024101106-2024101712 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # Kirk 12L, Leslie 13L, Milton 14L (manually killed workflow after 2024101018...)
 ./run_hafs.py ${opts} -M L,E 2024093000-2024101112 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024092606 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_COLDSTART_SMOOTH \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     forecast.max_slope=0.15,0.15,0.15,0.15,0.15,0.15,0.15,0.15,0.15,0.15 \
     forecast.full_zs_filter=.false.,.false.,.false.,.false.,.false.,.false.,.false.,.false.,.false.,.false. \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 #202409241800              forecast_1                       72226                DEAD                 139         1         238.0
 ./run_hafs.py ${opts} -M L,E 2024092218-2024092612 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024090912-2024092312 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi

########################################
########## *BACKFILL* REALTIME EXPERIMENT
########################################

if [ 0 == 1 ]; then
 #NHC  97L INVEST    20240922 1800 153N 0832W 345 021 1007 1009 0334 10
 #NHC  09L HELENE    20240928 1200 366N 0876W 270 036 0997 1010 0667 08
 #   202409241800              forecast_1                       72226                DEAD                 139         1         238.0
 ./run_hafs.py ${opts} -M L,E 2024092218-2024092418 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 #NHC  97L INVEST    20240922 1800 153N 0832W 345 021 1007 1009 0334 10
 #NHC  09L HELENE    20240928 1200 366N 0876W 270 036 0997 1010 0667 08
 #   202409260600              forecast_3                    10672153                DEAD                 139         1         357.0
 ./run_hafs.py ${opts} -M L,E 2024092500-2024092600 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
# LJG Restart 2024-10-15 (Was temporarily suspended 2024-10-07 22:30 ET - make room for Milton catch-up runs)
if [ 0 == 1 ]; then
 #NHC  97L INVEST    20240922 1800 153N 0832W 345 021 1007 1009 0334 10
 #NHC  09L HELENE    20240928 1200 366N 0876W 270 036 0997 1010 0667 08
 #   202409260600              forecast_3                    10672153                DEAD                 139         1         357.0
 ./run_hafs.py ${opts} -M L,E 2024092612-2024092812 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi

if [ 0 == 1 ]; then
 # BERYL
 #202407100000              forecast_1                      130750                DEAD                 137         1         254.0
 ./run_hafs.py ${opts} -M L,E 2024062800-2024071100 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
# LJG Restart 2024-10-15 (Was temporarily suspended 2024-10-07 22:30 ET - make room for Milton catch-up runs)
if [ 0 == 1 ]; then
 # DEBBY -> ERNESTO
 ./run_hafs.py ${opts} -M L,E 2024080112-2024082012 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf

 # DEBBY
 #./run_hafs.py ${opts} -M L,E 2024080112-2024081000 00L HISTORY \
fi




########## TEST TEST TEST
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024092418-2024092612 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_COLDSTART_NODA \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     config.gsi_d02=no \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024092606 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_COLDSTART_2 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024092418-2024092612 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_COLDSTART \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi



if [ 0 == 1 ]; then
 # DEBBY -> ERNESTO
 ./run_hafs.py ${opts} -M L,E 2024081000-2024081006 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_TEST \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
 # DEBBY -> ERNESTO
 ./run_hafs.py ${opts} -m 04L 2024081000 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_TEST_04L \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
 # DEBBY -> ERNESTO
 ./run_hafs.py ${opts} -m 05L 2024081000 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_TEST_05L \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi

########################################
########## REALTIME (backup) EXPERIMENT
########################################

if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024080318-2024080518 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=72 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024080118-2024080518 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=72 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024082412-2024082612 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=72 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024082218-2024082612 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=72 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2024081912-2024082012 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=72 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-12 11:40 ET: change NHRS 114 -> 96, to accommodate
 # 3-storm cases within our reservation using the new processor layout
 # suggested by Mu-Chieh.Ko@noaa.gov
 ./run_hafs.py ${opts} -M L,E 2024081900-2024082012 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=96 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-12 11:40 ET: change NHRS 114 -> 96, to accommodate
 # 3-storm cases within our reservation using the new processor layout
 # suggested by Mu-Chieh.Ko@noaa.gov
 ./run_hafs.py ${opts} -M L,E 2024070100-2024070212 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=96 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-12 11:40 ET: change NHRS 114 -> 96, to accommodate
 # 3-storm cases within our reservation using the new processor layout
 # suggested by Mu-Chieh.Ko@noaa.gov
 ./run_hafs.py ${opts} -M L,E 2024081212-2024081312 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.run_hrdgraphics=yes \
     config.NHRS=96 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 ./run_hafs.py ${opts} -M L,E 2024080318-2024080512 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 ./run_hafs.py ${opts} -M L,E 2024080218-2024080412 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west_gsi_d02.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 ./run_hafs.py ${opts} -M L,E 2024080712-2024080912 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_largedomain_test \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 ./run_hafs.py ${opts} -M L,E 2024080512-2024080712 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_largedomain_test \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 ./run_hafs.py ${opts} -M L,E 2024080418-2024080612 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_largedomain_test \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 ./run_hafs.py ${opts} -M L,E 2024080412-2024080518 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_largedomain_test \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west.conf
fi
if [ 0 == 1 ]; then
 # LJG 2024-08-02 11:34 ET: change NHRS 126 -> 114
 #./run_hafs.py ${opts} -M L,E 2024080118-2024080518 00L HISTORY \
 ./run_hafs.py ${opts} -M L,E 2024080118-2024080400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_largedomain_test \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=114 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain_15west.conf
fi

if [ 0 == 1 ]; then
 #./run_hafs.py ${opts} -M L 2024062812-2024070300 00L HISTORY \
 ./run_hafs.py ${opts} -M L 2024062812-2024062918 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_largedomain_test \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain.conf
fi

if [ 0 == 1 ]; then
 #./run_hafs.py ${opts} -M L 2024070118-2024070312 00L HISTORY \
 
 #./run_hafs.py ${opts} -M L 2024070212-2024070412 00L HISTORY \
 #    config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_TEST \
 #    gsi.use_bufr_nr=yes \
 #    grid.nest_grids=3 \
 #    config.domlat=20.0 config.domlon=-65.0 \
 #    config.run_hrdgraphics=yes \
 #    config.NHRS=126 ${scrubopt} \
 #    ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 ./run_hafs.py ${opts} -M L 2024070418-2024070700 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_TEST \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 ./run_hafs.py ${opts} -M L 2024070718-2024070918 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=HAFSV2.0.1M_2024_RT_TEST \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=3 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

#===============================================================================

date

echo 'cronjob done'
