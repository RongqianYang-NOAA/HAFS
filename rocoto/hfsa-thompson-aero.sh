#! /bin/bash
set -ue

HOMEhafs=$( cd $( dirname ${BASH_SOURCE[0]} ) ; cd .. ; pwd -P )
source ${HOMEhafs}/ush/hafs_pre_job.sh.inc
set -x

cd ${HOMEhafs}/rocoto
EXPT=$(basename ${HOMEhafs})
SUBEXPT=hfsa-thompson-aero
conf=../parm/hfsa_thompson_aero.conf
opts="-t -f"

first_test_works='2023082618-2023082700 10L'
breaks_noahmp='2020082506-2020082618 13L'
two_cycles='2020082506-2020082512 13L'

scrubopt="config.scrub_work=no config.scrub_com=no"
./run_hafs.py ${opts} ${two_cycles} HISTORY \
    config.EXPT=${EXPT} config.SUBEXPT=${SUBEXPT} \
    config.NHRS=126 ${scrubopt} \
    ${conf} \
    gsi.use_bufr_nr=yes \
    config.run_emcgraphics=yes
