#!/bin/sh
set -x
date

# NOAA WCOSS2
HOMEhafs=/lfs/h2/emc/hur/noscrub/zhan.zhang/save/hafsv0.3_ensda_eps_merge
dev="-s sites/wcoss2_ensda_eps.ent -f"
PYTHON3=/usr/bin/python3

# NOAA WCOSS Dell Phase3
#HOMEhafs=/gpfs/dell2/emc/modeling/noscrub/${USER}/save/H221_hafs_ensemble_phase3
#dev="-s sites/wcoss_dell_p3.ent -f"
#PYTHON3=/usrx/local/prod/packages/python/3.6.3/bin/python3

# NOAA WCOSS Cray
#HOMEhafs=/gpfs/hps3/emc/hwrf/noscrub/${USER}/save/H221_hafs_ensemble_phase3
#dev="-s sites/wcoss_cray.ent -f"
#PYTHON3=/opt/intel/intelpython3/bin/python3

# NOAA RDHPCS Jet
#HOMEhafs=/mnt/lfs1/HFIP/hwrfv3/${USER}/H222_ensemble_gefs
#dev="-s sites/xjet_ensda_eps.ent -f"
#PYTHON3=/apps/intel/intelpython3/bin/python3

# MSU Orion
# HOMEhafs=/work/noaa/hwrf/save/${USER}/HAFS
# HOMEhafs=/work/noaa/hurricane/save/${USER}/H221_hafs_ensemble_phase3
# dev="-s sites/orion_ensemble.ent -f"
# PYTHON3=/apps/intel-2020/intel-2020/intelpython3/bin/python3

# NOAA RDHPCS Hera
#HOMEhafs=/scratch1/NCEPDEV/hwrf/save/${USER}/hafsv0.3_ensda_eps
#dev="-s sites/hera_ensda_eps.ent -f"
#PYTHON3=/apps/intel/intelpython3/bin/python3

cd ${HOMEhafs}/rocoto

EXPT=$(basename ${HOMEhafs})
scrubopt="config.scrub_work=yes config.scrub_com=yes"

#===============================================================================

 # hafsv0p2a phase2
# confopts="config.EXPT=${EXPT} config.SUBEXPT=H221_hafs_ensemble_phase3 \
#     ../parm/hafsv2022_ensemble_AL.conf \
#     ../parm/hafs_hycom.conf"

 confopts_noocean="config.EXPT=${EXPT} config.SUBEXPT=H221_hafs_ensemble_phase3 \
     ../parm/hafsv2022_ensemble_EP.conf"
#Jet
for ens in 00 01 02 03 04 05 06 07 08 09 10 11
do

if [ $ens -eq 00 ] ; then
 ${PYTHON3} ./run_hafs.py -t ${dev} 2022081918 00E HISTORY \
     ${confopts_noocean} ${scrubopt} \
     config.EXPT=${EXPT} config.SUBEXPT=H222_ensemble_gefs_${ens} config.ENS=${ens} \
     forecast.do_sppt=.false. forecast.do_shum=.false. forecast.do_skeb=.false. \
     config.scrub_work=no config.scrub_com=no \
     forecast.write_group=1 \
     forecast.write_tasks_per_group=20 \
     dir.COMgfs=/lfs/h1/ops/prod/com/gefs/v12.2
#hera     dir.COMgfs=/scratch1/NCEPDEV/hwrf/noscrub/input/GEFS
else
 ${PYTHON3} ./run_hafs.py -t ${dev} 2022081918 00E HISTORY \
     ${confopts_noocean} ${scrubopt} \
     forecast.do_sppt=.true. forecast.do_shum=.true. forecast.do_skeb=.true. \
     config.EXPT=${EXPT} config.SUBEXPT=H222_ensemble_gefs_${ens} config.ENS=${ens} \
     config.scrub_work=no config.scrub_com=no \
     forecast.write_group=1 \
     forecast.write_tasks_per_group=20 \
     dir.COMgfs=/lfs/h1/ops/prod/com/gefs/v12.2
#hera     dir.COMgfs=/scratch1/NCEPDEV/hwrf/noscrub/input/GEFS
fi

done

#failed cycle: mem=04, 2022080318, 00E
#Orion
#for ens in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
#do

#if [ $ens -eq 00 ] ; then
# ${PYTHON3} ./run_hafs.py -t ${dev} 2020082112 00L HISTORY \
#     ${confopts_noocean} ${scrubopt} \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_${ens} config.ENS=${ens} \
#     config.do_sppt=.F. config.do_shum=.F. config.do_skeb=.F. \
#     config.disk_project=hurricane forecast.layoutx=16 forecast.layouty=15 \
#     forecast.write_tasks_per_group=20 dir.COMgfs=/work/noaa/hwrf/noscrub/zzhang/GEFS
#else
# ${PYTHON3} ./run_hafs.py -t ${dev} 2020082112 00L HISTORY \
#     ${confopts_noocean} ${scrubopt} \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_${ens} config.ENS=${ens} \
#     config.disk_project=hurricane forecast.layoutx=16 forecast.layouty=15 \
#     forecast.write_tasks_per_group=20 dir.COMgfs=/work/noaa/hwrf/noscrub/zzhang/GEFS
#fi

#done

#hera
#for ens in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20
#do
#
#if [ $ens -eq 00 ] ; then
# ${PYTHON3} ./run_hafs.py -t ${dev} 2020081918 00L HISTORY \
#     ${confopts_noocean} ${scrubopt} config.cpu_account=aoml-hafs1 \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_${ens} config.ENS=${ens} \
#     config.do_sppt=.F. config.do_shum=.F. config.do_skeb=.F. \
#     config.disk_project=hwrf forecast.layoutx=16 forecast.layouty=15 \
#     forecast.write_tasks_per_group=20 dir.COMgfs=/scratch1/NCEPDEV/hwrf/noscrub/input/GEFS
#else
# ${PYTHON3} ./run_hafs.py -t ${dev} 2020081918 00L HISTORY \
#     ${confopts_noocean} ${scrubopt} config.cpu_account=aoml-hafs1 \
#     config.EXPT=${EXPT} config.SUBEXPT=${EXPT}_${ens} config.ENS=${ens} \
#     config.disk_project=hwrf forecast.layoutx=16 forecast.layouty=15 \
#     forecast.write_tasks_per_group=20 dir.COMgfs=/scratch1/NCEPDEV/hwrf/noscrub/input/GEFS
#fi
#
#done
#===============================================================================

date

echo 'cronjob done'
