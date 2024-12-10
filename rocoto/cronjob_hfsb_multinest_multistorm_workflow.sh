#!/bin/sh
set -x
date

#module reset; module purge

# #HOMEhafs=${HOMEhafs:-/work/noaa/hwrf/save/bliu/hafsv1_merge}
# HOMEhafs=${HOMEhafs:-/work2/noaa/aoml-hafs1/lgramer/hafsv1_basin_10x10}
# #HOMEhafs=/work2/noaa/aoml-hafs1/wramstro/basin/HAFS
#HOMEhafs=${HOMEhafs:-/lfs4/HFIP/hur-aoml/Lew.Gramer/src/hafsv1_basin_10x10}
HOMEhafs=${HOMEhafs:-/scratch2/AOML/aoml-hafs1/Lew.Gramer/hafsv2_basin_largedomain}

source ${HOMEhafs}/ush/hafs_pre_job.sh.inc

cd ${HOMEhafs}/rocoto
EXPT=$(basename ${HOMEhafs})
# Lew.Gramer@noaa.gov 2023-11-27
# #opts="-f"
opts="-t -f"
scrubopt="config.scrub_work=no config.scrub_com=no"

# Science....
if [ 0 == 1 ]; then
 # SALLY (+ variously Paulette, Teddy, possibly Rene, Vicky or Karina)
 ./run_hafs.py ${opts} -M L,E -m 19L 2020091118-2020091800 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_1storm_Sally \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=1 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L,E -m 19L 2020091118-2020091800 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_2storm_Sally \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 config.scrub_work=no config.scrub_com=no \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi
if [ 0 == 1 ]; then
  ./run_hafs.py ${opts} -M L,E -m 19L 2020091118-2020091800 00L HISTORY \
      config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_3storm_Sally \
      gsi.use_bufr_nr=yes \
      grid.nest_grids=3 \
      config.domlat=20.0 config.domlon=-65.0 \
      config.run_hrdgraphics=yes \
      dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
      config.NHRS=126 ${scrubopt} \
      ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
  ./run_hafs.py ${opts} -M L,E -m 19L 2020091118-2020091800 00L HISTORY \
      config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_4storm_Sally \
      gsi.use_bufr_nr=yes \
      grid.nest_grids=4 \
      config.domlat=20.0 config.domlon=-65.0 \
      config.run_hrdgraphics=yes \
      dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
      config.NHRS=126 ${scrubopt} \
      ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 # EARL (starting as 91L + variously 05L Danielle or 92/93L, 11E Javier, or 12E Kay)
 ./run_hafs.py ${opts} -M L,E -m 06L 2022090300-2022091018 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_2storm_Earl \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=2 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 # EARL (starting as 91L + variously 05L Danielle or 92/93L, 11E Javier, or 12E Kay)
 ./run_hafs.py ${opts} -M L,E -m 06L 2022090300-2022091018 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_4storm_Earl \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=4 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 # IDALIA, FRANKLIN (starting as 90L) (+ variously 11L JOSE, 06L GERT, 94L)
 ./run_hafs.py ${opts} -M L 2023081906-2023090218 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_4storm_Idalia \
     gsi.use_bufr_nr=yes \
     grid.nest_grids=4 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi


if [ 1 ]; then
 ./run_hafs.py ${opts} -m 17L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_1STORM \
     gsi.use_bufr_nr=yes \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain.conf
fi
if [ 1 ]; then
 ./run_hafs.py ${opts} -m 17L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_1STORM_WEST15 \
     gsi.use_bufr_nr=yes \
     config.run_hrdgraphics=yes \
     config.domlat=20.0 \
     config.domlon=-70.0 \
     grid.istart_nest=73,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.jstart_nest=419,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.iend_nest=1464,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.jend_nest=1118,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain.conf
fi
if [ 1 ]; then
 ./run_hafs.py ${opts} -M L 2020091406 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_5STORM_WEST15 \
     gsi.use_bufr_nr=yes \
     config.run_hrdgraphics=yes \
     config.domlat=20.0 \
     config.domlon=-70.0 \
     grid.istart_nest=73,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.jstart_nest=419,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.iend_nest=1464,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.jend_nest=1118,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain.conf
fi
if [ 1 ]; then
 ./run_hafs.py ${opts} -M L,E 2020091406 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_6STORM_WEST30 \
     gsi.use_bufr_nr=yes \
     config.run_hrdgraphics=yes \
     config.domlat=20.0 \
     config.domlon=-85.0 \
     grid.istart_nest=73,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.jstart_nest=419,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.iend_nest=1464,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     grid.jend_nest=1118,-999,-999,-999,-999,-999,-999,-999,-999,-999 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 17L,19L,20L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA \
     gsi.use_bufr_nr=yes \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow_largedomain.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 17L,19L,20L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_REPEAT \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 17L,18L,19L,20L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_4storm \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 ./run_hafs.py ${opts} -m 17L,18L,19L,20L,16E 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_5storm \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 17L,20L,22L,23L 2020091818 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_4storm \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 09L,07L,10L 2022092306-2022100206 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_3storm \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 ./run_hafs.py ${opts} -m 09L,07L 2022092306-2022100206 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_2storm \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # ./run_hafs.py ${opts} -m 09L 2022092306-2022092418 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_noDA_1storm \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_noDA_workflow.conf

 # ./run_hafs.py ${opts} -m 09L,07L 2022092306-2022100206 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_noDA_2storm \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_noDA_workflow.conf

 # ./run_hafs.py ${opts} -m 09L 2022092306-2022092418 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_tweakedDA_1storm \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_tweakedDA_workflow.conf

 # ./run_hafs.py ${opts} -m 09L,07L 2022092306-2022100206 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_tweakedDA_2storm \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_tweakedDA_workflow.conf

 ./run_hafs.py ${opts} -m 09L 2022092306-2022100206 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_1storm \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi
if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -M L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_minusM \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # 06L, 08L, 10L, 11L, and 94L
 ./run_hafs.py ${opts} -M L 2023083006-2023083018 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA_minusM_2023 \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 #    dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \

 # Multistorm self-cycled DA EXPERIMENT
 ./run_hafs.py ${opts} -M L -m 09L 2022092306-2022100200 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_multistorm_IAN_L \
     gsi.use_bufr_nr=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # TWO-storm self-cycled DA EXPERIMENT
 ./run_hafs.py ${opts} -m 09L,07L 2022092306-2022092418 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_multistorm_2STORM_L \
     gsi.use_bufr_nr=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # THREE-storm self-cycled DA EXPERIMENT
 ./run_hafs.py ${opts} -m 09L,07L,08L 2022092306-2022092312 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_multistorm_3STORM_L \
     gsi.use_bufr_nr=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # THREE-storm (incl. INVEST) self-cycled DA EXPERIMENT
 ./run_hafs.py ${opts} -m 09L,07L,10L 2022092306-2022092312 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_multistorm_3STORM_INVEST_L \
     gsi.use_bufr_nr=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # SINGLE-storm self-cycled DA EXPERIMENT
 ./run_hafs.py ${opts} -m 09L 2022092306-2022100200 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_singlestorm_IAN \
     gsi.use_bufr_nr=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi


#===============================================================================
# Example hafs moving nest experiments

#MULTI="-M L,E -m 17L,19L,20L"
#MULTI="-m 17L,19L,20L"
##MULTI="-m 17L,19L"
#MULTI="-m 17L,20L"
#MULTI="-m 17L"

# ./run_hafs.py ${opts} 2020091400 19L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hafsb_regional_5mvnest_storm \
#     config.domlat=20.0 config.domlon=-65.0 \
#     config.NHRS=96 ${scrubopt} \
#     ../parm/hafsb_regional_5mvnest_storm.conf

# ./run_hafs.py ${opts} 2020091400 19L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hafsb_regional_3mvnest_storm \
#     config.domlat=20.0 config.domlon=-65.0 \
#     config.NHRS=96 ${scrubopt} \
#     ../parm/hafsb_regional_3mvnest_storm.conf

 # ./run_hafs.py ${opts} ${MULTI} 2020091400 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_multistorm_ocean \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_workflow.conf

# COMMENTED OUT 2024-02-02
 # ./run_hafs.py ${opts} -m 17L,19L,20L 2020091400 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_multistorm_ocean \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_workflow.conf

 # ./run_hafs.py ${opts} -m 17L 2020091400 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_singlestorm_ocean_DA \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # ./run_hafs.py ${opts} -m 17L,19L 2020091400 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_multistorm_ocean_DA \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

# # ./run_hafs.py ${opts} -s sites/hera_3storm.ent -m 17L,19L,20L 2020091400 00L HISTORY 
#  ./run_hafs.py ${opts} -m 17L,19L,20L 2020091400 00L HISTORY \
#      config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_3storm_ocean_DA \
#      gsi.use_bufr_nr=yes \
#      config.domlat=20.0 config.domlon=-65.0 \
#      config.run_hrdgraphics=yes \
#      config.NHRS=126 ${scrubopt} \
#      ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf


if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 17L,19L,20L 2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 #    dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \

 # Multistorm self-cycled DA test
 ./run_hafs.py ${opts} -M L 2020091318-2020091400 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_cycledDA_minusM_L \
     gsi.use_bufr_nr=yes \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/Lew.Gramer/staging/input/COMGFSv16 \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 # Self-cycled long block in 2023
 ./run_hafs.py ${opts} -M L 2023083100-2023090218 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_cycledDA_minusM_L_2023 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 # Self-cycled long block in 2023
 ./run_hafs.py ${opts} -M L 2023081900-2023082618 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_cycledDA_minusM_L_2023 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 10L 2023083100-2023090218 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_cycledDA_minusm_10L_2023 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi

if [ 0 == 1 ]; then
 ./run_hafs.py ${opts} -m 08L 2023083100-2023090218 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_cycledDA_minusm_08L_2023 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf

 ./run_hafs.py ${opts} -m 11L 2023083100-2023090218 00L HISTORY \
     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_cycledDA_minusm_11L_2023 \
     dir.COMgfs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMGFSv16 \
     dir.COMrtofs=/scratch1/AOML/aoml-hafs1/role.aoml-hafs1/staging/hafs-input/COMRTOFSv2 \
     gsi.use_bufr_nr=yes \
     config.domlat=20.0 config.domlon=-65.0 \
     config.run_hrdgraphics=yes \
     config.NHRS=126 ${scrubopt} \
     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf
fi


 # ./run_hafs.py ${opts} -m 13L,13E,14E 2020082806 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multistorm_ocean_DA \
 #     gsi.use_bufr_nr=yes \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_DA_workflow.conf


 # ./run_hafs.py ${opts} -m 17L 2020091400 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_singlestorm_ocean \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_workflow.conf

 # ./run_hafs.py ${opts} -m 17L 2020091400 00L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_singlestorm_ocean_SPEEDUP \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_workflow_SPEEDUP.conf

 # ./run_hafs.py ${opts} 2020091400 17L HISTORY \
 #     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hfsb_regional_multinest_singlestorm_ocean_REGRESSION \
 #     config.run_multistorm=no grid.nest_grids=2 \
 #     config.domlat=20.0 config.domlon=-65.0 \
 #     config.run_hrdgraphics=yes \
 #     config.NHRS=126 ${scrubopt} \
 #     ../parm/hfsb_regional_multistorm_ocean_workflow_SPEEDUP.conf

# ./run_hafs.py ${opts} 2020081718 19L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hafsb_regional_5mvnest_storm_ocean \
#     config.domlat=20.0 config.domlon=-65.0 \
#     config.NHRS=126 ${scrubopt} \
#     ../parm/hafsb_regional_5mvnest_storm_ocean.conf

# ./run_hafs.py ${opts} 2020091400 19L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hafsb_regional_2mvnest_storm \
#     config.domlat=20.0 config.domlon=-65.0 \
#     config.NHRS=96 ${scrubopt} \
#     ../parm/hafsb_regional_2mvnest_storm.conf

# ./run_hafs.py ${opts} 2020091400 19L HISTORY \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_hafsb_regional_1mvnest_storm \
#     config.domlat=20.0 config.domlon=-65.0 \
#     config.NHRS=96 ${scrubopt} \
#     ../parm/hafsb_regional_1mvnest_storm.conf


#===============================================================================

date

echo 'cronjob done'
